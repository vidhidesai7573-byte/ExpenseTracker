import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DeleteExpenseServlet")
public class DeleteExpenseServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("id");

        if (id != null && !id.trim().isEmpty()) {

            try {
                Connection con = DBConnection.getConnection();

                String sql = "DELETE FROM expenses WHERE id = ?";

                PreparedStatement ps = con.prepareStatement(sql);

                ps.setInt(1, Integer.parseInt(id));

                ps.executeUpdate();

                ps.close();
                con.close();

            } catch (Exception e) {
                response.setContentType("text/html");
                response.getWriter().println(
                    "<h2>Error while deleting expense</h2>"
                );
                response.getWriter().println(
                    "<pre>" + e.toString() + "</pre>"
                );
                return;
            }
        }

        response.sendRedirect("ViewExpensesServlet");
    }
}