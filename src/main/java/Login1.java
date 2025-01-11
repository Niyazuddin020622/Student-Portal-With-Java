import jakarta.servlet.ServletException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/Login1")
public class Login1 extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final String DB_URL = "jdbc:mysql://localhost:3306/jdbc"; // Replace with your DB name
    private static final String DB_USER = "root"; // Replace with your MySQL username
    private static final String DB_PASSWORD = ""; // Replace with your MySQL password

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        response.setContentType("text/html");

        if (email == null || email.isEmpty() || password == null || password.isEmpty()) {
            response.getWriter().println("<h3>Error: Please fill in all the fields.</h3>");
            return;
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
                String sql = "SELECT name, role, profile_picture, atten, class_name, section, gpa FROM registers WHERE email = ? AND password = ?";
                try (PreparedStatement statement = connection.prepareStatement(sql)) {
                    statement.setString(1, email);
                    statement.setString(2, password);

                    ResultSet resultSet = statement.executeQuery();
                    if (resultSet.next()) {
                        // Fetching user details
                        String name = resultSet.getString("name");
                        String role = resultSet.getString("role");
                        String profilePicture = resultSet.getString("profile_picture");
                        double attendance = resultSet.getDouble("atten");
                        String className = resultSet.getString("class_name");
                        String section = resultSet.getString("section");
                        double gpa = resultSet.getDouble("gpa");

                        // Storing details in session
                        HttpSession session = request.getSession();
                        session.setAttribute("name", name);
                        session.setAttribute("email", email);
                        session.setAttribute("profilePicture", profilePicture);
                        session.setAttribute("atten", attendance);
                        session.setAttribute("className", className);
                        session.setAttribute("section", section);
                        session.setAttribute("gpa", gpa);

                        if ("user".equalsIgnoreCase(role)) {
                            response.sendRedirect("Home.jsp");
                        } else if ("admin".equalsIgnoreCase(role)) {
                            response.sendRedirect("Admin/adminPanel.jsp");
                        } else {
                            response.getWriter().println("<h3>Error: Unknown role. Please contact support.</h3>");
                        }
                    } else {
                        response.getWriter().println("<h3>Error: Invalid email or password.</h3>");
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("<h3>Error: Unable to connect to the database. Please try again later.</h3>");
        }
    }
}
