Imports System
Imports System.Web

Imports DotNetNuke.Common
Imports DotNetNuke.Common.Utilities
Imports DotNetNuke.ComponentModel
Imports DotNetNuke.Entities.Portals
Imports DotNetNuke.Entities.Users
Imports DotNetNuke.Framework.Providers
Imports DotNetNuke.Security.Membership.Data
Imports DotNetNuke.Security.Roles
Imports DotNetNuke.Services.Exceptions
Imports System.Data
Imports System.Collections

Namespace Rawson.Roles

    Public Class RoleAuthorizationProvider

#Region "Private Members"

        Private dataProvider As Rawson.Roles.Data.DataProvider

#End Region

#Region "Constructor"

        Public Sub New()
            dataProvider = Rawson.Roles.Data.DataProvider.Instance()

            If dataProvider Is Nothing Then
                dataProvider = New Rawson.Roles.Data.SqlDataProvider
            End If

        End Sub

#End Region

#Region "Public Methods"

        Public Function CreateRoleAuthorization(ByVal RoleId As Integer, ByVal CustomerId As Integer, ByVal ProjectId As Integer) As IDataReader

            Try
                Return dataProvider.AddRoleAuthorization(RoleId, CustomerId, ProjectId)
            Catch ex As Exception
                Throw New ArgumentException(ex.ToString)
            End Try

        End Function

        Public Function GetRoleAuthorization(ByVal RoleAuthorizationId As Integer) As IDataReader
            Return dataProvider.GetRoleAuthorization(RoleAuthorizationId)
        End Function

        Public Function GetRoleAuthorizationsByRole(ByVal RoleId As Integer) As ArrayList
            Return CType(CBO.FillCollection(dataProvider.GetRoleAuthorizationsByRole(RoleId), GetType(RoleAuthorizationInfo)), ArrayList)
        End Function

        Public Function GetRoleAuthorizationsByUser(ByVal UserId As Integer) As ArrayList
            Return CType(CBO.FillCollection(dataProvider.GetRoleAuthorizationsByUser(UserId), GetType(RoleAuthorizationInfo)), ArrayList)
        End Function

        Public Sub DeleteRoleAuthorization(ByVal RoleAuthorizationId As Integer)
            dataProvider.DeleteRoleAuthorization(RoleAuthorizationId)
        End Sub

        Public Sub DeleteRoleAuthorizationByRole(ByVal RoleId As Integer)
            dataProvider.DeleteRoleAuthorizationByRole(RoleId)
        End Sub

        Public Function GetCustomerList() As ArrayList
            Return CType(CBO.FillCollection(dataProvider.GetCustomerList, GetType(ListInfo)), ArrayList)
        End Function

        Public Function GetProjectsList(ByVal customerId As Integer) As ArrayList
            Return CType(CBO.FillCollection(dataProvider.GetProjectListByCustomer(customerId), GetType(ListInfo)), ArrayList)
        End Function

#End Region

    End Class

End Namespace

