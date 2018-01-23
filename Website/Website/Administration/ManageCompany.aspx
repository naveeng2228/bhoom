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
                            <!-- box -->
                            <div class="box box-default">
                                <!-- /.box-header -->
                                <div class="box-body">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="txtCompanyID">Company ID</label>
                                                <asp:TextBox ID="txtCompanyID" runat="server" CssClass="form-control" placeholder="Company ID" ReadOnly="true"></asp:TextBox>

                                                <p class="help-block">This is your company ID.</p>
                                            </div>
                                            <div class="form-group">
                                                <label for="txtCompanyName">Company Name</label>
                                                <asp:TextBox ID="txtCompanyName" runat="server" CssClass="form-control" placeholder="Enter Company Name"></asp:TextBox>

                                                <p class="help-block">Please enter your company name exactly.</p>
                                            </div>
                                            <div class="form-group">
                                                <label for="txtCompanyCode">Company Code</label>
                                                <asp:TextBox ID="txtCompanyCode" runat="server" CssClass="form-control" placeholder="Enter Company Code"></asp:TextBox>

                                                <p class="help-block">This is your company short code.</p>
                                            </div>
                                            <div class="form-group">
                                                <label for="txtDescription">Description</label>
                                                <asp:TextBox ID="txtDescription" runat="server" MaxLength="300" Columns="55" Rows="6" TextMode="MultiLine" CssClass="form-control"
                                                    placeholder="Enter Description"></asp:TextBox>

                                                <p class="help-block">Enter your company description in Max. of 300 charecters.</p>
                                            </div>
                                            <div class="form-group">
                                                <label for="txtCST">CST</label>
                                                <asp:TextBox ID="txtCST" runat="server" CssClass="form-control" placeholder="Enter CST"></asp:TextBox>
                                            </div>
                                            <div class="form-group">
                                                <label for="txtTIN">TIN</label>
                                                <asp:TextBox ID="txtTIN" runat="server" CssClass="form-control" placeholder="Enter TIN"></asp:TextBox>
                                            </div>
                                            <div class="form-group">
                                                <label for="txtPAN">PAN</label>
                                                <asp:TextBox ID="txtPAN" runat="server" CssClass="form-control" placeholder="Enter PAN"></asp:TextBox>
                                            </div>
                                            <div class="form-group">
                                                <label for="txtTAN">TAN</label>
                                                <asp:TextBox ID="txtTAN" runat="server" CssClass="form-control" placeholder="Enter TAN"></asp:TextBox>
                                            </div>
                                            <div class="form-group">
                                                <label for="txtGST">GST</label>
                                                <asp:TextBox ID="txtGST" runat="server" CssClass="form-control" placeholder="EnterGST"></asp:TextBox>
                                            </div>
                                            <div class="form-group">
                                                <label for="ddlStatus">Status</label>
                                                <asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-control select2" style="width: 100%;">
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="ddlYear">Estb. Year</label>
                                                <asp:DropDownList ID="ddlYear" runat="server" CssClass="form-control select2" style="width: 100%;">
                                                </asp:DropDownList>

                                                <p class="help-block">This is your companies year of establishment.</p>
                                            </div>
                                            <div class="form-group">
                                                <label for="fuLogo">Company Logo</label>
                                                <asp:FileUpload ID="fuLogo" runat="server" CssClass="form-control" placeholder="Select Company Logo"></asp:FileUpload>

                                                <p class="help-block">Logo dimentions 200 X 80 (Width X height).</p>
                                            </div>
                                            <div class="form-group">
                                                <label for="txtCompanyEmail">Company Email</label>
                                                <asp:TextBox ID="txtCompanyEmail" runat="server" CssClass="form-control" placeholder="Enter Company Email"></asp:TextBox>

                                                <p class="help-block">This is should be your company's primary email address.</p>
                                            </div>
                                            <div class="form-group">
                                                <label for="txtPrimaryAddress">Primary Address</label>
                                                <asp:TextBox ID="txtPrimaryAddress" runat="server" MaxLength="300" Columns="55" Rows="6" TextMode="MultiLine" CssClass="form-control"
                                                    placeholder="Enter Primary Address"></asp:TextBox>
                                                
                                                <p class="help-block">Enter your company primary address in Max. of 300 charecters.</p>
                                            </div>
                                            <div class="form-group">
                                                <label for="ddlCountry">Country</label>
                                                <asp:DropDownList ID="ddlCountry" runat="server" CssClass="form-control select2" style="width: 100%;">
                                                </asp:DropDownList>
                                            </div>
                                            <div class="form-group">
                                                <label for="ddlState">State</label>
                                                <asp:DropDownList ID="ddlState" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlState_SelectedIndexChanged" CssClass="form-control select2" style="width: 100%;">
                                                </asp:DropDownList>
                                            </div>
                                            <div class="form-group">
                                                <label for="txtPincode">Pincode</label>
                                                <asp:TextBox ID="txtPincode" runat="server" CssClass="form-control" placeholder="Enter Pincode"></asp:TextBox>
                                            </div>
                                            <div class="form-group">
                                                <label for="txtWebsite">Website</label>
                                                <asp:TextBox ID="txtWebsite" runat="server" CssClass="form-control" placeholder="Enter Website"></asp:TextBox>
                                            </div>
                                            <div class="form-group">
                                                <label for="txtPhoneNumber">Phone Number</label>
                                                <asp:TextBox ID="txtPhoneNumber" runat="server" CssClass="form-control" placeholder="Enter Phone Number"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- /.box-body -->

                                <div class="box-footer">
                                    <asp:Button ID="btnUpdate" runat="server" Text="Update Company Details" CssClass="btn btn-primary" OnClick="btnUpdate_Click" />
                                </div>
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
    </script>
</asp:Content>

