    <%@ Page Title="Broward College Survey" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<asp:Content runat="server" ID="Content3" ContentPlaceHolderID="MainContent">
    <div class="auto-style6"  style="margin-left: 0px">
    <asp:Label ID="lblError" runat="server" Text="" CssClass="auto-style5"></asp:Label>
    <div class="auto-style5"  style="margin-left: 0px">
    <asp:Panel ID="PanelCampus" runat="server" Visible="true" style="margin-left: 36px">

        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
            ControlToValidate="campusselect" ErrorMessage="Please select a campus" Font-Bold="True" Font-Underline="True" ForeColor="#CC0000"></asp:RequiredFieldValidator>
        <%-- This version will reuse 3 individual panels for displaying questions and responses
            there is a Yes/No panel, a Ratings panel and a Comments panel. THis allows for any amount and variation of question to be generated 
            and the code will handle it --%>
        <%-- DT 10.6 Added the Coral Springs option back but it will display the same options as the North Campus--%>
        <%-- DT 10.6 added some formatting for a more uniform look --%>

        <h1>* Which campus location would you like to rate today?</h1>

         <!--Changed RadioButtonList to DropDownList *Octavio* -->
        <asp:DropDownList ID="campusselect" runat="server" RepeatDirection="Horizontal" TextAlign="Left" Width="955px">
            <asp:ListItem Value="North" Text="North Campus"></asp:ListItem>
            <asp:ListItem Value="Coral" Text="Coral Springs Campus"></asp:ListItem>
        </asp:DropDownList>

        
       
        <asp:Button ID="ButtonNext1" runat="server" Text="Next" />

    </asp:Panel> 

    <div class="auto-style4">

        <div class="auto-style5">
    <%-- Panel for the Service North Campus  --%>
    <asp:Panel ID="PanelServiceNorth" runat="server" Visible="false">
    
        
        <h1>* Which student service would you like to rate today?</h1> 
        <%--  <asp:ListItem>--Select--</asp:ListItem> : These two lines not needed when using the database : --%>
        <%--  <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Dropdownlist1" ErrorMessage="Please choose a service" Font-Bold="True" Font-Underline="True" ForeColor="#CC0000" InitialValue="--Select--"> </asp:RequiredFieldValidator> --%>
        <%--  Note- in order for selected list value to be saved AutoPostBack must be TRUE (checked in setup) --%>
        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="GetCat1" DataTextField="CategoryName" DataValueField="CategoryId" AutoPostBack="True">
             </asp:DropDownList>
        
        <asp:SqlDataSource ID="GetCat1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Category]"></asp:SqlDataSource>
        
         <asp:Button ID="ButtonNext2" runat="server" Text="Next" />

       <%-- <asp:ListItem>--Select--</asp:ListItem> --%>

    </asp:Panel>

    <%-- Here I am adding new code for new panels this one for Yes/NO questions--%>
    </div>
        </div>
<div class="auto-style4">
    <div class="auto-style5">
    <%-- Panel for the YesNo Questions  --%>
    <asp:Panel ID="PanelYesNo" runat="server" Visible="False">
     
        
        <h2>
            <asp:Label ID="LabelYN" runat="server" Text="YES / NO"></asp:Label>
         <br />
         </h2>   
           
        
        <asp:RequiredFieldValidator ID="RequiredFieldValidatorYN" runat="server"
            ControlToValidate="RadioButtonListYN" ErrorMessage="Please choose one." Font-Bold="True" Font-Underline="True" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                <!--Changed RadioButtonList to DropDownList *Octavio* -->
                <asp:DropDownList ID="RadioButtonListYN" runat="server" RepeatDirection="Horizontal" Width="834px" TextAlign="Left">
                <asp:ListItem>Yes</asp:ListItem>
                <asp:ListItem>No</asp:ListItem>
            </asp:DropDownList>
         
        <asp:Button ID="ButtonSubmitYN" runat="server" Text="Submit" />
        </asp:Panel>

    <%--This panel is for ratings --%>
    </div>
        </div>
<div class="auto-style4">
    <div class="auto-style5">

    <%-- Panel for the Ratings  --%>
    <asp:Panel ID="PanelRatings" runat="server" Visible="false">
     
        
        <h2>
            <asp:Label ID="LabelRat" runat="server" Text="Ratings"></asp:Label>
         <br />
         </h2>   
        
            <%-- <h1>* How satisfied were you with the service you received?</h1> --%>
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorRat" runat="server" ControlToValidate="RadioButtonListRat" ErrorMessage="Please choose one." Font-Bold="True" Font-Underline="True" ForeColor="#CC0000"></asp:RequiredFieldValidator>
            <br />
             <!--Changed RadioButtonList to DropDownList *Octavio* -->
             <asp:DropDownList ID="RadioButtonListRat" runat="server" RepeatDirection="Horizontal" RepeatLayout="Table" CssClass="RBL" TextAlign="Left" Width="603px">
                <asp:ListItem>Very satisfied</asp:ListItem>
                <asp:ListItem>Satisfied</asp:ListItem>
                <asp:ListItem>Neutral</asp:ListItem>
                <asp:ListItem>Dissatisfied</asp:ListItem>
                <asp:ListItem>Very dissatisfied</asp:ListItem>
            </asp:DropDownList>

            <br />
            <asp:Button ID="ButtonSubmitRat" runat="server" Text="Submit" />
        
    </asp:Panel>

    <%--This panel is for comments --%>
        </div>
        </div>
