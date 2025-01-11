<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Manage Courses</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
  body {
    background-color: #f5f5f5;
  }
  .navbar {
    margin-bottom: 20px;
  }
  .card {
    margin: 20px 0;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
  }
  .action-btns {
    display: flex;
    gap: 10px;
  }
</style>
</head>
<body>

<!-- Courses Section -->
<div class="container mt-4" id="courses">
  <h2>Manage Courses</h2>
  <table class="table table-striped table-bordered">
    <thead class="table-dark">
      <tr>
        <th>ID</th>
        <th>Course Name</th>
        <th>Course Description</th>
        <th>Course Image</th>
        <th>Explore Link</th>
        <th>Created At</th>
        <th>Updated At</th>
        <th>Actions</th>
      </tr>
    </thead>
    <tbody>
      <% 
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
          // Establish connection to the database
          Class.forName("com.mysql.cj.jdbc.Driver");
          connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/jdbc", "root", "");

          // SQL query to fetch course data
          String query = "SELECT * FROM courses";
          statement = connection.prepareStatement(query);
          resultSet = statement.executeQuery();

          // Loop through result set and display courses
          while (resultSet.next()) {
      %>
      <tr>
        <td><%= resultSet.getInt("id") %></td>
        <td><%= resultSet.getString("course_name") %></td>
        <td><%= resultSet.getString("course_description") %></td>
        <td><img src="<%= resultSet.getString("course_image_url") %>" alt="Course Image" width="100" height="auto"></td>
        <td>
          <!-- Button to open the link from Explore column -->
          <form method="POST" action="<%= resultSet.getString("Explore") %>" target="_blank" style="display: inline;">
            <button type="submit" class="btn btn-sm btn-primary">Explore</button>
          </form>
        </td>
        <td><%= resultSet.getTimestamp("created_at") %></td>
        <td><%= resultSet.getTimestamp("updated_at") %></td>
        <td class="action-btns">
          <form method="POST" action="EditCourseServlet" style="display: inline;">
            <input type="hidden" name="courseId" value="<%= resultSet.getInt("id") %>">
            <button type="submit" class="btn btn-sm btn-warning">Edit</button>
          </form>
          <form method="POST" action="DeleteCourseServlet" style="display: inline;">
            <input type="hidden" name="courseId" value="<%= resultSet.getInt("id") %>">
            <button type="submit" class="btn btn-sm btn-danger">Delete</button>
          </form>
        </td>
      </tr>
      <% 
          }
        } catch (Exception e) {
      %>
      <tr>
        <td colspan="8" class="text-danger">Error fetching data. Please try again later.</td>
      </tr>
      <%
          e.printStackTrace();
        } finally {
          // Close the database resources
          if (resultSet != null) try { resultSet.close(); } catch (Exception ignored) {}
          if (statement != null) try { statement.close(); } catch (Exception ignored) {}
          if (connection != null) try { connection.close(); } catch (Exception ignored) {}
        }
      %>
    </tbody>
  </table>
</div>

<!-- Scripts -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
