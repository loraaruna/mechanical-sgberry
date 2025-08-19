<%-- 
    Document   : booking_error
    Created on : 15 Aug 2025, 10:11:29 PM
    Author     : Fatima 
--%>

<!DOCTYPE html>
<html>
<head>
    <title>Booking Error | Sugarberry Motors</title>
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
        
        .error-container {
            text-align: center;
            background: rgba(30, 30, 30, 0.95);
            padding: 60px 40px;
            border-radius: 15px;
            max-width: 700px;
            width: 100%;
            box-shadow: 0 15px 40px rgba(0, 0, 0, 0.6);
            border: 2px solid #e74c3c;
            position: relative;
            overflow: hidden;
        }
        
        .error-container:before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 5px;
            background: #e74c3c;
        }
        
        .error-icon {
            font-size: 100px;
            color: #e74c3c;
            margin-bottom: 30px;
            text-shadow: 0 0 20px rgba(231, 76, 60, 0.5);
            animation: shake 0.5s ease-in-out;
        }
        
        h2 {
            font-size: 2.8rem;
            margin-bottom: 20px;
            color: #fff;
            text-transform: uppercase;
            letter-spacing: 1px;
        }
        
        h2 span {
            color: #e74c3c;
        }
        
        p {
            font-size: 1.3rem;
            margin-bottom: 20px;
            color: #e0e0e0;
            line-height: 1.8;
        }
        
        .error-details {
            background: rgba(231, 76, 60, 0.15);
            border: 1px solid #e74c3c;
            border-radius: 10px;
            padding: 25px;
            margin: 30px 0;
            text-align: left;
        }
        
        .error-details p {
            margin: 15px 0;
            font-size: 1.2rem;
            display: flex;
            align-items: flex-start;
        }
        
        .error-details i {
            color: #e74c3c;
            font-size: 1.5rem;
            min-width: 30px;
            margin-right: 15px;
        }
        
        .highlight {
            color: #e74c3c;
            font-weight: bold;
        }
        
        .action-buttons {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-top: 30px;
            flex-wrap: wrap;
        }
        
        .btn {
            display: inline-block;
            padding: 15px 40px;
            border-radius: 30px;
            text-decoration: none;
            font-weight: bold;
            font-size: 1.2rem;
            text-transform: uppercase;
            letter-spacing: 1.5px;
            transition: all 0.3s ease;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.4);
            border: 2px solid transparent;
        }
        
        .btn-primary {
            background: #d32f2f;
            color: white;
        }
        
        .btn-primary:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 20px rgba(211, 47, 47, 0.6);
            background: #b71c1c;
        }
        
        .btn-secondary {
            background: transparent;
            color: #fff;
            border: 2px solid #d32f2f;
        }
        
        .btn-secondary:hover {
            background: rgba(211, 47, 47, 0.2);
            transform: translateY(-3px);
        }
        
        @keyframes shake {
            0%, 100% { transform: translateX(0); }
            20%, 60% { transform: translateX(-10px); }
            40%, 80% { transform: translateX(10px); }
        }
        
        /* Responsive Design */
        @media (max-width: 768px) {
            .error-container {
                padding: 40px 20px;
            }
            
            h2 {
                font-size: 2.2rem;
            }
            
            p {
                font-size: 1.1rem;
            }
            
            .error-icon {
                font-size: 80px;
            }
            
            .action-buttons {
                flex-direction: column;
                gap: 15px;
            }
            
            .btn {
                width: 100%;
            }
        }
        
        @media (max-width: 480px) {
            h2 {
                font-size: 1.8rem;
            }
            
            .error-details p {
                font-size: 1rem;
            }
            
            .btn {
                padding: 12px 30px;
                font-size: 1rem;
            }
        }
    </style>
</head>
<body>
    <div class="error-container">
        <div class="error-icon">
            <i class="fas fa-exclamation-circle"></i>
        </div>
        <h2>Booking <span>Error</span></h2>
        <p>We encountered an issue while processing your booking request.</p>
        
        <div class="error-details">
            <p>
                <i class="fas fa-exclamation-triangle"></i>
                <span><strong>Error Message:</strong> ${error}</span>
            </p>
            <p>
                <i class="fas fa-info-circle"></i>
                <span>Please try again or contact us directly for assistance.</span>
            </p>
            <p>
                <i class="fas fa-phone"></i>
                <span>Phone: <span class="highlight">+27 67 786 3886</span></span>
            </p>
            <p>
                <i class="fas fa-envelope"></i>
                <span>Email: <span class="highlight">support@sugarberrymotors.com</span></span>
            </p>
        </div>
        
        <div class="action-buttons">
            <a href="booking.jsp" class="btn btn-primary">
                <i class="fas fa-redo"></i> Try Again
            </a>
            <a href="index.html" class="btn btn-secondary">
                <i class="fas fa-home"></i> Return to Home
            </a>
        </div>
    </div>
</body>
</html>