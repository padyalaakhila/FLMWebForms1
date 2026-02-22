<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentRegistration.aspx.cs" Inherits="FLMWebForms1.Student.StudentRegistration" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Registration</title>

    <style>
        body {
            margin:0;
            min-height:100vh;
            display:flex;
            justify-content:center;
            align-items:center;
            background:linear-gradient(120deg,#89f7fe,#66a6ff);
            font-family:Segoe UI, sans-serif;
        }

        .container {
            background:white;
            padding:25px 35px;
            border-radius:12px;
            width:700px;
            box-shadow:0 15px 30px rgba(0,0,0,.15);
            animation:fadeIn .8s ease;
        }

        @keyframes fadeIn {
            from {opacity:0; transform:translateY(15px);}
            to {opacity:1; transform:translateY(0);}
        }

        table { width:100%; }

        td { padding:7px; }

        .title {
            font-size:22px;
            font-weight:600;
            color:#0077cc;
            animation:glow 1.5s infinite alternate;
        }

        @keyframes glow {
            from { text-shadow:0 0 6px #66a6ff;}
            to { text-shadow:0 0 12px #0077cc;}
        }

        input, textarea, select {
            width:95%;
            padding:6px 10px;
            border-radius:6px;
            border:1px solid #ccc;
            transition:.3s;
        }

        input:focus, textarea:focus, select:focus {
            border-color:#66a6ff;
            box-shadow:0 0 6px rgba(102,166,255,.6);
            outline:none;
        }

        .btn {
            background:linear-gradient(120deg,#66a6ff,#0077cc);
            border:none;
            padding:8px 22px;
            color:white;
            border-radius:20px;
            font-weight:600;
            cursor:pointer;
            transition:.4s;
        }

        .btn:hover {
            transform:scale(1.05);
            box-shadow:0 0 10px rgba(0,119,204,.6);
        }

        .right { text-align:right; font-weight:600; }
    </style>
</head>

<body>
<form id="form1" runat="server">

<div class="container">
<table>

<tr>
<td colspan="2" align="center">
<asp:Label ID="Label1" runat="server" Text="Student Registration" CssClass="title"></asp:Label>
</td>
</tr>

<tr>
<td class="right">Student Name :</td>
<td>
<asp:TextBox ID="TxtStudName" runat="server"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
ErrorMessage="Student Name is Mandatory" ControlToValidate="TxtStudName" ForeColor="Red" />
</td>
</tr>

<tr>
<td class="right">Email :</td>
<td>
<asp:TextBox ID="TxtEmail" runat="server" TextMode="Email"></asp:TextBox>
</td>
</tr>

<tr>
<td class="right">Password :</td>
<td>
<asp:TextBox ID="TxtPassword" runat="server" TextMode="Password"></asp:TextBox>
</td>
</tr>

<tr>
<td class="right">Re-Password :</td>
<td>
<asp:TextBox ID="TxtRePassword" runat="server" TextMode="Password"></asp:TextBox>
<asp:CompareValidator ID="CompareValidator1" runat="server"
ErrorMessage="Password does not match"
ControlToValidate="TxtRePassword"
ControlToCompare="TxtPassword"
ForeColor="Red" />
</td>
</tr>

<tr>
<td class="right">Gender :</td>
<td>
<asp:RadioButton ID="RbtMale" runat="server" GroupName="Gender" Text=" Male" Checked="True" />
<asp:RadioButton ID="RbtFemale" runat="server" GroupName="Gender" Text=" Female" />
</td>
</tr>

<tr>
<td class="right">Mobile :</td>
<td>
<asp:TextBox ID="TxtMobile" runat="server" MaxLength="10" TextMode="Number"></asp:TextBox>
</td>
</tr>
<tr>
    <td class="right">Address :</td>
    <td>
        <asp:TextBox ID="TxtAddress" runat="server"
            TextMode="MultiLine" Height="70px"></asp:TextBox>
    </td>
</tr>
<tr>
<td class="right">State :</td>
<td>
<asp:DropDownList ID="DdlState" runat="server"
    AutoPostBack="True"
    OnSelectedIndexChanged="DdlState_SelectedIndexChanged">

    <asp:ListItem Text="Andhra Pradesh" Value="AP"></asp:ListItem>
    <asp:ListItem Text="Telangana" Value="TS"></asp:ListItem>
    <asp:ListItem Text="Karnataka" Value="KA"></asp:ListItem>
    <asp:ListItem Text="Tamil Nadu" Value="TN"></asp:ListItem>
    <asp:ListItem Text="Kerala" Value="KL"></asp:ListItem>
    <asp:ListItem Text="Maharashtra" Value="MH"></asp:ListItem>

</asp:DropDownList>
</td>
</tr>

<tr>
<td class="right">City :</td>
<td>
<asp:DropDownList ID="DdlCity" runat="server">
    <asp:ListItem Text="Select City" Value="0"></asp:ListItem>
</asp:DropDownList>
</td>
</tr>

<tr>
<td class="right">Date Of Birth :</td>
<td>
<asp:Calendar ID="CalDob" runat="server" Visible="False"
OnSelectionChanged="CalDob_SelectionChanged"></asp:Calendar>

<asp:Label ID="LblDob" runat="server" ForeColor="Green"></asp:Label>

<asp:LinkButton ID="LinkButton1" runat="server"
OnClick="LinkButton1_Click">Click Here</asp:LinkButton>
</td>
</tr>

<tr>
<td class="right">Upload Photo :</td>
<td>
<asp:FileUpload ID="FileStudPhoto" runat="server" />
<asp:Image ID="ImgStudPhoto" runat="server" Height="55px" Width="60px" />
</td>
</tr>

<tr>
<td class="right">Select Course :</td>
<td>
<asp:DropDownList ID="DdlCourse" runat="server"></asp:DropDownList>
</td>
</tr>

<tr>
<td class="right">
<asp:Label ID="LblError" runat="server" ForeColor="Red"></asp:Label>
</td>
<td>
<asp:Button ID="BtnRegister" runat="server" Text="Register"
CssClass="btn" OnClick="BtnRegister_Click" />
</td>
</tr>

</table>
</div>

</form>
</body>
</html>