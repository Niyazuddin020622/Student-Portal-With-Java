<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%
    // Fetch session attributes
    String name = (String) session.getAttribute("name");
    String email = (String) session.getAttribute("email");
    String profilePicture = (String) session.getAttribute("profilePicture");
    Double attendance = (Double) session.getAttribute("atten");
    String className = (String) session.getAttribute("className");
    String section = (String) session.getAttribute("section");
    Double gpa = (Double) session.getAttribute("gpa");

    // Redirect to login page if session attributes are missing
    if (name == null || email == null) {
        response.sendRedirect("index.html");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Profile</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
    
    <style>
        body {
            background: #e9ecef;
            font-family: 'Arial', sans-serif;
        }
        .profile-card {
            margin: auto;
            margin-top: 80px;
            max-width: 600px;
            padding: 40px;
            border-radius: 15px;
            background: white;
            box-shadow: 0 12px 24px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .profile-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.15);
        }
        .profile-card img {
            border-radius: 50%;
            width: 150px;
            height: 150px;
            object-fit: cover;
            border: 5px solid #007bff;
        }
        .profile-card h1 {
            font-size: 2.2rem;
            margin: 20px 0;
            font-weight: bold;
            color: #343a40;
        }
        .profile-card p {
            margin: 8px 0;
            font-size: 1.1rem;
            color: #495057;
        }
        .profile-card p strong {
            color: #007bff;
        }
        .btn {
            width: 100%;
            padding: 12px;
            border-radius: 8px;
            font-size: 1.1rem;
            font-weight: bold;
        }
        .btn-primary {
            background-color: #007bff;
            border: none;
        }
        .btn-danger {
            background-color: #dc3545;
            border: none;
        }
        .btn:hover {
            opacity: 0.9;
        }
        .profile-card .row {
            margin-top: 20px;
        }
    </style>
</head>
<body>


    <div class="container">
        <div class="profile-card text-center">
            <img src="<%= profilePicture != null ? profilePicture : "default-profile.png" %>" alt="Profile Picture">
            <h1>Welcome, <%= name %>!</h1>
            <p><strong>Email:</strong> <%= email %></p>
            <p><strong>Class:</strong> <%= className %></p>
            <p><strong>Section:</strong> <%= section %></p>
            <p><strong>Attendance:</strong> <%= attendance %>%</p>
            <p><strong>GPA:</strong> <%= gpa %></p>

            <div class="row">
                <div class="col-6">
                    <a href="EditProfile.jsp" class="btn btn-primary">Edit Profile</a>
                </div>
                <div class="col-6">
                    <a href="Logout" class="btn btn-danger">Logout</a>
                </div>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
