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
Imports KartSettingsManager

''' <summary>
''' Used in Categories.aspx, to list the products that belong to the currently browsed category.
''' It uses the 3 UCs Product's View Templates "Extened, Shortened, and Normal" to Display Products.
''' The UC ItemPager.ascx is used here to allow the paging for large number of products.
''' </summary>
''' <remarks>By Mohammad</remarks>
Partial Class CategoryProductsView
    Inherits System.Web.UI.UserControl

    '' The URL Query String Key that holds the Products' PageNo. to display.
    Const c_PAGER_QUERY_STRING_KEY As String = "PPGR"


    Private _CategoryID As Integer
    Private _LanguageID As Short
    Private _ViewType As Char
    Private _DisplayOrder As String
    Private _DisplayDirection As Char

    '' No. of products in each page. Its the CONFIG Setting Key (frontend.products.display.[viewName].pagesize)
    Private _RowsPerPage As Short

    '' The total number of Products under the category.
    Private c_numTotalProductsInCategory As Integer

    Public ReadOnly Property CategoryID() As Integer
        Get
            Return _CategoryID
        End Get
    End Property

    Public ReadOnly Property TotalItems() As Integer
        Get
            Return c_numTotalProductsInCategory
        End Get
    End Property

    Dim tblProducts As New DataTable
    ''' <summary>
    ''' Loads/Prepares the products of the Category.
    ''' </summary>
    ''' <param name="pCategoryID"></param>
    ''' <param name="pLanguageID"></param>
    ''' <param name="pViewType">e->Extended, n->Normal, s->Shortened, and d->Default "CONFIG Setting Key"</param>
    ''' <remarks>By Mohammad</remarks>
    Public Sub LoadCategoryProducts(ByVal pCategoryID As Integer, ByVal pLanguageID As Short, _
                                    ByVal pViewType As Char, ByVal pDisplayOrder As String, ByVal pDisplayDirection As Char)

        If pCategoryID = 0 Then Exit Sub

        _CategoryID = pCategoryID
        _LanguageID = pLanguageID
        _ViewType = pViewType
        _DisplayOrder = pDisplayOrder
        _DisplayDirection = pDisplayDirection

        '' Gets the View Type value from the CONFIG Settings if the viewType parameter is set to Default.
        If _ViewType = "d" Then _ViewType = GetKartConfig("frontend.products.display.default")


        '' Loads the Products in the tblProducts DataTable depending
        ''  on the View Type of the products. "ByRef"
        GenerateProductsList(tblProducts)

        '' If there is no products under the category, then exit.
        If tblProducts.Rows.Count = 0 Then Me.Visible = False : Exit Sub

        '' Binding the tblProducts to the proper repeater, depending on the View Type.
        '' And then activate the corresponding View Control.
        Select Case _ViewType
            Case "n"
                rptNormal.DataSource = tblProducts.DefaultView
                rptNormal.DataBind()
                mvwCategoryProducts.SetActiveView(viwNormal)
            Case "e"
                rptExtended.DataSource = tblProducts.DefaultView
                rptExtended.DataBind()
                mvwCategoryProducts.SetActiveView(viwExtended)
            Case "s"
                rptShortened.DataSource = tblProducts.DefaultView
                rptShortened.DataBind()
                mvwCategoryProducts.SetActiveView(viwShortened)
            Case "t"
                rptTabular.DataSource = tblProducts.DefaultView
                rptTabular.DataBind()
                mvwCategoryProducts.SetActiveView(viwTabular)
            Case Else
                'litGroupName.Visible = False
        End Select
    End Sub

    ''' <summary>
    ''' Generates and Fills the tblProducts with the products that belong to the Current Category Page.
    ''' Also, initializes the ItemPager.ascx to create the pages(if any).
    ''' </summary>
    ''' <param name="pTblProducts">Reference to the products' dataTable</param>
    ''' <remarks></remarks>
    Private Sub GenerateProductsList(ByRef pTblProducts As DataTable)

        '' Checking if the Products' Paging is Enabled in the CONFIG Settings

        '' Gets the value of the Paging Key "PPGR" from the URL.
        Dim numPageIndx As Short
        Try
            If Request.QueryString(c_PAGER_QUERY_STRING_KEY) Is Nothing Then
                numPageIndx = 0
            Else
                numPageIndx = Request.QueryString(c_PAGER_QUERY_STRING_KEY)
            End If
        Catch ex As Exception
        End Try
        Dim strViewName As String = Nothing

        Select Case _ViewType
            Case "n" : strViewName = "normal"
            Case "e" : strViewName = "extended"
            Case "s" : strViewName = "shortened"
            Case "t" : strViewName = "tabular"
            Case Else
        End Select

        '' Gets No. of Products/Page from the CONFIG Setting, depending on the viewName(viewType)
        _RowsPerPage = GetKartConfig("frontend.products.display." & strViewName & ".pagesize")

        Dim numCGroupID As Short = 0
        If HttpContext.Current.User.Identity.IsAuthenticated Then
            numCGroupID = CShort(DirectCast(Page, PageBaseClass).CurrentLoggedUser.CustomerGroupID)
        End If

        '' Saving the current page's products in tblProducts, depending on the pageIndex "PPGR"
        pTblProducts = ProductsBLL.GetProductsPageByCategory(_CategoryID, _LanguageID, numPageIndx, _
                                                                _RowsPerPage, numCGroupID, c_numTotalProductsInCategory)


        If pTblProducts.Rows.Count <> 0 Then
            '' If the total products couldn't be fitted in 1 Page, Then Initialize the Pager.
            If c_numTotalProductsInCategory > _RowsPerPage Then

                '' Load the Header & Footer Pagers
                UC_ItemPager_Header.LoadPager(c_numTotalProductsInCategory, _RowsPerPage, c_PAGER_QUERY_STRING_KEY)
                UC_ItemPager_Footer.LoadPager(c_numTotalProductsInCategory, _RowsPerPage, c_PAGER_QUERY_STRING_KEY)

                UC_ItemPager_Header.DisableLink(numPageIndx)
                UC_ItemPager_Footer.DisableLink(numPageIndx)

                '' Make the pager visible.
                UC_ItemPager_Header.Visible = True
                UC_ItemPager_Footer.Visible = True
            End If
        End If

        '' Converting the price currency in the retrieved products, depending on the current currency.
        For Each row As DataRow In pTblProducts.Rows
            row("MinPrice") = CurrenciesBLL.ConvertCurrency(Session("CUR_ID"), CDbl(row("MinPrice")))
        Next

    End Sub

End Class
