<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageCourseMaterial.aspx.cs" Inherits="FLMWebForms1.Faculty.ManageCourseMaterial" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manage Course Material</title>

    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Arial, sans-serif;
            background: linear-gradient(120deg, #eef2ff, #f8fafc, #fdf2f8);
            background-size: 300% 300%;
            animation: bgMove 10s ease infinite;
        }

        @keyframes bgMove {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        .main-table {
            width: 95%;
            margin: 25px auto;
            border-collapse: collapse;
            background: rgba(255,255,255,0.88);
            border-radius: 14px;
            overflow: hidden;
            box-shadow: 0 10px 25px rgba(0,0,0,0.10);
            animation: fadeCard 0.8s ease;
        }

        @keyframes fadeCard {
            from { opacity: 0; transform: translateY(15px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .side-menu {
            background: rgba(238,242,255,0.8);
            padding: 15px 10px;
            border-right: 1px solid #e5e7eb;
        }

        .side-menu a {
            display: block;
            padding: 10px 12px;
            margin-bottom: 8px;
            text-decoration: none;
            color: #1f2937;
            border-radius: 8px;
            transition: all 0.25s ease;
            font-size: 14px;
        }

        .side-menu a:hover {
            background: #6366f1;
            color: white;
            transform: translateX(4px);
        }

        .content-area {
            padding: 18px;
        }

        .page-title {
            font-size: 20px;
            font-weight: 600;
            color: #1f2937;
            padding-bottom: 10px;
        }

        .form-table {
            width: 100%;
        }

        .label-cell {
            text-align: right;
            padding: 8px 10px;
            color: #374151;
            width: 30%;
            font-size: 14px;
        }

        .input-cell {
            padding: 8px 10px;
        }

        .input-box, select, textarea {
            width: 80%;
            padding: 8px 10px;
            border-radius: 7px;
            border: 1px solid #c7d2fe;
            font-size: 14px;
            outline: none;
            background: #fafafa;
            transition: all 0.25s ease;
        }

        .input-box:focus, select:focus, textarea:focus {
            border-color: #6366f1;
            box-shadow: 0 0 0 3px rgba(99,102,241,0.18);
            background: white;
        }

        .btn-main {
            background: linear-gradient(120deg, #6366f1, #38bdf8);
            color: white;
            border: none;
            padding: 9px 20px;
            border-radius: 8px;
            font-size: 14px;
            cursor: pointer;
            transition: transform 0.2s ease, box-shadow 0.2s ease;
        }

        .btn-main:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 16px rgba(99,102,241,0.35);
        }

        .grid-style {
            width: 100%;
            border-radius: 10px;
            overflow: hidden;
            border: 1px solid #e5e7eb;
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">

        <table class="main-table">
            <tr>
                <td colspan="2" align="center">
                    <h2>Welcome <%=Session["facultyname"] %></h2>
                </td>
            </tr>

            <tr>
                <td width="25%" valign="top" class="side-menu">
                    <a href="ManageCourses.aspx">Manage Courses</a>
                    <a href="ManageCourseMaterial.aspx">Manage Course Material</a>
                    <a href="ManageTests.aspx">Manage Tests</a>
                    <a href="ManageQuestions.aspx">Manage Questions</a>
                </td>

                <td width="75%" valign="top" class="content-area">

                    <table class="form-table">
                        <tr>
                            <td colspan="2" align="center" class="page-title">
                                Manage Course Material
                            </td>
                        </tr>

                        <tr>
                            <td class="label-cell">Select The Course:</td>
                            <td class="input-cell">
                                <asp:DropDownList ID="DdlCourse" runat="server" CssClass="input-box"
                                    DataSourceID="DsCourse" DataTextField="coursename" DataValueField="id">
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
                            <td class="label-cell">Material Name:</td>
                            <td class="input-cell">
                                <asp:TextBox ID="TxtMaterialName" runat="server" CssClass="input-box"></asp:TextBox>
                            </td>
                        </tr>

                        <tr>
                            <td class="label-cell">Material Description:</td>
                            <td class="input-cell">
                                <asp:TextBox ID="TxtMaterialDisc" runat="server" TextMode="MultiLine" CssClass="input-box"></asp:TextBox>
                            </td>
                        </tr>

                        <tr>
                            <td class="label-cell">Upload Material:</td>
                            <td class="input-cell">
                                <asp:FileUpload ID="MaterialUpload" runat="server" CssClass="input-box" />
                            </td>
                        </tr>

                        <tr>
                            <td class="label-cell">
                                <asp:Label ID="LblError" runat="server" ForeColor="Red"></asp:Label>
                            </td>
                            <td class="input-cell">
                                <asp:Button ID="BtnAddMaterial" runat="server" Text="Add Material"
                                    CssClass="btn-main" OnClick="Button1_Click" />
                            </td>
                        </tr>

                        <tr>
                            <td colspan="2" style="padding-top:15px;">
                                <b>Existing Material:</b>
                            </td>
                        </tr>

                        <tr>
                            <td colspan="2">
                                <asp:GridView ID="GridView1" runat="server" CssClass="grid-style"
                                    BackColor="White" BorderStyle="None" CellPadding="6">
                                </asp:GridView>
                            </td>
                        </tr>

                    </table>

                </td>
            </tr>
        </table>

    </form>
</body>
</html>