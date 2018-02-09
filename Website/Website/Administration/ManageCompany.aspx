<%@ Page Title="Company" Language="C#" MasterPageFile="~/Ethon.Master" AutoEventWireup="true" CodeBehind="ManageCompany.aspx.cs" Inherits="Website.Administration.ManageCompany" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>Manage Companies
        </h1>
        <ol class="breadcrumb">
            <li><a href="<%=ResolveUrl("~") %>dashboard"><i class="fa fa-dashboard"></i>Home</a></li>
            <li><a href="<%=ResolveUrl("~") %>administration">Administration</a></li>
            <li class="active">Manage Companies</li>
        </ol>
    </section>

    <!-- Main content -->
    <section class="content">

        <div class="row">
            <div class="col-md-12">
                <h3 class="profile-username">
                    Manage Companies
                </h3>
                <asp:GridView ID="gvCompanies" runat="server" AutoGenerateColumns="false"
                    AllowPaging="true" PageSize="20" OnRowCommand="gvCompanies_RowCommand"
                    OnPageIndexChanging="gvCompanies_PageIndexChanging" CssClass="edatatable table table-bordered table-hover">
                    <Columns>
                        <asp:TemplateField HeaderText="Actions">
                            <ItemTemplate>
                                <asp:Button ID="btnDelete" runat="server" Text="Delete" CommandArgument='<%# Eval("CompanyID") %>' CommandName="iDel" CssClass="btn btn-danger btn-sm" OnClientClick="return confirm('Are you sure you want to delete this?');" />
                                <asp:Button ID="btnEdit" runat="server" Text="Edit" CommandArgument='<%# Eval("CompanyID") %>' CommandName="iEd" CssClass="btn btn-success btn-sm" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Company Name">
                            <ItemTemplate>
                                <asp:HyperLink ID="hlCompanyName" runat="server" Text='<%# Eval("CompanyName") %>' NavigateUrl='<%# "~/administration/viewcompany/" + Eval("CompanyID") %>'></asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Company Email">
                            <ItemTemplate>
                                <asp:Label ID="lblCompanyEmail" runat="server" Text='<%# Eval("CompanyEmail") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Address">
                            <ItemTemplate>
                                <asp:Label ID="lblPrimaryAddress" runat="server" Text='<%# Eval("PrimaryAddress") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
            <!-- /.col -->
        </div>
        <!-- /.row -->

    </section>
    <!-- /.content -->
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptBlock" runat="server">
    <script>
        var liform = $("#liForm_<%= this.FormName.Replace(" ", string.Empty).ToLower() %>");
        var ulmodule = $(liform).closest("ul");
        var limodule = $(ulmodule).closest("li");
        $(liform).attr("class", "active").find("a").css("color", "#FFF");
        $(ulmodule).attr("class", "active");
        $(limodule).attr("class", "active");
    </script>
</asp:Content>

