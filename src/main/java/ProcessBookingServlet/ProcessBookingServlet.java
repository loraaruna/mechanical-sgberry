package ProcessBookingServlet;

import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.Properties;
import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ProcessBookingServlet extends HttpServlet {
    
    // Database config
    private static final String DB_URL = "jdbc:derby://localhost:1527/SugarberryDB";
    private static final String DB_USER = "app";
    private static final String DB_PASSWORD = "123";
    
    // Email config - will be loaded from properties file
    private String EMAIL_HOST;
    private String EMAIL_PORT;
    private String EMAIL_USERNAME;
    private String EMAIL_PASSWORD;
    private String COMPANY_EMAIL;
    
    @Override
    public void init() throws ServletException {
        loadEmailConfig();
    }
    
    private void loadEmailConfig() {
        Properties mailProps = new Properties();
        try (InputStream input = getClass().getClassLoader().getResourceAsStream("mail.properties")) {
            if (input != null) {
                mailProps.load(input);
                EMAIL_HOST = mailProps.getProperty("mail.host", "smtp.gmail.com");
                EMAIL_PORT = mailProps.getProperty("mail.port", "587");
                EMAIL_USERNAME = mailProps.getProperty("mail.username", "your-email@gmail.com");
                EMAIL_PASSWORD = mailProps.getProperty("mail.password", "your-app-password");
                COMPANY_EMAIL = mailProps.getProperty("mail.company", "sugarberrytrd@gmail.com");
                
                System.out.println("Email configuration loaded successfully:");
                System.out.println("Host: " + EMAIL_HOST);
                System.out.println("Port: " + EMAIL_PORT);
                System.out.println("Username: " + EMAIL_USERNAME);
                System.out.println("Company Email: " + COMPANY_EMAIL);
            } else {
                // Set default values if properties file doesn't exist
                System.err.println("mail.properties file not found! Using default values.");
                EMAIL_HOST = "smtp.gmail.com";
                EMAIL_PORT = "587";
                EMAIL_USERNAME = "your-email@gmail.com";
                EMAIL_PASSWORD = "your-app-password";
                COMPANY_EMAIL = "sugarberrytrd@gmail.com";
            }
        } catch (IOException e) {
            System.err.println("Failed to load email configuration: " + e.getMessage());
            // Set default values on error
            EMAIL_HOST = "smtp.gmail.com";
            EMAIL_PORT = "587";
            EMAIL_USERNAME = "your-email@gmail.com";
            EMAIL_PASSWORD = "your-app-password";
            COMPANY_EMAIL = "sugarberrytrd@gmail.com";
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Get form data
        String fullName = request.getParameter("full_name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String vehicleModel = request.getParameter("vehicle_model");
        int vehicleYear = Integer.parseInt(request.getParameter("vehicle_year"));
        String problemDesc = request.getParameter("problem_description");
        String bookingDate = request.getParameter("booking_date");
        String timeSlot = request.getParameter("time_slot");
        
        try {
            // Load Derby driver
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            
            // Check daily booking limit
            if (getBookingCount(bookingDate) >= 5) {
                response.sendRedirect("booking_full.jsp");
                return;
            }
            
            // Check if timeslot already booked
            if (isTimeSlotTaken(bookingDate, timeSlot)) {
                response.sendRedirect("timeslot_taken.jsp");
                return;
            }
            
            // Save to database
            saveBooking(fullName, email, phone, vehicleModel, vehicleYear, 
                        problemDesc, bookingDate, timeSlot);
            
            // Send confirmation emails
            sendCustomerConfirmation(email, fullName, bookingDate, timeSlot);
            sendCompanyNotification(fullName, email, phone, vehicleModel, vehicleYear, 
                                  problemDesc, bookingDate, timeSlot);
            
            // Redirect to success page
            response.sendRedirect("booking_success.jsp");
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", e.getMessage());
            request.getRequestDispatcher("booking_error.jsp").forward(request, response);
        }
    }
    
    // Count bookings for a given day
    private int getBookingCount(String bookingDate) throws SQLException {
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            String sql = "SELECT COUNT(*) FROM bookings WHERE booking_date = ?";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, bookingDate);
                try (ResultSet rs = stmt.executeQuery()) {
                    if (rs.next()) {
                        return rs.getInt(1);
                    }
                }
            }
        }
        return 0;
    }
    
    // Check if specific timeslot is already taken
    private boolean isTimeSlotTaken(String bookingDate, String timeSlot) throws SQLException {
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            String sql = "SELECT COUNT(*) FROM bookings WHERE booking_date = ? AND time_slot = ?";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, bookingDate);
                stmt.setString(2, timeSlot);
                try (ResultSet rs = stmt.executeQuery()) {
                    if (rs.next()) {
                        return rs.getInt(1) > 0;
                    }
                }
            }
        }
        return false;
    }
    
    // Save booking into DB
    private void saveBooking(String fullName, String email, String phone, String vehicleModel,
                           int vehicleYear, String problemDesc, String bookingDate, String timeSlot) 
            throws SQLException {
        
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            String sql = "INSERT INTO bookings (full_name, email, phone, vehicle_model, "
                       + "vehicle_year, problem_description, booking_date, time_slot) "
                       + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, fullName);
                stmt.setString(2, email);
                stmt.setString(3, phone);
                stmt.setString(4, vehicleModel);
                stmt.setInt(5, vehicleYear);
                stmt.setString(6, problemDesc);
                stmt.setDate(7, Date.valueOf(bookingDate));
                stmt.setString(8, timeSlot);
                
                stmt.executeUpdate();
                System.out.println("Booking saved to database for: " + fullName);
            }
        }
    }
    
    // Send confirmation email to customer
    // Send confirmation email to customer
    private void sendCustomerConfirmation(String customerEmail, String fullName, 
                                        String bookingDate, String timeSlot) {
        try {
            System.out.println("Attempting to send email to: " + customerEmail);
            System.out.println("Using SMTP host: " + EMAIL_HOST + ":" + EMAIL_PORT);
            System.out.println("Authenticating as: " + EMAIL_USERNAME);

            // Email properties
            Properties props = new Properties();
            props.put("mail.smtp.host", EMAIL_HOST);
            props.put("mail.smtp.port", EMAIL_PORT);
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.enable", "true");
            props.put("mail.smtp.connectiontimeout", "10000"); // 10 seconds
            props.put("mail.smtp.timeout", "10000"); // 10 seconds
            props.put("mail.smtp.writetimeout", "10000"); // 10 seconds
            props.put("mail.debug", "true"); // Enable debug mode

            // Create session with authentication
            Session session = Session.getInstance(props, new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    System.out.println("Authenticating with username: " + EMAIL_USERNAME);
                    return new PasswordAuthentication(EMAIL_USERNAME, EMAIL_PASSWORD);
                }
            });

            // Create email message
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(EMAIL_USERNAME));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(customerEmail));
            message.setSubject("Sugarberry Motors - Booking Confirmation");

            // Create email content
            String emailContent = "<html><body>"
                + "<h2 style='color: #d32f2f;'>Sugarberry Motors</h2>"
                + "<h3>Booking Confirmation</h3>"
                + "<p>Dear " + fullName + ",</p>"
                + "<p>Thank you for booking your vehicle inspection with Sugarberry Motors.</p>"
                + "<p><strong>Booking Details:</strong></p>"
                + "<ul>"
                + "<li><strong>Date:</strong> " + bookingDate + "</li>"
                + "<li><strong>Time Slot:</strong> " + timeSlot + "</li>"
                + "<li><strong>Inspection Fee:</strong> R500 (payable at workshop)</li>"
                + "</ul>"
                + "<p>We'll contact you within 24 hours to confirm your appointment.</p>"
                + "<p><strong>Workshop Address:</strong><br>"
                + "13 Beaumont Street, Booysens, JHB, 2091</p>"
                + "<p><strong>Contact:</strong> +27 67 786 3886</p>"
                + "<p>Please bring your vehicle registration documents and ID when you visit.</p>"
                + "<br><p>Best regards,<br>Sugarberry Motors Team</p>"
                + "</body></html>";

            message.setContent(emailContent, "text/html");

            System.out.println("Attempting to send email...");
            // Send email
            Transport.send(message);

            System.out.println("Confirmation email successfully sent to: " + customerEmail);

        } catch (Exception e) {
            System.err.println("FAILED to send confirmation email to " + customerEmail);
            System.err.println("Error: " + e.getMessage());
            e.printStackTrace();
        }
    }
    
    // Send notification email to company
    private void sendCompanyNotification(String fullName, String email, String phone, 
                                       String vehicleModel, int vehicleYear, String problemDesc,
                                       String bookingDate, String timeSlot) {
        try {
            // Email properties
            Properties props = new Properties();
            props.put("mail.smtp.host", EMAIL_HOST);
            props.put("mail.smtp.port", EMAIL_PORT);
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.enable", "true");
            props.put("mail.smtp.connectiontimeout", "5000");
            props.put("mail.smtp.timeout", "5000");
            props.put("mail.smtp.writetimeout", "5000");
            
            // Create session with authentication
            Session session = Session.getInstance(props, new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(EMAIL_USERNAME, EMAIL_PASSWORD);
                }
            });
            
            // Create email message
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(EMAIL_USERNAME));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(COMPANY_EMAIL));
            message.setSubject("New Booking: " + fullName + " - " + bookingDate);
            
            // Create email content
            String emailContent = "<html><body>"
                + "<h2 style='color: #d32f2f;'>New Booking Received</h2>"
                + "<h3>Customer Details:</h3>"
                + "<ul>"
                + "<li><strong>Name:</strong> " + fullName + "</li>"
                + "<li><strong>Email:</strong> " + email + "</li>"
                + "<li><strong>Phone:</strong> " + phone + "</li>"
                + "</ul>"
                + "<h3>Vehicle Details:</h3>"
                + "<ul>"
                + "<li><strong>Model:</strong> " + vehicleModel + "</li>"
                + "<li><strong>Year:</strong> " + vehicleYear + "</li>"
                + "<li><strong>Problem Description:</strong> " + problemDesc + "</li>"
                + "</ul>"
                + "<h3>Booking Details:</h3>"
                + "<ul>"
                + "<li><strong>Date:</strong> " + bookingDate + "</li>"
                + "<li><strong>Time Slot:</strong> " + timeSlot + "</li>"
                + "</ul>"
                + "<p>This booking has been automatically added to the database.</p>"
                + "</body></html>";
            
            message.setContent(emailContent, "text/html");
            
            // Send email
            Transport.send(message);
            
            System.out.println("Notification email sent to company: " + COMPANY_EMAIL);
            
        } catch (Exception e) {
            System.err.println("Failed to send notification email to company: " + e.getMessage());
            e.printStackTrace();
        }
    }
}