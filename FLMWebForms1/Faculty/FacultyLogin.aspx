<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FacultyLogin.aspx.cs" Inherits="FLMWebForms1.Faculty.FacultyLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Faculty Login</title>
    <style type="text/css">
         body {
            margin: 0;
            font-family: 'Segoe UI', Arial, sans-serif;
            background: linear-gradient(120deg, #c7d2fe, #e0f2fe, #fdf2f8);
            background-size: 300% 300%;
            animation: bgMove 8s ease infinite;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        @keyframes bgMove {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        .login-table {
            background: rgba(255,255,255,0.85);
            padding: 28px 32px;
            border-radius: 14px;
            min-width: 370px;
            backdrop-filter: blur(6px);
            box-shadow: 0 12px 30px rgba(0,0,0,0.12);
            animation: floatCard 1.2s ease forwards;
            transform: translateY(30px);
            opacity: 0;
        }

        @keyframes floatCard {
            to {
                transform: translateY(0);
                opacity: 1;
            }
        }

        .login-title {
            font-size: 22px;
            font-weight: 600;
            color: #1f2937;
            padding-bottom: 14px;
        }

        .label-cell {
            text-align: right;
            padding: 9px 10px;
            color: #374151;
            font-size: 14px;
            width: 40%;
        }

        .input-cell {
            padding: 9px 10px;
        }

        .input-box {
            width: 100%;
            padding: 9px 12px;
            border-radius: 7px;
            border: 1px solid #c7d2fe;
            outline: none;
            font-size: 14px;
            background: rgba(255,255,255,0.7);
            transition: all 0.25s ease;
        }

        .input-box:focus {
            border-color: #6366f1;
            box-shadow: 0 0 0 3px rgba(99,102,241,0.18);
            background: #fff;
        }

        .login-btn {
            background: linear-gradient(120deg, #6366f1, #38bdf8);
            color: white;
            border: none;
            padding: 9px 22px;
            border-radius: 7px;
            font-size: 14px;
            cursor: pointer;
            transition: transform 0.2s ease, box-shadow 0.2s ease;
        }

        .login-btn:hover {
            transform: translateY(-2px) scale(1.02);
            box-shadow: 0 6px 16px rgba(99,102,241,0.35);
        }

        .error-text {
            color: #ef4444;
            font-size: 12px;
            text-align: right;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <table class="login-table">
                <tr>
                    <td colspan="2" align="center" class="login-title">
                        Faculty Login
                    </td>
                </tr>

                <tr>
                    <td class="label-cell">User Name:</td>
                    <td class="input-cell">
                        <asp:TextBox ID="TextBox1" runat="server" CssClass="input-box"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td class="label-cell">Password:</td>
                    <td class="input-cell">
                        <asp:TextBox ID="TextBox2" runat="server" TextMode="Password" CssClass="input-box"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td class="error-text">
                        <asp:Label ID="LblError" runat="server"></asp:Label>
                    </td>
                    <td class="input-cell">
                        <asp:Button ID="BtnLogin" runat="server" Text="Login" CssClass="login-btn" OnClick="BtnLogin_Click" />
                    </td>
                </tr>
            </table>

        </div>
    </form>
</body>
</html>
