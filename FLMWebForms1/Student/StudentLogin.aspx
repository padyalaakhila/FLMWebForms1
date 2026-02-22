<%@ Page AutoEventWireup="true" CodeBehind="StudentLogin.aspx.cs" Inherits="FLMWebForms1.Student.StudentLogin" Language="C#" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Login</title>
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

        .login-card {
            background: rgba(255,255,255,0.85);
            padding: 32px 36px;
            border-radius: 14px;
            min-width: 350px;
            max-width: 400px;
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
            font-size: 24px;
            font-weight: 600;
            color: #1f2937;
            text-align: left;
            padding-bottom: 20px;
        }

        .input-label {
            display: block;
            margin-bottom: 6px;
            font-weight: 500;
            color: #374151;
            text-align: left;
        }

        .input-box {
            width: 100%;
            padding: 10px 12px;
            border-radius: 7px;
            border: 1px solid #c7d2fe;
            outline: none;
            font-size: 14px;
            background: rgba(255,255,255,0.7);
            transition: all 0.25s ease;
            margin-bottom: 12px;
        }

        .input-box:focus {
            border-color: #6366f1;
            box-shadow: 0 0 0 3px rgba(99,102,241,0.18);
            background: #fff;
        }

        .login-btn {
            width: 100%;
            background: linear-gradient(120deg, #6366f1, #38bdf8);
            color: white;
            border: none;
            padding: 10px 0;
            border-radius: 7px;
            font-size: 16px;
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
            margin-bottom: 12px;
            text-align: right;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-card">
            <div class="login-title">Student Login</div>
            
            <asp:Label ID="LblError" runat="server" CssClass="error-text"></asp:Label>
            
            <label class="input-label" for="TxtUserName">User Name:</label>
            <asp:TextBox ID="TxtUserName" runat="server" CssClass="input-box"></asp:TextBox>

            <label class="input-label" for="TxtPassword">Password:</label>
            <asp:TextBox ID="TxtPassword" runat="server" TextMode="Password" CssClass="input-box"></asp:TextBox>

            <asp:Button ID="BtnLogin" runat="server" Text="Login" OnClick="BtnLogin_Click" CssClass="login-btn" />
        </div>
    </form>
</body>
</html>