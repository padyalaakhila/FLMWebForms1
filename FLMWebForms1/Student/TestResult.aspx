<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TestResult.aspx.cs" Inherits="FLMWebForms1.Student.TestResult" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Test Result</title>
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
            padding-bottom: 14px;
            text-align:center;
        }

        .data-item {
            background: rgba(255,255,255,0.95);
            border-radius: 10px;
            padding: 12px 16px;
            margin-bottom: 12px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.08);
        }

        .grid-container {
            margin-top: 20px;
            overflow-x: auto;
        }

        .error-text {
            color: #ef4444;
            font-size: 12px;
            text-align: right;
        }

        h2, h3 {
            text-align: center;
            color: #1f2937;
        }

        asp\:GridView, asp\:DataList {
            width: 100%;
        }

        table {
            width: 100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-table">
            <h2>Welcome <%=Session["studname"] != null ? Session["studname"] : "Student" %>, This is your Result</h2>
            <br />
            <asp:DataList ID="DataList1" runat="server" DataSourceID="DsAttemptSummary" DataKeyField="id" CellPadding="6">
                <ItemTemplate>
                    <div class="data-item">
                        <strong>Attempt ID:</strong> <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' /> <br />
                        <strong>Student ID:</strong> <asp:Label ID="fkstudidLabel" runat="server" Text='<%# Eval("fkstudid") %>' /> <br />
                        <strong>Test ID:</strong> <asp:Label ID="fktestidLabel" runat="server" Text='<%# Eval("fktestid") %>' /> <br />
                        <strong>Attempt Date:</strong> <asp:Label ID="attemptdateLabel" runat="server" Text='<%# Eval("attemptdate") %>' /> <br />
                        <strong>Result:</strong> <asp:Label ID="resultLabel" runat="server" Text='<%# Eval("result") %>' />
                    </div>
                </ItemTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="DsAttemptSummary" runat="server" ConnectionString="<%$ ConnectionStrings:LMSConnectionString %>" SelectCommand="SELECT * FROM [studentattemptsummary] WHERE (([fkstudid] = @fkstudid) AND ([fktestid] = @fktestid))">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="2" Name="fkstudid" SessionField="studid" Type="Int32" />
                    <asp:SessionParameter DefaultValue="1" Name="fktestid" SessionField="testid" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>

            <div class="grid-container">
                <h3>Test Attempt Details</h3>
                <asp:GridView ID="GvTestAttemptDetails" runat="server" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4">
                    <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                    <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                    <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                    <RowStyle BackColor="White" ForeColor="#003399" />
                    <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                    <SortedAscendingCellStyle BackColor="#EDF6F6" />
                    <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                    <SortedDescendingCellStyle BackColor="#D6DFDF" />
                    <SortedDescendingHeaderStyle BackColor="#002876" />
                </asp:GridView>
            </div>
        </div>
    </form>
</body>
</html>