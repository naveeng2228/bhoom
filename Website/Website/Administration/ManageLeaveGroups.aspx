﻿<%@ Page Title="Leave Groups" Language="C#" MasterPageFile="~/Ethon.Master" AutoEventWireup="true" CodeBehind="ManageLeaveGroups.aspx.cs" Inherits="Website.Administration.ManageLeaveGroups" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>Manage Leave Groups
        </h1>
        <ol class="breadcrumb">
            <li><a href="<%=ResolveUrl("~") %>dashboard"><i class="fa fa-dashboard"></i>Home</a></li>
            <li><a href="<%=ResolveUrl("~") %>administration">Administration</a></li>
            <li><a href="<%=ResolveUrl("~") %>administration/managecompany">Manage Companies</a></li>
            <li class="active">Manage Leave Groups</li>
        </ol>
    </section>

    <!-- Main content -->
    <section class="content">

        <div class="row">
            <div class="col-md-3">

                <!-- Profile Image -->
                <div class="box box-primary">
                    <div class="box-body box-profile">
                        <h3 class="profile-username">
                            <asp:Label ID="lblLeaveGroups" runat="server" Text="Leave Groups"></asp:Label>
                        </h3>

                        <p class="text-muted text-center"></p>
                        <div id="divLeaveGroupList" runat="server">
                            <asp:GridView ID="gvLeaveGroups" runat="server" AutoGenerateColumns="false" 
                                AllowPaging="true" PageSize="20" OnRowCommand="gvLeaveGroups_RowCommand" 
                                OnPageIndexChanging="gvLeaveGroups_PageIndexChanging" CssClass="edatatable table table-bordered table-hover">
                                <Columns>
                                    <asp:TemplateField HeaderText="Actions">
                                        <ItemTemplate>
                                            <asp:Button ID="btnDelete" runat="server" Text="Delete" CommandArgument='<%# Eval("LeaveGroupID") %>' CommandName="iDel" CssClass="btn btn-danger btn-sm" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Title">
                                        <ItemTemplate>
                                            <asp:HyperLink ID="hlLeaveGroupName" runat="server" Text='<%# Eval("LeaveGroupName") %>' NavigateUrl='<%# "~/leavemanagement/manageleavegroups/" + Eval("LeaveGroupID") %>'></asp:HyperLink>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                    <!-- /.box-body -->
                    <div class="box-footer">
                        <a href="<%=ResolveUrl("~") %>leavemanagement/createleavegroups" class="btn btn-primary btn-sm">Create Leave Group</a>
                    </div>
                </div>
                <!-- /.box -->
            </div>
            <!-- /.col -->
            <div class="col-md-9">
                <div class="nav-tabs-custom">
                    <ul class="nav nav-tabs">
                        <li class="active"><a href="#details" data-toggle="tab">Leave Group details</a></li>
                    </ul>
                    <div class="tab-content">
                        <div class="active tab-pane" id="details">
                            <!-- box -->
                            <div id="divLeaveGroup" runat="server" class="box box-default">
                                <!-- /.box-header -->
                                <div class="box-body">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="txtLeaveGroupID">Leave Group ID</label>
                                                <asp:TextBox ID="txtLeaveGroupID" runat="server" CssClass="form-control" placeholder="Leave Group ID" ReadOnly="true"></asp:TextBox>
                                            </div>
                                            <div class="form-group">
                                                <label for="txtCompanyID">Company ID</label>
                                                <asp:TextBox ID="txtCompanyID" runat="server" CssClass="form-control" placeholder="Company ID" ReadOnly="true"></asp:TextBox>
                                            </div>
                                            <div class="form-group">
                                                <label for="txtLeaveGroupName">Leave Group Name</label>
                                                <asp:TextBox ID="txtLeaveGroupName" runat="server" CssClass="form-control" placeholder="Enter Leave Group Name"></asp:TextBox>
                                            </div>
                                            <div class="form-group">
                                                <label for="ddlStatus">Status</label>
                                                <asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-control select2" style="width: 100%;">
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- /.box-body -->

                                <div class="box-footer">
                                    <asp:Button ID="btnUpdate" runat="server" Text="Update Leave Group Details" CssClass="btn btn-primary" OnClientClick="return CustomValidate();" OnClick="btnUpdate_Click" />
                                    <!-- Hidden Fields -->
                                    <asp:HiddenField ID="hdnPriority" runat="server" />
                                </div>
                            </div>
                            <div id="divNoCompanies" runat="server">
                                <p>No leave groups available for you.</p>
                            </div>
                            <!-- /.box -->
                        </div>
                        <!-- /.tab-pane -->
                    </div>
                    <!-- /.tab-content -->
                </div>
                <!-- /.nav-tabs-custom -->
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

        function CustomValidate()
        {
            var Validated = false;

            // Validating Logo to meet dimentions
            if(ValidateLogo())
            {
                Validated = true;
            }
            
            return Validated;
        }

        function ValidateLogo()
        {
            return true;
        }
    </script>
</asp:Content>

