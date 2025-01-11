<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Panel</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
  body {
    background-color: #f5f5f5;
  }
  .navbar {
    margin-bottom: 20px;
  }
  .container {
    margin-top: 20px;
  }
  .form-control {
    margin-bottom: 15px;
  }
</style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark" style="background-color: #007bff;">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Admin Panel</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse justify-content-between" id="navbarNav">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link active" href="adminPanel.jsp">Dashboard</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#addStudent">Manage Student</a>
        </li>
        <li class="nav-item">
          <a class="nav-link " href="ManageCourse.html">Manage Courses</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#studentList">Manage Assignments</a>
        </li>
      </ul>
      
        <a href="../Logout" class="btn btn-outline-danger" style="margin-left: auto;">Logout</a>
    </div>
  </div>
</nav>

<!-- Register Manage Section -->
<div id="register"></div>
<script>
  fetch('manageRegisteredUsers.jsp')
    .then(response => response.text())
    .then(data => {
      document.getElementById('register').innerHTML = data;
    })
    .catch(error => console.error('Error loading footer: ', error));
</script>

<!-- Register Manage Section -->
<div id="fetchcourses"></div>
<script>
  fetch('FetchCourses.jsp')
    .then(response => response.text())
    .then(data => {
      document.getElementById('fetchcourses').innerHTML = data;
    })
    .catch(error => console.error('Error loading footer: ', error));
</script>

<!-- Scripts -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
