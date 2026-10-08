<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Add Expense | Expense Tracker</title>

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

        .navbar {
            max-width: 1100px;
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

        .wrapper {
            max-width: 700px;
            margin: 20px auto 50px;
        }

        .card {
            background: rgba(255,255,255,0.09);
            border: 1px solid rgba(255,255,255,0.15);
            backdrop-filter: blur(18px);
            -webkit-backdrop-filter: blur(18px);
            border-radius: 25px;
            padding: 40px;
            box-shadow: 0 25px 60px rgba(0,0,0,0.35);
        }

        .heading {
            text-align: center;
            margin-bottom: 35px;
        }

        .heading .icon {
            font-size: 42px;
            margin-bottom: 10px;
        }

        h1 {
            font-size: 34px;
            margin-bottom: 8px;
        }

        .subtitle {
            color: #94a3b8;
            font-size: 15px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            color: #e2e8f0;
            font-size: 14px;
            font-weight: 600;
        }

        input,
        select,
        textarea {
            width: 100%;
            padding: 14px 15px;
            border-radius: 10px;
            border: 1px solid rgba(255,255,255,0.15);
            background: rgba(15,23,42,0.65);
            color: white;
            font-size: 15px;
            outline: none;
            transition: 0.25s;
        }

        input:focus,
        select:focus,
        textarea:focus {
            border-color: #60a5fa;
            box-shadow: 0 0 0 3px rgba(96,165,250,0.15);
        }

        select option {
            color: black;
            background: white;
        }

        textarea {
            min-height: 110px;
            resize: vertical;
        }

        input::placeholder,
        textarea::placeholder {
            color: #64748b;
        }

        .save-btn {
            width: 100%;
            border: none;
            padding: 15px;
            border-radius: 10px;
            background: linear-gradient(135deg, #3b82f6, #6366f1);
            color: white;
            font-size: 16px;
            font-weight: 700;
            cursor: pointer;
            margin-top: 8px;
            transition: 0.3s;
            box-shadow: 0 10px 25px rgba(59,130,246,0.25);
        }

        .save-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 15px 30px rgba(59,130,246,0.4);
        }

        .back {
            display: block;
            text-align: center;
            margin-top: 22px;
            color: #93c5fd;
            text-decoration: none;
            font-size: 15px;
        }

        .back:hover {
            color: white;
        }

        @media (max-width: 600px) {

            body {
                padding: 15px;
            }

            .navbar {
                padding-bottom: 20px;
            }

            .badge {
                display: none;
            }

            .card {
                padding: 25px;
            }

            h1 {
                font-size: 28px;
            }
        }

    </style>
</head>

<body>

    <div class="navbar">

        <div class="logo">
            💰 Expense<span>Tracker</span>
        </div>

        <div class="badge">
            Smart Expense Management
        </div>

    </div>


    <div class="wrapper">

        <div class="card">

            <div class="heading">

                <div class="icon">
                    💸
                </div>

                <h1>Add New Expense</h1>

                <p class="subtitle">
                    Record your spending and keep your finances organized
                </p>

            </div>


            <form action="ExpenseServlet" method="post">

                <div class="form-group">

                    <label for="title">
                        Expense Title
                    </label>

                    <input
                        type="text"
                        id="title"
                        name="title"
                        placeholder="e.g. Grocery Shopping"
                        required>

                </div>


                <div class="form-group">

                    <label for="amount">
                        Amount (₹)
                    </label>

                    <input
                        type="number"
                        id="amount"
                        name="amount"
                        step="0.01"
                        min="0"
                        placeholder="e.g. 500"
                        required>

                </div>


                <div class="form-group">

                    <label for="category">
                        Category
                    </label>

                    <select
                        id="category"
                        name="category"
                        required>

                        <option value="">Select a category</option>

                        <option value="Food">
                            🍔 Food
                        </option>

                        <option value="Travel">
                            🚌 Travel
                        </option>

                        <option value="Shopping">
                            🛍️ Shopping
                        </option>

                        <option value="Education">
                            📚 Education
                        </option>

                        <option value="Entertainment">
                            🎬 Entertainment
                        </option>

                        <option value="Health">
                            ❤️ Health
                        </option>

                        <option value="Other">
                            📦 Other
                        </option>

                    </select>

                </div>


                <div class="form-group">

                    <label for="expense_date">
                        Expense Date
                    </label>

                    <input
                        type="date"
                        id="expense_date"
                        name="expense_date"
                        required>

                </div>


                <div class="form-group">

                    <label for="description">
                        Description
                    </label>

                    <textarea
                        id="description"
                        name="description"
                        placeholder="Add some details about this expense..."></textarea>

                </div>


                <button
                    type="submit"
                    class="save-btn">

                    💾 Save Expense

                </button>

            </form>


            <a
                class="back"
                href="index.jsp">

                ← Back to Home

            </a>

        </div>

    </div>

</body>
</html>