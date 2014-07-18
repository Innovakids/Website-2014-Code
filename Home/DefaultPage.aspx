<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="DefaultPage.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Innovakids</title>
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
                 success: function(msg) {//On Successfull service call
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
             Data = '{"Id": "' + uesrid + '"}';
             ContentType = "application/json; charset=utf-8";
             DataType = "json"; ProcessData = true;
             CallService();
         }

         function ServiceSucceeded(result) {

             if (DataType == "json") {

                 resultObject = result.GetUserResult;

               
                     document.getElementById("<%=SchoolName.ClientID %>").value = resultObject[0];
                     document.getElementById("<%=UserName.ClientID %>").value = document.getElementById("<%=EmailLogin.ClientID %>").value;
                
             
             }
         
         }

         function ServiceFailed(xhr) {
             alert(xhr.responseText);
             if (xhr.responseText) {
                 var err = xhr.responseText;
                 if (err)
                     error(err);
                 else
                     error({ Message: "Unknown server error." })
             }
             return;
         }

         $(document).ready(
         function() {
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
      <li><a href="http://www.ilearningsystem.com" target="_blank">Administrator Login</a></li>
      <li><a href="http://www.ilearningsystem.com" target="_blank">Teacher Login</a></li>
      <li><a href="http://www.mylearningsystem.com" target="_blank">Student/Parent Login</a></li>
       
    </ul>
    <!-- end pages -->
    <form action="http://www.innovakids.com">
      <input type="text" id="UserName" runat="server" readonly="readonly" tabindex="-1000" class="regularname" />
    </form>
    <div class="break"></div>
    <!-- begin logo -->
    <div class="logo">
      <h1><a href="http://www.innovakids.com">Innovakids</a></h1>
      <h2>  <input type="text" id="SchoolName" runat="server" readonly="readonly" tabindex="-1000" class="schoolname" />        
      </h2> 
       
      
         
    </div>
    <!-- end logo -->
    <!-- begin sponsor -->
    <div class="sponsor"> <a href="http://www.innovakids.com"><img src="images/171LINEART.jpg" alt="" width="560" height="84" /></a> </div>
    <!-- end sponsor -->
    <!-- begin categories -->
    <ul class="categories">
      <li><a href="http://www.innovakids.com">Grading</a></li>
      <li><a href="http://www.innovakids.com">Enrollment</a></li>
      <li><a href="http://www.innovakids.com">Lesson Plans</a></li>
      <li><a href="http://www.innovakids.com">Online Learning</a></li>
      <li><a href="http://www.innovakids.com">Online Testing</a></li>
      <li><a href="http://www.innovakids.com">Collaboration</a></li>
      <li><a href="http://www.innovakids.com">Resources</a></li>
      <li><a href="http://www.innovakids.com">Videos</a></li>
    </ul>
    <!-- end categories -->
  </div>
  <!-- END header -->
  <!-- BEGIN content -->
  <div id="content">
    <!-- begin featured -->
    <div id="featured">
      <div class="post">
        <h2><a href="http://www.innovakids.com">Full Service Educational Website</a></h2>
        <p class="details">&nbsp;</p>
        <div class="thumb"><a href="images/images5OWD8VBI.jpg"><img src="images/images5OWD8VBI.jpg" alt="" /></a></div>
        The Innovakids.com site is designed as a full service Educational Website created to assist Teachers, Parents, Administrators and Students in centralizing the learning environment. This site is designed to integrate learning with classroom management. This site is designed for K to College.
        <p>&nbsp;</p>
        <p class="readmore">&nbsp;</p>
        <p class="tags">TAGS: <a href="http://www.innovakids.com">money</a>, <a href="http://www.innovakids.com">currency</a>, <a href="http://www.innovakids.com">product</a></p>
        <div class="break"></div>
      </div>
      <div class="post">
        <h2><a href="http://www.innovakids.com">Created to Focus on how Students Learn</a></h2>
        <p class="details">&nbsp;</p>
        <div class="thumb"><img src="images/education11.jpg" alt="" /></div>
        <p>This site is created by teachers and used by teachers. It&rsquo;s a revolutionary change in focus from the use of educational technology for administrative purposes to actual teaching/Learning. This is the first truly ILP (Individual Lesson Plan) system that works with the way you teach</p>
        <p class="readmore">&nbsp;</p>
        <p class="tags">TAGS: <a href="http://www.innovakids.com">money</a>, <a href="http://www.innovakids.com">currency</a>, <a href="http://www.innovakids.com">product</a></p>
        <div class="break"></div>
      </div>
    </div>
    <!-- end featured -->
    <!-- begin recent posts -->
    <div class="recent">
      <!-- begin post -->
      <div class="o post"> <a href="http://www.innovakids.com"><img src="images/computers.jpg" alt="" /></a>
        <h2><a href="http://www.innovakids.com">Online Classroom of the Future</a></h2>
        <p> Teachers and departments enter their lesson, lesson plans, activities, web based quests, quizzes and tests into one school wide system. This becomes an online warehouse for your school's resources.<br />
        </p>
        <div class="break"></div>
      </div>
      <!-- end post -->
      <!-- begin post -->
      <div class="e post"> <a href=""><img src="images/education10.jpg" alt="" width="225" height="225" /></a>
       
        <h2><a href="">Real Learning Real Fun</a></h2>
        <p>Teachers can add their own lessons, tests, activities based on their style or import from teachers around the world.<br />
          • New teachers are right on board with lesson plans, presentation, cooperative activities, and pacing quides.<br />
          • Departmental meeting teachers are all on the same page.<br />
           • Parents get immediate feed back on their child is doing on Assignments and Tests.<br />
        • Teachers see all their lessons and quizzes group by State Standards</p>
        <div class="break"></div>
      </div>
      <!-- end post -->
      <!-- begin post -->
      <div class="o post"> <a href="http://www.innovakids.com"><img src="images/circlekids.png" alt="" /></a>
        <h2><a href="http://www.innovakids.com">Features</a></h2>
        <p><br />
          • Teachers have an Online notebook for all your lessons, lesson plans, tests, quizzes, pacing plans, gradebook, student general information, etc...<br />
          • Imagine all the teachers in your school or district sharing their lessons. Resource from Retiring teachers are no longer lost forever.<br />
          • Reward systems are built into the system, allowing students to earn school dollars or points for achieving mastery of content areas<br />
        • Control systems built in for assigning lessons to students only if they need them based on assessment tests and mastery of previous requirements.</p>
        <p class="readmore">&nbsp;</p>
        <div class="break"></div>
      </div>
      <!-- end post -->
      <!-- begin post -->
      <div class="e post"> <a href="http://www.innovakids.com"><img src="images/teacher2.jpg" alt="" /></a>
        <h2><a href="http://www.innovakids.com">Integrated Learning System</a></h2>
        <p>This is not a quiz system, this is a lesson system. Each question you create is connected to a concept page that teaches. Each concept is then connected to a standard.<br />
          • Automate your quizzes allowing students to access them from school or home. Give students a chance to retake exams until they learn the material.<br />
          • Automatically have Innovakids send you and the parents emails each time their child takes a quiz.<br />
          • Automatically send progress reports for an entire class to parents email with a single button click.<br />
        • Place class announcements online.</p>
        <div class="break"></div>
      </div>
      <!-- end post -->
    </div>
    <!-- end recent posts -->
  </div>
  <!-- END content -->
  <!-- BEGIN sidebar -->
  <div id="sidebar">
    <!-- begin sponsors -->
    <div class="box">
      <p class="sponsors"> <a href="http://www.innovakids.com"><img src="images/education5.jpg" alt="" width="125" height="127" /></a> <a href="http://www.innovakids.com"><img src="images/education6.jpg" alt="" width="127" height="128" /></a> </p>
         Email Login:<br />
          <input type="text" id="EmailLogin" runat="server"   /><br />
           Password:<br />
           <input type="password" id="Password"   runat="server"   /><br />

         <input id="LoginButton" type="button" value="Login" onclick="WCFJSON();" style="width:100px;height:25px;" />
     
    </div>
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
      <div class="video"> <img src="images/education4.jpg" alt="" width="275" height="226" /> </div>
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
  <p class="l">Copyright &copy; 2009 - <a href="http://www.innovakids.com">Website Name</a> &middot; All Rights Reserved | Template by: <a href="http://www.wpthemedesigner.com/">WordPress Designer</a> | Get More <a href="http://www.innovakids.com">Free CSS Templates</a> </p>
</div>
<!-- END footer -->
<div align=center>This template  downloaded form <a href='http://www.innovakids.com'>free website templates</a></div>

</div>
</body>
 

</html>
