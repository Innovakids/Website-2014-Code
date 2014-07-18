<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="StudentLogin.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Student Login Page</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" type="text/css" href="style.css" />
<!--[if lte IE 6]><link rel="stylesheet" type="text/css" href="ie.css" /><![endif]-->
<script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="js/jquery.cycle.all.min.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script src="js/jquery.js" type="text/javascript"></script>
    
     <script type="text/javascript">

         var Type;
         var Url;
         var Data;
         var ContentType;
         var DataType;
         var ProcessData;
         //Generic function to call AXMX/WCF  Service        
         function CallService() {
             $.ajax({
                 type: Type, //GET or POST or PUT or DELETE verb
                 url: Url, // Location of the service
                 data: Data, //Data sent to server
                 contentType: ContentType, // content type sent to server
                 dataType: DataType, //Expected data format from server
                 processdata: ProcessData, //True or False
                 success: function (msg) {//On Successfull service call
                     ServiceSucceeded(msg);
                 },
                 error: ServiceFailed// When Service call fails
             });
         }

         function ServiceFailed(result) {
             alert('Service call failed: ' + result.status + '' + result.statusText);
             Type = null; Url = null; Data = null; ContentType = null; DataType = null; ProcessData = null;
         }

         function WCFJSON() {
             var uesrid = "1";
             Type = "POST";
             Url = "Service.svc/GetUser";
             Data = '{"Id": "' + uesrid + '"}';
             ContentType = "application/json; charset=utf-8";
             DataType = "json"; ProcessData = true;
             CallService();
         }

         function GetLogin() {
             var uesrid = "2";
             Type = "POST";
             Url = "Service.svc/GetLogin";
             Data = '{"Id": "' + document.getElementById("<%=EmailLogin.ClientID %>").value + '","Password": "' + document.getElementById("<%=Password.ClientID %>").value + '"}';
             ContentType = "application/json; charset=utf-8";
             DataType = "json"; ProcessData = true;
             CallService();
         }

         function ServiceSucceeded(result) {

             if (DataType == "json") {

                 resultObject = result.GetLoginResult;

                 var array = resultObject.split(',')


                 document.getElementById("<%=DistrictName.ClientID %>").value = array[0];

                 document.getElementById("<%=SchoolName.ClientID %>").value = array[1];

                 document.getElementById("<%=UserName.ClientID %>").value = array[2];


             }

         }

         function ServiceFailed(xhr) {
             alert('Login not Found.  Please Try again!');
             if (xhr.responseText) {
                 var err = xhr.responseText;
                 if (err)
                     error("Login not Valid.  Try Again");
                 else
                     error({ Message: "Unknown server error." })
             }
             return;
         }

         $(document).ready(
         function () {
             //WCFJSON();
         }
         );
         
    </script>
</head>


