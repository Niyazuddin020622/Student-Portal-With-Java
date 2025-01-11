<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>B.Tech Courses</title>

  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
  <!-- Custom CSS -->
  <style>
    body {
      font-family: 'Roboto', sans-serif;
    }
    .hero-section {
      background: url('https://images.unsplash.com/photo-1498050108023-c5249f4df085') no-repeat center center/cover;
      color: #fff;
      padding: 80px 0;
      text-align: center;
    }
    .card {
      transition: transform 0.3s ease;
    }
    .card:hover {
      transform: translateY(-10px);
    }
    .meta-info {
      font-size: 0.85rem;
      color: #6c757d;
    }
  </style>
</head>
<body>
<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container">
    <a class="navbar-brand" href="Home.jsp">
      <i class="bi bi-mortarboard-fill me-2"></i>
      Student Portal
    </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item"><a class="nav-link" href="Home.jsp">Home</a></li>
        <li class="nav-item"><a class="nav-link active" href="#">Courses</a></li>
        <li class="nav-item"><a class="nav-link" href="Assignment.html">Assignments</a></li>
        <li class="nav-item"><a class="nav-link" href="Grades.html">Grades</a></li>
      </ul>
   <a href="Logout" class="btn btn-outline-danger">Logout</a>
    </div>
  </div>
</nav>

<!-- Hero Section -->
<div class="hero-section">
  <div class="container">
    <h1 class="display-4">B.Tech Courses</h1>
    <p class="lead">Explore a wide range of technical courses designed to enhance your skills and career.</p>
  </div>
</div>

<!-- Courses Section -->
<section class="courses-section py-5">
  <div class="container">
    <h2 class="text-center mb-4">Available Courses</h2>
    <div class="row">
      <%
        // Database connection details
        String jdbcURL = "jdbc:mysql://localhost:3306/jdbc";
        String jdbcUsername = "root";
        String jdbcPassword = "";

        // Initialize JDBC components
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);

            String query = "SELECT * FROM courses";
            stmt = conn.createStatement();
            rs = stmt.executeQuery(query);

            while (rs.next()) {
                int id = rs.getInt("id");
                String courseName = rs.getString("course_name");
                String courseDescription = rs.getString("course_description");
                String courseImageUrl = rs.getString("course_image_url");
                String courseUrl = rs.getString("explore");
               
      %>
      <div class="col-md-4 mb-4">
        <div class="card shadow-sm">
          <img src="<%= courseImageUrl %>" class="card-img-top" alt="<%= courseName %>">
          <div class="card-body">
            <h5 class="card-title"><%= courseName %></h5>
            <p class="card-text"><%= courseDescription %></p>
            <p class="meta-info">
              
            </p>
            <a href="<%= courseUrl %>" class="btn btn-primary" target="_blank">Explore</a>
          </div>
        </div>
      </div>
      <%
            }
        } catch (Exception e) {
            out.println("<div class='alert alert-danger'>Error: " + e.getMessage() + "</div>");
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception e) {}
            try { if (stmt != null) stmt.close(); } catch (Exception e) {}
            try { if (conn != null) conn.close(); } catch (Exception e) {}
        }
      %>
    </div>
  </div>
</section>

<!-- Footer Section -->
<div id="footer"></div> <!-- Placeholder for footer -->

<script>
  fetch('Footer.html') // Fetching the footer content from Footer.html file
    .then(response => response.text()) // Convert the response to text
    .then(data => {
      document.getElementById('footer').innerHTML = data; // Insert the footer content
    })
    .catch(error => console.log('Error loading footer: ', error)); // Handle error
</script>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>
</body>
</html>
