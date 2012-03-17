Imports Microsoft.VisualBasic
Imports System.Data

Namespace Rawson.Roles.Data

    Public MustInherit Class DataProvider

#Region "Shared/Static Methods"

        ' return the provider
        Public Shared Shadows Function Instance() As DataProvider
            Return DotNetNuke.ComponentModel.ComponentFactory.GetComponent(Of DataProvider)()
        End Function

#End Region

#Region "Abstract Methods"

        Public MustOverride Function GetRoleAuthorization(ByVal RoleAuthorizationId As Integer) As IDataReader
        Public MustOverride Function GetRoleAuthorizationsByRole(ByVal RoleId As Integer) As IDataReader
        Public MustOverride Function GetRoleAuthorizationsByUser(ByVal UserId As Integer) As IDataReader
        Public MustOverride Function AddRoleAuthorization(ByVal RoleId As Integer, ByVal CustomerId As Integer, ByVal ProjectId As Integer) As IDataReader

        Public MustOverride Sub DeleteRoleAuthorization(ByVal RoleAuthorizationId As Integer)
        Public MustOverride Sub DeleteRoleAuthorizationByRole(ByVal RoleAuthorizationId As Integer)

        Public MustOverride Function GetCustomerList() As IDataReader
        Public MustOverride Function GetProjectListByCustomer(ByVal customerId As Integer) As IDataReader

#End Region


    End Class

End Namespace