<body>
   <div id="wrapper">
  <!-- BEGIN header -->
  <div id="header">
    <!-- begin pages -->
    <ul class="pages">
      <li><a href="index.html">Home</a></li>
      <li><a href="about.html">About Us</a></li>
      <li><a href="AdminLogin.aspx" >Teacher Login</a></li>
      <li><a href="ParentLogin.aspx" >Parent Login</a></li>
      <li><a href="StudentLogin.aspx" >Student Login</a></li>
       
    </ul>
    <!-- end pages -->
   <br />
      User: <input type="text" id="UserName" runat="server" readonly="readonly" tabindex="-1000" width="120px" />
   
    <div class="break"></div>
    <!-- begin logo -->
    <div class="logo">
      <h1>  <input type="text"  id="DistrictName" runat="server" readonly="readonly" tabindex="-1000"  value="Welcome" class="schoolname" /> </h1>
      <h2>  <input type="text"  id="SchoolName" runat="server" readonly="readonly" tabindex="-1000"  value="Innovakids - Online School" class="schoolname" style="width:350px;"  />  </h2>   
   
       
      
         
    </div>
    <!-- end logo -->
    <!-- begin sponsor -->
    <div class="sponsor"> <a href="http://www.innovakids.com"><img src="images/171LINEART.jpg" alt="Online Learning Software" width="560" height="84" /></a> </div>
    <!-- end sponsor -->
    <!-- begin categories -->
   
    <!-- end categories -->
  </div>
  <!-- END header -->
  <!-- BEGIN content -->
  <div id="content">
    <!-- begin featured -->
    <div id="featured">
      <div class="box">
      <p class="sponsors"> <a href="http://www.innovakids.com"><img src="images/education5.jpg" alt="Online Learning Software" width="125" height="127" />
      </a>  </p>
         Student Login (Email) :<br />
          <input type="text" id="EmailLogin" runat="server"   style="width:250px;" /><br />
           Password:<br />
           <input type="password" id="Password"   runat="server"   /><br />

         <input id="LoginButton" type="button" value="Login" onclick="GetLogin();" style="width:100px;height:25px;" />
     
    </div>
      
    </div>
    <!-- end featured -->
    <!-- begin recent posts -->
    <div class="recent">
      <!-- begin post -->
     
      <!-- end post -->
      <!-- begin post -->
     
      <!-- end post -->
      <!-- begin post -->
     
      <!-- end post -->
      <!-- begin post -->
      
      <!-- end post -->
    </div>
    <!-- end recent posts -->
  </div>
  <!-- END content -->
  <!-- BEGIN sidebar -->
  <div id="sidebar">
    <!-- begin sponsors -->
   
    <!-- end sponsors -->
    <!-- begin popular posts -->
    <div class="box">
      <h2>Innovakids News</h2>
      <ul class="popular">
        <li> <a href="http://www.innovakids.com/whatsnew.html">Whats New</a>
          <p>Latest Features.</p>
        </li>
       <li> <a href="http://www.innovakids.com">Contact Innovakids</a>
          <p>For Questions Call the corporate office at 760.524.2473 or Support at 760.282.4421 Email at support@innovakids.com</p>
        </li>
        <li> <a href="http://www.innovakids.com">Using iLearningSystem.com </a>
          <p>Using the Ilearningsystem.com Administration Site and Parent Portal.</p>
        </li>
      </ul>
    </div>
    <!-- end popular posts -->
    <!-- begin flickr images -->
    <div class="box">
      <h2>Innovakids Projects</h2>
      <ul class="popular">
        <li> <a href="http://www.innovakids.com">Virtual Field Trips</a>
          <p>Use the Computer Lab or Smartboard to Visit Historic and Educational Site around the World. </p>
        </li>
        <li> <a href="http://www.innovakids.com">Wiki Learning Database Project</a>
          <p>The Innovkids Learning Database.  We are building a database of Lessons, Quizes, Lesson Plans, etc... Available to teachers around the world to search and use throughout classrooms throughout the world.</p>
        </li>
         <li> <a href="http://www.innovakids.com">Innovakids Web Quests</a>
          <p>The idea of an Innovakids Web Quest is to build lessons with an online journey in mind. Each page of a lesson concludes with a choice that leads to another adventure.  This lessons becomes an interactive book that based on learning allows the students to make choices to attempt to find the end. </p>
        </li>
       
      </ul>
    <!-- end flickr images -->
    <!-- begin featured video -->
    <div class="box">
      <h2>Features</h2>
      <div class="video"> <img src="images/education4.jpg" alt="Online Learning Software" width="275" height="226" /> </div>
    </div>
    <!-- end featured video -->
    <!-- begin tag cloud -->
    <div class="box">
      <h2> collaboration on the Cloud</h2>
      <div class="tags"> <a href="http://www.innovakids.com">Teacher Collaboration</a>
          <p>Innovakids is creating a site to build collaboration groups to build and share lessons and resources.  New teachers are sometimes scrambling to find lesson plans and build resource collections.  Innovakids allows teachers to quickly find and share this tremendous treasure of creativity for todays teachers and future generations.</p>
    
    </div>
    </div>
    <!-- end tag cloud -->
    <!-- BEGIN left -->
    <div class="l">
      <!-- begin categories -->
      <div class="box">
        <h2>Categories</h2>
        <ul>
          <li><a href="http://www.innovakids.com">Advertising</a></li>
          <li><a href="http://www.innovakids.com">Fashion</a></li>
          <li><a href="http://www.innovakids.com">Gadgets</a></li>
          <li><a href="http://www.innovakids.com">Lifestyle</a></li>
          <li><a href="http://www.innovakids.com">Networking</a></li>
          <li><a href="http://www.innovakids.com">News</a></li>
          <li><a href="http://www.innovakids.com">Sports</a></li>
        </ul>
      </div>
      <!-- end categories -->
      <!-- begin meta -->
      <div class="box">
        <h2>Meta</h2>
        <ul>
          <li><a href="http://www.innovakids.com">Log in</a></li>
          <li><a href="http://www.innovakids.com">Valid XHTML</a></li>
        </ul>
      </div>
      <!-- end meta -->
    </div>
    <!-- END left -->
    <!-- BEGIN right -->
    <div class="r">
      <!-- begin archives -->
      <div class="box">
        <h2>Archives</h2>
        <ul>
          <li><a href="http://www.innovakids.com">June 2009</a></li>
          <li><a href="http://www.innovakids.com">May 2009</a></li>
          <li><a href="http://www.innovakids.com">April 2009</a></li>
          <li><a href="http://www.innovakids.com">March 2009</a></li>
          <li><a href="http://www.innovakids.com">February 2009</a></li>
        </ul>
      </div>
      <!-- end archives -->
      <!-- begin blogroll -->
      <div class="box">
        <h2>Blogroll</h2>
        <ul>
          <li><a href="http://www.innovakids.com">Documentation</a></li>
          <li><a href="http://www.innovakids.com">Suggest Ideas</a></li>
          <li><a href="http://www.innovakids.com">Support Forum</a></li>
        </ul>
      </div>
      <!-- end archives -->
    </div>
    <!-- END right -->
  </div>
  <!-- END sidebar -->
</div>
<!-- END wrapper -->
<!-- BEGIN footer -->
<div id="footer">
  <p class="l">Copyright &copy; 2009 Ver 1.1 - <a href="http://www.innovakids.com">Website Name</a> &middot; All Rights Reserved | Template by: <a href="http://www.wpthemedesigner.com/">WordPress Designer</a> | Get More <a href="http://www.innovakids.com">Free CSS Templates</a> </p>
</div>
<!-- END footer -->
<div align=center>This template  downloaded form <a href='http://www.innovakids.com'>free website templates</a></div>

</div>
</body>
 

</html>


