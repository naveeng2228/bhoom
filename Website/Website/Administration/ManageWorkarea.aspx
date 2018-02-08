<%@ Page Title="Workareas" Language="C#" MasterPageFile="~/Ethon.Master" AutoEventWireup="true" CodeBehind="ManageWorkarea.aspx.cs" Inherits="Website.Administration.ManageWorkarea" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>Manage Workareas
        </h1>
        <ol class="breadcrumb">
            <li><a href="<%=ResolveUrl("~") %>dashboard"><i class="fa fa-dashboard"></i>Home</a></li>
            <li><a href="<%=ResolveUrl("~") %>administration">Administration</a></li>
            <li><a href="<%=ResolveUrl("~") %>administration/managecompany">Manage Companies</a></li>
            <li class="active">Manage Workareas</li>
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
                            <asp:Label ID="lblWorkareaName" runat="server" Text="Workarea List"></asp:Label>
                        </h3>

                        <p class="text-muted text-center"></p>
                        <asp:DropDownList ID="ddlCompanies" runat="server" CssClass="form-control select2" style="width: 100%;" AutoPostBack="true" OnSelectedIndexChanged="ddlCompanies_SelectedIndexChanged"></asp:DropDownList>
                        <div id="divWorkareasList" runat="server"></div>
                    </div>
                    <!-- /.box-body -->
                </div>
                <!-- /.box -->
            </div>
            <!-- /.col -->
            <div class="col-md-9">
                <div class="nav-tabs-custom">
                    <ul class="nav nav-tabs">
                        <li class="active"><a href="#companydetails" data-toggle="tab">Workarea details</a></li>
                    </ul>
                    <div class="tab-content">
                        <div class="active tab-pane" id="companydetails">
                            <!-- box -->
                            <div id="divUpdateWorkarea" runat="server" class="box box-default">
                                <!-- /.box-header -->
                                <div class="box-body">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="txtWorkareaID">Workarea ID</label>
                                                <asp:TextBox ID="txtWorkareaID" runat="server" CssClass="form-control" placeholder="Workarea ID" ReadOnly="true"></asp:TextBox>

                                                <p class="help-block">This is your Workarea ID.</p>
                                            </div>
                                            <div class="form-group">
                                                <label for="txtWorkareaName">Workarea Name</label>
                                                <asp:TextBox ID="txtWorkareaName" runat="server" CssClass="form-control" placeholder="Enter Workarea Name"></asp:TextBox>

                                                <p class="help-block">Please enter your workarea name exactly.</p>
                                            </div>
                                            <div class="form-group">
                                                <label for="txtCompanyID">Company ID</label>
                                                <asp:TextBox ID="txtCompanyID" runat="server" CssClass="form-control" placeholder="Company ID" ReadOnly="true"></asp:TextBox>

                                                <p class="help-block">This is your company ID.</p>
                                            </div>
                                            <div class="form-group">
                                                <label for="txtWorkareaCode">Workarea Code</label>
                                                <asp:TextBox ID="txtWorkareaCode" runat="server" CssClass="form-control" placeholder="Enter Workarea Code"></asp:TextBox>

                                                <p class="help-block">This is your workarea short code.</p>
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
                                                <asp:TextBox ID="txtGST" runat="server" CssClass="form-control" placeholder="Enter GST"></asp:TextBox>
                                            </div>
                                            <div class="form-group">
                                                <label for="txtPFCode">PF Code</label>
                                                <asp:TextBox ID="txtPFCode" runat="server" CssClass="form-control" placeholder="Enter PF Code"></asp:TextBox>
                                            </div>
                                            <div class="form-group">
                                                <label for="txtESICode">ESI Code</label>
                                                <asp:TextBox ID="txtESICode" runat="server" CssClass="form-control" placeholder="Enter ESI Code"></asp:TextBox>
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

                                                <p class="help-block">This is your workareas year of establishment.</p>
                                            </div>
                                            <div class="form-group">
                                                <label for="txtWorkareaEmail">Workarea Email</label>
                                                <asp:TextBox ID="txtWorkareaEmail" runat="server" CssClass="form-control" placeholder="Enter Workarea Email"></asp:TextBox>

                                                <p class="help-block">This is should be your workarea's primary email address.</p>
                                            </div>
                                            <div class="form-group">
                                                <label for="txtPrimaryAddress">Primary Address</label>
                                                <asp:TextBox ID="txtPrimaryAddress" runat="server" MaxLength="300" Columns="55" Rows="6" TextMode="MultiLine" CssClass="form-control"
                                                    placeholder="Enter Primary Address"></asp:TextBox>
                                                
                                                <p class="help-block">Enter your workarea primary address in Max. of 300 charecters.</p>
                                            </div>
                                            <div class="form-group">
                                                <label for="ddlCountry">Country</label>
                                                <asp:DropDownList ID="ddlCountry" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCountry_SelectedIndexChanged" CssClass="form-control select2" style="width: 100%;">
                                                </asp:DropDownList>
                                            </div>
                                            <div class="form-group">
                                                <label for="ddlState">State</label>
                                                <asp:DropDownList ID="ddlState" runat="server" CssClass="form-control select2" style="width: 100%;">
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
                                            <div class="form-group">
                                                <label for="ddlLeaveGroup">Leave Group</label>
                                                <asp:DropDownList ID="ddlLeaveGroup" runat="server" CssClass="form-control select2" style="width: 100%;">
                                                </asp:DropDownList>
                                            </div>
                                            <div class="form-group">
                                                <label for="ddlShiftGroup">Shift Group</label>
                                                <asp:DropDownList ID="ddlShiftGroup" runat="server" CssClass="form-control select2" style="width: 100%;">
                                                </asp:DropDownList>
                                            </div>
                                            <div class="form-group">
                                                <label for="ddlAllowanceGroup">Allowance Group</label>
                                                <asp:DropDownList ID="ddlAllowanceGroup" runat="server" CssClass="form-control select2" style="width: 100%;">
                                                </asp:DropDownList>
                                            </div>
                                            <div class="form-group">
                                                <label for="ddlHolidayGroup">Holiday Group</label>
                                                <asp:DropDownList ID="ddlHolidayGroup" runat="server" CssClass="form-control select2" style="width: 100%;">
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- /.box-body -->

                                <div class="box-footer">
                                    <asp:Button ID="btnUpdate" runat="server" Text="Update Workarea Details" CssClass="btn btn-primary" OnClientClick="return CustomValidate();" OnClick="btnUpdate_Click" />
                                    <!-- Hidden Fields -->
                                    <asp:HiddenField ID="hdnPriority" runat="server" />
                                </div>
                            </div>
                            <div id="divNoWorkareas" runat="server">
                                <p>No workareas available for you. Please contact admin.</p>
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