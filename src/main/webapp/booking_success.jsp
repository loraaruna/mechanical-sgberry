<%-- 
    Document   : booking_success
    Created on : 15 Aug 2025, 10:07:54 PM
    Author     : Fatima 
--%>

<!DOCTYPE html>
<html>
<head>
    <title>Booking Successful | Sugarberry Motors</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
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
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }
        
        .success-container {
            text-align: center;
            background: rgba(30, 30, 30, 0.95);
            padding: 60px 40px;
            border-radius: 15px;
            max-width: 700px;
            width: 100%;
            box-shadow: 0 15px 40px rgba(0, 0, 0, 0.6);
            border: 2px solid #d32f2f;
            position: relative;
            overflow: hidden;
        }
        
        .success-container:before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 5px;
            background: #d32f2f;
        }
        
        .success-icon {
            font-size: 100px;
            color: #4CAF50;
            margin-bottom: 30px;
            text-shadow: 0 0 20px rgba(76, 175, 80, 0.5);
            animation: pulse 1.5s infinite;
        }
        
        h2 {
            font-size: 2.8rem;
            margin-bottom: 20px;
            color: #fff;
            text-transform: uppercase;
            letter-spacing: 1px;
        }
        
        h2 span {
            color: #d32f2f;
        }
        
        p {
            font-size: 1.3rem;
            margin-bottom: 20px;
            color: #e0e0e0;
            line-height: 1.8;
        }
        
        .highlight {
            color: #4CAF50;
            font-weight: bold;
            font-size: 1.4rem;
        }
        
        .contact-info {
            background: rgba(211, 47, 47, 0.15);
            border: 1px solid #d32f2f;
            border-radius: 10px;
            padding: 20px;
            margin: 30px 0;
        }
        
        .contact-info p {
            margin: 10px 0;
            font-size: 1.2rem;
        }
        
        .home-button {
            display: inline-block;
            background: #d32f2f;
            color: white;
            padding: 15px 40px;
            border-radius: 30px;
            text-decoration: none;
            font-weight: bold;
            font-size: 1.2rem;
            text-transform: uppercase;
            letter-spacing: 1.5px;
            transition: all 0.3s ease;
            box-shadow: 0 5px 15px rgba(211, 47, 47, 0.4);
            margin-top: 20px;
            border: 2px solid #fff;
        }
        
        .home-button:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 20px rgba(211, 47, 47, 0.6);
            background: #b71c1c;
        }
        
        @keyframes pulse {
            0% { transform: scale(1); }
            50% { transform: scale(1.1); }
            100% { transform: scale(1); }
        }
        
        /* Responsive Design */
        @media (max-width: 768px) {
            .success-container {
                padding: 40px 20px;
            }
            
            h2 {
                font-size: 2.2rem;
            }
            
            p {
                font-size: 1.1rem;
            }
            
            .success-icon {
                font-size: 80px;
            }
        }
        
        @media (max-width: 480px) {
            h2 {
                font-size: 1.8rem;
            }
            
            .highlight {
                font-size: 1.2rem;
            }
            
            .home-button {
                padding: 12px 30px;
                font-size: 1rem;
            }
        }
    </style>
</head>
<body>
    <div class="success-container">
        <div class="success-icon">
            <i class="fas fa-check-circle"></i>
        </div>
        <h2>Booking <span>Successful!</span></h2>
        <p>Thank you for booking your vehicle inspection with Sugarberry Motors.</p>
        <p>We'll contact you within 24 hours to confirm your appointment.</p>
        
        <div class="contact-info">
            <p><i class="fas fa-money-bill-wave"></i> Inspection Fee: <span class="highlight">R500</span> (payable at workshop)</p>
            <p><i class="fas fa-map-marker-alt"></i> Workshop Address: 13 Beaumont Street, Booysens, JHB</p>
            <p><i class="fas fa-phone"></i> Contact: +27 67 786 3886</p>
        </div>
        
        <p>Please bring your vehicle registration documents and ID when you visit.</p>
        <a href="index.html" class="home-button">Back to Home</a>
    </div>
</body>
</html>