﻿<%@ Page Title="Filter Search" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FilterSearch.aspx.cs" Inherits="WebApp.SamplePages.FilterSearch" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Filter Search</h1>
    <blockquote class="alert alert-info">
        This page will review filter search techniques. This page will using
        code-behind and ObjectDataSource on multi-record controls. This page will
        use various form controls. This will review event driven logic.
    </blockquote>
    <div class="col-md-offset-3">
         <asp:Label ID="Message" runat="server" ></asp:Label>
        <br /><br />
        <asp:Label ID="label1" runat="server" Text="Select an artist:"></asp:Label>
        &nbsp;&nbsp;
        <asp:DropDownList ID="ArtistList" runat="server"></asp:DropDownList>
        &nbsp;&nbsp;
        <asp:LinkButton ID="FetchAlbums" runat="server" OnClick="FetchAlbums_Click">Fetch Albums</asp:LinkButton>
        <br />
        <asp:GridView ID="AlbumList" runat="server" AutoGenerateColumns="false" DataSourceID="AlbumListODS" AllowPaging="True" PageSize="5">
            <Columns>
                <asp:CommandField SelectText="View" ShowSelectButton="True"></asp:CommandField>
                <asp:TemplateField HeaderText="Album">
                    <ItemTemplate>
                        <asp:Label ID="AlbumTitle" runat="server"
                             Text='<%# Eval("Title") %>'></asp:Label>
                        <asp:Label ID="AlbumID" runat="server"
                             Text='<%# Eval("AlbumId") %>' Visible="false" ></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Year">
                      <ItemTemplate>
                        <asp:Label ID="Label7" runat="server"
                             Text='<%# Eval("ReleaseYear") %>'></asp:Label>
                      </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Label">
                      <ItemTemplate>
                        <asp:Label ID="Label8" runat="server"
                             Text='<%# Eval("ReleaseLabel") %>'></asp:Label>
                      </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EmptyDataTemplate>
                No albums for selected artist.
            </EmptyDataTemplate>
        </asp:GridView>
        <br />
        <asp:Label ID="label2" runat="server" Text="ALbum Id:"></asp:Label>
        &nbsp;&nbsp;
        <asp:Label ID="EditAlbumID" runat="server"></asp:Label>
        <br />
        <asp:Label ID="label3" runat="server" Text="Title:"></asp:Label>
        &nbsp;&nbsp;
        <asp:TextBox ID="EditTitle" runat="server"></asp:TextBox>
        <br />
         <asp:Label ID="label4" runat="server" Text="Artist"></asp:Label>
        &nbsp;&nbsp;
       <asp:DropDownList ID="EditAlbumArtistList" runat="server" DataSourceID="AlbumArtistListODS" 
           DataTextField="Name" 
           DataValueField="ArtistId" ></asp:DropDownList>
        <br />
         <asp:Label ID="label5" runat="server" Text="Year:"></asp:Label>
        &nbsp;&nbsp;
        <asp:TextBox ID="EditReleaseYear" runat="server"></asp:TextBox>
        <br />
         <asp:Label ID="label6" runat="server" Text="Label:"></asp:Label>
        &nbsp;&nbsp;
        <asp:TextBox ID="EditReleaseLabel" runat="server"></asp:TextBox>
        <br />
    </div>
    <asp:ObjectDataSource ID="AlbumListODS" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="Album_GetByArtist" TypeName="ChinookSystem.BLL.AlbumController">
        <SelectParameters>
            <asp:ControlParameter ControlID="ArtistList" PropertyName="SelectedValue" DefaultValue="0" Name="artistid" Type="Int32"></asp:ControlParameter>
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="AlbumArtistListODS" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="Artist_List" TypeName="ChinookSystem.BLL.ArtistController"></asp:ObjectDataSource>
</asp:Content>