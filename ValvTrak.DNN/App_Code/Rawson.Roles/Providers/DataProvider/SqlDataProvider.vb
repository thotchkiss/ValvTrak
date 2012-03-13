Imports System
Imports System.Data

Imports Microsoft.ApplicationBlocks.Data

Namespace Rawson.Roles.Data

    Public Class SqlDataProvider
        Inherits DataProvider

#Region "Properties"

        Public ReadOnly Property ConnectionString() As String
            Get
                Return DotNetNuke.Data.DataProvider.Instance().ConnectionString
            End Get
        End Property

        Public ReadOnly Property DatabaseOwner() As String
            Get
                Return DotNetNuke.Data.DataProvider.Instance().DatabaseOwner
            End Get
        End Property

        Public ReadOnly Property ObjectQualifier() As String
            Get
                Return DotNetNuke.Data.DataProvider.Instance().ObjectQualifier
            End Get
        End Property

#End Region

#Region "General Public Methods"

        Private Function GetNull(ByVal Field As Object) As Object
            Return DotNetNuke.Common.Utilities.Null.GetNull(Field, DBNull.Value)
        End Function

        Private Function GetFullyQualifiedName(ByVal name As String) As String
            Return DatabaseOwner & ObjectQualifier & name
        End Function

#End Region

#Region "Abstract Method Implementations"

        Public Overrides Function GetRoleAuthorization(ByVal RoleAuthorizationId As Integer) As System.Data.IDataReader
            Return CType(SqlHelper.ExecuteReader(ConnectionString, "GetRoleAuthorization", RoleAuthorizationId), IDataReader)
        End Function

        Public Overrides Function GetRoleAuthorizationsByRole(ByVal RoleId As Integer) As System.Data.IDataReader
            Return CType(SqlHelper.ExecuteReader(ConnectionString, "GetRoleAuthorizationsByRoleID", RoleId), IDataReader)
        End Function

        Public Overrides Function GetRoleAuthorizationsByUser(ByVal UserId As Integer) As System.Data.IDataReader
            Return CType(SqlHelper.ExecuteReader(ConnectionString, "GetRoleAuthorizationsByUserID", UserId), IDataReader)
        End Function

        Public Overrides Function AddRoleAuthorization(ByVal RoleId As Integer, ByVal CustomerId As Integer, ByVal ProjectId As Integer) As IDataReader
            Return CType(SqlHelper.ExecuteReader(ConnectionString, "AddRoleAuthorization", RoleId, CustomerId, ProjectId), IDataReader)
        End Function

        Public Overrides Sub DeleteRoleAuthorization(ByVal RoleAuthorizationId As Integer)
            SqlHelper.ExecuteNonQuery(ConnectionString, "DeleteRoleAuthorization", RoleAuthorizationId)
        End Sub

        Public Overrides Sub DeleteRoleAuthorizationByRole(ByVal RoleId As Integer)
            SqlHelper.ExecuteNonQuery(ConnectionString, "DeleteRoleAuthorizationsByRole", RoleId)
        End Sub

        Public Overrides Function GetCustomerList() As System.Data.IDataReader
            Return CType(SqlHelper.ExecuteReader(ConnectionString, "GetCustomersList"), IDataReader)
        End Function

        Public Overrides Function GetProjectListByCustomer(ByVal CustomerId As Integer) As System.Data.IDataReader
            Return CType(SqlHelper.ExecuteReader(ConnectionString, "GetProjectsListByCustomer", CustomerId), IDataReader)
        End Function

#End Region

    End Class

End Namespace



