import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/EditExpenseServlet")
public class EditExpenseServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("id");

        try {
            Connection con = DBConnection.getConnection();

            String sql = "SELECT * FROM expenses WHERE id = ?";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, Integer.parseInt(id));

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                request.setAttribute("id", rs.getInt("id"));
                request.setAttribute("title", rs.getString("title"));
                request.setAttribute("amount", rs.getDouble("amount"));
                request.setAttribute("category", rs.getString("category"));
                request.setAttribute("expense_date",
                        rs.getString("expense_date"));
                request.setAttribute("description",
                        rs.getString("description"));

                request.getRequestDispatcher("editExpense.jsp")
                       .forward(request, response);
            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {
            response.setContentType("text/html");
            response.getWriter().println(
                "<h2>Error while loading expense</h2>"
            );
            response.getWriter().println(
                "<pre>" + e.toString() + "</pre>"
            );
        }
    }

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        try {
            int id = Integer.parseInt(request.getParameter("id"));

            String title = request.getParameter("title");
            double amount = Double.parseDouble(
                    request.getParameter("amount"));
            String category = request.getParameter("category");
            String date = request.getParameter("expense_date");
            String description = request.getParameter("description");

            Connection con = DBConnection.getConnection();

            String sql = "UPDATE expenses SET title=?, amount=?, "
                       + "category=?, expense_date=?, description=? "
                       + "WHERE id=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, title);
            ps.setDouble(2, amount);
            ps.setString(3, category);
            ps.setString(4, date);
            ps.setString(5, description);
            ps.setInt(6, id);

            ps.executeUpdate();

            ps.close();
            con.close();

            response.sendRedirect("ViewExpensesServlet");

        } catch (Exception e) {
            response.setContentType("text/html");
            response.getWriter().println(
                "<h2>Error while updating expense</h2>"
            );
            response.getWriter().println(
                "<pre>" + e.toString() + "</pre>"
            );
        }
    }
}