<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Search.aspx.vb" Inherits="Search" %>

<!DOCTYPE html>
<script runat="server">

    Protected Sub btnRent_Click(sender As Object, e As EventArgs)
        Dim TotalAmt As Integer

        lblTotal.Text = ""

        If cboxMovies.SelectedIndex >= 0 Then



            For Each MovieSelected As ListItem In cboxMovies.Items
                If (MovieSelected.Selected) Then
                    TotalAmt += MovieSelected.Value
                    lblTotal.Text = "- " & MovieSelected.Text & "<br>"
                End If
            Next

            If TotalAmt > 0 Then
                TotalAmt += 1
            End If

            lblTotal.Text &= "Your total (including $1 in tax) is $" & TotalAmt.ToString

        End If
    End Sub
</script>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <p>
        <br />
        Search Page</p>
    <p>
        &nbsp;</p>
    <form id="form1" runat="server">
    <p>
        <asp:Label ID="lblGenre" runat="server" Text="Genre:"></asp:Label>
        </p>
        <p>
            <asp:DropDownList ID="ddlGenre" runat="server">
                <asp:ListItem>Horror</asp:ListItem>
                <asp:ListItem>SciFi</asp:ListItem>
                <asp:ListItem>Romance</asp:ListItem>
                <asp:ListItem>Comedy</asp:ListItem>
                <asp:ListItem>Action</asp:ListItem>
            </asp:DropDownList>
        </p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            <asp:Label ID="lblRelease" runat="server" Text="Release Type:"></asp:Label>
        </p>
        <p>
            &nbsp;</p>
        <p>
            <asp:Label ID="lblMovies" runat="server" Text="Movies:"></asp:Label>
        </p>
        <p>
            <asp:CheckBoxList ID="cboxMovies" runat="server">
                <asp:ListItem Value="8">Cabin In The Woods</asp:ListItem>
                <asp:ListItem Value="15">Star Wars</asp:ListItem>
                <asp:ListItem Value="6">The Princess Bride</asp:ListItem>
                <asp:ListItem Value="3">Dumb and Dumber</asp:ListItem>
                <asp:ListItem Value="12">John Wick</asp:ListItem>
            </asp:CheckBoxList>
        </p>
        <p>
            &nbsp;</p>
        <p>
            <asp:Label ID="lblRent" runat="server" Text="Rent Selected Movies:"></asp:Label>
        </p>
        <p>
            <asp:Button ID="btnRent" runat="server" Text="Rent" Width="66px" OnClick="btnRent_Click" style="height: 26px" />
        </p>
        <p>
            &nbsp;</p>
        <p>
            <asp:Label ID="lblTotal2" runat="server" Text="Total:"></asp:Label>
        </p>
        <p>
            <asp:Label ID="lblTotal" runat="server"></asp:Label>
        </p>
    <div>
    
    </div>
    </form>
</body>
</html>
