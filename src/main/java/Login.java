import jakarta.servlet.ServletException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet("/Login")
public class Login extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Database credentials
    private static final String DB_URL = "jdbc:mysql://localhost:3306/jdbc";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "";

    public Login() {
        super();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get input data
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String cpassword = request.getParameter("cpassword");

        response.setContentType("text/html");

        // Validate passwords match
        if (!password.equals(cpassword)) {
            response.getWriter().println("<h3>Error: Passwords do not match!</h3>");
            return;
        }

        // Input validation
        if (name == null || name.isEmpty() || email == null || email.isEmpty()) {
            response.getWriter().println("<h3>Error: Please fill all required fields correctly.</h3>");
            return;
        }

        try {
            // Load the database driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Connect to the database
            try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
                // SQL query
                String sql = "INSERT INTO registers (name, email, password) VALUES (?, ?, ?)";

                // Prepare statement
                try (PreparedStatement statement = connection.prepareStatement(sql)) {
                    statement.setString(1, name);
                    statement.setString(2, email);
                    statement.setString(3, password);

                    // Execute query
                    int rowsInserted = statement.executeUpdate();
                    if (rowsInserted > 0) {
                    	 response.getWriter().println("<h3>Register Successfully.</h3>");
                        // Redirect to Register.html on successful registration
                        response.sendRedirect("index.html");
                    } else {
                        response.getWriter().println("<h3>Error: Unable to store the data.</h3>");
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("<h3>Error: Database connection failed! Please try again later.</h3>");
        }
    }
}
