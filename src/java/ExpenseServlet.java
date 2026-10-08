import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ExpenseServlet")
public class ExpenseServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        PrintWriter out = response.getWriter();

        String title = request.getParameter("title");
        String amountText = request.getParameter("amount");
        String category = request.getParameter("category");
        String expenseDate = request.getParameter("expense_date");
        String description = request.getParameter("description");

        try {

            double amount = Double.parseDouble(amountText);

            String sql = "INSERT INTO expenses "
                    + "(title, amount, category, expense_date, description) "
                    + "VALUES (?, ?, ?, ?, ?)";

            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, title);
            ps.setDouble(2, amount);
            ps.setString(3, category);
            ps.setString(4, expenseDate);
            ps.setString(5, description);

            ps.executeUpdate();

            ps.close();
            con.close();

            out.println("<html>");
            out.println("<head>");
            out.println("<title>Expense Added</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Expense Added Successfully!</h1>");
            out.println("<p>Your expense has been saved to MySQL.</p>");
            out.println("<a href='index.jsp'>Back to Home</a>");
            out.println("</body>");
            out.println("</html>");

        } catch (Exception e) {

            e.printStackTrace();

            out.println("<html>");
            out.println("<body>");
            out.println("<h2>Error while saving expense</h2>");
            out.println("<pre>");
            e.printStackTrace(out);
            out.println("</pre>");
            out.println("</body>");
            out.println("</html>");
        }
    }
}