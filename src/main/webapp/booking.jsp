<%-- 
    Document   : booking
    Created on : 15 Aug 2025, 8:44:28 PM
    Author     : Fatima 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Book Inspection - SGBERRY MOTORS</title>
    <style>
/* Reuse the same base styles from the homepage */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

body {
    background: linear-gradient(rgba(0, 0, 0, 0.85), rgba(0, 0, 0, 0.85)), 
                url('https://images.unsplash.com/photo-1503376780353-7e6692767b70?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80');
    background-size: cover;
    background-position: center;
    background-attachment: fixed;
    color: #fff;
    line-height: 1.6;
    padding-top: 140px;
    min-height: 100vh;
}

/* Header - same as homepage */
header {
    background: linear-gradient(to right, #000, #222);
    padding: 15px 0;
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    z-index: 1000;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.3);
    border-bottom: 4px solid #d32f2f;
}

.container {
    width: 90%;
    max-width: 1200px;
    margin: 0 auto;
    padding: 0 20px;
}

.header-content {
    display: flex;
    align-items: center;
    justify-content: space-between;
}

.logo-container {
    display: flex;
    align-items: center;
    text-decoration: none;
}

.logo {
    width: 90px;
    height: 90px;
    border-radius: 50%;
    overflow: hidden;
    margin-right: 20px;
    border: 3px solid #d32f2f;
    background: white;
    box-shadow: 0 0 15px rgba(211, 47, 47, 0.5);
}

.logo img {
    width: 100%;
    height: 100%;
    object-fit: contain;
    padding: 5px;
}

.company-name {
    text-align: left;
}

.company-name h1 {
    font-size: 2.2rem;
    color: #fff;
    margin-bottom: 5px;
    text-transform: uppercase;
    letter-spacing: 1px;
    font-weight: 700;
}

.company-name p {
    font-size: 1rem;
    color: #ccc;
}

.menu ul {
    display: flex;
    list-style: none;
    gap: 25px;
}

.menu ul li a {
    color: #fff;
    text-decoration: none;
    font-size: 1.1rem;
    font-weight: 600;
    padding: 10px 15px;
    border-radius: 30px;
    transition: all 0.3s ease;
    text-transform: uppercase;
    position: relative;
}

.menu ul li a:hover {
    background: #d32f2f;
    color: white;
}

.menu ul li a.active {
    background: #d32f2f;
}

/* Booking Page Specific Styles */
.booking-container {
    background: rgba(30, 30, 30, 0.9);
    border-radius: 15px;
    padding: 40px;
    margin: 40px auto;
    max-width: 800px;
    border: 2px solid #d32f2f;
    box-shadow: 0 15px 35px rgba(0, 0, 0, 0.4);
    position: relative;
    overflow: hidden;
}

.booking-container:before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 5px;
    background: #d32f2f;
}

.booking-container h2 {
    font-size: 2.5rem;
    color: #fff;
    text-align: center;
    margin-bottom: 30px;
    position: relative;
    padding-bottom: 15px;
}

.booking-container h2:after {
    content: '';
    position: absolute;
    bottom: 0;
    left: 50%;
    transform: translateX(-50%);
    width: 100px;
    height: 4px;
    background: #d32f2f;
}

.booking-container > p {
    text-align: center;
    font-size: 1.2rem;
    color: #d32f2f;
    margin-bottom: 30px;
    font-weight: 600;
}

.form-group {
    margin-bottom: 25px;
}

.form-group label {
    display: block;
    margin-bottom: 10px;
    font-size: 1.1rem;
    color: #fff;
    font-weight: 500;
}

.form-group input,
.form-group select,
.form-group textarea {
    width: 100%;
    padding: 14px 20px;
    border-radius: 8px;
    border: 2px solid #444;
    background: rgba(20, 20, 20, 0.7);
    color: #fff;
    font-size: 1rem;
    transition: all 0.3s ease;
}

.form-group input:focus,
.form-group select:focus,
.form-group textarea:focus {
    border-color: #d32f2f;
    outline: none;
    box-shadow: 0 0 0 3px rgba(211, 47, 47, 0.3);
}

.form-group textarea {
    resize: vertical;
    min-height: 120px;
}

