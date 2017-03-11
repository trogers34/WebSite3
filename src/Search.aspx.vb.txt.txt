
Partial Class Search
    Inherits System.Web.UI.Page

    Protected Sub btnRent_Click(sender As Object, e As EventArgs) Handles btnRent.Click
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
End Class
