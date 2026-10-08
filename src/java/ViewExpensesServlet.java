import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ViewExpensesServlet")
public class ViewExpensesServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        List<Map<String, Object>> expenses =
                new ArrayList<Map<String, Object>>();

        String sql = "SELECT * FROM expenses ORDER BY expense_date DESC";

        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Map<String, Object> expense =
                        new HashMap<String, Object>();

                expense.put("id", rs.getInt("id"));
                expense.put("title", rs.getString("title"));
                expense.put("amount", rs.getDouble("amount"));
                expense.put("category", rs.getString("category"));
                expense.put("expense_date",
                        rs.getString("expense_date"));
                expense.put("description",
                        rs.getString("description"));

                expenses.add(expense);
            }

            rs.close();
            ps.close();
            con.close();

            request.setAttribute("expenses", expenses);

            request.getRequestDispatcher("viewExpenses.jsp")
                   .forward(request, response);

        } catch (Exception e) {

            response.setContentType("text/html");

            response.getWriter().println(
                    "<h2>Error while loading expenses</h2>");

            response.getWriter().println(
                    "<pre>" + e.toString() + "</pre>");
        }
    }
}