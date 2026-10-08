<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Expense</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f2f4f7;
            margin: 0;
            padding: 40px;
        }

        .container {
            width: 500px;
            margin: auto;
            background: white;
            padding: 35px;
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.15);
        }

        h1 {
            text-align: center;
            color: #222;
        }

        label {
            display: block;
            margin-top: 15px;
            font-weight: bold;
        }

        input, select, textarea {
            width: 100%;
            padding: 11px;
            margin-top: 6px;
            border: 1px solid #ccc;
            border-radius: 6px;
            box-sizing: border-box;
        }

        textarea {
            height: 90px;
            resize: none;
        }

        .button {
            width: 100%;
            margin-top: 25px;
            padding: 13px;
            border: none;
            background: #007bff;
            color: white;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
        }

        .button:hover {
            background: #0056b3;
        }

        .back {
            display: block;
            text-align: center;
            margin-top: 15px;
            color: #007bff;
            text-decoration: none;
        }
    </style>
</head>

<body>

<div class="container">

    <h1>✏️ Edit Expense</h1>

    <form action="EditExpenseServlet" method="post">

        <input type="hidden"
               name="id"
               value="<%= request.getAttribute("id") %>">

        <label>Title</label>
        <input type="text"
               name="title"
               value="<%= request.getAttribute("title") %>"
               required>

        <label>Amount</label>
        <input type="number"
               step="0.01"
               name="amount"
               value="<%= request.getAttribute("amount") %>"
               required>

        <label>Category</label>
        <select name="category" required>
            <option value="Food">Food</option>
            <option value="Travel">Travel</option>
            <option value="Shopping">Shopping</option>
            <option value="Education">Education</option>
            <option value="Entertainment">Entertainment</option>
            <option value="Health">Health</option>
            <option value="Other">Other</option>
        </select>

        <label>Expense Date</label>
        <input type="date"
               name="expense_date"
               value="<%= request.getAttribute("expense_date") %>"
               required>

        <label>Description</label>
        <textarea name="description"><%= request.getAttribute("description") %></textarea>

        <button class="button" type="submit">
            Update Expense
        </button>

    </form>

    <a class="back" href="ViewExpensesServlet">
        ← Back to Expenses
    </a>

</div>

</body>
</html>