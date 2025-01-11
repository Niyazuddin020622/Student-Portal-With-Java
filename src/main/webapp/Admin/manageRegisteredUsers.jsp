<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Manage Registered Users</title>
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

<!-- Registered Users Section -->
<div class="container mt-4" id="registeredUsers">
  <h2>Registered Users</h2>
  <table class="table table-striped table-bordered">
    <thead class="table-dark">
      <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Email</th>
        <th>Password</th>
        <th>Profile Picture</th>
        <th>Attendance</th>
        <th>Class Name</th>
        <th>Section</th>
        <th>GPA</th>
        <th>Role</th>
        <th>Actions</th>
      </tr>
    </thead>
    <tbody>
      <% 
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
          Class.forName("com.mysql.cj.jdbc.Driver");
          connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/jdbc", "root", "");
          String query = "SELECT * FROM registers";
          statement = connection.prepareStatement(query);
          resultSet = statement.executeQuery();

          while (resultSet.next()) {
      %>
      <tr>
        <td><%= resultSet.getInt("id") %></td>
        <td><%= resultSet.getString("name") %></td>
        <td><%= resultSet.getString("email") %></td>
        <td><%= resultSet.getString("password") %></td>
        <td>
          <img src="<%= resultSet.getString("profile_picture") %>" alt="Profile Image" width="60" height="60">
        </td>
        <td><%= resultSet.getString("atten") %></td>
        <td><%= resultSet.getString("class_name") %></td>
        <td><%= resultSet.getString("section") %></td>
        <td><%= resultSet.getFloat("gpa") %></td>
        <td><%= resultSet.getString("role") %></td>
        <td class="action-btns">
          <form method="POST" action="EditUserServlet" style="display: inline;">
            <input type="hidden" name="userId" value="<%= resultSet.getInt("id") %>">
            <button type="submit" class="btn btn-sm btn-warning">Edit</button>
          </form>
          <form method="POST" action="../DeleteUserServlet" style="display: inline;" onsubmit="return confirmDelete();">
            <input type="hidden" name="userId" value="<%= resultSet.getInt("id") %>">
            <button type="submit" class="btn btn-sm btn-danger">Delete</button>
          </form>
        </td>
      </tr>
      <% 
          }
        } catch (Exception e) {
      %>
      <tr>
        <td colspan="11" class="text-danger">Error fetching data. Please try again later.</td>
      </tr>
      <%
          e.printStackTrace();
        } finally {
          if (resultSet != null) try { resultSet.close(); } catch (Exception ignored) {}
          if (statement != null) try { statement.close(); } catch (Exception ignored) {}
          if (connection != null) try { connection.close(); } catch (Exception ignored) {}
        }
      %>
    </tbody>
  </table>
</div>

<!-- JavaScript for confirmation -->
<script>
  function confirmDelete() {
    return confirm("Are you sure you want to delete this user?");
}
</script>

<!-- Scripts -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
