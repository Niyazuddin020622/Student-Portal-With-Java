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
    <title>Edit Profile</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: #e9ecef;
        }
        .edit-profile-form {
            margin: auto;
            margin-top: 80px;
            max-width: 600px;
            padding: 40px;
            border-radius: 15px;
            background: white;
            box-shadow: 0 12px 24px rgba(0, 0, 0, 0.1);
        }
        .edit-profile-form h1 {
            margin-bottom: 30px;
            color: #343a40;
        }
        .btn {
            width: 100%;
        }
    </style>
</head>
<body>
    <div class="container">
        <form action="UpdateProfile" method="post" enctype="multipart/form-data" class="edit-profile-form">
            <h1>Edit Profile</h1>
            <div class="mb-3">
                <label for="name" class="form-label">Name</label>
                <input type="text" class="form-control" id="name" name="name" value="<%= name %>" required>
            </div>
            <div class="mb-3">
                <label for="email" class="form-label">Email</label>
                <input type="email" class="form-control" id="email" name="email" value="<%= email %>" readonly>
            </div>
            <div class="mb-3">
                <label for="profilePicture" class="form-label">Profile Picture</label>
                <input type="file" class="form-control" id="profilePicture" name="profilePicture">
            </div>
            <div class="mb-3">
                <label for="className" class="form-label">Class</label>
                <input type="text" class="form-control" id="className" name="className" value="<%= className %>">
            </div>
            <div class="mb-3">
                <label for="section" class="form-label">Section</label>
                <input type="text" class="form-control" id="section" name="section" value="<%= section %>">
            </div>
            <div class="mb-3">
                <label for="attendance" class="form-label">Attendance (%)</label>
                <input type="number" class="form-control" id="attendance" name="attendance" value="<%= attendance != null ? attendance : 0 %>">
            </div>
            <div class="mb-3">
                <label for="gpa" class="form-label">GPA</label>
                <input type="number" class="form-control" id="gpa" name="gpa" value="<%= gpa != null ? gpa : 0.0 %>" step="0.01">
            </div>
            <button type="submit" class="btn btn-primary">Update Profile</button>
        </form>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
