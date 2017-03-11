<%@ Page Language="VB" AutoEventWireup="false" CodeFile="login.aspx.vb" Inherits="login" %>

<!DOCTYPE html>
<script runat="server">

    Protected Sub btnLogin_Click(sender As Object, e As EventArgs)

        Dim passwordArray() As Char
        Dim cntAt As Integer
        Dim cntDot As Integer
        Dim AtDot As Boolean
        Dim DotAt As Boolean
        Dim count As Integer
        Dim emailArray() As Char

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
            Response.Redirect("Search.aspx")
        Else
            lblEmailError.Text = "Error! Email invalid, please enter a valid email address."
        End If

    End Sub

    Protected Sub btnNewAccount_Click(sender As Object, e As EventArgs)
        Response.Redirect("new_account.aspx")
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
        <p>
            DVD Rental Company</p>
        <p>
            &nbsp;</p>
        <p>
            <asp:Label ID="lblEmail" runat="server" Text="Email:"></asp:Label>
        </p>
        <p>
            <asp:TextBox ID="txtEmail" runat="server" Width="293px"></asp:TextBox>
        </p>
        <p>
            &nbsp;</p>
        <p>
            <asp:Label ID="lblPassword" runat="server" Text="Password:"></asp:Label>
        </p>
        <p>
            <asp:TextBox ID="txtPassword" runat="server" Width="287px"></asp:TextBox>
        </p>
        <p>
            &nbsp;</p>
        <p>
            <asp:Button ID="btnLogin" runat="server" Height="37px" Text="Login" Width="118px" OnClick="btnLogin_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnNewAccount" runat="server" Height="37px" Text="Create New Account" Width="136px" OnClick="btnNewAccount_Click" />
        </p>
        <p>
            &nbsp;</p>
        <asp:Label ID="lblEmailError" runat="server"></asp:Label>
    </form>
</body>
</html>
