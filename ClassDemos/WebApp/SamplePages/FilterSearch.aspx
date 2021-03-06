﻿<%@ Page Title="Filter Search" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FilterSearch.aspx.cs" Inherits="WebApp.SamplePages.FilterSearch" %>

<%@ Register Src="~/UserControls/MessageUserControl.ascx" TagPrefix="uc1" TagName="MessageUserControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Filter Search</h1>
    <blockquote class="alert alert-info">
        This page will review filter search techniques. This page will using
        code-behind and ObjectDataSource on multi-record controls. This page will
        use various form controls. This will review event driven logic.
    </blockquote>
    <div class="col-md-offset-3">
        <uc1:MessageUserControl runat="server" ID="MessageUserControl" />
        <br /><br />
        <asp:Label ID="label1" runat="server" Text="Select an artist:"></asp:Label>
        &nbsp;&nbsp;
        <asp:DropDownList ID="ArtistList" runat="server"></asp:DropDownList>
        &nbsp;&nbsp;
        <asp:LinkButton ID="FetchAlbums" class="btn-primary" runat="server" CausesValidation="false">Fetch Albums</asp:LinkButton>
        <br />
        <asp:GridView ID="AlbumList" runat="server" AutoGenerateColumns="false" DataSourceID="AlbumListODS" AllowPaging="True" PageSize="5" CssClass="table table-striped" GridLines="Horizontal" BorderStyle="None" OnSelectedIndexChanged="AlbumList_SelectedIndexChanged">
            <Columns>
                <asp:CommandField SelectText="View" ShowSelectButton="True" CausesValidation="false"></asp:CommandField>
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
         <asp:Label ID="label4" runat="server" Text="Artist" MaxLength="160"></asp:Label>
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
        <asp:TextBox ID="EditReleaseLabel" runat="server" MaxLength="50"></asp:TextBox>
        <br />
        <asp:LinkButton ID="Add" runat="server" OnClick="Add_Click">Add</asp:LinkButton> &nbsp;&nbsp;
        <asp:LinkButton ID="Update" runat="server" OnClick="Update_Click">Update</asp:LinkButton> &nbsp;&nbsp;
        <asp:LinkButton ID="Remove" runat="server" OnClientClick="return confirm('Are you sure, you wish to remove this Album from the Collection.')" CausesValidation="false" OnClick="Remove_Click">Remove</asp:LinkButton> &nbsp;&nbsp;
    </div>
    <asp:ObjectDataSource ID="AlbumListODS" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="Album_GetByArtist" TypeName="ChinookSystem.BLL.AlbumController">
        <SelectParameters>
            <asp:ControlParameter ControlID="ArtistList" PropertyName="SelectedValue" DefaultValue="0" Name="artistid" Type="Int32"></asp:ControlParameter>
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="AlbumArtistListODS" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="Artist_List" TypeName="ChinookSystem.BLL.ArtistController"></asp:ObjectDataSource>
</asp:Content>
