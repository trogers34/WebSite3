
Partial Class new_account
    Inherits System.Web.UI.Page

    Dim FirstName As String
    Dim LastName As String
    Dim EmailAddress As String
    Dim Password As String
    Dim ConfirmPassword As String


    Protected Sub btnCreateAccount_Click(sender As Object, e As EventArgs) Handles btnCreateAccount.Click
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
End Class
