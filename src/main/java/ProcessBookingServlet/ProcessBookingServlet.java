package ProcessBookingServlet;

import java.io.IOException;
import java.sql.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ProcessBookingServlet extends HttpServlet {
    
    // Database config
    private static final String DB_URL = "jdbc:derby://localhost:1527/SugarberryDB";
    private static final String DB_USER = "app";
    private static final String DB_PASSWORD = "123";
    
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
            
            // Check booking limit
            if (getBookingCount(bookingDate) >= 5) {
                response.sendRedirect("booking_full.jsp");
                return;
            }
            
            // Save to database
            saveBooking(fullName, email, phone, vehicleModel, vehicleYear, 
                        problemDesc, bookingDate, timeSlot);
            
            // Redirect to success page
            response.sendRedirect("booking_success.jsp");
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", e.getMessage());
            request.getRequestDispatcher("booking_error.jsp").forward(request, response);
        }
    }
    
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
            }
        }
    }
}
