Imports Microsoft.VisualBasic
Imports DotNetNuke.Entities.Modules

Namespace Rawson.Roles

    Public Class ListInfo


#Region "Private Members"
        Private _Name As String
        Private _Value As String
#End Region

#Region "Public Members"

        Public Property Name() As String
            Get
                Return _Name
            End Get
            Set(ByVal value As String)
                _Name = value
            End Set
        End Property

        Public Property Value() As String
            Get
                Return _Value
            End Get
            Set(ByVal value As String)
                _Value = value
            End Set
        End Property

#End Region

    End Class

End Namespace
