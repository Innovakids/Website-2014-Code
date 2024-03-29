﻿<%@ Control Language="VB" AutoEventWireup="false" CodeFile="ProductTemplateNormal.ascx.vb" Inherits="ProductTemplateNormal" %>
<!-- product normal template start -->
<div class="item">
    <div class="box">
        <div class="pad">
            <asp:Literal ID="litProductID" runat="server" Visible="false" Text='<%# Eval("P_ID") %>'></asp:Literal>
            <div class="imageblock">
                <user:ImageViewer ID="UC_ImageView" runat="server" EnableViewState="False" />
            </div>
            <div class="details">
                <h2>
                    <asp:HyperLink ID="lnkProductName" runat="server" NavigateUrl='<%# Eval("P_ID", "~/Product.aspx?ProductID={0}") %>'
                        Text='<%# DisplayProductName() %>' EnableViewState="false"></asp:HyperLink></h2>
                <em class="strapline">
                    <asp:Literal ID="litStrapLine" runat="server" Text='<%# Eval("P_StrapLine") %>' EnableViewState="false"></asp:Literal></em>
                <p class="description">
                    <asp:Literal EnableViewState="false" ID="litProductDesc" runat="server" Text='<%# CkartrisDisplayFunctions.TruncateDescription(Eval("P_Desc"), KartSettingsManager.GetKartConfig("frontend.products.display.truncatedescription")) %>'></asp:Literal></p>
                <asp:Literal ID="litVersionsViewType" runat="server" Text='<%# Eval("P_VersionDisplayType") %>'
                    Visible="false"></asp:Literal>
                <div class="minprice" id="divPrice" runat="server" visible='<%# Iif( ObjectConfigBLL.GetValue("K:product.callforprice", Eval("P_ID")) = 1 OrElse Not String.IsNullOrEmpty(ObjectConfigBLL.GetValue("K:product.customcontrolname", Eval("P_ID"))), False, True) %>'>
                    <asp:Literal EnableViewState="false" ID="litPriceFrom" runat="server" Text="<%$ Resources:Products,ContentText_ProductPriceFrom %>"></asp:Literal>
                    <asp:Literal EnableViewState="false" ID="litPriceHidden" runat="server" Text='<%# Eval("MinPrice") %>' Visible="false" />
                    <asp:Literal EnableViewState="false" ID="litPriceView" runat="server" />
                </div>
                <asp:HyperLink ID="lnkMore" EnableViewState="false" runat="server" CssClass="link2" NavigateUrl='<%# Eval("P_ID", "~/Product.aspx?ProductID={0}") %>'
                    Text="<%$ Resources:Products,ContentText_ViewProductMoreDetail %>" /></div>
        </div>
    </div>
</div>
<!-- product normal template end -->