.fee-notice {
    background: rgba(211, 47, 47, 0.15);
    border: 1px solid #d32f2f;
    border-radius: 8px;
    padding: 15px;
    margin: 30px 0;
    text-align: center;
}

.fee-notice p {
    color: #f0f0f0;
    font-size: 1rem;
    line-height: 1.6;
}

.submit-btn {
    display: block;
    width: 100%;
    background: #d32f2f;
    color: white;
    border: none;
    padding: 16px;
    border-radius: 8px;
    font-size: 1.2rem;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.3s ease;
    text-transform: uppercase;
    letter-spacing: 1px;
    box-shadow: 0 5px 15px rgba(211, 47, 47, 0.4);
    margin-top: 20px;
}

.submit-btn:hover {
    background: #b71c1c;
    transform: translateY(-3px);
    box-shadow: 0 8px 20px rgba(211, 47, 47, 0.6);
}

/* Datepicker styling */
input[type="date"] {
    position: relative;
    background-image: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="%23d32f2f" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect><line x1="16" y1="2" x2="16" y2="6"></line><line x1="8" y1="2" x2="8" y2="6"></line><line x1="3" y1="10" x2="21" y2="10"></line></svg>');
    background-repeat: no-repeat;
    background-position: 95% center;
    background-size: 20px;
}

