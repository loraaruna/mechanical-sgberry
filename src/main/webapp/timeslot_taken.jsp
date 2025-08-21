<%-- 
    Document   : timeslot_taken
    Created on : 21 Aug 2025, 20:30:46
    Author     : fatim
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Time Slot Unavailable | Sugarberry Motors</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
            border: 2px solid #d32f2f;
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
            background: #d32f2f;
        }
        
        .error-icon {
            font-size: 100px;
            color: #d32f2f;
            margin-bottom: 30px;
            text-shadow: 0 0 20px rgba(211, 47, 47, 0.6);
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
        }
        
        @media (max-width: 480px) {
            h2 {
                font-size: 1.8rem;
            }
            
            .home-button {
                padding: 12px 30px;
                font-size: 1rem;
            }
        }
    </style>
</head>
<body>
    <div class="error-container">
        <div class="error-icon">
            <i class="fas fa-times-circle"></i>
        </div>
        <h2>Time Slot <span>Unavailable</span></h2>
        <p>Sorry, the time slot you selected has already been booked.</p>
        <p>Please go back and choose another available time slot.</p>
        <a href="booking.jsp" class="home-button">Back to Booking</a>
    </div>
</body>
</html>

