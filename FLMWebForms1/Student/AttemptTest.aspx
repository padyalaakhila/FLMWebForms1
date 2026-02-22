<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AttemptTest.aspx.cs" Inherits="FlmWebFormsApp.Student.AttemptTest" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Attempt Test</title>
    <style>
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
            min-width: 400px;
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
            text-align: center;
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

        .input-box, select {
            width: 100%;
            padding: 9px 12px;
            border-radius: 7px;
            border: 1px solid #c7d2fe;
            outline: none;
            font-size: 14px;
            background: rgba(255,255,255,0.7);
            transition: all 0.25s ease;
        }

        .input-box:focus, select:focus {
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

        table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0 12px;
        }

        td {
            vertical-align: top;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-table">
            <div class="login-title">Attempt Test</div>
            <asp:Label ID="Lblwelcome" runat="server" Text=""></asp:Label>
            <table>
                <tr>
                    <td class="label-cell">Question:</td>
                    <td class="input-cell">
                        <asp:Label ID="LblQuestion" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="label-cell">Answer 1:</td>
                    <td class="input-cell"><asp:Label ID="LblAnswer1" runat="server" Text="Label"></asp:Label></td>
                </tr>
                <tr>
                    <td class="label-cell">Answer 2:</td>
                    <td class="input-cell"><asp:Label ID="LblAnswer2" runat="server" Text="Label"></asp:Label></td>
                </tr>
                <tr>
                    <td class="label-cell">Answer 3:</td>
                    <td class="input-cell"><asp:Label ID="LblAnswer3" runat="server" Text="Label"></asp:Label></td>
                </tr>
                <tr>
                    <td class="label-cell">Answer 4:</td>
                    <td class="input-cell"><asp:Label ID="LblAnswer4" runat="server" Text="Label"></asp:Label></td>
                </tr>
                <tr>
                    <td class="label-cell">Select Correct Answer:</td>
                    <td class="input-cell">
                        <asp:DropDownList ID="DdlCorrectanswer" runat="server" CssClass="input-box">
                            <asp:ListItem>Select Correct Answer</asp:ListItem>
                            <asp:ListItem Value="1">Answer1</asp:ListItem>
                            <asp:ListItem Value="2">Answer2</asp:ListItem>
                            <asp:ListItem Value="3">Answer3</asp:ListItem>
                            <asp:ListItem Value="4">Answer4</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="input-cell">
                        <asp:Label ID="LblError" runat="server" CssClass="error-text" ForeColor="Red"></asp:Label>
                    </td>
                    <td class="input-cell">
                        <asp:Button ID="BtnContinue" runat="server" Text="Continue" OnClick="BtnContinue_Click" CssClass="login-btn" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>