/* Footer - same as homepage with updated hours */
footer {
    background: linear-gradient(to right, #000, #222);
    padding: 60px 0 20px;
    border-top: 4px solid #d32f2f;
    color: white;
}

.footer-content {
    display: flex;
    justify-content: space-between;
    flex-wrap: wrap;
    gap: 40px;
    margin-bottom: 30px;
}

.footer-section {
    flex: 1;
    min-width: 250px;
}

.footer-section h3 {
    font-size: 1.5rem;
    margin-bottom: 20px;
    color: #fff;
    position: relative;
    padding-bottom: 10px;
}

.footer-section h3:after {
    content: '';
    position: absolute;
    bottom: 0;
    left: 0;
    width: 50px;
    height: 3px;
    background: #d32f2f;
}

.footer-section p, .footer-section li {
    color: #ccc;
    margin-bottom: 10px;
}

.footer-section ul {
    list-style: none;
}

.footer-section ul li {
    margin-bottom: 12px;
}

.footer-section ul li i {
    color: #d32f2f;
    margin-right: 10px;
    width: 20px;
}

.social-links {
    display: flex;
    gap: 15px;
    margin-top: 20px;
}

.social-links a {
    display: flex;
    align-items: center;
    justify-content: center;
    width: 40px;
    height: 40px;
    background: #333;
    color: white;
    border-radius: 50%;
    text-align: center;
    line-height: 40px;
    transition: all 0.3s ease;
}

.social-links a:hover {
    background: #d32f2f;
    transform: translateY(-5px);
}

.copyright {
    text-align: center;
    padding-top: 20px;
    border-top: 1px solid #444;
    color: #aaa;
    font-size: 0.9rem;
}

/* Responsive Design */
@media (max-width: 900px) {
    body {
        padding-top: 180px;
    }
    
    .header-content {
        flex-direction: column;
        text-align: center;
    }
    
    .logo-container {
        margin-bottom: 20px;
        justify-content: center;
    }
    
    .menu ul {
        justify-content: center;
        flex-wrap: wrap;
    }
    
    .booking-container {
        padding: 30px;
        margin: 30px auto;
    }
    
    .booking-container h2 {
        font-size: 2.2rem;
    }
}

@media (max-width: 600px) {
    body {
        padding-top: 220px;
    }
    
    .logo {
        width: 70px;
        height: 70px;
    }
    
    .company-name h1 {
        font-size: 1.8rem;
    }
    
    .menu ul li a {
        font-size: 0.9rem;
        padding: 8px 12px;
    }
    
    .booking-container {
        padding: 20px;
        margin: 20px auto;
    }
    
    .booking-container h2 {
        font-size: 1.8rem;
    }
    
    .form-group label {
        font-size: 1rem;
    }
    
    .form-group input,
    .form-group select,
    .form-group textarea {
        padding: 12px 15px;
        font-size: 0.95rem;
    }
}
</style>
</head>
<body>
    <header>
        <div class="container">
            <div class="header-content">
                <a href="#" class="logo-container">
                    <div class="logo">
                        <img src="images/logo2.png" alt="Sugarberry Motors Logo">
                    </div>
                    <div class="company-name">
                        <h1>Sugarberry Motors</h1>
                        <p>Premium Auto Services Since 2010</p>
                    </div>
                </a>
                
                <nav class="menu">
                    <ul>
                        <li><a href="aboutus.jsp">About Us</a></li>
                        <li><a href="gallery.jsp">Gallery</a></li>
                    </ul>
                </nav>
            </div>
        </div>
    </header>
    <div class="booking-container">
        <h2>Book Vehicle Inspection</h2>
        <p>Inspection Fee: R500 (payable at workshop)</p>
        
        <form action="ProcessBookingServlet" method="POST">
            <div class="form-group">
                <label>Full Name:</label>
                <input type="text" name="full_name" required>
            </div>
            
            <div class="form-group">
                <label>Email:</label>
                <input type="email" name="email" required>
            </div>
            
            <div class="form-group">
                <label>Phone Number:</label>
                <input type="tel" name="phone" required>
            </div>
            
            <div class="form-group">
                <label>Vehicle Model:</label>
                <input type="text" name="vehicle_model" required>
            </div>
            
            <div class="form-group">
                <label>Vehicle Year:</label>
                <input type="number" name="vehicle_year" min="1990" max="2025" required>
            </div>
            
            <div class="form-group">
                <label>Describe the Problem:</label>
                <textarea name="problem_description" rows="4" required></textarea>
            </div>
            
            <div class="form-group">
                <label>Preferred Date:</label>
                <input type="date" name="booking_date" min="<%= java.time.LocalDate.now() %>" required>
            </div>
            
            <div class="form-group">
                <label>Time Slot:</label>
                <select name="time_slot" required>
                    <option value="">Select Time</option>
                    <option value="09:00-11:00">09:00 AM - 11:00 AM</option>
                    <option value="11:00-13:00">11:00 AM - 1:00 PM</option>
                    <option value="13:00-15:00">1:00 PM - 3:00 PM</option>
                    <option value="15:00-17:00">3:00 PM - 5:00 PM</option>
                </select>
            </div>
            
            <div class="fee-notice">
                <p>Note: You'll receive confirmation within 24 hours.</p>
            </div>
            
            <input type="submit" class="submit-btn" value="Book Inspection">
        </form>
    </div>
</body>
<footer>
        <div class="container">
            <div class="footer-content">
                <div class="footer-section">
                    <h3>Contact Us</h3>
                    <ul>
                        <li><i class="fas fa-map-marker-alt"></i> 13 Beaumont Street, Booysens, JHB, 2091</li>
                        <li><i class="fas fa-phone"></i> +27 67 786 3886</li>
                        <li><i class="fas fa-envelope"></i> sugarberrytrd@gmail.com</li>
                        <li><i class="fas fa-clock"></i> Mon-Fri: 8:00 AM - 5:00 PM</li>
                    </ul>
                </div>
                
                <div class="footer-section">
                    <h3>Quick Links</h3>
                    <ul>
                        <li><i class="fas fa-chevron-right"></i> <a href="aboutus.jsp">About Us</a></li>
                        <li><i class="fas fa-chevron-right"></i> <a href="gallery.jsp">Gallery</a></li>
                        <li><i class="fas fa-chevron-right"></i> <a href="booking.jsp">Book Service</a></li>
                    </ul>
                </div>
                
                <div class="footer-section">
                    <h3>Business Hours</h3>
                    <ul>
                        <li><i class="fas fa-calendar-day"></i> Monday - Friday: 8am - 5pm</li>
                        <li><i class="fas fa-calendar-day"></i> Saturday: 9am - 12pm</li>
                        <li><i class="fas fa-calendar-times"></i> Sunday: Closed</li>
                        <li><i class="fas fa-calendar-star"></i> Public Holidays: 9am - 3pm</li>
                    </ul>
                </div>
            </div>
            
            <div class="copyright">
                <p>&copy; 2023 Sugarberry Motors. All Rights Reserved. | Established 2010 | Operating Since 2020</p>
            </div>
        </div>
    </footer>
</html>
