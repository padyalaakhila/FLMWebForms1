<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageTests.aspx.cs" Inherits="FLMWebForms1.Faculty.ManageTests" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manage Tests</title>

    <style type="text/css">

        body {
            margin: 0;
            font-family: 'Segoe UI', Arial, sans-serif;
            background: linear-gradient(120deg, #dbeafe, #f0f9ff);
            animation: fadeIn 0.8s ease;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }

        table { border-collapse: collapse; }

        .main-table {
            width: 90%;
            margin: 25px auto;
            background: white;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            animation: zoomIn 0.6s ease;
        }

        @keyframes zoomIn {
            from { transform: scale(0.97); opacity: 0; }
            to { transform: scale(1); opacity: 1; }
        }

        h2 {
            margin: 10px 0;
            color: #1e40af;
        }

        .menu {
            background: #eff6ff;
            padding: 20px 10px;
            text-align: center;
        }

        .menu a {
            display: block;
            padding: 10px;
            margin: 6px 0;
            border-radius: 6px;
            background: #e0e7ff;
            color: #1e3a8a;
            font-weight: 500;
            text-decoration: none;
            transition: 0.3s;
        }

        .menu a:hover {
            background: #3b82f6;
            color: white;
            transform: translateX(5px);
        }

        .content {
            padding: 20px;
            animation: slideUp 0.6s ease;
        }

        @keyframes slideUp {
            from { opacity: 0; transform: translateY(15px); }
            to { opacity: 1; transform: translateY(0); }
        }

        input[type=text],
        input[type=number],
        textarea,
        select {
            width: 90%;
            padding: 7px 10px;
            border: 1px solid #c7d2fe;
            border-radius: 6px;
            outline: none;
            transition: 0.3s;
        }

        input:focus, textarea:focus, select:focus {
            border-color: #2563eb;
            box-shadow: 0 0 6px rgba(37,99,235,0.4);
        }

        input[type=submit],
        button {
            padding: 8px 20px;
            background: linear-gradient(135deg, #2563eb, #3b82f6);
            border: none;
            color: white;
            border-radius: 6px;
            cursor: pointer;
            transition: 0.3s;
        }

        input[type=submit]:hover,
        button:hover {
            transform: scale(1.05);
            box-shadow: 0 3px 10px rgba(0,0,0,0.2);
        }

        .auto-style2 {
            text-align: right;
            padding-right: 10px;
            font-weight: 600;
        }

        .grid {
            margin-top: 15px;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 3px 10px rgba(0,0,0,0.1);
        }

    </style>
</head>

<body>
<form id="form1" runat="server">

<table border="1" border-color="blue" cell-spacing="0" width="100%" class="main-table">

    <tr>
        <td colspan="2" align="center">
            <h2>Welcome <%=Session["facultyname"] %></h2>
        </td>
    </tr>

    <tr>
        <td width="25%" valign="top" class="menu">
            <a href="ManageCourses.aspx">Manage Courses</a>
            <a href="ManageCourseMaterial.aspx">Manage Course Material</a>
            <a href="ManageTests.aspx">Manage Tests</a>
            <a href="ManageQuestions.aspx">Manage Questions</a>
        </td>

        <td width="75%" valign="top" class="content">

            <table class="auto-style1">

                <tr>
                    <td colspan="2" align="center">
                        <h3 style="color:#1e40af">Manage Tests</h3>
                    </td>
                </tr>

                <tr>
                    <td class="auto-style2">Select The Course:</td>
                    <td>
                        <asp:DropDownList ID="DdlCourse" runat="server"
                            DataSourceID="DsCourse"
                            DataTextField="coursename"
                            DataValueField="id">
                        </asp:DropDownList>

                        <asp:SqlDataSource ID="DsCourse" runat="server"
                            ConnectionString="<%$ ConnectionStrings:LMSConnectionString %>"
                            SelectCommand="select '0' as id, 'Select a Course' as coursename
                            union
                            select id, coursename from coursemaster">
                        </asp:SqlDataSource>
                    </td>
                </tr>

                <tr>
                    <td class="auto-style2">Test Name:</td>
                    <td>
                        <asp:TextBox ID="TxtTestName" runat="server"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td class="auto-style2">Duration (Mins):</td>
                    <td>
                        <asp:TextBox ID="TxtDuration" runat="server" TextMode="Number"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td class="auto-style2">Total Questions:</td>
                    <td>
                        <asp:TextBox ID="TxtQuestions" runat="server" TextMode="Number"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="LblError" runat="server" ForeColor="Red"></asp:Label>
                    </td>
                    <td>
                        <asp:Button ID="BtnAddTest" runat="server" Text="Add Test" OnClick="BtnAddTest_Click" />
                    </td>
                </tr>

                <tr><td colspan="2">&nbsp;</td></tr>

                <tr>
                    <td colspan="2" style="font-weight:600;color:#1e3a8a;">Existing Tests</td>
                </tr>

                <tr>
                    <td colspan="2" align="center">

                        <asp:GridView ID="GridView1" runat="server" CssClass="grid"
                            AllowPaging="True"
                            AutoGenerateColumns="False"
                            DataKeyNames="id"
                            DataSourceID="DsTests">

                            <Columns>
                                <asp:BoundField DataField="id" HeaderText="ID" ReadOnly="True" />
                                <asp:BoundField DataField="fkcourseid" HeaderText="Course ID" />
                                <asp:BoundField DataField="testname" HeaderText="Test Name" />
                                <asp:BoundField DataField="duration" HeaderText="Duration" />
                                <asp:BoundField DataField="totquestions" HeaderText="Total Qns" />
                                <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
                            </Columns>

                            <HeaderStyle BackColor="#2563eb" ForeColor="White" Font-Bold="True" />
                        </asp:GridView>

                        <asp:SqlDataSource ID="DsTests" runat="server"
                            ConnectionString="<%$ ConnectionStrings:LMSConnectionString %>"
                            SelectCommand="SELECT * FROM [testmaster]"
                            InsertCommand="INSERT INTO [testmaster] ([fkcourseid], [testname], [duration], [totquestions]) VALUES (@fkcourseid, @testname, @duration, @totquestions)"
                            UpdateCommand="UPDATE [testmaster] SET [fkcourseid]=@fkcourseid, [testname]=@testname, [duration]=@duration, [totquestions]=@totquestions WHERE [id]=@id"
                            DeleteCommand="DELETE FROM [testmaster] WHERE [id]=@id">

                            <InsertParameters>
                                <asp:Parameter Name="fkcourseid" Type="Int32" />
                                <asp:Parameter Name="testname" Type="String" />
                                <asp:Parameter Name="duration" Type="Int32" />
                                <asp:Parameter Name="totquestions" Type="Int32" />
                            </InsertParameters>

                            <UpdateParameters>
                                <asp:Parameter Name="fkcourseid" Type="Int32" />
                                <asp:Parameter Name="testname" Type="String" />
                                <asp:Parameter Name="duration" Type="Int32" />
                                <asp:Parameter Name="totquestions" Type="Int32" />
                                <asp:Parameter Name="id" Type="Int32" />
                            </UpdateParameters>

                            <DeleteParameters>
                                <asp:Parameter Name="id" Type="Int32" />
                            </DeleteParameters>

                        </asp:SqlDataSource>

                    </td>
                </tr>

            </table>

        </td>
    </tr>

</table>

</form>
</body>
</html>