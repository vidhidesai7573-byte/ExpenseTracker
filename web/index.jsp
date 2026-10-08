<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Expense Tracker | Smart Finance</title>

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
            overflow-x: hidden;
        }

        /* NAVBAR */

        .navbar {
            width: 100%;
            padding: 22px 7%;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logo {
            font-size: 25px;
            font-weight: 700;
            letter-spacing: 0.5px;
        }

        .logo span {
            color: #60a5fa;
        }

        .badge {
            background: rgba(255,255,255,0.1);
            border: 1px solid rgba(255,255,255,0.15);
            padding: 8px 16px;
            border-radius: 30px;
            font-size: 13px;
            color: #cbd5e1;
        }

        /* HERO */

        .hero {
            min-height: calc(100vh - 80px);
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 40px 7%;
        }

        .content {
            width: 100%;
            max-width: 1100px;
            display: grid;
            grid-template-columns: 1.2fr 0.8fr;
            gap: 70px;
            align-items: center;
        }

        .left h1 {
            font-size: 58px;
            line-height: 1.08;
            margin-bottom: 22px;
        }

        .highlight {
            background: linear-gradient(90deg, #60a5fa, #a78bfa);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .left p {
            color: #cbd5e1;
            font-size: 18px;
            line-height: 1.7;
            max-width: 580px;
            margin-bottom: 35px;
        }

        /* BUTTONS */

        .buttons {
            display: flex;
            gap: 15px;
            flex-wrap: wrap;
        }

        .button {
            text-decoration: none;
            padding: 15px 24px;
            border-radius: 10px;
            font-size: 16px;
            font-weight: 600;
            transition: 0.3s;
            display: inline-flex;
            align-items: center;
            gap: 8px;
        }

        .primary {
            background: linear-gradient(135deg, #3b82f6, #6366f1);
            color: white;
            box-shadow: 0 10px 25px rgba(59,130,246,0.3);
        }

        .primary:hover {
            transform: translateY(-3px);
            box-shadow: 0 15px 30px rgba(59,130,246,0.45);
        }

        .secondary {
            background: rgba(255,255,255,0.08);
            border: 1px solid rgba(255,255,255,0.18);
            color: white;
        }

        .secondary:hover {
            background: rgba(255,255,255,0.15);
            transform: translateY(-3px);
        }

        /* DASHBOARD CARD */

        .dashboard {
            background: rgba(255,255,255,0.08);
            border: 1px solid rgba(255,255,255,0.15);
            backdrop-filter: blur(18px);
            -webkit-backdrop-filter: blur(18px);
            border-radius: 25px;
            padding: 28px;
            box-shadow: 0 25px 60px rgba(0,0,0,0.35);
        }

        .dashboard-title {
            color: #cbd5e1;
            font-size: 14px;
            margin-bottom: 12px;
        }

        .balance {
            font-size: 38px;
            font-weight: 700;
            margin-bottom: 25px;
        }

        .mini-card {
            background: rgba(255,255,255,0.08);
            border-radius: 15px;
            padding: 18px;
            margin-top: 12px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .mini-left {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .icon {
            width: 42px;
            height: 42px;
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            background: rgba(96,165,250,0.18);
            font-size: 20px;
        }

        .mini-name {
            font-weight: 600;
        }

        .mini-date {
            color: #94a3b8;
            font-size: 12px;
            margin-top: 4px;
        }

        .price {
            font-weight: 700;
        }

        /* FEATURES */

        .features {
            display: flex;
            gap: 25px;
            margin-top: 35px;
            color: #94a3b8;
            font-size: 14px;
        }

        .feature {
            display: flex;
            align-items: center;
            gap: 7px;
        }

        /* RESPONSIVE */

        @media (max-width: 850px) {

            .content {
                grid-template-columns: 1fr;
                gap: 40px;
            }

            .left h1 {
                font-size: 42px;
            }

            .dashboard {
                max-width: 500px;
            }
        }

    </style>
</head>

<body>

    <!-- NAVBAR -->

    <nav class="navbar">

        <div class="logo">
            💰 Expense<span>Tracker</span>
        </div>

        <div class="badge">
            Smart Expense Management
        </div>

    </nav>


    <!-- HERO -->

    <section class="hero">

        <div class="content">

            <!-- LEFT -->

            <div class="left">

                <h1>
                    Take control of your
                    <span class="highlight">expenses.</span>
                </h1>

                <p>
                    Track your daily spending, manage your expenses,
                    and keep your finances organized — all in one simple
                    and beautiful dashboard.
                </p>

                <div class="buttons">

                    <a class="button primary"
                       href="addExpense.jsp">
                        ➕ Add Expense
                    </a>

                    <a class="button secondary"
                       href="ViewExpensesServlet">
                        📊 View Expenses
                    </a>

                </div>

                <div class="features">

                    <div class="feature">
                        ✓ Easy to use
                    </div>

                    <div class="feature">
                        ✓ Secure database
                    </div>

                    <div class="feature">
                        ✓ Full expense control
                    </div>

                </div>

            </div>


            <!-- RIGHT DASHBOARD -->

            <div class="dashboard">

                <div class="dashboard-title">
                    EXPENSE OVERVIEW
                </div>

                <div class="balance">
                    ₹ 12,450
                </div>

                <div class="mini-card">

                    <div class="mini-left">

                        <div class="icon">
                            🍔
                        </div>

                        <div>
                            <div class="mini-name">
                                Food
                            </div>

                            <div class="mini-date">
                                Today
                            </div>
                        </div>

                    </div>

                    <div class="price">
                        ₹ 450
                    </div>

                </div>


                <div class="mini-card">

                    <div class="mini-left">

                        <div class="icon">
                            🚌
                        </div>

                        <div>
                            <div class="mini-name">
                                Travel
                            </div>

                            <div class="mini-date">
                                Yesterday
                            </div>
                        </div>

                    </div>

                    <div class="price">
                        ₹ 280
                    </div>

                </div>


                <div class="mini-card">

                    <div class="mini-left">

                        <div class="icon">
                            🛍️
                        </div>

                        <div>
                            <div class="mini-name">
                                Shopping
                            </div>

                            <div class="mini-date">
                                2 days ago
                            </div>
                        </div>

                    </div>

                    <div class="price">
                        ₹ 1,250
                    </div>

                </div>

            </div>

        </div>

    </section>

</body>
</html>