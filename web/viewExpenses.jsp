<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>View Expenses | Expense Tracker</title>

    <style>

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: "Segoe UI", Arial, sans-serif;
            min-height: 100vh;

            background:
                radial-gradient(circle at 10% 20%, rgba(99,102,241,0.25), transparent 30%),
                radial-gradient(circle at 90% 80%, rgba(14,165,233,0.22), transparent 30%),
                linear-gradient(135deg, #0f172a, #1e293b);

            color: white;
            padding: 30px;
        }

        /* NAVBAR */

        .navbar {
            max-width: 1250px;
            margin: auto;

            display: flex;
            justify-content: space-between;
            align-items: center;

            padding: 10px 0 30px;
        }

        .logo {
            font-size: 25px;
            font-weight: 700;
        }

        .logo span {
            color: #60a5fa;
        }

        .badge {
            padding: 8px 16px;
            border-radius: 30px;

            background: rgba(255,255,255,0.08);
            border: 1px solid rgba(255,255,255,0.15);

            color: #cbd5e1;
            font-size: 13px;
        }

        /* MAIN CARD */

        .container {
            max-width: 1250px;
            margin: 20px auto 50px;

            background: rgba(255,255,255,0.08);
            border: 1px solid rgba(255,255,255,0.15);

            backdrop-filter: blur(18px);
            -webkit-backdrop-filter: blur(18px);

            border-radius: 25px;
            padding: 35px;

            box-shadow: 0 25px 60px rgba(0,0,0,0.35);
        }

        /* HEADING */

        .heading {
            text-align: center;
            margin-bottom: 30px;
        }

        .heading-icon {
            font-size: 42px;
            margin-bottom: 8px;
        }

        h1 {
            font-size: 34px;
            margin-bottom: 8px;
        }

        .subtitle {
            color: #94a3b8;
            font-size: 15px;
        }

        /* TABLE */

        .table-wrapper {
            overflow-x: auto;
            border-radius: 15px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            min-width: 900px;
            overflow: hidden;
        }

        th {
            background: linear-gradient(135deg, #2563eb, #4f46e5);
            color: white;

            padding: 16px 12px;
            text-align: center;

            font-size: 14px;
            letter-spacing: 0.3px;
        }

        td {
            padding: 15px 12px;

            border-bottom: 1px solid rgba(255,255,255,0.08);

            text-align: center;
            color: #e2e8f0;
            font-size: 14px;
        }

        tbody tr {
            background: rgba(255,255,255,0.035);
            transition: 0.25s;
        }

        tbody tr:hover {
            background: rgba(96,165,250,0.10);
        }

        .amount {
            font-weight: 700;
            color: #86efac;
        }

        .no-expenses {
            padding: 30px;
            color: #94a3b8;
            font-size: 16px;
        }

        /* ACTION BUTTONS */

        .edit {
            display: inline-block;

            padding: 8px 12px;
            margin-right: 6px;

            border-radius: 7px;

            background: rgba(59,130,246,0.15);
            border: 1px solid rgba(96,165,250,0.25);

            color: #93c5fd;
            text-decoration: none;

            font-weight: 600;
            transition: 0.25s;
        }

        .edit:hover {
            background: #2563eb;
            color: white;
            transform: translateY(-2px);
        }

        .delete {
            display: inline-block;

            padding: 8px 12px;

            border-radius: 7px;

            background: rgba(239,68,68,0.12);
            border: 1px solid rgba(248,113,113,0.2);

            color: #fca5a5;
            text-decoration: none;

            font-weight: 600;
            transition: 0.25s;
        }

        .delete:hover {
            background: #dc2626;
            color: white;
            transform: translateY(-2px);
        }

        /* BACK BUTTON */

        .back {
            display: inline-block;

            margin-top: 30px;
            padding: 13px 20px;

            background: linear-gradient(135deg, #3b82f6, #6366f1);

            color: white;
            text-decoration: none;

            border-radius: 9px;

            font-weight: 600;

            box-shadow: 0 8px 20px rgba(59,130,246,0.25);

            transition: 0.3s;
        }

        .back:hover {
            transform: translateY(-2px);

            box-shadow: 0 12px 25px rgba(59,130,246,0.4);
        }

        /* MOBILE */

        @media (max-width: 650px) {

            body {
                padding: 15px;
            }

            .badge {
                display: none;
            }

            .container {
                padding: 20px;
            }

            h1 {
                font-size: 28px;
            }

        }

    </style>

</head>

<body>


<!-- NAVBAR -->

<div class="navbar">

    <div class="logo">
        💰 Expense<span>Tracker</span>
    </div>

    <div class="badge">
        Smart Expense Management
    </div>

</div>


<!-- MAIN -->

<div class="container">


    <div class="heading">

        <div class="heading-icon">
            📊
        </div>

        <h1>
            All Expenses
        </h1>

        <p class="subtitle">
            View and manage all your recorded expenses
        </p>

    </div>


    <div class="table-wrapper">

        <table>

            <thead>

                <tr>

                    <th>ID</th>
                    <th>Title</th>
                    <th>Amount</th>
                    <th>Category</th>
                    <th>Date</th>
                    <th>Description</th>
                    <th>Action</th>

                </tr>

            </thead>


            <tbody>

            <%
                List<Map<String, Object>> expenses =
                    (List<Map<String, Object>>)
                    request.getAttribute("expenses");

                if (expenses != null && !expenses.isEmpty()) {

                    for (Map<String, Object> expense : expenses) {
            %>

                <tr>

                    <td>
                        <%= expense.get("id") %>
                    </td>

                    <td>
                        <%= expense.get("title") %>
                    </td>

                    <td class="amount">
                        ₹ <%= expense.get("amount") %>
                    </td>

                    <td>
                        <%= expense.get("category") %>
                    </td>

                    <td>
                        <%= expense.get("expense_date") %>
                    </td>

                    <td>
                        <%= expense.get("description") %>
                    </td>

                    <td>

                        <a
                            class="edit"
                            href="EditExpenseServlet?id=<%= expense.get("id") %>">

                            ✏️ Edit

                        </a>


                        <a
                            class="delete"
                            href="DeleteExpenseServlet?id=<%= expense.get("id") %>"

                            onclick="return confirm('Are you sure you want to delete this expense?');">

                            🗑 Delete

                        </a>

                    </td>

                </tr>

            <%
                    }

                } else {
            %>

                <tr>

                    <td
                        colspan="7"
                        class="no-expenses">

                        📭 No expenses found.

                    </td>

                </tr>

            <%
                }
            %>

            </tbody>

        </table>

    </div>


    <!-- BACK TO HOME -->

    <a
        class="back"
        href="index.jsp">

        ← Back to Home

    </a>


</div>

</body>
</html>