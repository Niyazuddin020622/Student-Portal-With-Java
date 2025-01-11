<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%
    String name = (String) session.getAttribute("name");
    String email = (String) session.getAttribute("email");
    String profilePicture = (String) session.getAttribute("profilePicture");
    Double attendance = (Double) session.getAttribute("atten");
    String className = (String) session.getAttribute("className");
    String section = (String) session.getAttribute("section");
    Double gpa = (Double) session.getAttribute("gpa");

    if (name == null || email == null) {
        response.sendRedirect("login.html");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Student Portal</title>

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Bootstrap Icons -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="Home.css">
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container">
    <a class="navbar-brand" href="#">
      <i class="bi bi-mortarboard-fill me-2"></i>
      Student Portal
    </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item"><a class="nav-link active" href="#">Home</a></li>
        <li class="nav-item"><a class="nav-link" href="courses.jsp">Courses</a></li>
        <li class="nav-item"><a class="nav-link" href="Assignment.html">Assignments</a></li>
        <li class="nav-item"><a class="nav-link" href="Grades.html">Grades</a></li>
        <li class="nav-item"><a class="nav-link" href="Resources.html">Resources</a></li>
        <li class="nav-item"><a class="nav-link" href="Profile.jsp">Profile</a></li>
      </ul>
      <a href="Logout" class="btn btn-outline-danger">Logout</a>
    </div>
  </div>
</nav>

<!-- Hero Section -->
<div class="hero-section">
  <div>
    <h1>Welcome to the Student Portal</h1>
    <p class="lead">Empowering Students to Achieve Excellence</p>
    <a href="#services" class="btn btn-primary btn-lg">Explore More</a>
  </div>
</div>

<!-- About Section -->
<section class="about-section py-5" id="about">
  <div class="container">
    <div class="row align-items-center">
      <div class="col-md-6">
        <img src="https://images.unsplash.com/photo-1523240795612-9a054b0db644" alt="About Us" class="img-fluid rounded shadow">
      </div>
      <div class="col-md-6">
        <h2>About Us</h2>
        <p>We are dedicated to providing students with the best resources to enhance their learning experience. From educational materials to career guidance, our mission is to support students in every step of their academic journey.</p>
      </div>
    </div>
  </div>
</section>

<!-- Services Section -->
<section class="services-section bg-light py-5" id="services">
  <div class="container">
    <h2 class="text-center mb-4">Our Services</h2>
    
    <!-- Carousel -->
    <div id="servicesCarousel" class="carousel slide" data-bs-ride="carousel">
      <div class="carousel-inner">
        <!-- Carousel item 1 -->
        <div class="carousel-item active">
          <div class="row">
            <div class="col-md-4 text-center">
              <div class="card border-0 shadow-sm">
                <img src="https://images.unsplash.com/photo-1503676260728-1c00da094a0b" class="card-img-top" alt="Study Materials">
                <div class="card-body">
                  <h5 class="card-title">Study Materials</h5>
                  <p class="card-text">Access a wide range of educational resources to help you excel in your studies.</p>
                </div>
              </div>
            </div>
            <div class="col-md-4 text-center">
              <div class="card border-0 shadow-sm">
                <img src="https://images.unsplash.com/photo-1610484826967-09c5720778c7" class="card-img-top" alt="Career Guidance">
                <div class="card-body">
                  <h5 class="card-title">Career Guidance</h5>
                  <p class="card-text">Get personalized guidance to choose the right career path for your future.</p>
                </div>
              </div>
            </div>
            <div class="col-md-4 text-center">
              <div class="card border-0 shadow-sm">
                <img src="https://images.unsplash.com/photo-1516397281156-ca07cf9746fc" class="card-img-top" alt="Community Support">
                <div class="card-body">
                  <h5 class="card-title">Community Support</h5>
                  <p class="card-text">Join a community of learners and collaborate to achieve your goals.</p>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- Carousel item 2 -->
        <div class="carousel-item">
          <div class="row">
            <div class="col-md-4 text-center">
              <div class="card border-0 shadow-sm">
                <img src="https://cdn.prod.website-files.com/61841eeeb196d8bb217a08c2/61cde110bda4b080d4c69cca_619545cc5c43eeea75258c71_2_Webinar%2520vs%2520Workshop.jpeg" class="card-img-top" alt="Study Materials">
                <div class="card-body">
                  <h5 class="card-title">Interactive Online Workshops</h5>
                  <p class="card-text">Join live sessions and workshops to boost your skills.</p>
                </div>
              </div>
            </div>
            <div class="col-md-4 text-center">
              <div class="card border-0 shadow-sm">
                <img src="https://images.squarespace-cdn.com/content/v1/629540fdd7e567047c1115f2/eed6deb8-142a-4dc6-848c-988b2d74766a/Image+16.jpg" class="card-img-top" alt="Career Guidance">
                <div class="card-body">
                  <h5 class="card-title">Expert Academic Tutoring</h5>
                  <p class="card-text">Get help from experienced tutors for all subjects.</p>
                </div>
              </div>
            </div>
            <div class="col-md-4 text-center">
              <div class="card border-0 shadow-sm">
                <img src="https://images.unsplash.com/photo-1516397281156-ca07cf9746fc" class="card-img-top" alt="Community Support">
                <div class="card-body">
                  <h5 class="card-title">Community Support</h5>
                  <p class="card-text">Join a community of learners and collaborate to achieve your goals.</p>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- Add more carousel items as needed -->
      </div>
      <!-- Carousel controls -->
      <button class="carousel-control-prev" type="button" data-bs-target="#servicesCarousel" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
      </button>
      <button class="carousel-control-next" type="button" data-bs-target="#servicesCarousel" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
      </button>
    </div>
  </div>
</section>
<!-- Contact Us Section -->
<section class="contact-us-section py-5" id="contact">
  <div class="container">
    <h2 class="text-center mb-4">Contact Us</h2>
    <div class="row">
      <div class="col-md-6">
        <h4>Get in Touch</h4>
        <form action="contactFormHandler.jsp" method="POST">
          <div class="mb-3">
            <label for="name" class="form-label">Your Name</label>
            <input type="text" class="form-control" id="name" name="name" required>
          </div>
          <div class="mb-3">
            <label for="email" class="form-label">Your Email</label>
            <input type="email" class="form-control" id="email" name="email" required>
          </div>
          <div class="mb-3">
            <label for="message" class="form-label">Your Message</label>
            <textarea class="form-control" id="message" name="message" rows="4" required></textarea>
          </div>
          <button type="submit" class="btn btn-primary">Submit</button>
        </form>
      </div>
      <div class="col-md-6">
        <h4>Our Location</h4>
        <p>1234 School St, City, Country</p>
        <!-- You can also embed Google Maps -->
        <div class="embed-responsive embed-responsive-16by9">
        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d118147.68696443523!2d70.73872349317425!3d22.273624940214702!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3959c98ac71cdf0f%3A0x76dd15cfbe93ad3b!2sRajkot%2C%20Gujarat!5e0!3m2!1sen!2sin!4v1735495888009!5m2!1sen!2sin" width="100%" height="300" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
          
        </div>
      </div>
    </div>
  </div>
</section>


<!-- Footer Section -->
<div id="footer"></div>
<script>
  fetch('Footer.html')
    .then(response => response.text())
    .then(data => {
      document.getElementById('footer').innerHTML = data;
    })
    .catch(error => console.error('Error loading footer: ', error));
</script>

<!-- Bootstrap JS and Popper -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>
</body>
</html>
