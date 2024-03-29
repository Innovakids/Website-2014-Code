﻿'========================================================================
'Kartris - www.kartris.com
'Copyright 2013 CACTUSOFT INTERNATIONAL FZ LLC

'GNU GENERAL PUBLIC LICENSE v2
'This program is free software distributed under the GPL without any
'warranty.
'www.gnu.org/licenses/gpl-2.0.html

'KARTRIS COMMERCIAL LICENSE
'If a valid license.config issued by Cactusoft is present, the KCL
'overrides the GPL v2.
'www.kartris.com/t-Kartris-Commercial-License.aspx
'========================================================================
Partial Class UserControls_Back_OrderBreadcrumb
    Inherits System.Web.UI.UserControl
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim intOrderID As Long = CType(Request.QueryString("OrderID"), Integer)
            If intOrderID > 0 Then
                Dim blnIsOrderChild As Boolean = True
                Dim intChildID As Long = 0
                'Check if this order has a parent
                Dim intParentID As Long = OrdersBLL._GetParentOrderID(intOrderID)
                'If it doesn't have a parent then assume that its the parent
                If intParentID = 0 Then
                    blnIsOrderChild = False
                    intParentID = intOrderID
                    intChildID = OrdersBLL._GetChildOrderID(intOrderID)
                Else
                    intChildID = intOrderID
                End If

                If intParentID > 0 And intChildID > 0 Then
                    lnkChild.Text = "#" & intChildID
                    lnkParent.Text = "#" & intParentID
                    If blnIsOrderChild Then
                        lnkParent.NavigateUrl = "~/Admin/_ModifyOrderStatus.aspx?OrderID=" & intParentID
                    Else
                        lnkChild.NavigateUrl = "~/Admin/_ModifyOrderStatus.aspx?OrderID=" & intChildID
                    End If
                Else
                    Me.Visible = False
                End If
            Else
                Me.Visible = False
            End If
        End If
    End Sub
End Class
