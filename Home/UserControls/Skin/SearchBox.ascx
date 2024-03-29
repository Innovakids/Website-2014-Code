<%@ Control Language="VB" AutoEventWireup="false" CodeFile="SearchBox.ascx.vb" Inherits="UserControls_Skin_SearchBox" %>
<div id="section_searchbox">
    <div id="searchboxes">
        <asp:Panel ID="pnlSearchBox" runat="server">
            <input type="text" size="40" class="textbox" id="searchbox" onkeypress="javascript:presssearchkey(event);" />
            <input id="searchbutton" type="button" value='<asp:Literal ID="litContentText_Search" runat="server" Text="<%$ Resources: Kartris, ContentText_Search%>" />'
                class="button" onclick="javascript:submitsearchbox()" />
            <div class="spacer">
            </div>
            <script type="text/javascript">
                function submitsearchbox() {
                    window.location.href = document.getElementById('baseTag').href + 'Search.aspx?strSearchText=' + document.getElementById('searchbox').value.replace(/ /gi, "+");
                }
                function presssearchkey(e) {
                    if (typeof e == 'undefined' && window.event) { e = window.event; }
                    if (e.keyCode == 13) {
                        document.getElementById('searchbutton').click();
                    }
                }
            </script>
        </asp:Panel>
    </div>
</div>