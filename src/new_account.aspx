<%@ Page Language="VB" AutoEventWireup="false" CodeFile="new_account.aspx.vb" Inherits="new_account" %>

<!DOCTYPE html>
<script runat="server">

    Protected Sub btnCreateAccount_Click(sender As Object, e As EventArgs)
        Dim emailArray() As Char
        Dim passwordArray() As Char
        Dim cntAt As Integer
        Dim cntDot As Integer
        Dim AtDot As Boolean
        Dim DotAt As Boolean
        Dim count As Integer

        emailArray = txtEmail.Text.ToCharArray()
        passwordArray = txtPassword.Text.ToCharArray()
        cntAt = 0
        cntDot = 0
        DotAt = False
        AtDot = False

        For i As Integer = 0 To emailArray.Length - 1
            If (emailArray(i) = "@"c) Then
                cntAt += 1
                count = i - 1
                If (count >= 0) Then
                    If (emailArray(count) = "."c) Then
                        DotAt = True
                    End If
                End If
            End If

            If (emailArray(i) = "."c) Then
                cntDot += 1
                count = i - 1
                If (count <= 0) Then
                    If (emailArray(count) = "@"c) Then
                        AtDot = True
                    End If
                End If
            End If
        Next

        If (cntAt = 1) Or (cntDot >= 1) Or DotAt Or AtDot Then
            lblEmailError.Text = ""
            Response.Redirect("login.aspx")
        Else
            lblEmailError.Text = "Error! Email invalid, please enter a valid email address."
        End If
    End Sub
</script>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
    <p>Create New Account</p>
        <p>&nbsp;</p>
        <p>
            <asp:Label ID="lblFirstName" runat="server" Text="First Name:"></asp:Label>
        </p>
        <p>
            <asp:TextBox ID="txtFirstName" runat="server" Width="275px"></asp:TextBox>
        </p>
        <p>&nbsp;</p>
        <p>
            <asp:Label ID="lblLastName" runat="server" Text="Last Name:"></asp:Label>
        </p>
        <p>
            <asp:TextBox ID="txtLastName" runat="server" Width="277px"></asp:TextBox>
        </p>
        <p>&nbsp;</p>
        <p>
            <asp:Label ID="lblEmail" runat="server" Text="Email:"></asp:Label>
        </p>
        <p>
            <asp:TextBox ID="txtEmail" runat="server" Width="275px"></asp:TextBox>
        </p>
        <p>&nbsp;</p>
        <p>
            <asp:Label ID="lblPassword" runat="server" Text="Password:"></asp:Label>
        </p>
        <p>
            <asp:TextBox ID="txtPassword" runat="server" Width="275px"></asp:TextBox>
        </p>
        <p>&nbsp;</p>
        <p>
            <asp:Label ID="lblConfirmPassword" runat="server" Text="Confirm Password:"></asp:Label>
        </p>
        <p>
            <asp:TextBox ID="txtConfirmPassword" runat="server" Width="275px"></asp:TextBox>
        </p>
        <p>&nbsp;</p>
        <p>
            <asp:Label ID="lblAccountType" runat="server" Text="Type of Account:"></asp:Label>
        </p>
        <p>
            <asp:DropDownList ID="ddlType" runat="server">
                <asp:ListItem>Administrator</asp:ListItem>
                <asp:ListItem>Cashier</asp:ListItem>
                <asp:ListItem>Customer</asp:ListItem>
            </asp:DropDownList>
        </p>
        <p>
            &nbsp;</p>
        <p>
            <asp:Button ID="btnCreateAccount" runat="server" Text="Create Account" OnClick="btnCreateAccount_Click" />
        </p>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
        <p>
            <asp:Label ID="lblEmailError" runat="server"></asp:Label>
        </p>
        <p>&nbsp;</p>

    </form>
</body>
</html>
