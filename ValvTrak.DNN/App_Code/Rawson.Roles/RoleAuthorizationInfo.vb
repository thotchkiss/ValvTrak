
Imports System
Imports System.Collections
Imports System.Configuration
Imports System.Data
Imports System.Xml.Serialization
Imports System.Xml.Schema
Imports System.Xml
Imports DotNetNuke.Entities.Modules

Namespace Rawson.Roles
    Public Class RoleAuthorizationInfo
        Implements IHydratable

#Region "ctor"

        Public Sub New()

        End Sub

        Public Sub New(ByVal rId As Integer, ByVal cId As Integer)

            RoleId = rId
            CustomerId = cId

        End Sub

        Public Sub New(ByVal rId As Integer, ByVal cId As Integer, ByVal pId As Integer)

            RoleId = rId
            CustomerId = cId
            ProjectId = pId

        End Sub

#End Region

#Region "Private Members"

        Private _RoleAuthorizationId As Integer = Null.NullInteger
        Private _RoleId As Integer = Null.NullInteger
        Private _CustomerId As Integer = Null.NullInteger
        Private _CustomerName As String = Null.NullString
        Private _ProjectId As Integer = Null.NullInteger
        Private _ProjectName As String = Null.NullString

#End Region

#Region "Public Members"

        Public Property RoleAuthorizationId() As Integer
            Get
                Return _RoleAuthorizationId
            End Get
            Set(ByVal value As Integer)
                _RoleAuthorizationId = value
            End Set
        End Property

        Public Property RoleId() As Integer
            Get
                Return _RoleId
            End Get
            Set(ByVal value As Integer)
                _RoleId = value
            End Set
        End Property

        Public Property CustomerId() As Integer
            Get
                Return _CustomerId
            End Get
            Set(ByVal value As Integer)
                _CustomerId = value
            End Set
        End Property

        Public Property CustomerName() As String
            Get
                Return _CustomerName
            End Get
            Set(ByVal value As String)
                _CustomerName = value
            End Set
        End Property

        Public Property ProjectId() As Integer
            Get
                Return _ProjectId
            End Get
            Set(ByVal value As Integer)
                _ProjectId = value
            End Set
        End Property

        Public Property ProjectName() As String
            Get
                Return _ProjectName
            End Get
            Set(ByVal value As String)
                _ProjectName = value
            End Set
        End Property

#End Region

#Region "IHydratable Members"

        Public Sub Fill(ByVal dr As System.Data.IDataReader) Implements DotNetNuke.Entities.Modules.IHydratable.Fill

            RoleAuthorizationId = Null.SetNullInteger(dr("RoleAuthorizationId"))
            RoleId = Null.SetNullInteger(dr("RoleId"))
            CustomerId = Null.SetNullString(dr("CustomerId"))
            CustomerName = Null.SetNullString(dr("CustomerName"))
            ProjectId = Null.SetNullString(dr("ProjectId"))
            ProjectName = Null.SetNullString(dr("ProjectName"))

        End Sub

        Public Property KeyID() As Integer Implements DotNetNuke.Entities.Modules.IHydratable.KeyID
            Get
                Return RoleAuthorizationId
            End Get
            Set(ByVal value As Integer)
                RoleAuthorizationId = value
            End Set
        End Property

#End Region


    End Class

End Namespace
