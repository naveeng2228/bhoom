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
            <div class="col-md-3">

                <!-- Profile Image -->
                <div class="box box-primary">
                    <div class="box-body box-profile">
                        <h3 class="profile-username">
                            <asp:Label ID="lblCompanyName" runat="server" Text="Company List"></asp:Label>
                        </h3>

                        <p class="text-muted text-center"></p>
                        <div id="divCompaniesList" runat="server"></div>
                    </div>
                    <!-- /.box-body -->
                </div>
                <!-- /.box -->
            </div>
            <!-- /.col -->
            <div class="col-md-9">
                <div class="nav-tabs-custom">
                    <ul class="nav nav-tabs">
                        <li class="active"><a href="#companydetails" data-toggle="tab">Company details</a></li>
                    </ul>
                    <div class="tab-content">
                        <div class="active tab-pane" id="companydetails">
                            
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

