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

@WebServlet("/DeleteUserServlet")
public class DeleteUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the userId from the form
    	int userId = Integer.parseInt(request.getParameter("userId"));
        
        Connection connection = null;
        PreparedStatement statement = null;

        try {
            // Set response content type
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            
            // Database connection details
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/jdbc", "root", "");

            // SQL query to delete the user
            String query = "DELETE FROM registers WHERE id = ?";
            statement = connection.prepareStatement(query);
            statement.setInt(1, userId);

            int rowsAffected = statement.executeUpdate();

            if (rowsAffected > 0) {
                // User was successfully deleted
                out.println("<script type='text/javascript'>");
                out.println("alert('User deleted successfully!');");
                out.println("window.location.href = 'Admin/adminPanel.jsp';"); // Redirect to the manage users page
                out.println("</script>");
            } else {
                // User not found
                out.println("<script type='text/javascript'>");
                out.println("alert('Error: User not found!');");
                out.println("window.location.href = 'Admin/adminPanel.jsp';"); // Redirect to the manage users page
                out.println("</script>");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Close the resources
            try {
                if (statement != null) statement.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