<div class="auto-style4">
        <div class="auto-style5">
        <%-- Panel for the Comments  --%>
        <asp:Panel ID="PanelComments" runat="server" Visible="false">
     
                    
        <h2>
            <asp:Label ID="LabelCmt" runat="server" Text="Any Additional Comment"></asp:Label>
         <br />
         </h2>   
         <br />
            &nbsp;<%-- NE_140924; <h1>Additional Comments</h1><br /> --%><asp:TextBox ID="TextBoxCmt" runat="server" Height="51px" Width="240px"></asp:TextBox>
            <asp:Button ID="ButtonSubmitCmt" runat="server" Text="Submit" />
     
    </asp:Panel>
    </div>
        </div>


<div class="auto-style4">
    <%-- Panel for Admissions  --%>
    <asp:Panel ID="PanelAdmissions" runat="server" Visible="false">
     
       <%--The following code creates the grid with just the header and questions. 
        It sets autogeneratecolumns to false to avoid populating the other columns like question IDs etc.  --%>
    <asp:GridView ID="ddlQuestions" autogeneratecolumns="True" runat="server">
        <Columns>
            <asp:BoundField DataField="QuestionText" HeaderText="Questions:" />
        </Columns>
    </asp:GridView>

        

    <%--I've commented the following code out to hide the drop down.
        I've also deleted another smaller orphaned drop down  --%>

        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Question]"></asp:SqlDataSource>
        <br />
        
        <h1>
            <asp:Label ID="QuLabel1" runat="server" Text="Label"></asp:Label>
         <br />
         </h1>   
        
       
        
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
            ControlToValidate="RadioButtonList11" ErrorMessage="Please choose one." Font-Bold="True" Font-Underline="True" ForeColor="#CC0000"></asp:RequiredFieldValidator>
          
       
            <!--Changed RadioButtonList to DropDownList *Octavio* -->
            <asp:DropDownList ID="RadioButtonList11" runat="server" RepeatDirection="Horizontal" Width="834px" TextAlign="Left">
                <asp:ListItem>Yes</asp:ListItem>
                <asp:ListItem>No</asp:ListItem>
            </asp:DropDownList>
         
                
            <%--<h1>* How satisfied were you with the service you received?</h1> --%>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="RadioButtonList3" ErrorMessage="Please choose one." Font-Bold="True" Font-Underline="True" ForeColor="#CC0000"></asp:RequiredFieldValidator>
            <br />
          
            <!--Changed RadioButtonList to DropDownList *Octavio* -->
            <asp:DropDownList ID="RadioButtonList3" runat="server" TextAlign="Left" Width="603px">
                <asp:ListItem>Very dissatisfied</asp:ListItem>
                <asp:ListItem>Dissatisfied</asp:ListItem>
                <asp:ListItem>Neutral</asp:ListItem>
                <asp:ListItem>Satisfied</asp:ListItem>
                <asp:ListItem>Very satisfied</asp:ListItem>
            </asp:DropDownList>
            <br />
            &nbsp;<%-- <h1>Additional Comments</h1><br /> --%>
            <asp:TextBox ID="TextBox4" runat="server" Height="51px" Width="240px"></asp:TextBox>
            <asp:Button ID="ButtonSubmit1" runat="server" Text="Submit" />
        


    </asp:Panel>


        </div>

        </div>

        </div>
        <%--This panel was added to give the user some options before starting the survey, continue, start over or exit --%>
        <asp:Panel ID="PanelContinue" runat="server" Visible="false" CssClass="auto-style4">
              <h2>
              <asp:Label ID="LabelDept" runat="server" Text="Department"></asp:Label>
            </h2>
            <h3> Will be evaluated. Click </h3>
              <h3>CONTINUE to start the survey&nbsp </h3><asp:Button ID="ButtonCont" runat="server" Text="Continue" />
              <h3>START OVER to restart the survey&nbsp; </h3><asp:Button ID="ButtonGoBack" runat="server" Text="Start Over" Width="104px" />
              <h3>EXIT to quit the survey&nbsp </h3><asp:Button ID="ButtonExit" runat="server" Text="Exit" Width="78px" />
              <br />
            
        </asp:Panel> 

        <%-- This panel is no longer used. It can be recalled for diagnostic purposes to stop the program before submitting the answers to the database --%>
        <asp:Panel ID="PanelDone" runat="server" Visible="false" CssClass="auto-style4">
            <h1>* You have completed all the questions. Click SUBMIT to post your answers</h1><br />
            <asp:Button ID="ButtonDone" runat="server" Text="Submit" />
        </asp:Panel>

    <%-- Exit Panel  --%>
    <asp:Panel ID="PanelExit" runat="server" Visible="false" CssClass="auto-style4">
        <h2>You have chosen to EXIT without taking the survey. <br />We hope you will return soon and give us your feedback.</h2>
         
    </asp:Panel>

    <%-- This is the last panel, used to submit the survey. --%>
    <asp:Panel ID="PanelSubmit" runat="server" Visible="false" style="margin-left: 36px">
        <h2>Thank you for participating in our brief Student Affairs survey. <br />Your survey has been successfully submitted.</h2>
         
    </asp:Panel>

</asp:Content>
    <asp:Content ID="Content4" runat="server" contentplaceholderid="HeadContent">
        <style type="text/css">
    .auto-style4 {
        padding-left: 30px;
    }
            .auto-style5 {
                padding-left: 0;
            }
            .auto-style6 {
                padding-left: -1px;
            }
        </style>
    </asp:Content>
