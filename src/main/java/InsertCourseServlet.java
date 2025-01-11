import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/InsertCourseServlet")
public class InsertCourseServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Set response content type
        response.setContentType("text/html");

        PrintWriter out = response.getWriter();

        String courseName = request.getParameter("course_name");
        String courseDescription = request.getParameter("course_description");
        String courseImgUrl = request.getParameter("course_img_url");
        String exploreImgUrl = request.getParameter("explore_img_url");

        // Database connection parameters
        String jdbcURL = "jdbc:mysql://localhost:3306/jdbc";
        String dbUser = "root";
        String dbPassword = ""; // Replace with your actual MySQL password

        try {
            // Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish database connection
            Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

            // SQL query for insertion
            String query = "INSERT INTO courses (course_name, course_description, course_image_url, Explore, created_at, updated_at) " +
                           "VALUES (?, ?, ?, ?, current_timestamp(), current_timestamp())";
            PreparedStatement statement = connection.prepareStatement(query);

            // Set parameters for the PreparedStatement
            statement.setString(1, courseName);
            statement.setString(2, courseDescription);
            statement.setString(3, courseImgUrl);
            statement.setString(4, exploreImgUrl);

            int rowsInserted = statement.executeUpdate();

            if (rowsInserted > 0) {
                out.println("<script>alert('Course added successfully!');</script>");
                response.sendRedirect("");
            } else {
                out.println("<script>alert('Error adding course. Please try again later.');</script>");
            }

            statement.close();
            connection.close();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            out.println("<script>alert('Driver not found: " + e.getMessage() + "');</script>");
        } catch (SQLException e) {
            e.printStackTrace();
            out.println("<script>alert('Database error: " + e.getMessage() + "');</script>");
        }
    }
}
