<%-- 
    Document   : aboutus
    Created on : 15 Aug 2025, 7:37:16 PM
    Author     : Fatima 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>About Us Page</title>
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

/* About Us Page Specific Styles */
main {
    padding: 60px 0;
    min-height: calc(100vh - 400px); /* Adjust based on footer height */
}

.description {
    background: rgba(30, 30, 30, 0.9);
    border-radius: 15px;
    padding: 40px;
    margin-bottom: 50px;
    border: 2px solid #d32f2f;
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
    position: relative;
    overflow: hidden;
}

.description:before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 5px;
    background: #d32f2f;
}

.description h2 {
    font-size: 2.8rem;
    color: #fff;
    margin-bottom: 20px;
    text-align: center;
    text-transform: uppercase;
}

.description h2 span {
    color: #d32f2f;
}

.desc-info h3 {
    font-size: 1.8rem;
    color: #d32f2f;
    margin: 30px 0 15px;
    position: relative;
    padding-bottom: 10px;
}

.desc-info h3:after {
    content: '';
    position: absolute;
    bottom: 0;
    left: 0;
    width: 50px;
    height: 3px;
    background: #d32f2f;
}

.timeline {
    display: block;
    text-align: center;
    font-size: 1.2rem;
    color: #d32f2f;
    margin-bottom: 30px;
    font-weight: 600;
}

.description p {
    font-size: 1.2rem;
    color: #e0e0e0;
    margin-bottom: 20px;
    line-height: 1.8;
}

.mission {
    font-style: italic;
    border-left: 4px solid #d32f2f;
    padding-left: 20px;
    margin-top: 30px;
    color: #f0f0f0;
}

.features {
    list-style: none;
    margin: 25px 0;
}

.features li {
    margin-bottom: 15px;
    padding-left: 30px;
    position: relative;
    font-size: 1.1rem;
    color: #e0e0e0;
}

.features li:before {
    content: '✓';
    position: absolute;
    left: 0;
    color: #d32f2f;
    font-weight: bold;
}

.services {
    margin-top: 60px;
}

.services h2 {
    font-size: 2.5rem;
    color: #fff;
    text-align: center;
    margin-bottom: 40px;
    text-transform: uppercase;
    position: relative;
    padding-bottom: 15px;
}

.services h2:after {
    content: '';
    position: absolute;
    bottom: 0;
    left: 50%;
    transform: translateX(-50%);
    width: 80px;
    height: 4px;
    background: #d32f2f;
}

.service-cards {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
    gap: 30px;
    margin-top: 30px;
}

.card {
    background: rgba(30, 30, 30, 0.9);
    border-radius: 15px;
    padding: 30px;
    transition: transform 0.3s ease;
    border: 2px solid #444;
    position: relative;
    overflow: hidden;
    text-align: center;
}

.card:hover {
    transform: translateY(-10px);
    border-color: #d32f2f;
    box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
}

.card:before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 5px;
    background: #d32f2f;
    transform: scaleX(0);
    transition: transform 0.3s ease;
}

.card:hover:before {
    transform: scaleX(1);
}

.card h3 {
    font-size: 1.5rem;
    color: #fff;
    margin-bottom: 15px;
    position: relative;
    padding-bottom: 10px;
}

.card h3:after {
    content: '';
    position: absolute;
    bottom: 0;
    left: 50%;
    transform: translateX(-50%);
    width: 50px;
    height: 2px;
    background: #d32f2f;
}

.card p {
    color: #bbb;
    font-size: 1.1rem;
    line-height: 1.6;
}

/* Footer - same as homepage */
footer {
    background: linear-gradient(to right, #000, #222);
    padding: 60px 0 20px;
    margin-top: 60px;
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
    
    .description {
        padding: 30px;
    }
    
    .description h2 {
        font-size: 2.3rem;
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
    
    .description {
        padding: 20px;
    }
    
    .description h2 {
        font-size: 2rem;
    }
    
    .desc-info h3 {
        font-size: 1.5rem;
    }
    
    .services h2 {
        font-size: 2rem;
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
        <main>
            <section class="description">
                <div class="desc-info">
                    <h2>About SGBERRY MOTORS</h2>
                    <p class="timeline"><strong>Established 2010 | Operational Since 2020</strong></p>

                    <p>SGBERRY MOTORS is the trusted choice for government vehicle repair and maintenance services. 
                    Founded in 2010 and operational since 2020, we combine technical expertise with an uncompromising 
                    commitment to quality.</p>

                    <h3>What Makes Us Different</h3>
                    <ul class="features">
                        <li><strong>Authentic Manufacturer Parts:</strong> We use only original components made by your vehicle's brand - never generic substitutes</li>
                        <li><strong>Job Guarantee:</strong> All repairs come with a solid warranty for your peace of mind</li>
                        <li><strong>On-Time Promise:</strong> Quality work completed by or before the agreed deadline</li>
                        <li><strong>Service You'll Remember:</strong> A hassle-free experience that builds lasting trust</li>
                    </ul>

                    <p class="mission">We don't just fix vehicles – we deliver reliable, brand-approved solutions that keep government fleets running smoothly. Our commitment to genuine parts and guaranteed work makes us a leader in automotive care.</p>
                </div>
            </section>
                
            </section>
            <section class="services">
                <h2>Our Services</h2>
                <div class="service-cards">
                  <div class="card">
                    <h3>Engine Overhaul</h3>
                    <p>Comprehensive engine rebuilding and repair to restore performance and extend vehicle life.</p>
                  </div>
                  <div class="card">
                    <h3>Automatic & Manual Gearbox Repairs</h3>
                    <p>Expert servicing and repair of both automatic and manual transmissions for smooth, reliable shifting.</p>
                  </div>
                  <div class="card">
                    <h3>Suspension</h3>
                    <p>Inspection, repair, and replacement of suspension components for a safe and comfortable ride.</p>
                  </div>
                  <div class="card">
                    <h3>Brakes</h3>
                    <p>Complete brake system servicing, including pads, discs, and hydraulics, to keep you safe on the road.</p>
                  </div>
                  <div class="card">
                    <h3>Minor & Major Service</h3>
                    <p>Routine maintenance services, from oil changes to full inspections, ensuring your car runs at its best.</p>
                  </div>
                  <div class="card">
                    <h3>Machine Diagnostics</h3>
                    <p>Advanced computer diagnostics to quickly identify and resolve mechanical or electrical issues.</p>
                  </div>
                </div>
        </section>
        </main>
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
    </body>
</html>
