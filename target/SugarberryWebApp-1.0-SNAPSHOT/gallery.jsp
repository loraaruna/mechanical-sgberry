<%-- 
    Document   : gallery
    Created on : 15 Aug 2025, 7:53:02 PM
    Author     : Fatima 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gallery Page</title>
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

/* Gallery Page Specific Styles */
main {
    padding: 60px 0;
    min-height: calc(100vh - 400px);
}

.gallery {
    padding: 0 20px;
}

.gallery h2 {
    font-size: 2.8rem;
    color: #fff;
    margin-bottom: 40px;
    text-align: center;
    text-transform: uppercase;
    position: relative;
    padding-bottom: 15px;
}

.gallery h2:after {
    content: '';
    position: absolute;
    bottom: 0;
    left: 50%;
    transform: translateX(-50%);
    width: 80px;
    height: 4px;
    background: #d32f2f;
}

.gallery-grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
    gap: 25px;
    margin-top: 30px;
}

.gallery-item {
    position: relative;
    border-radius: 10px;
    overflow: hidden;
    box-shadow: 0 8px 25px rgba(0, 0, 0, 0.5);
    height: 280px;
    transition: all 0.4s ease;
    border: 2px solid #333;
}

.gallery-item:hover {
    transform: translateY(-10px);
    box-shadow: 0 15px 35px rgba(211, 47, 47, 0.3);
    border-color: #d32f2f;
    z-index: 2;
}

.gallery-item img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    transition: all 0.5s ease;
}

.gallery-item:hover img {
    transform: scale(1.1);
}

.gallery-item:after {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: linear-gradient(to bottom, transparent 0%, rgba(211, 47, 47, 0.7) 100%);
    opacity: 0;
    transition: opacity 0.4s ease;
}

.gallery-item:hover:after {
    opacity: 1;
}

/* Lightbox Effect */
.lightbox {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.95);
    display: flex;
    align-items: center;
    justify-content: center;
    z-index: 10000;
    opacity: 0;
    visibility: hidden;
    transition: all 0.4s ease;
}

.lightbox.active {
    opacity: 1;
    visibility: visible;
}

.lightbox-content {
    max-width: 90%;
    max-height: 90%;
    position: relative;
}

.lightbox-content img {
    max-width: 100%;
    max-height: 80vh;
    border: 3px solid #d32f2f;
    border-radius: 5px;
    box-shadow: 0 10px 40px rgba(0, 0, 0, 0.8);
}

.close-lightbox {
    position: absolute;
    top: 20px;
    right: 20px;
    font-size: 2.5rem;
    color: white;
    cursor: pointer;
    transition: all 0.3s ease;
    background: rgba(211, 47, 47, 0.7);
    width: 50px;
    height: 50px;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    z-index: 10;
}

.close-lightbox:hover {
    transform: rotate(90deg);
    background: #d32f2f;
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
    
    .gallery h2 {
        font-size: 2.3rem;
    }
    
    .gallery-grid {
        grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
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
    
    .gallery h2 {
        font-size: 2rem;
    }
    
    .gallery-grid {
        grid-template-columns: 1fr;
    }
}
</style>
    </head>
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
    <body>
        <section class="gallery">
            <h2>Our Gallery</h2>
            <div class="gallery-grid">
              <div class="gallery-item">
                <img src="images/img1.jpg" alt="">
              </div>
              <div class="gallery-item">
                <img src="images/img2.jpg" alt="">
              </div>
              <div class="gallery-item">
                <img src="images/img3.jpg" alt="">
              </div>
              <div class="gallery-item">
                <img src="images/img4.jpg" alt="">
              </div>
              <div class="gallery-item">
                <img src="images/img5.jpg" alt="">
              </div>
              <div class="gallery-item">
                <img src="images/img6.jpg" alt="">
              </div>
              <div class="gallery-item">
                <img src="images/img7.jpg" alt="">
              </div>
              <div class="gallery-item">
                <img src="images/img8.jpg" alt="">
              </div>
              <div class="gallery-item">
                <img src="images/img9.jpg" alt="">
              </div>
              <div class="gallery-item">
                <img src="images/img10.jpg" alt="">
              </div>
              <div class="gallery-item">
                <img src="images/img11.jpg" alt="">
              </div>
              <div class="gallery-item">
                <img src="images/img12.jpg" alt="">
              </div>
              <!-- Add more gallery items as needed -->
            </div>
        </section>
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
