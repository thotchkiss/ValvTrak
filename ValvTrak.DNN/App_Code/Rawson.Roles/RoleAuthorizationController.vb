Imports System
Imports System.Collections
Imports DotNetNuke.Services.Messaging.Data
Imports Microsoft.VisualBasic

Imports DotNetNuke.Common.Utilities
Imports DotNetNuke.Entities.Portals
Imports DotNetNuke.Entities.Users
Imports DotNetNuke.Services.Mail
Imports System.Xml
Imports System.Collections.Generic
Imports System.Data

Namespace Rawson.Roles

    Public Class RoleAuthorizationController

#Region "Private Shared Members"

        Private Shared _provider As RoleAuthorizationProvider = New RoleAuthorizationProvider()

#End Region

#Region "Public Methods"

        Public Sub AddRoleAuthorization(ByRef info As RoleAuthorizationInfo)
            Dim dr As IDataReader = _provider.CreateRoleAuthorization(info.RoleId, info.CustomerId, info.ProjectId)

            Try
                If dr.Read Then

                    Dim rId As Integer = Null.SetNullInteger(dr(0))
                    Dim result As IDataReader = _provider.GetRoleAuthorization(rId)

                    If (result.Read) Then
                        Try
                            info.Fill(result)
                        Finally
                            CBO.CloseDataReader(result, True)
                        End Try

                    End If

                    Dim objEventLog As New DotNetNuke.Services.Log.EventLog.EventLogController
                    objEventLog.AddLog(info, PortalController.GetCurrentPortalSettings, UserController.GetCurrentUserInfo.UserID, "", DotNetNuke.Services.Log.EventLog.EventLogController.EventLogType.ROLE_CREATED)

                End If

            Finally
                CBO.CloseDataReader(dr, True)
            End Try
        End Sub

        Public Function GetRoleAuthorizationByRole(ByVal roleId As Integer) As ArrayList
            Return _provider.GetRoleAuthorizationsByRole(roleId)
        End Function

        Public Function GetRoleAuthorizationByUser(ByVal userId As Integer) As ArrayList
            Return _provider.GetRoleAuthorizationsByUser(userId)
        End Function

        Public Sub DeleteRoleAuthorization(ByVal roleAuthorizationId As Integer)
            _provider.DeleteRoleAuthorization(roleAuthorizationId)
        End Sub

        Public Sub DeleteRoleAuthorizationByRole(ByVal roleId As Integer)
            _provider.DeleteRoleAuthorizationByRole(roleId)
        End Sub

        Public Function GetCustomers() As ArrayList
            Return _provider.GetCustomerList()
        End Function

        Public Function GetProjects(ByVal customerId As Integer) As ArrayList
            Return _provider.GetProjectsList(customerId)
        End Function

#End Region

    End Class

End Namespace

