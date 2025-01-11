import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet("/UpdateProfile")
@MultipartConfig
public class UpdateProfile extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String DB_URL = "jdbc:mysql://localhost:3306/jdbc";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        // Fetch parameters
        String name = request.getParameter("name");
        String className = request.getParameter("className");
        String section = request.getParameter("section");
        String attendance = request.getParameter("attendance");
        String gpa = request.getParameter("gpa");
        String email = (String) session.getAttribute("email"); // Use session to identify user

        Part profilePicturePart = request.getPart("profilePicture");
        String profilePicturePath = null;

        if (profilePicturePart != null && profilePicturePart.getSize() > 0) {
            String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) uploadDir.mkdir();

            profilePicturePath = uploadPath + File.separator + profilePicturePart.getSubmittedFileName();
            profilePicturePart.write(profilePicturePath);
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
                String sql = "UPDATE registers SET name = ?, profile_picture = ?, class_name = ?, section = ?, atten = ?, gpa = ? WHERE email = ?";
                try (PreparedStatement statement = connection.prepareStatement(sql)) {
                    statement.setString(1, name);
                    statement.setString(2, profilePicturePath);
                    statement.setString(3, className);
                    statement.setString(4, section);
                    statement.setString(5, attendance);
                    statement.setString(6, gpa);
                    statement.setString(7, email);

                    int rowsUpdated = statement.executeUpdate();
                    if (rowsUpdated > 0) {
                        session.setAttribute("name", name);
                        session.setAttribute("profilePicture", profilePicturePath);
                        session.setAttribute("className", className);
                        session.setAttribute("section", section);
                        session.setAttribute("atten", Double.valueOf(attendance));
                        session.setAttribute("gpa", Double.valueOf(gpa));

                        response.sendRedirect("Profile.jsp");
                    } else {
                        response.getWriter().println("<h3>Error updating profile. Try again!</h3>");
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("<h3>Error: Database connection failed!</h3>");
        }
    }
}
