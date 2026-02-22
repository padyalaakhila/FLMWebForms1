<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentHome.aspx.cs" Inherits="FLMWebForms1.Student.StudentHome" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Dashboard</title>
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
            min-width: 500px;
            max-width: 900px;
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
            padding-bottom: 20px;
            text-align:center;
        }

        .data-item {
            background: rgba(255,255,255,0.95);
            border-radius: 10px;
            padding: 12px 16px;
            margin-bottom: 12px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.08);
        }

        .section-title {
            font-weight: 600;
            font-size: 16px;
            margin-top: 20px;
            margin-bottom: 8px;
            color: #1f2937;
        }

        .login-btn {
            background: linear-gradient(120deg, #6366f1, #38bdf8);
            color: white;
            border: none;
            padding: 8px 18px;
            border-radius: 7px;
            font-size: 14px;
            cursor: pointer;
            transition: transform 0.2s ease, box-shadow 0.2s ease;
        }

        .login-btn:hover {
            transform: translateY(-2px) scale(1.02);
            box-shadow: 0 6px 16px rgba(99,102,241,0.35);
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
            <div class="login-title">Welcome, <%=Session["studname"] != null ? Session["studname"] : "Student" %></div>

            <div class="section-title">Your Course Details</div>
            <asp:DataList ID="DlCourseDetails" runat="server" DataSourceID="DsCourseMaster" DataKeyField="id" CellPadding="6">
                <ItemTemplate>
                    <div class="data-item">
                        <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' Visible="False" />
                        <strong>Course Name:</strong> <asp:Label ID="coursenameLabel" runat="server" Text='<%# Eval("coursename") %>' /><br />
                        <strong>Description:</strong> <asp:Label ID="descriptionLabel" runat="server" Text='<%# Eval("description") %>' /><br />
                        <strong>Modules:</strong> <asp:Label ID="modulesLabel" runat="server" Text='<%# Eval("modules") %>' /><br />
                        <strong>Duration:</strong> <asp:Label ID="durationLabel" runat="server" Text='<%# Eval("duration") %>' />
                    </div>
                </ItemTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="DsCourseMaster" runat="server" ConnectionString="<%$ ConnectionStrings:LMSConnectionString %>" SelectCommand="SELECT * FROM [coursemaster] WHERE ([id] = @id)">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="1" Name="id" SessionField="fkcourseid" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>

            <div class="section-title">Your Course Material</div>
            <asp:DataList ID="DlCourseMaterial" runat="server"></asp:DataList>

            <div class="section-title">Your Test Attempts</div>
            <asp:DataList ID="DlTestAttempts" runat="server"></asp:DataList>

            <div class="section-title">Select a Test To Attempt</div>
            <asp:DropDownList ID="DdlTestMaster" runat="server" DataSourceID="DsTestList" DataTextField="testname" DataValueField="id" CssClass="input-box"></asp:DropDownList>
            <asp:SqlDataSource ID="DsTestList" runat="server" ConnectionString="<%$ ConnectionStrings:LMSConnectionString %>" SelectCommand="select '0' as id, 'Select a Test' as testname union SELECT id, testname FROM [testmaster] WHERE ([fkcourseid] = @fkcourseid)">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="1" Name="fkcourseid" SessionField="fkcourseid" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br /><br />
            <asp:LinkButton ID="LnkAttemptTest" runat="server" OnClick="LnkAttemptTest_Click" CssClass="login-btn">Attempt Test</asp:LinkButton>
        </div>
    </form>
</body>
</html>