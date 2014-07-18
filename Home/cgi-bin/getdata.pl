#!c:/perl/bin


use Win32::ODBC;
use Mail::Sendmail;
use Time::localtime;
use perlchartdir;

print "Content-type: text/html\n\n";

 my($globalcounter) = 0;
 my($buffer);
 my(@pairs);
 my($displayonly) = "YES";
 my(@afield);
 my(@afieldvalues);
 my($sstate) = "NONE";
 my($pair);
 my($spassword) = "";
 my($sselectcategory) = "";
 my($steacher)= "NO";
 my($steacherlogin) = "NO";
 my($slogin) = "NO";
 my($semailcomment) = "";
 my($sreplaceteacher) = "";
 my($sselectdepartment) = "";
 my($sadmin)= "NO";
 my($sval1);
 my($sorgclassno) = "";
 my($sclasslevel) = "";
 my($ssort) = "NONE";
 my($snextpage);
 my($sinsertstudentno) = "";
 my($sfieldfilter) = "";
 my($sstandardsearch) = "";
 my($sblogid) = "";
 my($sdisciplineno) = "";
 my($sstandard) = "";
 my($saddstudentsbyclass) = "";
  my($sstudentuserid) = "";
   my($steacheruserid) = "";
 my($sconceptkey) = "";
 my($sanswerlist) = "";
  my($ssearch) = "DEFAULT";
 my($sclassno);
 my($questiontype) = "RADIO";
 my($sgrade) = "ALL";
 my($speriod) = "";
  my($sclassyears) = "2011-2012";
   my($ssemester) = "FALL";
 my($siscorrect) = "";
  my($sorderno) = 0;
    my($sconceptno) = 0;
 my($sstudentno);
 my($sactualanswer) = "";
 my($slessonno);
 my($steacherno) = "";
  my($smisorderno);
  my($semailname) = "";
  my($semailaddress) = "";
  my($schoolno) = "0";
  my($sdatastring);
  my($scopylessonto) = "";
  my($sactive) = "Y";
  my($swherekey) = "";
  my($squestionno) = "";
  my($skey) = "";
  my($sbackupno) = "";
  my($stable) = "";
  my($sfield) = "";
  my($sfieldvalue) = "";
  my($sanswer) = "";
  my($sdepartment) = "";
  my($swhere) = "";
  my($sanswertype) = "HIDDEN";
  my($string);
  my($sprimekey) = "";
  my($array);
  my($skeyword) = "";
  my($temp);
 read(STDIN,$buffer,$ENV{'CONTENT_LENGTH'});
 @pairs = split(/&/, $buffer);
 $sval1 = "Programmer ";
 $string = " Perl $sval1";
 my($number) = 0;
my($y) = 0;
my($x) = 0;
my($x2) = 0;
my($connection);
my($connection2);
my($connection3);
my($connection4);
 my $DSN = "DSN=DSN_innovaki_vivaldi;UID=DB_6956_innovakids_user;PWD=foll2164;";

# $connection = new Win32::ODBC($DSN);
if (!($connection = new Win32::ODBC($DSN))){
    print "Error connecting to $DSN\n";
    print "Error: " . Win32::ODBC::Error() . "\n";
    exit;
}

if (!($connection2 = new Win32::ODBC($DSN))){
    print "Error connecting to $DSN\n";
    print "Error: " . Win32::ODBC::Error() . "\n";
    exit;
}
if (!($connection3 = new Win32::ODBC($DSN))){
    print "Error connecting to $DSN\n";
    print "Error: " . Win32::ODBC::Error() . "\n";
    exit;
}
if (!($connection4 = new Win32::ODBC($DSN))){
    print "Error connecting to $DSN\n";
    print "Error: " . Win32::ODBC::Error() . "\n";
    exit;
}

 foreach $pair (@pairs)
 {
 #print( "(760) 246-4735");
 #print "$pair<BR>\n";
   $temp = "$pair";

   push(@array,  $temp);
     if( substr($pair,0,8) eq "CLASSNO=" )
    {
        $sclassno = substr($pair,8,15);
         $sorgclassno = substr($pair,8,15);
         #print("Classno: $sorgclassno");
    }




   if( substr($pair,0,5) eq "TABLE" )
    {
        $stable = substr($pair,6,50);
        #print("$stable");
    }


      if( substr($pair,0,14) eq "STANDARDSEARCH" )
    {
        $sstandardsearch = substr($pair,15,50);
        #print("$stable");
    }
    
     if( substr($pair,0,14) eq "SELECTCATEGORY" )
    {
        $ssearchcategory = substr($pair,15,70);
        while( index($ssearchcategory,"+") > 0)
    {
      if( index($ssearchcategory,"+") > 0 )
      {
        $ssearchcategory = substr($ssearchcategory,0,index($ssearchcategory,"+"))." ". substr($ssearchcategory,index($ssearchcategory,"+")+1,70);
       # sinput = sinput.Trim();

      }


    }


        #print("$stable");
    }

    if( substr($pair,0,18) eq "ADDSTUDENTSBYCLASS" )
    {
        $addstudentsbyclass = substr($pair,19,20);
        #print("$stable");
    }
    if( substr($pair,0,11) eq "DISPLAYONLY" )
    {
         $displayonly = "NO";
    }

    if( substr($pair,0,8) eq "REPLACE=" )
    {
         $sreplaceteacher = substr($pair,8,15);
    }


    if( substr($pair,0,16) eq "SELECTDEPARTMENT" )
    {
        $sselectdepartment = substr($pair,17,25);
        #print("$stable");
    }

    
      if( substr($pair,0,10) eq "CLASSLEVEL" )
    {
        $sclasslevel = substr($pair,11,15);
        #print("$stable");
    }
    
    
    
     if( substr($pair,0,9) eq "TEACHERNO" )
    {
        $steacherno = substr($pair,10,50);
        my $sqlcommand = "select SCHOOLNO from STUDENT WHERE STUDENTNO = '$steacherno'";

       #print("$sqlcommand");
       $connection->Sql("$sqlcommand");
       $connection->FetchRow();
       $schoolno = $connection->Data("SCHOOLNO");

       #print($schoolno);
     
    }
    
     if( substr($pair,0,6) eq "WHERE=" )
    {
        $swhere = substr($pair,6,50);
        
    }
    if( substr($pair,0,16) eq "INSERTSTUDENTNO=" )
    {
        $sinsertstudentno = substr($pair,16,12);

    }
    
     if( substr($pair,0,6) eq "GRADE=" )
    {
        $sgrade = substr($pair,6,3);
        
    }
      if( substr($pair,0,6) eq "FIELD=" )
    {
        $sfieldfilter = substr($pair,6,7);

    }
     if( substr($pair,0,7) eq "SEARCH=" )
    {
        $ssearch = substr($pair,7,100);

    }# FIX THIS
     if( substr($pair,0,16) eq "CLASS.CLASSYEARS" )
    {
        $sclassyears = substr($pair,17,100);

    }
    if( substr($pair,0,14) eq "CLASS.SEMESTER" )
    {
        $ssemester = substr($pair,15,100);

    }
    
     if( substr($pair,0,11) eq "DEPARTMENT=" )
    {
        $sdepartment = substr($pair,11,60);
        $sselectdepartment = substr($pair,11,60);
    }

    
     if( substr($pair,0,13) eq "COPYLESSONTO=" )
    {
        $scopylessonto = substr($pair,13,20);

    }
    
     if( substr($pair,0,13) eq "DISCIPLINENO=" )
    {
        $sdisciplineno = substr($pair,13,3);

    }
    
     if( substr($pair,0,9) eq "LESSONNO=" )
    {
        $slessonno = substr($pair,9,15);

    }
    

    
      if( substr($pair,0,11) eq "QUESTIONNO=" )
    {
        $squestionno = substr($pair,11,15);

    }
    
    if( substr($pair,0,13) eq "STUDENTUSERID" )
   {
      $sstudentuserid = substr($pair,14,100);
      # print("Student No - $sstudentno<P>");
   }
    if( substr($pair,0,13) eq "TEACHERUSERID" )
   {
      $steacheruserid = substr($pair,14,100);
      # print("Student No - $sstudentno<P>");
   }
    
   if( substr($pair,0,10) eq "RUNREPORT=" )
    {
     $returndata = substr($pair,10,25);
     my($output) = "rwlite.exe $returndata -q -np -b";


     print("Running Report: $returndata");

     $returndata = `$output`;
  }
  if( substr($pair,0,9) eq "STUDENTNO" )
   {
      $skey = substr($pair,10,100);
      $sprimekey = substr($pair,10,100);
      $sstudentno = substr($pair,10,100);

      #print("Key - $skey<P>");
   }
   if( substr($pair,0,8) eq "PRIMEKEY" )
   {
      $skey = substr($pair,9,100);
      $sprimekey = substr($pair,9,100);
      $sstudentno = substr($pair,9,100);

      #print("Primekey: $sprimekey");
   }

      if( substr($pair,0,10) eq "CONCEPTNO=" )
    {
         $sconceptno = substr($pair,10,18);

    }
      if( substr($pair,0,11) eq "CONCEPTKEY=" )
    {
         $sconceptkey = substr($pair,11,18);

    }
    
     if( substr($pair,0,11) eq "ANSWERLIST=" )
    {
        $sanswerlist = substr($pair,11,200);
        $sanswerlist =~ tr/[a-z]/[A-Z]/;
        #print("Answerlist= $sanswerlist");
    }
    
     
      if( substr($pair,0,7) eq "BLOGID=" )
    {
        $sblogid = substr($pair,7,8);
        
    }
     
     if( substr($pair,0,9) eq "STANDARD=" )
    {
        $sstandard = substr($pair,9,25);
        
    }
    if( substr($pair,0,7) eq "ACTIVE=" )
    {
        $sactive = substr($pair,7,1);
        
    }
    
     if( substr($pair,0,8) eq "TEACHER=" )
    {
       $steacher = substr($pair,8,20);
       
        
    }
     if( substr($pair,0,9) eq "PERIODNO=" )
    {
       $speriod = substr($pair,9,10);


    }
     if( substr($pair,0,12) eq "TEACHERLOGIN" )
    {
       $steacherlogin = substr($pair,13,3);
       
        
    }
     if( substr($pair,0,5) eq "ADMIN" )
    {
       $sadmin = substr($pair,6,3);
        
    }
     if( substr($pair,0,5) eq "LOGIN" )
    {
      $slogin = substr($pair,6,3);
        
    }
    if( substr($pair,0,12) eq "STUDENTLOGIN" )
    {
      $slogin = substr($pair,13,3);
        $wherecommand = "STUDENTUSERID = $sstudentuserid AND SCHOOLNO = $schoolno AND PASSWORD = $spassword";

        my $sqlcommand = "SELECT STUDENT,STUDENTNO,SCHOOL,SCHOOLNO,CITY,STATE,GRADE,TEACHER,ADMIN from STUDENTSCHOOL WHERE $wherecommand";


       $connection->Sql("$sqlcommand");
       $connection->FetchRow();
       ($studentname,$studentid,$school,$schoolno,$city,$state,$grade,$teacher, $admin) = $connection->Data("STUDENT","STUDENTNO","SCHOOL","SCHOOLNO","CITY","STATE","GRADE","TEACHER","ADMIN");

        $sstudentno = $studentid;
        $sprimekey = $studentid;

        #print($sqlcommand);
      
      

    }
    
    
      if( substr($pair,0,8) eq "SCHOOLNO" )
    {
        $schoolno = substr($pair,9,10);
        
    }

if( substr($pair,0,6) eq "STATE=" )
    {
        $sstate = substr($pair,6,70);

        if( $sstate eq "" )
        {
          my($sqlcommand) = "SELECT STATE FROM SCHOOL WHERE SCHOOLNO = '$schoolno'";

          #print("$sqlcommand");

          $connection->Sql("$sqlcommand");

          if($connection->FetchRow() )
          {
            #print("found record...");
            $sstate = $connection->Data("STATE");
          }
          else
          {
            $sstate = "SCHOOL MISSING STATE";
          
          }



        }

        #print("$stable");
    }




    if( substr($pair,0,13) eq "GETQUESTIONNO" )
    {

      $sqlcommand3 = "SELECT MAX(CONCEPTKEY) AS MAXCONCEPT FROM CONCEPT WHERE LESSONNO = $slessonno";

       $connection2->Sql("$sqlcommand3");
       $connection2->FetchRow();
       $sconceptkey = $connection2->Data("MAXCONCEPT");
       $squestionno = $sconceptkey;


     }
      if( substr($pair,0,10) eq "EMAIL.NAME" )
      {

           $semailname =  substr($pair,11,120);
             my $char = '+';
             if( index($semailname,$char) gt -1 )
             {

              while( index($semailname,$char) > -1 )
              {

                if( index($semailname,$char) > -1 )
                {
                  $semailname = substr($semailname,0,index($semailname,$char))." ". substr($semailname,index($semailname,$char)+1,200);
                }
              }
             }
      }
      if( substr($pair,0,13) eq "EMAIL.COMMENT" )
      {

           $semailcomment =  substr($pair,14,2000);

      }
      if( substr($pair,0,13) eq "EMAIL.ADDRESS" )
      {

             $semailaddress =  substr($pair,14,120);


      }

      if( substr($pair,0,6) eq "SIGNUP" && substr($pair,7,4) eq "TRUE" )
      {

       if( substr($semailname,0,3) eq "SQL" )
       {

          print("$semailcomment");

          $connection2->Sql("$semailcomment");
          print("SQL Processed");
          #$connection2->FetchRow();
       }
       else
       {


           $sqlcommand = "INSERT INTO SCHOOL (SCHOOL, SCHOOLTYPE, TEACHERNO) VALUES ('$semailname','NEW SCHOOL',816352)";
       #print("$sqlcommand");
       #print("$sqlcommand");
       $connection->Sql("$sqlcommand");
       

       $sqlcommand = "SELECT MAX(SCHOOLNO) SCHOOLNO FROM SCHOOL WHERE SCHOOLTYPE = 'NEW SCHOOL'";
       #print("$sqlcommand");
       #print("$sqlcommand");
       $connection->Sql("$sqlcommand");


       my($returnvalue) = "";
      $connection->FetchRow();

       my($snewschoolno) = $connection->Data("SCHOOLNO");


         $sqlcommand = "INSERT INTO STUDENT (TEACHER, SCHOOLNO, STUDENT, PASSWORD, EMAIL, STUDENTUSERID) VALUES ('1','$snewschoolno','$semailname','$snewschoolno','$semailaddress'  ,'$snewschoolno' )";
       #print("$sqlcommand");
       #print("$sqlcommand");
       $connection->Sql("$sqlcommand");

         my($sinnovakids) = "@innovakids.com";

         my($semailtext) = "Name: $semailname  Comment: $semailcomment  Email: $semailaddress";

         #rint("Thank yo$semailtext<br>");

         %mail = ( To      => 'sales@innovakids.com ; rick2164@msn.com; debbie@innovakids.com; mary@innovakids.com; rick@innovakids.com',
            From    => 'rick@innovakids.com',
            Subject    => 'Signup Application',
            Message => $semailtext
           );
          sendmail(%mail) or die $Mail::Sendmail::error;
          print "OK. Your Welcome Email Has been sent. Log says:\n", $Mail::Sendmail::log;
          print "\nYour Comment: $semailtext";
          
           my($semailtext) = "Dear Teacher\n\nWelcome to the Innovakids Educational Classroom/School Management System.  You have been given a free 3 month membership to Innovakids.com for all your classes.  After the 3 month period there is a 19.95 yearly fee to continue with the service.  Your coupon code is AB385723-$snewschoolno. \n\nPlease log into Innovakids.com using your new user id $snewschoolno with a password of $snewschoolno.\n\n \nYour School code or Classroom ID is $snewschoolno. Use the Teacher Login to begin.\n\nYou will also need to add a class first then add your students and lessons.  To import lessons, select the Import Lessons button and search for lessons that match your concept or standard. If you have any questions please feel free to write our support office at 'support\@innovakids.com'  or 'sales\@innovakids.com' . Phone support is also available after you signup a support rep will personnally email you with contact information.\n\nThank you for your interest in Innovakids. \n\nDebbie Gray\nTeacher Training Manager\n\nInnovakids.com";


         #rint("Thank yo$semailtext<br>");

         %mail = ( To      => $semailaddress,
            From    => 'rick@innovakids.com',
            cc    => 'sales@innovakids.com',
            Subject    => 'Welcome to Innovakids',
            Message => $semailtext
           );
          sendmail(%mail) or die $Mail::Sendmail::error;
          
          
       }
     }

       if( substr($pair,0,13) eq "SENDTOTEACHER" && substr($pair,13,4) eq "TRUE" )
      {


         my($semailtext) = "'Name: $semailname \n Comment: $semailcomment \n Email: $semailaddress'";

         #rint("Thank yo$semailtext<br>");

         $sqlcommand3 = "INSERT INTO BLOG (TEACHERNO, COMMENTS) VALUES (999,'$semailtext')";
         $connection2->Sql("$sqlcommand3");

         %mail = ( To      => 'sales@innovakids.com ; rick@innovakids.com; debbie@innovakids.com',
            From    => 'rick@innovakids.com',
            Subject    => 'Send to Teacher Message $steacherno',
            Message => $semailtext );
          sendmail(%mail) or die $Mail::Sendmail::error;
          print "OK. Log says:\n", $Mail::Sendmail::log;
          print "\nYour Message $semailtext";

     }
     
      if( substr($pair,0,5) eq "EMAIL" && substr($pair,6,4) eq "TEST" )
      {

       $sqlcommand3 = "SELECT EMAIL, STUDENT FROM STUDENT WHERE STUDENTNO = $steacherno";

       $connection2->Sql("$sqlcommand3");
       $connection2->FetchRow();
       my($semail) = $connection2->Data("EMAIL");
       #my($semailname) = "This is a very short message for ".$connection2->Data("STUDENT");
       my($semailname) = "Teacher Test Email";
       #my($smessage) = "( To => \'$semail\', From => \'rick@innovakids.com\',  Subject    => \'Test Email From Innovakids\', Message => \'This is a very short message for $semailname\'");
       #print("$smessage");

      if( $semail ne "" )
      {
            %mail = ( To      => $semail,
              From    => 'rick@innovakids.com',
              Subject    => 'Test Email for Teacher',
              Message => $semailname
           );

        sendmail(%mail) or die $Mail::Sendmail::error;
        print "OK. Log says: %mail \n", $Mail::Sendmail::log;
      }
      else
      {
        print("Error: No Email address is entered for this teacher<br>");
      }
     }


     #start
     

     #end




      if( substr($pair,0,24) eq "STOPALLSTUDENTPROGRESSREPORT" )
      {

       my($sqlcommand) = "SELECT PARENT1,ADDRESS1,ADDRESS2,CITY,STATE,ZIP,STUDENTNO,LETTERGRADE, STUDENT, CLASS , PERIOD, [PERCENT], CLASSNO FROM CLASSLISTING WHERE  STUDENTNO = '$sstudentno' ORDER BY PERIOD";

       $connection->Sql("$sqlcommand");

       my($pr_studentno) = "";
       my($pr_student) = "";
       my($pr_class) = "";

       my($pr_period) = "";
       my($pr_percent) = "";
       my($pr_parent1) = "";
       my($pr_address1) = "";
       my($pr_address2) = "";
       my($pr_city) = "";
       my($pr_state) = "";
       my($pr_zip) = "";

       my($nclass) = 0;



       while($connection->FetchRow() )
       {
          #print("found record...");
          $pr_studentno = $connection->Data("STUDENTNO");
          $pr_student = $connection->Data("STUDENT");
          $pr_classgrade = $connection->Data("LETTERGRADE");
           $pr_class = $connection->Data("CLASS");
          $pr_period = $connection->Data("PERIOD");
          $pr_percent = $connection->Data("PERCENT");
          $pr_parent1 = $connection->Data("PARENT1");
           $sclassno = $connection->Data("CLASSNO");
           $pr_address1 = $connection->Data("ADDRESS1");
          $pr_address2 = $connection->Data("ADDRESS2");
          $pr_city = $connection->Data("CITY");
          $pr_state = $connection->Data("STATE");
          $pr_zip = $connection->Data("ZIP");

          if( $nclass eq 0 )
          {
           my($tm) = localtime;
         printf("Report Date: %04d-%02d-%02d <br>", $tm->year+1900,($tm->mon)+1, $tm->mday);

          print(" &nbsp; &nbsp; <h1 class=page_title_lev_1 >School Progress Report for $pr_student<br>");
          print(" &nbsp; &nbsp; All Current Classes</h1>");


          if( $pr_parent1 ne "" )
          {
             print( "&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;  $pr_parent1 <br>" );
          }
          else
          {
             print( "&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;  Parents of  $pr_student <br>" );

          }


          print( "&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;  $pr_address1 <br>" );

          if( $pr_address2 ne "" )
          {
             print( "&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp; $pr_address2 <br>" );
          }


          if( $pr_city ne "" )
          {
            print( " &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp; $pr_city, $pr_state  $pr_zip <br><br><br>" );
          }
           else
          {
             print("<br><br><br><br>");
          }

          print(" &nbsp;&nbsp; Student Number: $pr_studentno  Student Name:  $pr_student</span><br>");
          

          $nclass = 1;
          }
          else
          {
           print("**********************************************************************************<br>");
          }

          print(" &nbsp;&nbsp; Period: $pr_period &nbsp;&nbsp;Class: $pr_class ($sclassno)  -  Current Grade: $pr_classgrade ($pr_percent %)<br>");



          my($sqlcommand2) = "SELECT * FROM PROGRESSREPORT WHERE CLASSNO = '$sclassno' AND STUDENTNO = $pr_studentno";
          #fixit
          #print("$sqlcommand");
          $connection2->Sql("$sqlcommand2");

          my($pr_lesson) = "";
          my($pr_lessonno) = "";
          my($pr_lettergrade) = "";
          my($pr_percent) = "";
          my($pr_attempts) = "";
          my($pr_datetime) = "";
          my($pr_chapterno) = "";
          my($pr_objective) = "";



           print("&nbsp;&nbsp;---------------------------------------------------------------------------<br>");
           print("Assignments and Homework<br><br>");
          while($connection2->FetchRow() )
          {
             $pr_lesson  = $connection2->Data("LESSON");
             $pr_lessonno  = $connection2->Data("LESSONNO");
             $pr_lettergrade = $connection2->Data("GRADE");
             $pr_percent  = $connection2->Data("LESSONPERCENT");
             $pr_attempts = $connection2->Data("ATTEMPTS");
             $pr_datetime = $connection2->Data("DATETIME");
             $pr_chapterno = $connection2->Data("CHAPTERNO");
             $pr_objective = $connection2->Data("OBJECTIVE");

             $pr_datetime = substr($pr_datetime,0,10);

             print( " &nbsp;&nbsp; $pr_lettergrade ($pr_percent %) $pr_lesson ");
             print( " &nbsp;&nbsp; $pr_objective ($pr_lessonno)<br>");
             #print( " &nbsp;&nbsp; ----- Chapter: $pr_chapterno  Date Completed: $pr_datetime  Attempts: $pr_attempts <br>");



          }

            my($sqlcommand2) = "SELECT * FROM DISCIPLINE WHERE CLASSNO = '$sclassno' AND STUDENTNO = $pr_studentno AND lettersent = 1 AND ACTIVE=1";
          #fixit
          #print("$sqlcommand");
          $connection2->Sql("$sqlcommand2");

          my($pr_offencedate) = "";
          my($pr_offencedesc) = "";
          my($pr_offencememo) = "";
          my($pr_period) = "";
          my($pr_consequences) = "";
          my($pr_detentioninfo) = "";


           print("&nbsp;&nbsp;---------------------------------------------------------------------------<br>");
           print("Referrals and Discipline Information<br><br>");
          while($connection2->FetchRow() )
          {
             $pr_offencedate  = $connection2->Data("OFFENCEDATE");
             $pr_offencedesc  = $connection2->Data("OFFENCEDESC");
             $pr_disciplineno  = $connection2->Data("DISCIPLINENO");
             $pr_offencememo = $connection2->Data("OFFENCEMEMO");
             $pr_period  = $connection2->Data("PERIOD");
             $pr_consequences = $connection2->Data("CONCEQUENCES");
             $pr_detentioninfo = $connection2->Data("DETENTIONINTO");

             $pr_offencedate = substr($pr_offencedate,0,10);


             print( " &nbsp;&nbsp; ($pr_disciplineno) $pr_offencedate Period: $pr_period ($pr_offencedesc) $pr_offencememo<BR> ");
             print( " &nbsp;&nbsp; ---- $pr_consequences ($pr_detentioninfo)<br>");
             #print( " &nbsp;&nbsp; ----- Chapter: $pr_chapterno  Date Completed: $pr_datetime  Attempts: $pr_attempts <br>");



          }

             my($sqlcommand2) = "SELECT * FROM STUDENTSTANDARDS WHERE CLASSNO = '$sclassno' AND STUDENTNO = $pr_studentno";
          #fixit
          #print("$sqlcommand");
          $connection2->Sql("$sqlcommand2");

          my($pr_standard) = "";
          my($pr_description) = "";
          my($pr_grade) = "";
          my($pr_subject) = "";



           print("&nbsp;&nbsp;---------------------------------------------------------------------------<br>");
           print("Standards that need focus<br><br>");
          while($connection2->FetchRow() )
          {
             $pr_standard  = $connection2->Data("STANDARD");
             $pr_description  = $connection2->Data("DESCRIPTION");
             $pr_grade  = $connection2->Data("GRADE");
             $pr_subject = $connection2->Data("SUBJECT");



             print( "  Grade: $pr_grade Subject: $pr_subject ($pr_standard) $pr_description <BR> ");
             #print( " &nbsp;&nbsp; ---- $pr_consequences ($pr_detentioninfo)<br>");
             #print( " &nbsp;&nbsp; ----- Chapter: $pr_chapterno  Date Completed: $pr_datetime  Attempts: $pr_attempts <br>");



          }



          # end of form next page
          #print("  <H3></H3>"); # form feed - This requires the style on the page first: <STYLE> H3 { page-break-before: always }</STYLE>


        }
      }
     if( substr($pair,0,5) eq "EMAIL" && substr($pair,6,21) eq "STUDENTPROGRESSREPORT" )
      {

       $sqlcommand3 = "SELECT EMAIL, STUDENT FROM STUDENT WHERE STUDENTNO = $sstudentno AND EMAIL IS NOT NULL";

       $connection2->Sql("$sqlcommand3");
my($semail) = "";
my($sname) = "";
       if( $connection2->FetchRow() )
       {
            $sname = $connection2->Data("STUDENT");
            $semail = $connection2->Data("EMAIL");
       }
       
       #get teacher information
        $sqlcommand3 = "SELECT EMAIL, STUDENT FROM STUDENT WHERE STUDENTNO = $steacherno AND EMAIL IS NOT NULL";

       $connection2->Sql("$sqlcommand3");
my($steacheremail) = "teacher@innovakids.com";
my($steachername) = "Teacher";
       if( $connection2->FetchRow() )
       {
            $steachername = $connection2->Data("STUDENT");
            $steacheremail = $connection2->Data("EMAIL");
       }

       
       
       #my($semail) = $connection2->Data("EMAIL");
       my($semailname) = "";

       #my($smessage) = "( To => \'$semail\', From => \'rick@innovakids.com\',  Subject    => \'Test Email From Innovakids\', Message => \'This is a very short message for $semailname\'");
       #print("$smessage");


       my($sqlcommand) = "SELECT TEACHER,PARENT1,ADDRESS1,ADDRESS2,CITY,STATE,ZIP,STUDENTNO,LETTERGRADE, STUDENT, CLASS , PERIOD, [PERCENT] FROM CLASSLISTING WHERE CLASSNO = '$sclassno' AND STUDENTNO = '$sstudentno'";
       #fixit

       $connection->Sql("$sqlcommand");
       my($pr_studentno) = "";
       my($pr_student) = "";
       my($pr_class) = "";
       my($pr_period) = "";
       my($pr_percent) = "";
       my($pr_parent1) = "";
       my($pr_address1) = "";
       my($pr_address2) = "";
       my($pr_city) = "";
        my($pr_teacher) = "";
       my($pr_state) = "";
       my($pr_zip) = "";

       while($connection->FetchRow() )
       {
          #print("found record...");
          $pr_teacher =  $connection->Data("TEACHER");
          $pr_studentno = $connection->Data("STUDENTNO");
          $pr_student = $connection->Data("STUDENT");
          $pr_classgrade = $connection->Data("LETTERGRADE");
           $pr_class = $connection->Data("CLASS");
          $pr_period = $connection->Data("PERIOD");
          $pr_percent = $connection->Data("PERCENT");
          $pr_parent1 = $connection->Data("PARENT1");
          $pr_address1 = $connection->Data("ADDRESS1");
          $pr_address2 = $connection->Data("ADDRESS2");
          $pr_city = $connection->Data("CITY");
          $pr_state = $connection->Data("STATE");
          $pr_zip = $connection->Data("ZIP");


          $semailname = "Class Progress Report for $pr_student \n";
          $semailname = $semailname."  Class: $pr_class \n \n";


          if( $pr_parent1 ne "" )
          {
            $semailname = $semailname."$pr_parent1 \n";
          }
          else
          {
             $semailname = $semailname."Parents of  $pr_student \n";

          }


          $semailname = $semailname."$pr_address1 \n";

          if( $pr_address2 ne "" )
          {
             $semailname = $semailname."$pr_address2 \n";
          }


          if( $pr_city ne "" )
          {
            $semailname = $semailname."$pr_city, $pr_state  $pr_zip \n \n \n";
          }
           else
          {
             $semailname = $semailname."\n \n \n";
          }

          $semailname = $semailname."Student Number: $pr_studentno  Student Name:  $pr_student \n";
          $semailname = $semailname."Period: $pr_period Teacher: $pr_teacher    \n Class: $pr_class ($sclassno)  -  Current Grade: $pr_classgrade ($pr_percent %)\n";


         my($sqlcommand2) = "SELECT * FROM PROGRESSREPORT WHERE CLASSNO = '$sclassno' AND STUDENTNO = $pr_studentno";
          #fixit
          #print("$sqlcommand");
          $connection2->Sql("$sqlcommand2");

          my($pr_lesson) = "";
          my($pr_lessonno) = "";
          my($pr_lettergrade) = "";
          my($pr_percent) = "";
          my($pr_attempts) = "";
          my($pr_datetime) = "";
          my($pr_chapterno) = "";
          my($pr_objective) = "";
           my($pr_standard) = "";
            my($pr_classgpa) = "";


           $semailname = $semailname."---------------------------------------------------------------------------\n";
           $semailname = $semailname."Assignments and Homework \n \n";
          while($connection2->FetchRow() )
          {
             $pr_lesson  = $connection2->Data("LESSON");
             $pr_lessonno  = $connection2->Data("LESSONNO");
             $pr_lettergrade = $connection2->Data("GRADE");
             $pr_percent  = $connection2->Data("LESSONPERCENT");
             $pr_attempts = $connection2->Data("ATTEMPTS");
             $pr_datetime = $connection2->Data("DATETIME");
             $pr_chapterno = $connection2->Data("CHAPTERNO");
             $pr_objective = $connection2->Data("OBJECTIVE");

             $pr_datetime = substr($pr_datetime,0,10);
              $pr_standard  = $connection2->Data("STANDARD");
                $pr_classgpa = $connection2->Data("CLASSGPA");
               
             $semailname = $semailname."$pr_lettergrade ($pr_percent %) $pr_datetime Lesson: $pr_lesson ($pr_lessonno)\n";
             $semailname = $semailname."    Standard: $pr_standard - Class Average $pr_classgpa Objective: $pr_objective \n \n";
             #print( " &nbsp;&nbsp; ----- Chapter: $pr_chapterno  Date Completed: $pr_datetime  Attempts: $pr_attempts <br>");



          }
          
             my($sqlcommand2) = "SELECT * FROM DISCIPLINE WHERE CLASSNO = '$sclassno' AND STUDENTNO = $pr_studentno AND lettersent = 1 AND ACTIVE=1";
          #fixit
          #print("$sqlcommand");
          $connection2->Sql("$sqlcommand2");

          my($pr_offencedate) = "";
          my($pr_offencedesc) = "";
          my($pr_offencememo) = "";
          my($pr_period) = "";
          my($pr_consequences) = "";
          my($pr_detentioninfo) = "";


           $semailname = $semailname."---------------------------------------------------------------------------\n";
           $semailname = $semailname."Referrals and Discipline Information\n \n";
          while($connection2->FetchRow() )
          {
             $pr_offencedate  = $connection2->Data("OFFENCEDATE");
             $pr_offencedesc  = $connection2->Data("OFFENCEDESC");
             $pr_disciplineno  = $connection2->Data("DISCIPLINENO");
             $pr_offencememo = $connection2->Data("OFFENCEMEMO");
             $pr_period  = $connection2->Data("PERIOD");
             $pr_consequences = $connection2->Data("CONCEQUENCES");
             $pr_detentioninfo = $connection2->Data("DETENTIONINTO");

             $pr_offencedate = substr($pr_offencedate,0,10);


             $semailname = $semailname."($pr_disciplineno) $pr_offencedate Period: $pr_period ($pr_offencedesc) $pr_offencememo\n ";
             $semailname = $semailname."---- $pr_consequences ($pr_detentioninfo)\n";
             #print( " &nbsp;&nbsp; ----- Chapter: $pr_chapterno  Date Completed: $pr_datetime  Attempts: $pr_attempts <br>");



          }

             my($sqlcommand2) = "SELECT * FROM STUDENTSTANDARDS WHERE CLASSNO = '$sclassno' AND STUDENTNO = $pr_studentno";
          #fixit
          #print("$sqlcommand");
          $connection2->Sql("$sqlcommand2");

          my($pr_standard) = "";
          my($pr_description) = "";
          my($pr_grade) = "";
          my($pr_subject) = "";



           $semailname = $semailname."---------------------------------------------------------------------------\n";
           $semailname = $semailname."Standards that need focus \n \n";
          while($connection2->FetchRow() )
          {
             $pr_standard  = $connection2->Data("STANDARD");
             $pr_description  = $connection2->Data("DESCRIPTION");
             $pr_grade  = $connection2->Data("GRADE");
             $pr_subject = $connection2->Data("SUBJECT");



             $semailname = $semailname." Grade: $pr_grade Subject: $pr_subject ($pr_standard) $pr_description \n ";
             #print( " &nbsp;&nbsp; ---- $pr_consequences ($pr_detentioninfo)<br>");
             #print( " &nbsp;&nbsp; ----- Chapter: $pr_chapterno  Date Completed: $pr_datetime  Attempts: $pr_attempts <br>");



          }



        # print($semailname);


      }
      
      my($subject) = "Progress Report Email from $steachername";
      
      if( $semail ne "" )
      {
      %mail = ( To      => $semail,
            From    => 'rick@innovakids.com' ,
            Subject    => 'School Email Progress Report' ,
            Message => $semailname
           );
        sendmail(%mail) or die $Mail::Sendmail::error;
        print "OK. Log says: ", $Mail::Sendmail::log;
        #print(%mail);
      }
      else
      {
         print "Not OK. No Email Address assigned for Parents \n";
      }
      if( $semail ne "" )
      {
       print("\n Email Sent for $email  Student $sname  Email: $semail \n")
      }
     }
    
     if( substr($pair,0,5) eq "EMAIL" && substr($pair,6,24) eq "ALLSTUDENTPROGRESSREPORT" )
      {

my($semail) = "";
my($sname) = "";

      print("Class Progress Report Email Log - Please Wait Until all emails are sent ");

       #my($smessage) = "( To => \'$semail\', From => \'rick@innovakids.com\',  Subject    => \'Test Email From Innovakids\', Message => \'This is a very short message for $semailname\'");
       #print("$smessage");


       my($sqlcommand) = "SELECT PARENT1,ADDRESS1,ADDRESS2,CITY,STATE,ZIP,STUDENTNO,LETTERGRADE, STUDENT, CLASS , PERIOD, [PERCENT] FROM CLASSLISTING WHERE CLASSNO = '$sclassno' order by student";
       #fixit
       #print("$sqlcommand");
       $connection->Sql("$sqlcommand");
       my($pr_studentno) = "";
       my($pr_student) = "";
       my($pr_class) = "";
       my($pr_period) = "";
       my($pr_percent) = "";
       my($pr_parent1) = "";
       my($pr_address1) = "";
       my($pr_address2) = "";
       my($pr_city) = "";
       my($pr_state) = "";
       my($pr_zip) = "";

       while($connection->FetchRow() )
       {
          $pr_studentno = $connection->Data("STUDENTNO");

          $pr_student = $connection->Data("STUDENT");
          $pr_classgrade = $connection->Data("LETTERGRADE");
           $pr_class = $connection->Data("CLASS");
          $pr_period = $connection->Data("PERIOD");
          $pr_percent = $connection->Data("PERCENT");
          $pr_parent1 = $connection->Data("PARENT1");
          $pr_address1 = $connection->Data("ADDRESS1");
          $pr_address2 = $connection->Data("ADDRESS2");
          $pr_city = $connection->Data("CITY");
          $pr_state = $connection->Data("STATE");
          $pr_zip = $connection->Data("ZIP");
           my($semail) = "";
       $sqlcommand2 = "SELECT EMAIL, STUDENT FROM STUDENT WHERE STUDENTNO = $pr_studentno AND EMAIL IS NOT NULL";

       $connection2->Sql("$sqlcommand2");

       if( $connection2->FetchRow() )
       {
            $sname = $connection2->Data("STUDENT");
            $semail = $connection2->Data("EMAIL");
       }
       #my($semail) = $connection2->Data("EMAIL");
       my($semailname) = "";



               #print("found record...");


          $semailname = "Class Progress Report for $pr_student \n";
          $semailname = $semailname."  Class: $pr_class \n \n";


          if( $pr_parent1 ne "" )
          {
            $semailname = $semailname."$pr_parent1 \n";
          }
          else
          {
             $semailname = $semailname."Parents of  $pr_student \n";

          }


          $semailname = $semailname."$pr_address1 \n";

          if( $pr_address2 ne "" )
          {
             $semailname = $semailname."$pr_address2 \n";
          }


          if( $pr_city ne "" )
          {
            $semailname = $semailname."$pr_city, $pr_state  $pr_zip \n \n \n";
          }
           else
          {
             $semailname = $semailname."\n \n \n";
          }

          $semailname = $semailname."Student Number: $pr_studentno  Student Name:  $pr_student \n";
          $semailname = $semailname."Period: $pr_period \n Class: $pr_class ($sclassno)  -  Current Grade: $pr_classgrade ($pr_percent %)\n";


         my($sqlcommand2) = "SELECT * FROM PROGRESSREPORT WHERE CLASSNO = '$sclassno' AND STUDENTNO = $pr_studentno";
          #fixit
          #print("$sqlcommand");
          $connection2->Sql("$sqlcommand2");

          my($pr_lesson) = "";
          my($pr_lessonno) = "";
          my($pr_lettergrade) = "";
          my($pr_percent) = "";
          my($pr_attempts) = "";
          my($pr_datetime) = "";
          my($pr_chapterno) = "";
          my($pr_objective) = "";



           $semailname = $semailname."---------------------------------------------------------------------------\n";
           $semailname = $semailname."Assignments and Homework \n \n";
          while($connection2->FetchRow() )
          {
             $pr_lesson  = $connection2->Data("LESSON");
             $pr_lessonno  = $connection2->Data("LESSONNO");
             $pr_lettergrade = $connection2->Data("GRADE");
             $pr_percent  = $connection2->Data("LESSONPERCENT");
             $pr_attempts = $connection2->Data("ATTEMPTS");
             $pr_datetime = $connection2->Data("DATETIME");
             $pr_chapterno = $connection2->Data("CHAPTERNO");
             $pr_objective = $connection2->Data("OBJECTIVE");

             $pr_datetime = substr($pr_datetime,0,10);

             $semailname = $semailname."$pr_lettergrade ($pr_percent %) Lesson: $pr_lesson ($pr_lessonno)\n";
             $semailname = $semailname."    Objective: $pr_objective \n \n";
             #print( " &nbsp;&nbsp; ----- Chapter: $pr_chapterno  Date Completed: $pr_datetime  Attempts: $pr_attempts <br>");



          }

             my($sqlcommand2) = "SELECT * FROM DISCIPLINE WHERE CLASSNO = '$sclassno' AND STUDENTNO = $pr_studentno AND lettersent = 1 AND ACTIVE=1";
          #fixit
          #print("$sqlcommand");
          $connection2->Sql("$sqlcommand2");

          my($pr_offencedate) = "";
          my($pr_offencedesc) = "";
          my($pr_offencememo) = "";
          my($pr_period) = "";
          my($pr_consequences) = "";
          my($pr_detentioninfo) = "";


           $semailname = $semailname."---------------------------------------------------------------------------\n";
           $semailname = $semailname."Referrals and Discipline Information\n \n";
          while($connection2->FetchRow() )
          {
             $pr_offencedate  = $connection2->Data("OFFENCEDATE");
             $pr_offencedesc  = $connection2->Data("OFFENCEDESC");
             $pr_disciplineno  = $connection2->Data("DISCIPLINENO");
             $pr_offencememo = $connection2->Data("OFFENCEMEMO");
             $pr_period  = $connection2->Data("PERIOD");
             $pr_consequences = $connection2->Data("CONCEQUENCES");
             $pr_detentioninfo = $connection2->Data("DETENTIONINTO");

             $pr_offencedate = substr($pr_offencedate,0,10);


             $semailname = $semailname."($pr_disciplineno) $pr_offencedate Period: $pr_period ($pr_offencedesc) $pr_offencememo\n ";
             $semailname = $semailname."---- $pr_consequences ($pr_detentioninfo)\n";
             #print( " &nbsp;&nbsp; ----- Chapter: $pr_chapterno  Date Completed: $pr_datetime  Attempts: $pr_attempts <br>");



          }

             my($sqlcommand2) = "SELECT * FROM STUDENTSTANDARDS WHERE CLASSNO = '$sclassno' AND STUDENTNO = $pr_studentno";
          #fixit
          #print("$sqlcommand");
          $connection2->Sql("$sqlcommand2");

          my($pr_standard) = "";
          my($pr_description) = "";
          my($pr_grade) = "";
          my($pr_subject) = "";



           $semailname = $semailname."---------------------------------------------------------------------------\n";
           $semailname = $semailname."Standards that need focus \n \n";
          while($connection2->FetchRow() )
          {
             $pr_standard  = $connection2->Data("STANDARD");
             $pr_description  = $connection2->Data("DESCRIPTION");
             $pr_grade  = $connection2->Data("GRADE");
             $pr_subject = $connection2->Data("SUBJECT");



             $semailname = $semailname."  Grade: $pr_grade Subject: $pr_subject ($pr_standard) $pr_description \n ";
             #print( " &nbsp;&nbsp; ---- $pr_consequences ($pr_detentioninfo)<br>");
             #print( " &nbsp;&nbsp; ----- Chapter: $pr_chapterno  Date Completed: $pr_datetime  Attempts: $pr_attempts <br>");



          }



        # print($semailname);



      if( $semail ne "" )
      {
       print("<p>Email Sending for $semail  Student $sname");
      %mail = ( To      => $semail,
            From    => 'rick@innovakids.com',
            Subject    => 'Progress Report Email',
            Message => $semailname
           );
        sendmail(%mail) or die $Mail::Sendmail::error;
        print "Sent OK. Log says:\n", $Mail::Sendmail::log;


      }
      else
      {
         print "<p>Not OK. No Email Address assigned for Parents of Student $sname ";
      }


     }
     print("<p>All Emails Sent... You may now close the window and return to Innovakids");

     }

     if( substr($pair,0,6) eq "REPORT"  && substr($pair,7,8) eq "SCHEDULE" )
        {

       my($sqlcommand) = "SELECT PARENT1,ADDRESS1,ADDRESS2,CITY,STATE,ZIP,STUDENTNO,LETTERGRADE, STUDENT, CLASS , PERIOD, [PERCENT] FROM CLASSLISTING WHERE CLASSNO = $sclassno AND STUDENTNO = '$sstudentno'";
       #fixit
       #print("$sqlcommand");
       $connection->Sql("$sqlcommand");

       my($pr_studentno) = "";
       my($pr_student) = "";
       my($pr_class) = "";
       my($pr_period) = "";
       my($pr_percent) = "";
       my($pr_parent1) = "";
       my($pr_address1) = "";
       my($pr_address2) = "";
       my($pr_city) = "";
       my($pr_state) = "";
       my($pr_zip) = "";

       while($connection->FetchRow() )
       {
          #print("found record...");
          $pr_studentno = $connection->Data("STUDENTNO");
          $pr_student = $connection->Data("STUDENT");
          $pr_classgrade = $connection->Data("LETTERGRADE");
           $pr_class = $connection->Data("CLASS");
          $pr_period = $connection->Data("PERIOD");
          $pr_percent = $connection->Data("PERCENT");
          $pr_parent1 = $connection->Data("PARENT1");
          $pr_address1 = $connection->Data("ADDRESS1");
          $pr_address2 = $connection->Data("ADDRESS2");
          $pr_city = $connection->Data("CITY");
          $pr_state = $connection->Data("STATE");
          $pr_zip = $connection->Data("ZIP");


         my($tm) = localtime;
         printf("Report Date: %04d-%02d-%02d <br>", $tm->year+1900,($tm->mon)+1, $tm->mday);


          print("<B>Student Schedule Report for $pr_student</B><br><br><br>");



          if( $pr_parent1 ne "" )
          {
             print( "&nbsp; &nbsp;  $pr_parent1 <br>" );
          }
          else
          {
             print( "&nbsp;&nbsp;  Parents of  $pr_student <br>" );

          }


          print( "&nbsp;&nbsp;  $pr_address1 <br>" );

          if( $pr_address2 ne "" )
          {
             print( "&nbsp;&nbsp;  $pr_address2 <br>" );
          }


          if( $pr_city ne "" )
          {
            print( " &nbsp;&nbsp; $pr_city, $pr_state  $pr_zip <br><br><br>" );
          }
           else
          {
             print("<br><br><br><br>");
          }

          print(" &nbsp;&nbsp; Student Number: $pr_studentno  Student Name:  $pr_student</span><br>");


          my($sqlcommand2) = "SELECT B.LETTERGRADE, B.[PERCENT],A.PERIOD,A.TEACHER,A.CLASSNO,A.CLASS,A.CODE,A.DEPARTMENT, A.ROOM, A.BEGTIME, A.ENDTIME, A.CLASSLEVEL, A.CLASSTYPE FROM CLASS A, STUDCLAS B WHERE  B.STUDENTNO = $sstudentno AND A.CLASSNO = B.CLASSNO ORDER BY A.PERIOD";
          #fixit
          #print("$sqlcommand");
          $connection2->Sql("$sqlcommand2");

          my($pr_period) = "";
          my($pr_teacher) = "";
          my($pr_classno) = "";
          my($pr_class) = "";
          my($pr_code) = "";
          my($pr_department) = "";
          my($pr_room) = "";
          my($pr_begtime) = "";
          my($pr_endtime) = "";
          my($pr_classlevel) = "";
          my($pr_classtype) = "";
          my($pr_grade) = "";
          my($pr_percent) = "";


           print("&nbsp;&nbsp;---------------------------------------------------------------------------<br>");
           print("Classes<br><br>");
          while($connection2->FetchRow() )
          {
             $pr_period  = $connection2->Data("PERIOD");
             $pr_teacher  = $connection2->Data("TEACHER");
             $pr_classno = $connection2->Data("CLASSNO");
             $pr_class  = $connection2->Data("CLASS");
             $pr_code = $connection2->Data("CODE");
             $pr_department = $connection2->Data("DEPARTMENT");
             $pr_room = $connection2->Data("ROOM");
             $pr_begtime = $connection2->Data("BEGTIME");
             $pr_endtime = $connection2->Data("ENDTIME");
             $pr_classlevel = $connection2->Data("CLASSLEVEL");
             $pr_classtype = $connection2->Data("CLASSTYPE");
             $pr_grade = $connection2->Data("LETTERGRADE");
             $pr_percent = $connection2->Data("PERCENT");

             print( " &nbsp;&nbsp; $pr_period ($pr_classno) $pr_code:$pr_class - $pr_teacher <br>");
             print( " &nbsp;&nbsp; $pr_department ($pr_room)<br>");
             print( " &nbsp;&nbsp; Beginning Time: $pr_begtime Ending Time: $pr_endtime<br>");
             print( " &nbsp;&nbsp; Level: $pr_classlevel ($pr_classtype)<br>");
             print( " &nbsp;&nbsp; Current Grade: $pr_grade ($pr_percent %)<br><br><br>");
             #print( " &nbsp;&nbsp; ----- Chapter: $pr_chapterno  Date Completed: $pr_datetime  Attempts: $pr_attempts <br>");



          }





          # end of form next page
          #print("  <H3></H3>"); # form feed - This requires the style on the page first: <STYLE> H3 { page-break-before: always }</STYLE>


        }
      }
     #print(substr($pair,0,20));
     if( substr($pair,0,20) eq "LESSONPROGRESSREPORT"  )
        {

       my($sqlcommand) = "SELECT PARENT1,ADDRESS1,ADDRESS2,CITY,STATE,ZIP,STUDENTNO,LETTERGRADE, STUDENT, CLASS , PERIOD, [PERCENT] FROM CLASSLISTING WHERE CLASSNO = '$sclassno' AND STUDENTNO = '$sstudentno'";
       #fixit
       print("$sqlcommand");
       $connection->Sql("$sqlcommand");

       my($pr_studentno) = "";
       my($pr_student) = "";
       my($pr_class) = "";
       my($pr_period) = "";
       my($pr_percent) = "";
       my($pr_parent1) = "";
       my($pr_address1) = "";
       my($pr_address2) = "";
       my($pr_city) = "";
       my($pr_state) = "";
       my($pr_zip) = "";

       while($connection->FetchRow() )
       {
          #print("found record...");
          $pr_studentno = $connection->Data("STUDENTNO");
          $pr_student = $connection->Data("STUDENT");
          $pr_classgrade = $connection->Data("LETTERGRADE");
           $pr_class = $connection->Data("CLASS");
          $pr_period = $connection->Data("PERIOD");
          $pr_percent = $connection->Data("PERCENT");
          $pr_parent1 = $connection->Data("PARENT1");
          $pr_address1 = $connection->Data("ADDRESS1");
          $pr_address2 = $connection->Data("ADDRESS2");
          $pr_city = $connection->Data("CITY");
          $pr_state = $connection->Data("STATE");
          $pr_zip = $connection->Data("ZIP");

           my($tm) = localtime;
         printf("Report Date: %04d-%02d-%02d <br>", $tm->year+1900,($tm->mon)+1, $tm->mday);

          print(" &nbsp; &nbsp; <h1 class=page_title_lev_1 >Lesson Student Analysis Report for $pr_student<br>");
          print(" &nbsp; &nbsp; Class: $pr_class</h1>");


          if( $pr_parent1 ne "" )
          {
             print( "&nbsp; &nbsp;  $pr_parent1 <br>" );
          }
          else
          {
             print( "&nbsp;&nbsp;  Parents of  $pr_student <br>" );

          }


          print( "&nbsp;&nbsp;  $pr_address1 <br>" );

          if( $pr_address2 ne "" )
          {
             print( "&nbsp;&nbsp;  $pr_address2 <br>" );
          }


          if( $pr_city ne "" )
          {
            print( " &nbsp;&nbsp; $pr_city, $pr_state  $pr_zip <br><br><br>" );
          }
           else
          {
             print("<br><br><br><br>");
          }
           print("&nbsp;&nbsp;_________________________________________________________________________________<br>");
          print(" &nbsp;&nbsp;<b> Student Number: $pr_studentno </b> <b>Student Name:  $pr_student</span></b><br>");
          print(" &nbsp;&nbsp; Period: $pr_period &nbsp;&nbsp;Class:<b> $pr_class </b>($sclassno)  -  Current Grade:<b> $pr_classgrade</b> ($pr_percent %)<br>");



                my($sqlcommand2) = "SELECT * FROM PROGRESSREPORT WHERE CLASSNO = '$sclassno' AND STUDENTNO = $sstudentno AND LESSONNO = $slessonno";
          #fixit
          #print("$sqlcommand");
          $connection2->Sql("$sqlcommand2");

          my($pr_lesson) = "";
          my($pr_lessonno) = "";
          my($pr_lettergrade) = "";
          my($pr_percent) = "";
          my($pr_attempts) = "";
          my($pr_datetime) = "";
          my($pr_chapterno) = "";
          my($pr_objective) = "";



           $semailname = $semailname."---------------------------------------------------------------------------\n";
           $semailname = $semailname."Assignments and Homework \n \n";
          while($connection2->FetchRow() )
          {
             $pr_lesson  = $connection2->Data("LESSON");
             $pr_lessonno  = $connection2->Data("LESSONNO");
             $pr_lettergrade = $connection2->Data("GRADE");
             $pr_percent  = $connection2->Data("LESSONPERCENT");
             $pr_attempts = $connection2->Data("ATTEMPTS");
             $pr_datetime = $connection2->Data("DATETIME");
             $pr_chapterno = $connection2->Data("CHAPTERNO");
             $pr_objective = $connection2->Data("OBJECTIVE");

             $pr_datetime = substr($pr_datetime,0,10);

             $semailname = $semailname."$pr_lettergrade ($pr_percent %) Lesson: $pr_lesson ($pr_lessonno) \n";
             $semailname = $semailname."    Objective: $pr_objective \n    Attempt: $pr_attempts \n \n";
             #print( " &nbsp;&nbsp; ----- Chapter: $pr_chapterno  Date Completed: $pr_datetime  Attempts: $pr_attempts <br>");



          }



         my($sqlcommand2) = "SELECT DISTINCT B.QUESTION, C.CHOICE1,C.CHOICE2,C.CHOICE3,C.CHOICE4 FROM STUDQUES A, QUESTION B, ANSWER C WHERE A.QUESTIONNO = B.QUESTIONNO AND B.QUESTIONNO = C.QUESTIONNO AND A.LESSONNO = $slessonno AND A.STUDENTNO = $sstudentno AND A.ATTEMPT = $pr_attempts - 1 and A.CORRECT = 0 ORDER BY B.QUESTION";
          #fixit
          #print("$sqlcommand2");
          $connection2->Sql("$sqlcommand2");

          my($pr_question) = "";
          my($choice1) = "";
          my($choice2) = "";
          my($choice3) = "";
          my($choice4) = "";



           $semailname = $semailname."---------------------------------------------------------------------------\n";
           $semailname = $semailname."Missed Questions \n \n";
          while($connection2->FetchRow() )
          {
             $pr_question  = $connection2->Data("QUESTION");
             $choice1  = $connection2->Data("CHOICE1");
             $choice2  = $connection2->Data("CHOICE2");
             $choice3  = $connection2->Data("CHOICE3");
             $choice4  = $connection2->Data("CHOICE4");

                $semailname = $semailname."WRONG - $pr_question \n \n";

                $semailname = $semailname."Choices: $choice1 , $choice2 , $choice3 , $choice4 \n \n";


             print( " &nbsp;&nbsp; ----- Chapter: $pr_chapterno  Date Completed: $pr_datetime  Attempts: $pr_attempts <br>");



          }


            my($sqlcommand2) = "SELECT * FROM DISCIPLINE WHERE CLASSNO = '$sclassno' AND STUDENTNO = $pr_studentno AND lettersent = 1 AND ACTIVE=1";
          #fixit
          #print("$sqlcommand");
          $connection2->Sql("$sqlcommand2");

          my($pr_offencedate) = "";
          my($pr_offencedesc) = "";
          my($pr_offencememo) = "";
          my($pr_period) = "";
          my($pr_consequences) = "";
          my($pr_detentioninfo) = "";


           print("&nbsp;&nbsp;_________________________________________________________________________________<br>");
           print("<b>&nbsp;&nbsp;Referrals and Discipline Information</b><br><br>");
          while($connection2->FetchRow() )
          {
             $pr_offencedate  = $connection2->Data("OFFENCEDATE");
             $pr_offencedesc  = $connection2->Data("OFFENCEDESC");
             $pr_disciplineno  = $connection2->Data("DISCIPLINENO");
             $pr_offencememo = $connection2->Data("OFFENCEMEMO");
             $pr_period  = $connection2->Data("PERIOD");
             $pr_consequences = $connection2->Data("CONCEQUENCES");
             $pr_detentioninfo = $connection2->Data("DETENTIONINTO");

             $pr_offencedate = substr($pr_offencedate,0,10);


             print( " &nbsp;&nbsp; ($pr_disciplineno) $pr_offencedate Period: $pr_period ($pr_offencedesc) $pr_offencememo<BR> ");
             print( " &nbsp;&nbsp; ---- $pr_consequences ($pr_detentioninfo)<br>");
             #print( " &nbsp;&nbsp; ----- Chapter: $pr_chapterno  Date Completed: $pr_datetime  Attempts: $pr_attempts <br>");



          }

             my($sqlcommand2) = "SELECT * FROM STUDENTSTANDARDS WHERE CLASSNO = '$sclassno' AND STUDENTNO = $pr_studentno";
          #fixit
          #print("$sqlcommand");
          $connection2->Sql("$sqlcommand2");

          my($pr_standard) = "";
          my($pr_description) = "";
          my($pr_grade) = "";
          my($pr_subject) = "";



          print("&nbsp;&nbsp;_________________________________________________________________________________<br>");
           print("<b>&nbsp;&nbsp;Standards that need focus</b><br><br>");
          while($connection2->FetchRow() )
          {
             $pr_standard  = $connection2->Data("STANDARD");
             $pr_description  = $connection2->Data("DESCRIPTION");
             $pr_grade  = $connection2->Data("GRADE");
             $pr_subject = $connection2->Data("SUBJECT");



             print( " &nbsp;&nbsp; Grade: $pr_grade Subject: $pr_subject ($pr_standard) $pr_description <BR> ");
             #print( " &nbsp;&nbsp; ---- $pr_consequences ($pr_detentioninfo)<br>");
             #print( " &nbsp;&nbsp; ----- Chapter: $pr_chapterno  Date Completed: $pr_datetime  Attempts: $pr_attempts <br>");



          }

           print("<br><br>&nbsp;&nbsp;<b>Teacher Signature: __________________________ <br><br>&nbsp;&nbsp;Required: Yes&nbsp;&nbsp; No <br>&nbsp;&nbsp;  Parent Signature _________________________<br>");


          # end of form next page
          #print("  <H3></H3>"); # form feed - This requires the style on the page first: <STYLE> H3 { page-break-before: always }</STYLE>


        }
      }



     
     
     
     
     # End of Test Results
    
    
     if( substr($pair,0,22) eq "iSTUDENTPROGRESSREPORT" || substr($pair,0,21) eq "STUDENTPROGRESSREPORT" )
        {

       my($sqlcommand) = "SELECT PARENT1,ADDRESS1,ADDRESS2,CITY,STATE,ZIP,STUDENTNO,LETTERGRADE, STUDENT, CLASS , PERIOD, [PERCENT] FROM CLASSLISTING WHERE CLASSNO = '$sclassno' AND STUDENTNO = '$sstudentno'";
       #fixit
       #print("$sqlcommand");
       $connection->Sql("$sqlcommand");

       my($pr_studentno) = "";
       my($pr_student) = "";
       my($pr_class) = "";
       my($pr_period) = "";
       my($pr_percent) = "";
       my($pr_parent1) = "";
       my($pr_address1) = "";
       my($pr_address2) = "";
       my($pr_city) = "";
       my($pr_state) = "";
       my($pr_zip) = "";

       while($connection->FetchRow() )
       {
          #print("found record...");
          $pr_studentno = $connection->Data("STUDENTNO");
          $pr_student = $connection->Data("STUDENT");
          $pr_classgrade = $connection->Data("LETTERGRADE");
           $pr_class = $connection->Data("CLASS");
          $pr_period = $connection->Data("PERIOD");
          $pr_percent = $connection->Data("PERCENT");
          $pr_parent1 = $connection->Data("PARENT1");
          $pr_address1 = $connection->Data("ADDRESS1");
          $pr_address2 = $connection->Data("ADDRESS2");
          $pr_city = $connection->Data("CITY");
          $pr_state = $connection->Data("STATE");
          $pr_zip = $connection->Data("ZIP");

           my($tm) = localtime;
         printf("Report Date: %04d-%02d-%02d <br>", $tm->year+1900,($tm->mon)+1, $tm->mday);

          print(" &nbsp; &nbsp; <h1 class=page_title_lev_1 >Class Progress Report for $pr_student<br>");
          print(" &nbsp; &nbsp; Class: $pr_class</h1>");


          if( $pr_parent1 ne "" )
          {
             print( "&nbsp; &nbsp;  $pr_parent1 <br>" );
          }
          else
          {
             print( "&nbsp;&nbsp;  Parents of  $pr_student <br>" );

          }


          print( "&nbsp;&nbsp;  $pr_address1 <br>" );

          if( $pr_address2 ne "" )
          {
             print( "&nbsp;&nbsp;  $pr_address2 <br>" );
          }


          if( $pr_city ne "" )
          {
            print( " &nbsp;&nbsp; $pr_city, $pr_state  $pr_zip <br><br><br>" );
          }
           else
          {
             print("<br><br><br><br>");
          }
           print("&nbsp;&nbsp;_________________________________________________________________________________<br>");
          print(" &nbsp;&nbsp;<b> Student Number: $pr_studentno </b> <b>Student Name:  $pr_student</span></b><br>");
          print(" &nbsp;&nbsp; Period: $pr_period &nbsp;&nbsp;Class:<b> $pr_class </b>($sclassno)  -  Current Grade:<b> $pr_classgrade</b> ($pr_percent %)<br>");



          my($sqlcommand2) = "SELECT * FROM PROGRESSREPORT WHERE CLASSNO = '$sclassno' AND STUDENTNO = $pr_studentno";
          #fixit
          #print("$sqlcommand");
          $connection2->Sql("$sqlcommand2");

          my($pr_lesson) = "";
          my($pr_lessonno) = "";
          my($pr_lettergrade) = "";
          my($pr_percent) = "";
          my($pr_attempts) = "";
          my($pr_datetime) = "";
          my($pr_chapterno) = "";
          my($pr_objective) = "";
           my($pr_standard) = "";
          my($pr_classgpa) = "";



           print("&nbsp;&nbsp;_________________________________________________________________________________<br>");
           print("&nbsp;&nbsp;<b>Assignments and Homework</b><br>");

          while($connection2->FetchRow() )
          {
             $pr_lesson  = $connection2->Data("LESSON");
             $pr_lessonno  = $connection2->Data("LESSONNO");
             $pr_lettergrade = $connection2->Data("GRADE");
             $pr_percent  = $connection2->Data("LESSONPERCENT");
             $pr_attempts = $connection2->Data("ATTEMPTS");
             $pr_datetime = $connection2->Data("DATETIME");
             $pr_chapterno = $connection2->Data("CHAPTERNO");
             $pr_objective = $connection2->Data("OBJECTIVE");

                         $pr_standard  = $connection2->Data("STANDARD");
                $pr_classgpa = $connection2->Data("CLASSGPA");

             $pr_datetime = substr($pr_datetime,0,10);

             print( " &nbsp;&nbsp;<b> $pr_lettergrade</b> ($pr_percent %) $pr_lesson ");
             print( " &nbsp;&nbsp; Standard: $pr_standard  Class Average: $pr_classgpa % <br>&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; Objective: $pr_objective ($pr_lessonno)<br>");
             #print( " &nbsp;&nbsp; ----- Chapter: $pr_chapterno  Date Completed: $pr_datetime  Attempts: $pr_attempts <br>");



          }

            my($sqlcommand2) = "SELECT * FROM DISCIPLINE WHERE CLASSNO = '$sclassno' AND STUDENTNO = $pr_studentno AND lettersent = 1 AND ACTIVE=1";
          #fixit
          #print("$sqlcommand");
          $connection2->Sql("$sqlcommand2");

          my($pr_offencedate) = "";
          my($pr_offencedesc) = "";
          my($pr_offencememo) = "";
          my($pr_period) = "";
          my($pr_consequences) = "";
          my($pr_detentioninfo) = "";


           print("&nbsp;&nbsp;_________________________________________________________________________________<br>");
           print("<b>&nbsp;&nbsp;Referrals and Discipline Information</b><br><br>");
          while($connection2->FetchRow() )
          {
             $pr_offencedate  = $connection2->Data("OFFENCEDATE");
             $pr_offencedesc  = $connection2->Data("OFFENCEDESC");
             $pr_disciplineno  = $connection2->Data("DISCIPLINENO");
             $pr_offencememo = $connection2->Data("OFFENCEMEMO");
             $pr_period  = $connection2->Data("PERIOD");
             $pr_consequences = $connection2->Data("CONCEQUENCES");
             $pr_detentioninfo = $connection2->Data("DETENTIONINTO");

             $pr_offencedate = substr($pr_offencedate,0,10);


             print( " &nbsp;&nbsp; ($pr_disciplineno) $pr_offencedate Period: $pr_period ($pr_offencedesc) $pr_offencememo<BR> ");
             print( " &nbsp;&nbsp; ---- $pr_consequences ($pr_detentioninfo)<br>");
             #print( " &nbsp;&nbsp; ----- Chapter: $pr_chapterno  Date Completed: $pr_datetime  Attempts: $pr_attempts <br>");



          }

             my($sqlcommand2) = "SELECT * FROM STUDENTSTANDARDS WHERE CLASSNO = '$sclassno' AND STUDENTNO = $pr_studentno";
          #fixit
          #print("$sqlcommand");
          $connection2->Sql("$sqlcommand2");

          my($pr_standard) = "";
          my($pr_description) = "";
          my($pr_grade) = "";
          my($pr_subject) = "";



          print("&nbsp;&nbsp;_________________________________________________________________________________<br>");
           print("<b>&nbsp;&nbsp;Standards that need focus</b><br><br>");
          while($connection2->FetchRow() )
          {
             $pr_standard  = $connection2->Data("STANDARD");
             $pr_description  = $connection2->Data("DESCRIPTION");
             $pr_grade  = $connection2->Data("GRADE");
             $pr_subject = $connection2->Data("SUBJECT");



             print( " &nbsp;&nbsp; Grade: $pr_grade Subject: $pr_subject ($pr_standard) $pr_description <BR> ");
             #print( " &nbsp;&nbsp; ---- $pr_consequences ($pr_detentioninfo)<br>");
             #print( " &nbsp;&nbsp; ----- Chapter: $pr_chapterno  Date Completed: $pr_datetime  Attempts: $pr_attempts <br>");



          }

           print("<br><br>&nbsp;&nbsp;<b>Teacher Signature: __________________________ <br><br>&nbsp;&nbsp;Required: Yes&nbsp;&nbsp; No <br>&nbsp;&nbsp;  Parent Signature _________________________<br>");


          # end of form next page
          #print("  <H3></H3>"); # form feed - This requires the style on the page first: <STYLE> H3 { page-break-before: always }</STYLE>


        }
      }

       if( substr($pair,0,22) eq "iSTUDENTREFERRALREPORT" )
        {

       my($sqlcommand) = "SELECT PHONENO,PARENT1,ADDRESS1,ADDRESS2,CITY,STATE,ZIP,STUDENTNO,LETTERGRADE, STUDENT, CLASS , PERIOD, [PERCENT],TEACHER FROM CLASSLISTING WHERE CLASSNO = '$sclassno' AND STUDENTNO = '$sstudentno'";
       #fixit
       #print("$sqlcommand");
       $connection->Sql("$sqlcommand");

       my($pr_studentno) = "";
       my($pr_student) = "";
       my($pr_class) = "";
       my($pr_period) = "";
       my($pr_percent) = "";
       my($pr_parent1) = "";
       my($pr_address1) = "";
          my($pr_phoneno) = "";
          my($pr_address2) = "";
        my($pr_teachername) = "";
       my($pr_city) = "";
       my($pr_state) = "";
       my($pr_zip) = "";

       while($connection->FetchRow() )
       {
          #print("found record...");
          $pr_studentno = $connection->Data("STUDENTNO");
          $pr_student = $connection->Data("STUDENT");
          $pr_phoneno = $connection->Data("PHONENO");
          $pr_classgrade = $connection->Data("LETTERGRADE");
           $pr_class = $connection->Data("CLASS");
          $pr_period = $connection->Data("PERIOD");
          $pr_percent = $connection->Data("PERCENT");
          $pr_parent1 = $connection->Data("PARENT1");
          $pr_address1 = $connection->Data("ADDRESS1");
          $pr_address2 = $connection->Data("ADDRESS2");
          $pr_city = $connection->Data("CITY");
          $pr_state = $connection->Data("STATE");
          $pr_zip = $connection->Data("ZIP");
          $pr_teachername = $connection->Data("TEACHER");

           my($tm) = localtime;
         printf("Report Date: %04d-%02d-%02d <br>", $tm->year+1900,($tm->mon)+1, $tm->mday);

          print(" &nbsp; &nbsp; <h1 class=page_title_lev_1 >Referral for $pr_student<br></H1>");
          print(" <h2 class=page_title_lev_1 >&nbsp;$pr_class  - $pr_teachername</h2>");


          if( $pr_parent1 ne "" )
          {
             print( "&nbsp; &nbsp;  $pr_parent1 <br>" );
          }
          else
          {
             print( "&nbsp;&nbsp;  Parents of  $pr_student <br>" );

          }


          print( "&nbsp;&nbsp;  $pr_address1 <br>" );

          if( $pr_address2 ne "" )
          {
             print( "&nbsp;&nbsp;  $pr_address2 <br>" );
          }


          if( $pr_city ne "" )
          {
            print( " &nbsp;&nbsp; $pr_city, $pr_state  $pr_zip <br>" );
          print( "&nbsp;&nbsp;  $pr_phoneno <br>" );
          }
           else
          {
               print( "&nbsp;&nbsp;  $pr_phoneno <br>" );

          }
           print("&nbsp;&nbsp;_________________________________________________________________________________<br>");
          print(" &nbsp;&nbsp;<b> Student Number: $pr_studentno </b> <b>Student Name:  $pr_student</span></b><br>");
          print(" &nbsp;&nbsp; Period: $pr_period &nbsp;&nbsp;Class: <b> $pr_class </b>($sclassno)  -  Current Grade:<b> $pr_classgrade</b> ($pr_percent %)<br>");




            my($sqlcommand2) = "SELECT * FROM DISCIPLINE WHERE DISCIPLINENO = $sdisciplineno";
          #fixit
          #print("$sqlcommand");
          $connection2->Sql("$sqlcommand2");

          my($pr_offencedate) = "";
          my($pr_offencedesc) = "";
          my($pr_offencememo) = "";
          my($pr_offencecount) = "";
          my($pr_calledhome) = "";
          my($pr_period) = "";
          my($pr_consequences) = "";
          my($pr_detentioninfo) = "";


           print("&nbsp;&nbsp;_________________________________________________________________________________<br>");
           print("<b>&nbsp;&nbsp;Referrals and Discipline Information</b>");
          while($connection2->FetchRow() )
          {
             $pr_offencedate  = $connection2->Data("OFFENCEDATE");
             $pr_offencedesc  = $connection2->Data("OFFENCEDESC");
              $pr_offencecount  = $connection2->Data("OFFENCECOUNT");
               $pr_calledhome  = $connection2->Data("PHONECALL");
             $pr_disciplineno  = $connection2->Data("DISCIPLINENO");
             $pr_offencememo = $connection2->Data("OFFENCEMEMO");
             $pr_period  = $connection2->Data("PERIOD");
             $pr_consequences = $connection2->Data("CONCEQUENCES");
             $pr_detentioninfo = $connection2->Data("DETENTIONINTO");

             $pr_offencedate = substr($pr_offencedate,0,10);


             print( " <br><br>&nbsp;&nbsp;<b>Referral No:</b> $pr_disciplineno<BR>&nbsp;&nbsp;<b>Referral Date:</b> $pr_offencedate <br>&nbsp;&nbsp;<b>Class Period:</b> $pr_period <br><br><b>&nbsp;&nbsp;Description of Event:</b> <br> &nbsp;&nbsp;$pr_offencedesc <BR><BR>&nbsp;&nbsp;<b>Teachers Memo:</b> <br>&nbsp;&nbsp;$pr_offencememo<BR> ");
             print( " <br>&nbsp;&nbsp;<b>Consequences:</b> $pr_consequences <br><br>&nbsp;&nbsp;<b>Detention Information: </b><br>$pr_detentioninfo<br>");
             #print( " &nbsp;&nbsp; ----- Chapter: $pr_chapterno  Date Completed: $pr_datetime  Attempts: $pr_attempts <br>");
              print( " <br>&nbsp;&nbsp;<b>Teacher Called Parent On:</b> $pr_calledhome<br><br>");
               print( " <br>&nbsp;&nbsp;This is the $pr_offencecount offense of this nature<br><br>");

          }

           print("<br><br>&nbsp;&nbsp;<b>Parent Comment to Teacher: <br>  <br><br>");



           print("<br><br>&nbsp;&nbsp;<b>Teacher Signature: __________________________ <br><br>&nbsp;&nbsp;Parent Signature Required: Yes&nbsp;&nbsp; No    <br>&nbsp;&nbsp;Parent Contact Teacher for Meeting: Yes&nbsp;&nbsp; No<BR><bR><br>&nbsp;&nbsp;  Parent Signature _________________________ (Please Return to Teacher)<br>");


          # end of form next page
          #print("  <H3></H3>"); # form feed - This requires the style on the page first: <STYLE> H3 { page-break-before: always }</STYLE>


        }
      }




    if( substr($pair,0,8) eq "WHEREKEY" )
    {
        $swherekey = substr($pair,9,50);
        
    }
    
    if( $stable eq substr($pair,0,index($pair,'.') ) )
    {
     
     $x = index($pair,'=');
     $x2 = index($pair,'.')+1;
     $sfield = substr($pair,$x2,$x - $x2); 
     $sfieldvalue = substr($pair,$x+1,8000);
   while( index($sfieldvalue,"+") > 0)
    {
      if( index($sfieldvalue,"+") > 0 )
      {
        $sfieldvalue = substr($sfieldvalue,0,index($sfieldvalue,"+"))." ". substr($sfieldvalue,index($sfieldvalue,"+")+1,8000);
       # sinput = sinput.Trim();

      }


    }
  
   my $char = '%0D';
   if( index($sfieldvalue,$char) gt -1 )
   {
    
    while( index($sfieldvalue,$char) > -1 )
    {
  
     if( index($sfieldvalue,$char) > -1 )
      {
        $sfieldvalue = substr($sfieldvalue,0,index($sfieldvalue,$char))."\n". substr($sfieldvalue,index($sfieldvalue,$char)+3,8000);
       # sinput = sinput.Trim();

      }


    }
   }
  
   my $char = '%0A';
   if( index($sfieldvalue,$char) gt -1 )
   {
    
    while( index($sfieldvalue,$char) > -1 )
    {
  
     if( index($sfieldvalue,$char) > -1 )
      {
        $sfieldvalue = substr($sfieldvalue,0,index($sfieldvalue,$char))."". substr($sfieldvalue,index($sfieldvalue,$char)+3,8000);
       # sinput = sinput.Trim();

      }


    }
   }
  
   my $char = '%28';
   if( index($sfieldvalue,$char) gt -1 )
   {
    
    while( index($sfieldvalue,$char) > -1 )
    {
  
     if( index($sfieldvalue,$char) > -1 )
      {
        $sfieldvalue = substr($sfieldvalue,0,index($sfieldvalue,$char))."(". substr($sfieldvalue,index($sfieldvalue,$char)+3,8000);
       # sinput = sinput.Trim();

      }


    }
   }
    my $char = '%22';
   if( index($sfieldvalue,$char) gt -1 )
   {

    while( index($sfieldvalue,$char) > -1 )
    {

     if( index($sfieldvalue,$char) > -1 )
      {
        $sfieldvalue = substr($sfieldvalue,0,index($sfieldvalue,$char))."\"". substr($sfieldvalue,index($sfieldvalue,$char)+3,8000);
       # sinput = sinput.Trim();

      }


    }
   }
   
    my $char = '%29';
   if( index($sfieldvalue,$char) gt -1 )
   {
    
    while( index($sfieldvalue,$char) > -1 )
    {
  
     if( index($sfieldvalue,$char) > -1 )
      {
        $sfieldvalue = substr($sfieldvalue,0,index($sfieldvalue,$char)).")". substr($sfieldvalue,index($sfieldvalue,$char)+3,8000);
       # sinput = sinput.Trim();

      }


    }
   }
   
   my $char = '%5C';
   if( index($sfieldvalue,$char) gt -1 )
   {

    while( index($sfieldvalue,$char) > -1 )
    {

     if( index($sfieldvalue,$char) > -1 )
      {
        $sfieldvalue = substr($sfieldvalue,0,index($sfieldvalue,$char))."\\". substr($sfieldvalue,index($sfieldvalue,$char)+3,8000);
       # sinput = sinput.Trim();

      }


    }
   }

   
    my $char = '%27';
   if( index($sfieldvalue,$char) gt -1 )
   {

    while( index($sfieldvalue,$char) > -1 )
    {

     if( index($sfieldvalue,$char) > -1 )
      {
        $sfieldvalue = substr($sfieldvalue,0,index($sfieldvalue,$char))."''". substr($sfieldvalue,index($sfieldvalue,$char)+3,8000);
       # sinput = sinput.Trim();

      }


    }
   }
   
   
     my $char = '%21';
   if( index($sfieldvalue,$char) gt -1 )
   {

    while( index($sfieldvalue,$char) > -1 )
    {

     if( index($sfieldvalue,$char) > -1 )
      {
        $sfieldvalue = substr($sfieldvalue,0,index($sfieldvalue,$char))."!". substr($sfieldvalue,index($sfieldvalue,$char)+3,8000);
       # sinput = sinput.Trim();

      }


    }
   }
   

my $char = '%3A';
   if( index($sfieldvalue,$char) gt -1 )
   {
    
    while( index($sfieldvalue,$char) > -1 )
    {
  
     if( index($sfieldvalue,$char) > -1 )
      {
        $sfieldvalue = substr($sfieldvalue,0,index($sfieldvalue,$char)).":". substr($sfieldvalue,index($sfieldvalue,$char)+3,8000);
       # sinput = sinput.Trim();

      }


    }
   }

   my $char = '%3C';
   if( index($sfieldvalue,$char) gt -1 )
   {

    while( index($sfieldvalue,$char) > -1 )
    {

     if( index($sfieldvalue,$char) > -1 )
      {
        $sfieldvalue = substr($sfieldvalue,0,index($sfieldvalue,$char))."<". substr($sfieldvalue,index($sfieldvalue,$char)+3,8000);
       # sinput = sinput.Trim();

      }


    }
   }

    my $char = '%3D';
   if( index($sfieldvalue,$char) gt -1 )
   {

    while( index($sfieldvalue,$char) > -1 )
    {

     if( index($sfieldvalue,$char) > -1 )
      {
        $sfieldvalue = substr($sfieldvalue,0,index($sfieldvalue,$char))."=". substr($sfieldvalue,index($sfieldvalue,$char)+3,8000);
       # sinput = sinput.Trim();

      }


    }
   }


    my $char = '%2F';
   if( index($sfieldvalue,$char) gt -1 )
   {

    while( index($sfieldvalue,$char) > -1 )
    {

     if( index($sfieldvalue,$char) > -1 )
      {
        $sfieldvalue = substr($sfieldvalue,0,index($sfieldvalue,$char))."/". substr($sfieldvalue,index($sfieldvalue,$char)+3,8000);
       # sinput = sinput.Trim();

      }


    }
   }
   
    my $char = '%2B';
   if( index($sfieldvalue,$char) gt -1 )
   {

    while( index($sfieldvalue,$char) > -1 )
    {

     if( index($sfieldvalue,$char) > -1 )
      {
        $sfieldvalue = substr($sfieldvalue,0,index($sfieldvalue,$char))."+". substr($sfieldvalue,index($sfieldvalue,$char)+3,8000);
       # sinput = sinput.Trim();

      }


    }
   }
   

   my $char = '%3E';
   if( index($sfieldvalue,$char) gt -1 )
   {

    while( index($sfieldvalue,$char) > -1 )
    {

     if( index($sfieldvalue,$char) > -1 )
      {
        $sfieldvalue = substr($sfieldvalue,0,index($sfieldvalue,$char)).">". substr($sfieldvalue,index($sfieldvalue,$char)+3,8000);
       # sinput = sinput.Trim();

      }


    }
   }

    my $char = '%3F';
   if( index($sfieldvalue,$char) gt -1 )
   {

    while( index($sfieldvalue,$char) > -1 )
    {

     if( index($sfieldvalue,$char) > -1 )
      {
        $sfieldvalue = substr($sfieldvalue,0,index($sfieldvalue,$char))."?". substr($sfieldvalue,index($sfieldvalue,$char)+3,8000);
       # sinput = sinput.Trim();

      }


    }
   }
    my $char = '%24';
   if( index($sfieldvalue,$char) gt -1 )
   {

    while( index($sfieldvalue,$char) > -1 )
    {

     if( index($sfieldvalue,$char) > -1 )
      {
        $sfieldvalue = substr($sfieldvalue,0,index($sfieldvalue,$char))."\$". substr($sfieldvalue,index($sfieldvalue,$char)+3,8000);
       # sinput = sinput.Trim();

      }


    }
   }
   
   
    my $char = '%25';
   if( index($sfieldvalue,$char) gt -1 )
   {

    while( index($sfieldvalue,$char) > -1 )
    {

     if( index($sfieldvalue,$char) > -1 )
      {
        $sfieldvalue = substr($sfieldvalue,0,index($sfieldvalue,$char))."%". substr($sfieldvalue,index($sfieldvalue,$char)+3,8000);
       # sinput = sinput.Trim();

      }


    }
   }
   
    my $char = '%7C';
   if( index($sfieldvalue,$char) gt -1 )
   {

    while( index($sfieldvalue,$char) > -1 )
    {

     if( index($sfieldvalue,$char) > -1 )
      {
        $sfieldvalue = substr($sfieldvalue,0,index($sfieldvalue,$char))."|". substr($sfieldvalue,index($sfieldvalue,$char)+3,8000);
       # sinput = sinput.Trim();

      }


    }
   }
   my $char = '%85';
   if( index($sfieldvalue,$char) gt -1 )
   {

    while( index($sfieldvalue,$char) > -1 )
    {

     if( index($sfieldvalue,$char) > -1 )
      {
        $sfieldvalue = substr($sfieldvalue,0,index($sfieldvalue,$char))."…". substr($sfieldvalue,index($sfieldvalue,$char)+3,8000);
       # sinput = sinput.Trim();

      }


    }
   }
     my $char = '%96';
   if( index($sfieldvalue,$char) gt -1 )
   {

    while( index($sfieldvalue,$char) > -1 )
    {

     if( index($sfieldvalue,$char) > -1 )
      {
        $sfieldvalue = substr($sfieldvalue,0,index($sfieldvalue,$char))."–". substr($sfieldvalue,index($sfieldvalue,$char)+3,8000);
       # sinput = sinput.Trim();

      }


    }
   }
   
    my $char = '%92';
   if( index($sfieldvalue,$char) gt -1 )
   {

    while( index($sfieldvalue,$char) > -1 )
    {

     if( index($sfieldvalue,$char) > -1 )
      {
        $sfieldvalue = substr($sfieldvalue,0,index($sfieldvalue,$char))."'". substr($sfieldvalue,index($sfieldvalue,$char)+3,8000);
       # sinput = sinput.Trim();

      }


    }
   }
   
    my $char = '%40';
   if( index($sfieldvalue,$char) gt -1 )
   {

    while( index($sfieldvalue,$char) > -1 )
    {

     if( index($sfieldvalue,$char) > -1 )
      {
        $sfieldvalue = substr($sfieldvalue,0,index($sfieldvalue,$char))."@". substr($sfieldvalue,index($sfieldvalue,$char)+3,8000);
       # sinput = sinput.Trim();

      }


    }
   }
   
    my $char = '%2C';
   if( index($sfieldvalue,$char) gt -1 )
   {
    
    while( index($sfieldvalue,$char) > -1 )
    {
  
     if( index($sfieldvalue,$char) > -1 )
      {
        $sfieldvalue = substr($sfieldvalue,0,index($sfieldvalue,$char)).",". substr($sfieldvalue,index($sfieldvalue,$char)+3,8000);
       # sinput = sinput.Trim();

      }


    }
   }
   
   
    my $char = '%26';
   if( index($sfieldvalue,$char) gt -1 )
   {

    while( index($sfieldvalue,$char) > -1 )
    {

     if( index($sfieldvalue,$char) > -1 )
      {
        $sfieldvalue = substr($sfieldvalue,0,index($sfieldvalue,$char))."&". substr($sfieldvalue,index($sfieldvalue,$char)+3,8000);
       # sinput = sinput.Trim();

      }


    }
   }
   
   my $char = '%23';
   if( index($sfieldvalue,$char) gt -1 )
   {

    while( index($sfieldvalue,$char) > -1 )
    {

     if( index($sfieldvalue,$char) > -1 )
      {
        $sfieldvalue = substr($sfieldvalue,0,index($sfieldvalue,$char))."#". substr($sfieldvalue,index($sfieldvalue,$char)+3,8000);
       # sinput = sinput.Trim();

      }


    }
   }
   
   my $char = '%3B';
   if( index($sfieldvalue,$char) gt -1 )
   {

    while( index($sfieldvalue,$char) > -1 )
    {

     if( index($sfieldvalue,$char) > -1 )
      {
        $sfieldvalue = substr($sfieldvalue,0,index($sfieldvalue,$char)).";". substr($sfieldvalue,index($sfieldvalue,$char)+3,8000);
       # sinput = sinput.Trim();

      }


    }
   }
   
  
    push(@afields, $sfield);
    push(@afieldvalues, $sfieldvalue);

    
    }
  
  

  
  
  if( substr($pair,0,7) eq "LESSON-" )
     {
       
        my($insertstudentno) = "";
        my($insertlessonno) = "";
        my($insertgrade) = "";
        my($idollars) = "0";
       
       my($insertclass) = "";
       
        $insertstudentno = substr($pair,7,index($pair,"=")-7);        
        
        $insertlessonno = $slessonno;

        $insertgrade = substr($pair,index($pair,"=")+1,5);  


 
my($lgrade) = "F";

if( $insertgrade < 0 )
{
    $lgrade = "NA";
}
if( $insertgrade > 97 )
{
    $lgrade = "A+";
}

if( $insertgrade > 93 && ($insertgrade < 98 ))
{
    $lgrade = "A";
}

if( ($insertgrade > 89 ) && ($insertgrade < 94 ))
{
    $lgrade = "A-";
}

if( ($insertgrade > 87 ) && ($insertgrade < 90 ))
{
    $lgrade = "B+";
}
             
if( ($insertgrade > 83 ) && ($insertgrade < 88 ))
{
    $lgrade = "B";
}

if( ($insertgrade > 79 ) && ($insertgrade < 84 ))
{
    $lgrade = "B-";
}

if( ($insertgrade > 77 ) && ($insertgrade < 80 ))
{
    $lgrade = "C+";
}
             
if( ($insertgrade > 73 ) && ($insertgrade < 78 ))
{
    $lgrade = "C";
}

if( ($insertgrade > 69 ) && ($insertgrade < 74 ))
{
    $lgrade = "C-";
}
if( ($insertgrade > 67 ) && ($insertgrade < 70 ))
{
    $lgrade = "D+";
}
             
if( ($insertgrade > 63 ) && ($insertgrade < 68 ))
{
    $lgrade = "D";
}

if( ($insertgrade > 59 ) && ($insertgrade < 64 ))
{
    $lgrade = "D-";
}

 my($sqlcommand) = "SELECT NOOFTIMES, REWARDDOLLARS FROM LESSON WHERE LESSONNO = $slessonno";

       #print("$sqlcommand<br>");
       $connection->Sql("$sqlcommand");

       my($returnvalue) = "";
       $connection->FetchRow();


       my($rewarddollars) = $connection->Data("REWARDDOLLARS");
if( substr($lgrade, 0,1) eq "A" )
{
   $idollars = $rewarddollars;
}



      my($sqlcommand) = "UPDATE STUDLESS SET DOLLARPOINTS = $idollars, [PERCENT] = '$insertgrade' , GRADE = '$lgrade' WHERE STUDENTNO =  $insertstudentno  AND LESSONNO = $insertlessonno";
      #print("$sqlcommand");
      $connection->Sql("$sqlcommand"); 
 
 



 
 
 
 
$sqlcommand = "SELECT AVG([PERCENT]) AS PGRADE FROM STUDLESS WHERE ATTEMPTS > 0 AND [PERCENT] > -1 AND STUDENTNO = $insertstudentno  AND CLASSNO = $sclassno";



$connection->Sql("$sqlcommand"); 
       
my($returnvalue) = "";
$connection->FetchRow();
   
my($pgrade) = $connection->Data("PGRADE"); 


$lgrade = "F";

if( $pgrade < 0 )
{
    $lgrade = "NA";
}

if( $pgrade > 97 )
{
    $lgrade = "A+";
}

if( $pgrade > 93 && ($pgrade < 98 ))
{
    $lgrade = "A";
}

if( ($pgrade > 89 ) && ($pgrade < 94 ))
{
    $lgrade = "A-";
}

if( ($pgrade > 87 ) && ($pgrade < 90 ))
{
    $lgrade = "B+";
}
             
if( ($pgrade > 83 ) && ($pgrade < 88 ))
{
    $lgrade = "B";
}

if( ($pgrade > 79 ) && ($pgrade < 84 ))
{
    $lgrade = "B-";
}

if( ($pgrade > 77 ) && ($pgrade < 80 ))
{
    $lgrade = "C+";
}
             
if( ($pgrade > 73 ) && ($pgrade < 78 ))
{
    $lgrade = "C";
}

if( ($pgrade > 69 ) && ($pgrade < 74 ))
{
    $lgrade = "C-";
}
if( ($pgrade > 67 ) && ($pgrade < 70 ))
{
    $lgrade = "D+";
}
             
if( ($pgrade > 63 ) && ($pgrade < 68 ))
{
    $lgrade = "D";
}

if( ($pgrade > 59 ) && ($pgrade < 64 ))
{
    $lgrade = "D-";
}

my($convert) = substr($pgrade,0,index($pgrade,'.')+3);




my($sqlcommand) = "UPDATE STUDCLAS SET DOLLARPOINTS = DOLLARPOINTS + $idollars, [PERCENT] = '$pgrade', LETTERGRADE = '$lgrade' WHERE STUDENTNO = '$insertstudentno' AND CLASSNO = '$sclassno'";

#print("1 $sqlcommand");

$connection->Sql("$sqlcommand"); 
             


 
      } 
  if( substr($pair,0,11) eq "UPDATETEAM-" )
{
   my($insertstudentno) = "";
        my($insertlessonno) = "";
        my($insertseat) = "";

       my($insertclass) = "";
       #UPDATECLASS-813679*4003
       #UPDATESEAT-816660*4003
        $insertstudentno = substr($pair,11,index($pair,"*")-11);

        $insertclassno = substr($pair,index($pair,"*")+1,index($pair,"=")-index($pair,"*")-1);

        $insertseat = substr($pair,index($pair,"=")+1,25);

        if( $insertseat ne "")
        {
          my($sqlcommand) = "UPDATE STUDCLAS SET TEAM = '$insertseat' WHERE STUDENTNO =  $insertstudentno  AND CLASSNO = $insertclassno";
          #print("$sqlcommand");
          $connection->Sql("$sqlcommand");
        }
}
  
  
  
if( substr($pair,0,11) eq "UPDATESEAT-" )
{  
   my($insertstudentno) = "";
        my($insertlessonno) = "";
        my($insertseat) = "";
       
       my($insertclass) = "";
       #UPDATECLASS-813679*4003
       #UPDATESEAT-816660*4003
        $insertstudentno = substr($pair,11,index($pair,"*")-11);        
        
        $insertclassno = substr($pair,index($pair,"*")+1,index($pair,"=")-index($pair,"*")-1);

        $insertseat = substr($pair,index($pair,"=")+1,5);  
        
        if( $insertseat ne "")
        {
          my($sqlcommand) = "UPDATE STUDCLAS SET SEAT = '$insertseat' WHERE STUDENTNO =  $insertstudentno  AND CLASSNO = $insertclassno";
          #print("$sqlcommand");
          $connection->Sql("$sqlcommand"); 
        }
}  

if( substr($pair,0,17) eq "UPDATECLASSGRADES" )
     {
       
        my($insertstudentno) = "";
        my($insertlessonno) = "";
        my($insertgrade) = "";
        my($idollars) = "0";
       my($insertclass) = "";
       #UPDATECLASS-813679*4003
        $insertstudentno = substr($pair,12,index($pair,"*")-12);        
        
        $insertlessonno = substr($pair,index($pair,"-")+1,index($pair,"=")-index($pair,"-")-1);

        $insertgrade = substr($pair,index($pair,"=")+1,5);  
  

      #my($sqlcommand) = "UPDATE STUDLESS SET [PERCENT] = $insertgrade WHERE STUDENTNO =  $insertstudentno  AND LESSONNO = $insertlessonno";
      #print("$sqlcommand");
      #$connection->Sql("$sqlcommand"); 
 
 
#$sqlcommand = "SELECT AVG([PERCENT]) AS PGRADE FROM STUDLESS WHERE [PERCENT] > -1 ANDSTUDENTNO = $insertstudentno  AND CLASSNO = $sclassno";



#$connection->Sql("$sqlcommand"); 
       
my($returnvalue) = "";
#$connection->FetchRow();
   
my($pgrade) = $insertgrade; 


my($lgrade) = "F";

if( $pgrade < 0 )
{
    $lgrade = "NA";
}

if( $pgrade > 97 )
{
    $lgrade = "A+";
}

if( $pgrade > 93 && ($pgrade < 98 ))
{
    $lgrade = "A";
}

if( ($pgrade > 89 ) && ($pgrade < 94 ))
{
    $lgrade = "A-";
}

if( ($pgrade > 87 ) && ($pgrade < 90 ))
{
    $lgrade = "B+";
}
             
if( ($pgrade > 83 ) && ($pgrade < 88 ))
{
    $lgrade = "B";
}

if( ($pgrade > 79 ) && ($pgrade < 84 ))
{
    $lgrade = "B-";
}

if( ($pgrade > 77 ) && ($pgrade < 80 ))
{
    $lgrade = "C+";
}
             
if( ($pgrade > 73 ) && ($pgrade < 78 ))
{
    $lgrade = "C";
}

if( ($pgrade > 69 ) && ($pgrade < 74 ))
{
    $lgrade = "C-";
}
if( ($pgrade > 67 ) && ($pgrade < 70 ))
{
    $lgrade = "D+";
}
             
if( ($pgrade > 63 ) && ($pgrade < 68 ))
{
    $lgrade = "D";
}

if( ($pgrade > 59 ) && ($pgrade < 64 ))
{
    $lgrade = "D-";
}



my($convert) = substr($pgrade,0,index($pgrade,'.')+3);




my($sqlcommand) = "UPDATE STUDCLAS SET [PERCENT] = '$pgrade', LETTERGRADE = '$lgrade' WHERE STUDENTNO = '$insertstudentno' AND CLASSNO = '$sclassno'";

#print("2 $sqlcommand");

$connection->Sql("$sqlcommand"); 
             



 
      } 
my($insertgrade2) = "";
 $insertgrade2 = substr($pair,index($pair,"=")+1,1);
 
   if( (substr($pair,0,9) eq "LISTGRADE") && ( $insertgrade2 ne "0" ))
     {
       
        my($insertstudentno) = "";
        my($insertlessonno) = "";
        my($insertgrade) = "";
        my($idollars) = "0";
        my($insertclass) = "";
       
        $insertstudentno = substr($pair,9,index($pair,"-")-9);        
        
        $insertlessonno = substr($pair,index($pair,"-")+1,index($pair,"=")-index($pair,"-")-1);

        $insertgrade = substr($pair,index($pair,"=")+1,5);  

         my($sqlcommand) = "SELECT NOOFTIMES, REWARDDOLLARS FROM LESSON WHERE LESSONNO = $slessonno";

       #print("$sqlcommand<br>");
       $connection->Sql("$sqlcommand");

       my($returnvalue) = "";
       $connection->FetchRow();


       my($rewarddollars) = $connection->Data("REWARDDOLLARS");


if( $insertgrade > 89 )
{
   $idollars = $rewarddollars;
}



my($lgrade) = "F";
my($pgrade) = $insertgrade;
if( $pgrade < 0 )
{
    $lgrade = "NA";
}

if( $pgrade > 97 )
{
    $lgrade = "A+";
}

if( $pgrade > 93 && ($pgrade < 98 ))
{
    $lgrade = "A";
}

if( ($pgrade > 89 ) && ($pgrade < 94 ))
{
    $lgrade = "A-";
}

if( ($pgrade > 87 ) && ($pgrade < 90 ))
{
    $lgrade = "B+";
}

if( ($pgrade > 83 ) && ($pgrade < 88 ))
{
    $lgrade = "B";
}

if( ($pgrade > 79 ) && ($pgrade < 84 ))
{
    $lgrade = "B-";
}

if( ($pgrade > 77 ) && ($pgrade < 80 ))
{
    $lgrade = "C+";
}

if( ($pgrade > 73 ) && ($pgrade < 78 ))
{
    $lgrade = "C";
}

if( ($pgrade > 69 ) && ($pgrade < 74 ))
{
    $lgrade = "C-";
}
if( ($pgrade > 67 ) && ($pgrade < 70 ))
{
    $lgrade = "D+";
}

if( ($pgrade > 63 ) && ($pgrade < 68 ))
{
    $lgrade = "D";
}

if( ($pgrade > 59 ) && ($pgrade < 64 ))
{
    $lgrade = "D-";
}




      my($sqlcommand) = "UPDATE STUDLESS SET DOLLARPOINTS = '$idollars', [PERCENT] = $insertgrade , GRADE = '$lgrade' WHERE STUDENTNO =  $insertstudentno  AND LESSONNO = $insertlessonno";
      #print("$sqlcommand");
      $connection->Sql("$sqlcommand"); 
      
      
      if( $insertgrade > 0 )
{
      my($sqlcommand) = "UPDATE STUDLESS SET ACTIVE = 1, ATTEMPTS = 1 WHERE STUDENTNO =  $insertstudentno  AND LESSONNO = $insertlessonno AND ATTEMPTS = 0";
      $connection->Sql("$sqlcommand");

}
 
 
$sqlcommand = "SELECT AVG([PERCENT]) AS PGRADE FROM STUDLESS WHERE  ATTEMPTS > 0 AND [PERCENT] > -1 AND STUDENTNO = $insertstudentno  AND CLASSNO = $sclassno";



$connection->Sql("$sqlcommand"); 
       
my($returnvalue) = "";
$connection->FetchRow();
   
my($pgrade) = $connection->Data("PGRADE"); 


my($lgrade) = "F";

if( $pgrade < 0 )
{
    $lgrade = "NA";
}

if( $pgrade > 97 )
{
    $lgrade = "A+";
}

if( $pgrade > 93 && ($pgrade < 98 ))
{
    $lgrade = "A";
}

if( ($pgrade > 89 ) && ($pgrade < 94 ))
{
    $lgrade = "A-";
}

if( ($pgrade > 87 ) && ($pgrade < 90 ))
{
    $lgrade = "B+";
}
             
if( ($pgrade > 83 ) && ($pgrade < 88 ))
{
    $lgrade = "B";
}

if( ($pgrade > 79 ) && ($pgrade < 84 ))
{
    $lgrade = "B-";
}

if( ($pgrade > 77 ) && ($pgrade < 80 ))
{
    $lgrade = "C+";
}
             
if( ($pgrade > 73 ) && ($pgrade < 78 ))
{
    $lgrade = "C";
}

if( ($pgrade > 69 ) && ($pgrade < 74 ))
{
    $lgrade = "C-";
}
if( ($pgrade > 67 ) && ($pgrade < 70 ))
{
    $lgrade = "D+";
}
             
if( ($pgrade > 63 ) && ($pgrade < 68 ))
{
    $lgrade = "D";
}

if( ($pgrade > 59 ) && ($pgrade < 64 ))
{
    $lgrade = "D-";
}



my($convert) = substr($pgrade,0,index($pgrade,'.')+3);



my($sqlcommand) = "UPDATE STUDCLAS SET DOLLARPOINTS = DOLLARPOINTS + $idollars, [PERCENT] = '$pgrade', LETTERGRADE = '$lgrade' WHERE STUDENTNO = '$insertstudentno' AND CLASSNO = '$sclassno'";

#print("3 $sqlcommand");

$connection->Sql("$sqlcommand"); 
             



 
      } 
      else
      {

   if( substr($pair,0,12) eq "GRADESUPDATE" )
     {
       
        my($insertstudentno) = "";
        my($insertlessonno) = "";
        my($insertgrade) = "";
       
       my($insertclass) = "";
       
        $insertstudentno = substr($pair,12,index($pair,"-")-12);        
        
        $insertlessonno = substr($pair,index($pair,"-")+1,index($pair,"=")-index($pair,"-")-1);

        $insertgrade = substr($pair,index($pair,"=")+1,5);  
  


my($lgrade) = "F";

if( $insertgrade < 0 )
{
    $lgrade = "NA";
}

if( $insertgrade > 97 )
{
    $lgrade = "A+";
}

if( $insertgrade > 93 && ($insertgrade < 98 ))
{
    $lgrade = "A";
}

if( ($insertgrade > 89 ) && ($insertgrade < 94 ))
{
    $lgrade = "A-";
}

if( ($insertgrade > 87 ) && ($insertgrade < 90 ))
{
    $lgrade = "B+";
}
             
if( ($insertgrade > 83 ) && ($insertgrade < 88 ))
{
    $lgrade = "B";
}

if( ($insertgrade > 79 ) && ($insertgrade < 84 ))
{
    $lgrade = "B-";
}

if( ($insertgrade > 77 ) && ($insertgrade < 80 ))
{
    $lgrade = "C+";
}
             
if( ($insertgrade > 73 ) && ($insertgrade < 78 ))
{
    $lgrade = "C";
}

if( ($insertgrade > 69 ) && ($insertgrade < 74 ))
{
    $lgrade = "C-";
}
if( ($insertgrade > 67 ) && ($insertgrade < 70 ))
{
    $lgrade = "D+";
}
             
if( ($insertgrade > 63 ) && ($insertgrade < 68 ))
{
    $lgrade = "D";
}

if( ($insertgrade > 59 ) && ($insertgrade < 64 ))
{
    $lgrade = "D-";
}


         my($sqlcommand) = "SELECT NOOFTIMES, REWARDDOLLARS FROM LESSON WHERE LESSONNO = $slessonno";

       #print("$sqlcommand<br>");
       $connection->Sql("$sqlcommand");

       my($returnvalue) = "";
       $connection->FetchRow();


       my($rewarddollars) = $connection->Data("REWARDDOLLARS");


if( $insertgrade > 89 )
{
   $idollars = $rewarddollars;
}

       #BACKHERE
if( $insertgrade > 0 )
{
      my($sqlcommand) = "UPDATE STUDLESS SET ACTIVE = 1, ATTEMPTS = 1 WHERE STUDENTNO =  $insertstudentno  AND LESSONNO = $insertlessonno AND ATTEMPTS = 0";
      $connection->Sql("$sqlcommand");
      #print(" <span class=style5>  $sqlcommand</style5> </br>");
}

my($sqlcommand) = "UPDATE STUDLESS SET DOLLARPOINTS = '$idollars', [PERCENT] = $insertgrade, GRADE = '$lgrade'  WHERE STUDENTNO =  $insertstudentno  AND LESSONNO = $insertlessonno";
$connection->Sql("$sqlcommand");
 
$sqlcommand = "SELECT AVG([PERCENT]) AS PGRADE FROM STUDLESS WHERE  ATTEMPTS > 0 AND [PERCENT] > -1 AND STUDENTNO = $insertstudentno  AND CLASSNO = $sclassno";

$connection->Sql("$sqlcommand");
       
my($returnvalue) = "";
$connection->FetchRow();
   

my($pgrade) = $connection->Data("PGRADE"); 





$pgrade = substr($pgrade,0,index($pgrade,'.')+3);

$lgrade = "F";

if( $pgrade < 0 )
{
    $lgrade = "NA";
}

if( $pgrade > 97 )
{
    $lgrade = "A+";
}

if( $pgrade > 93 && ($pgrade < 98 ))
{
    $lgrade = "A";
}

if( ($pgrade > 89 ) && ($pgrade < 94 ))
{
    $lgrade = "A-";
}

if( ($pgrade > 87 ) && ($pgrade < 90 ))
{
    $lgrade = "B+";
}
             
if( ($pgrade > 83 ) && ($pgrade < 88 ))
{
    $lgrade = "B";
}

if( ($pgrade > 79 ) && ($pgrade < 84 ))
{
    $lgrade = "B-";
}

if( ($pgrade > 77 ) && ($pgrade < 80 ))
{
    $lgrade = "C+";
}
             
if( ($pgrade > 73 ) && ($pgrade < 78 ))
{
    $lgrade = "C";
}

if( ($pgrade > 69 ) && ($pgrade < 74 ))
{
    $lgrade = "C-";
}
if( ($pgrade > 67 ) && ($pgrade < 70 ))
{
    $lgrade = "D+";
}
             
if( ($pgrade > 63 ) && ($pgrade < 68 ))
{
    $lgrade = "D";
}

if( ($pgrade > 59 ) && ($pgrade < 64 ))
{
    $lgrade = "D-";
}




$sqlcommand = "SELECT SUM(DOLLARPOINTS) AS SUMDOLLARS FROM STUDLESS WHERE  ATTEMPTS > 0 AND [PERCENT] > -1 AND STUDENTNO = $insertstudentno  AND CLASSNO = $sclassno";

$connection->Sql("$sqlcommand");

my($returnvalue) = "";
$connection->FetchRow();


$idollars = $connection->Data("SUMDOLLARS");





my($sqlcommand) = "UPDATE STUDCLAS SET DOLLARPOINTS= $idollars,[PERCENT] = '$pgrade', LETTERGRADE = '$lgrade' WHERE STUDENTNO = '$insertstudentno' AND CLASSNO = '$sclassno'";



$connection->Sql("$sqlcommand");
             



 }
      } 
    
    if( substr($pair,0,8) eq "LOADFORM" )
    {


     if( substr($pair,9,8) eq "INACTIVE" )
     {
      
      if( $sactive eq "Y" )
      {
         $sactive = "N";
      }
      else
      {
        $sactive = "Y";
       
      }
      
      
      
      
      my($sqlcommand) = "UPDATE STUDCLAS SET ACTIVE = '$sactive' WHERE STUDENTNO = $sstudentno AND CLASSNO = $sclassno";
      #print("$sqlcommand");
      $connection->Sql("$sqlcommand"); 
 
      }


if( substr($pair,9,9) eq "ASSIGNALL" )
     {
      
      
       my($sqlcommand) = "SELECT STUDENTNO FROM CLASSLISTING WHERE CLASSNO = '$sclassno' AND ACTIVE = 'Y' ";
   #fixit
   #print("$sqlcommand");
   $connection->Sql("$sqlcommand");
    
 
    #my(row) = $connection->Data;
      
   
   my($tempstud) = ""; 
   my($returnvalue) = "  ~";
   my($sqlcommand2) = "";
   


  my($tm) = localtime;
  my($sdatecurrent) = sprintf("%02d-%02d-%04d",($tm->mon)+1, $tm->mday, $tm->year+1900);


   while ($connection->FetchRow())
   {
	    $tempstud = $connection->Data("STUDENTNO");
      $sqlcommand2 = "INSERT INTO STUDLESS (STUDENTNO,LESSONNO,CLASSNO,ACTIVE,DATETIME,GRADE) VALUES ($tempstud,$slessonno,$sclassno,'0','$sdatecurrent','NA')";
      #print("$sqlcommand2");
      $connection2->Sql("$sqlcommand2"); 
        

    }
 
 
      
    
 
      }
      
      if( substr($pair,9,11) eq "ADDSTUDENTS" )
     {


       my($sqlcommand) = "SELECT STUDENTNO, GRADE,PERIOD FROM STUDCLAS WHERE CLASSNO = '$addstudentsbyclass' AND ACTIVE = 'Y' ";
   #fixit
   #print("$sqlcommand");
   $connection->Sql("$sqlcommand");


    #my(row) = $connection->Data;


   my($tempstud) = "";
   my($returnvalue) = "  ~";
   my($sqlcommand2) = "";



  my($tm) = localtime;
  my($sdatecurrent) = sprintf("%02d-%02d-%04d",($tm->mon)+1, $tm->mday, $tm->year+1900);


   while ($connection->FetchRow())
   {
	    $tempstud = $connection->Data("STUDENTNO");
       $tempgrade = $connection->Data("GRADE");
         $tempperiod = $connection->Data("PERIOD");
      $sqlcommand2 = "INSERT INTO STUDCLAS (STUDENTNO,CLASSNO,GRADE,PERIOD,ACTIVE) VALUES ($tempstud,$sclassno,'$tempgrade','$tempperiod','Y')";
      #print("$sqlcommand2");
      $connection2->Sql("$sqlcommand2");


    }





      }
      
     if( substr($pair,9,7) eq "REPLACE" )
     {

        my($sqlcommand) = "UPDATE CLASS SET TEACHERNO = '$steacherno' WHERE TEACHERNO = '$sreplaceteacher' ";
        #print("$sqlcommand");
        $connection->Sql("$sqlcommand");



     }
      
      
      
      
       if( substr($pair,9,10) eq "COPYLESSON" )   # CHECK THIS
     {

   #my($sqlcommand) = "UPDATE  WHERE CLASSNO = '$sclassno' AND ACTIVE = 'Y' ";
   #fixit
   #print("$sqlcommand");
   #$connection->Sql("$sqlcommand");



       my($sqlcommand) = "SELECT STUDENTNO FROM CLASSLISTING WHERE CLASSNO = '$sclassno' AND ACTIVE = 'Y' ";
   #fixit
   #print("$sqlcommand");
   $connection->Sql("$sqlcommand");


    #my(@datarow) = $connection->Data;


   my($tempstud) = "";
   my($returnvalue) = "  ~";
   my($sqlcommand2) = "";

    my($tm) = localtime;
  my($sdatecurrent) = sprintf("%02d-%02d-%04d",($tm->mon)+1, $tm->mday, $tm->year+1900);



   while ($connection->FetchRow())
   {
	    $tempstud = $connection->Data("STUDENTNO");
      $sqlcommand2 = "INSERT INTO STUDLESS (STUDENTNO,LESSONNO,CLASSNO,ACTIVE,DATETIME) VALUES ($tempstud,$slessonno,$sclassno,'1','$sdatecurrent')";
      #print("$sqlcommand2");
      $connection2->Sql("$sqlcommand2");


    }





      }


     if( substr($pair,9,4) eq "SAVE" )
     {
      $y = 0;
      
      my($is1) = "0";
      my($is2) = "0";
      my($is3) = "0";
      my($is4) = "0";
      my($sinsertstudentno) = "";
      foreach $sfield (@afields)
      {
        if( $y > 0 &&  @afieldvalues[$y] ne "NONE" )
        {
          $sdatastring = "$sdatastring, ";
        }

        if( $sfield eq "CORRECT1" )
        {
           if( @afieldvalues[$y] eq "on" )
           {
              @afieldvalues[$y] = "1";
              $is1 = "1";
           }
        }
        if( $sfield eq "CORRECT2" )
        {
           if( @afieldvalues[$y] eq "on" )
           {
              @afieldvalues[$y] = "1";
              $is2 = "2";
           }
        }
        if( $sfield eq "CORRECT3" )
        {
           if( @afieldvalues[$y] eq "on" )
           {
              @afieldvalues[$y] = "1";
              $is3 = "3";
           }
        }
        if( $sfield eq "CORRECT4" )
        {
           if( @afieldvalues[$y] eq "on" )
           {
              @afieldvalues[$y] = "1";
              $is4 = "4";
           }
        }

        if( @afieldvalues[$y] ne "NONE" )
        {
          $sdatastring = "$sdatastring $sfield = '@afieldvalues[$y]'";
        }
        else
        {
          #print("$sfield - @afieldvalues[$y]");
        }
        
        

        $y=$y+1;
      }  
      if( $stable eq "ANSWER" )
      {
        if( $is1 eq "0" )
        {
           $sdatastring = "$sdatastring, CORRECT1 = '0'";
        }
        if( $is2 eq "0" )
        {
           $sdatastring = "$sdatastring, CORRECT2 = '0'";
        }
        if( $is3 eq "0" )
        {
           $sdatastring = "$sdatastring, CORRECT3 = '0'";
        }
        if( $is4 eq "0" )
        {
           $sdatastring = "$sdatastring, CORRECT4 = '0'";
        }
      
      
      }




       my($sqlcommand) = "SELECT $swhere FROM $stable WHERE $swhere = '$swherekey'";

       #print("$sqlcommand");
       $connection->Sql("$sqlcommand");

       my($scheckwhere) = "";
      $connection->FetchRow();

       my($scheckwhere) = $connection->Data("$swhere");

      if( $scheckwhere ne "" )
      {
         $sdatastring =~ s/\s+/ /g;
         my($sqlcommand) = "UPDATE $stable SET $sdatastring WHERE $swhere = '$swherekey'";
        #print("$sqlcommand");
         $connection->Sql("$sqlcommand");
      }
      
      }
      
      if( substr($pair,9,6) eq "IMPORT" )
     {
      $y = 0;
      my($sdatastring2) = "";
      my($soldlessonno) = "";
      my($slessondesc) = "";
      my($soldquestionno) = "";
      
      foreach $sfield (@afields)
      {

        
        if( $sfield ne "OLDLESSONNO" )
        {
          if( $y > 0 )
          {
          $sdatastring = "$sdatastring, ";
          $sdatastring2 = "$sdatastring2, ";
          }


         $sdatastring = "$sdatastring $sfield ";
         $sdatastring2 = "$sdatastring2 '@afieldvalues[$y]'";
        }
        else
        {


             $soldlessonno = @afieldvalues[$y];
        }
        #print("$sdatastring");

        if( $sfield eq "STUDENTNO" )
        {
          $sinsertstudentno = @afieldvalues[$y];

        }
         if( $sfield eq "LESSON" )
        {
          $slessondesc = @afieldvalues[$y];

        }
        
          if( $sfield eq "PREREQUISITE" )
        {
          $slessondesc = "";

        }


        $y=$y+1;
      }


      my($sqlcommand) = "INSERT INTO $stable ($sdatastring) VALUES ( $sdatastring2 )";
      #print("$sqlcommand <BR>");
      $connection->Sql("$sqlcommand");
      
      

      

      $sqlcommand = "SELECT MAX(LESSONNO) AS LESSONNO FROM LESSON WHERE CLASSNO = '$sclassno'";
      $connection->Sql("$sqlcommand");
       $connection->FetchRow();
       $slessonno = $connection->Data("LESSONNO");


       my($sqlcommand) = "UPDATE LESSON SET PERIOD = '$speriod' WHERE CLASSNO = '$sclassno' AND LESSONNO = 'slessonno'";
        $connection->Sql("$sqlcommand");


       $sqlcommand = "SELECT * FROM CONCEPT WHERE LESSONNO = '$soldlessonno'";
       $connection->Sql("$sqlcommand");
       #print("$sqlcommand <br>");
       while ($connection->FetchRow())
      {

        $sqlcommand2 = "INSERT INTO CONCEPT (CONCEPT,CONCEPTNO,LESSONNO,ORDERNO,FILENAME,FILETYPE,PAGENO,CLEARMOVIE,CLEARIMAGE,NARRMOVIE,TEXTCAPTION,TEXT,CLASSNO,MISORDERNO,STANDARDNO,ASSESSMENTQUESTION) VALUES ( '".$connection->Data("CONCEPT")."', '".$connection->Data("CONCEPTNO")."', '$slessonno', '".$connection->Data("ORDERNO")."',  '".$connection->Data("FILENAME")."', '".$connection->Data("FILETYPE")."', '".$connection->Data("PAGENO")."', '".$connection->Data("CLEARMOVIE")."', '".$connection->Data("CLEARIMAGE")."', '".$connection->Data("NARRMOVIE")."', '".$connection->Data("TEXTCAPTION")."', '".$connection->Data("TEXT")."', '$sclassno', '".$connection->Data("MISORDERNO")."', '".$connection->Data("STANDARDNO")."', '".$connection->Data("ASSESSMENTQUESTION")."')";

     #print("$sqlcommand2 <br>");
        $connection2->Sql("$sqlcommand2");

        $sqlcommand3 = "SELECT QUESTIONNO FROM CONCEPT WHERE LESSONNO = '$slessonno' AND CONCEPTNO = '".$connection->Data("CONCEPTNO")."'";
#print("$sqlcommand3 <br>");
        $connection3->Sql("$sqlcommand3");
        $connection3->FetchRow();
        $squestionno = $connection3->Data("QUESTIONNO");

         $sqlcommand3 = "SELECT QUESTIONNO FROM CONCEPT WHERE LESSONNO = '$soldlessonno' AND CONCEPTNO = '".$connection->Data("CONCEPTNO")."'";
#print("$sqlcommand3 <br>");
        $connection3->Sql("$sqlcommand3");
        $connection3->FetchRow();
        $soldquestionno = $connection3->Data("QUESTIONNO");


        $sqlcommand3 = "SELECT * FROM QUESTION WHERE QUESTIONNO = '$soldquestionno'";
        $connection3->Sql("$sqlcommand3");
        #print("$sqlcommand3 <br>");
        while ($connection3->FetchRow())
        {

          $sqlcommand4 = "INSERT INTO QUESTION (QUESTION,QUESTIONNO,QUESTTYPE,HINT,CONCEPTNO,LESSONNO,SHOWANSWER,CATEGORY1,CATEGORY2,LESSONLINK,IFWRONGGOTO,ORDERNO,CLASSNO) VALUES ( '".$connection3->Data("QUESTION")."', '$squestionno', '".$connection3->Data("QUESTTYPE")."',  '".$connection3->Data("HINT")."', '".$connection3->Data("CONCEPTNO")."', '$slessonno', '".$connection3->Data("SHOWANSWER")."', '".$connection3->Data("CATEGORY1")."', '".$connection3->Data("CATEGORY2")."', '".$connection3->Data("LESSONLINK")."', '".$connection3->Data("IFWRONGGOTO")."','".$connection3->Data("ORDERNO")."', '$sclassno')";
          #print("$sqlcommand4");
          $connection4->Sql("$sqlcommand4");

        }


        $sqlcommand3 = "SELECT * FROM ANSWER WHERE QUESTIONNO = '$soldquestionno'";
        $connection3->Sql("$sqlcommand3");
        #print("$sqlcommand3 <br>");
        while ($connection3->FetchRow())
        {

          $sqlcommand4 = "INSERT INTO ANSWER (ANSWER,QUESTIONNO,CHOICE1,CHOICE2,CHOICE3,CHOICE4,CORRECT1,CORRECT2,CORRECT3,CORRECT4,CONCEPTNO,LESSONNO,ANSWERTYPE1,ANSWERTYPEBUTTON,ORDERNO,ANSWERTYPE2,ANSWERTYPE3,ANSWERTYPE4,ANSWERLIST,CLASSNO) VALUES ( '".$connection3->Data("ANSWER")."', '$squestionno',  '".$connection3->Data("CHOICE1")."', '".$connection3->Data("CHOICE2")."', '".$connection3->Data("CHOICE3")."', '".$connection3->Data("CHOICE4")."', '".$connection3->Data("CORRECT1")."', '".$connection3->Data("CORRECT2")."', '".$connection3->Data("CORRECT3")."','".$connection3->Data("CORRECT4")."','".$connection3->Data("CONCEPTNO")."','$slessonno','".$connection3->Data("ANSWERTYPE1")."','".$connection3->Data("ANSWERTYPEBUTTON")."','".$connection3->Data("ORDERNO")."','".$connection3->Data("ANSWERTYPE2")."','".$connection3->Data("ANSWERTYPE3")."','".$connection3->Data("ANSWERTYPE4")."','".$connection3->Data("ANSWERLIST")."','$sclassno')";
          #print("$sqlcommand4");
          $connection4->Sql("$sqlcommand4");

        }




      }
      
      

      
      
      
      
       }
      if( substr($pair,9,13) eq "CONCEPTINSERT" )
     {
      $y = 0;
      my($sdatastring2) = "";
      foreach $sfield (@afields)
      {
        if( $y > 0 )
        {
          $sdatastring = "$sdatastring, ";
          $sdatastring2 = "$sdatastring2, ";
        }
        
        
        
        
        $sdatastring = "$sdatastring $sfield ";




        $sdatastring2 = "$sdatastring2 '@afieldvalues[$y]'";
        $sdatastring2 =~ s/\s+/ /g;
        #print("$sdatastring");




        $y=$y+1;
      }


      my($sqlcommand) = "INSERT INTO $stable ($sdatastring) VALUES ( $sdatastring2 )";
     #print("$sqlcommand");
      $connection->Sql("$sqlcommand");


        #print("$sqlcommand");




      }
      
      
      
       if( substr($pair,9,6) eq "INSERT" )
     {
      $y = 0;
      my($sdatastring2) = "";
      foreach $sfield (@afields)
      {
        if( $y > 0 )
        {
          $sdatastring = "$sdatastring, ";
          $sdatastring2 = "$sdatastring2, ";
        }
        $sdatastring = "$sdatastring $sfield ";
        $sdatastring2 = "$sdatastring2 '@afieldvalues[$y]'";
        #print("$sdatastring");

        if( $sfield eq "STUDENTNO" )
        {
          $sinsertstudentno = @afieldvalues[$y];

        }


        $y=$y+1;
      }


      my($sqlcommand) = "INSERT INTO $stable ($sdatastring) VALUES ( $sdatastring2 )";
      #print("$sqlcommand");
      $connection->Sql("$sqlcommand");

       if( $stable eq "STUDENT" )
       {
        my($sqlcommand) = "INSERT INTO STUDCLAS (STUDENTNO,CLASSNO,PERIOD) VALUES ( '$sinsertstudentno', '$sclassno', '$speriod' )";
     #print("$sqlcommand");
      $connection->Sql("$sqlcommand");
       }

      }
      
      

      
       if( substr($pair,9,11) eq "HOMEWORKADD" )
     {
      $y = 0;
      my($sdatastring2) = "";
      my($sdesc) = "No Description - Homework";
      foreach $sfield (@afields)
      {
        if( $y > 0 )
        {
          $sdatastring = "$sdatastring, ";
          $sdatastring2 = "$sdatastring2, ";
        }
        $sdatastring = "$sdatastring $sfield ";
        $sdatastring2 = "$sdatastring2 '@afieldvalues[$y]'";
        #print("$sdatastring");
        
        if( $sfield eq "STUDENTNO" )
        {
          $sinsertstudentno = @afieldvalues[$y];
         
        }
        
        if( $sfield eq "COMMENTS" )
        {
          $sdesc = @afieldvalues[$y];
         
        }
        
        $y=$y+1;
      }  


      my($sqlcommand) = "INSERT INTO $stable ($sdatastring) VALUES ( $sdatastring2 )";
     #print("$sqlcommand");
      $connection->Sql("$sqlcommand"); 
      
      
       my($sqlcommand) = "SELECT STUDENTNO FROM CLASSLISTING WHERE CLASSNO = '$sclassno'";
   #fixit
   #print("$sqlcommand");
   $connection->Sql("$sqlcommand");
    
 
    #my(@datarow) = $connection->Data;
      
   
   my($tempstud) = ""; 
   my($returnvalue) = "  ~";
   my($sqlcommand2) = "";
   

    my($tm) = localtime;
  my($sdatecurrent) = sprintf("%02d-%02d-%04d",($tm->mon)+1, $tm->mday, $tm->year+1900);

   $sqlcommand2 = "INSERT INTO LESSON (CLASSNO,SCHOOLNO,PERIOD,LESSON,ACTIVE,OBJECTIVE,STANDARD,HOMEWORK) VALUES ($sclassno,'$schoolno','$speriod','$sdesc','Y','HOMEWORK','HW','HW')";
      
      $connection2->Sql("$sqlcommand2"); 
      
    my($sqlcommand2) = "SELECT LESSONNO FROM LESSON WHERE CLASSNO = '$sclassno' AND LESSON = '$sdesc'";
    $connection2->Sql("$sqlcommand2");
    $connection2->FetchRow();
    my($tempstud2) = $connection2->Data("LESSONNO");
    my($sqlcommand2) = "UPDATE HOMEWORK SET HWLESSONNO = $tempstud2 WHERE CLASSNO = '$sclassno' AND LESSON = '$sdesc'";
    $connection2->Sql("$sqlcommand2");
    #print("($tempstud2)");
   
   while ($connection->FetchRow())
   {
	    $tempstud = $connection->Data("STUDENTNO");
      $sqlcommand2 = "INSERT INTO STUDLESS (LESSONNO,STUDENTNO,CLASSNO,DATETIME) VALUES ($tempstud2,$tempstud,$sclassno,'$sdatecurrent')";
      #print("$sqlcommand2");
      $connection2->Sql("$sqlcommand2"); 
        

    } 
 
      }
      
      
      if( substr($pair,9,8) eq "ADDCLASS" )
     {
      $y = 0;
           

      my($sqlcommand) = "INSERT INTO STUDCLAS (STUDENTNO,CLASSNO,GRADE,PERIOD) VALUES ('$sinsertstudentno' , '$sclassno', '$sgrade', '$speriod' )";
     #print("$sqlcommand");
      $connection->Sql("$sqlcommand"); 
      
     
      
 
      }

       if( substr($pair,9,12) eq "CHANGESCHOOL" )
     {
      $y = 0;


      my($sqlcommand) = "UPDATE STUDENT SET SCHOOLNO = '$schoolno' WHERE STUDENTNO = $steacherno";
      #INSERT INTO STUDCLAS (STUDENTNO,CLASSNO,GRADE,PERIOD) VALUES ('$sstudentno' , '$sclassno', '$sgrade', '$speriod' )";
     #print("$sqlcommand");
      $connection->Sql("$sqlcommand");




      }

      if( substr($pair,9,9) eq "ADDLESSON" )
     {
      $y = 0;


      my($sqlcommand) = "INSERT INTO STUDLESS (STUDENTNO,LESSONNO,CLASSNO,GRADE,PERIOD) VALUES ('$sstudentno' , '$slessonno', '$sclassno')";
     #print("$sqlcommand");
      $connection->Sql("$sqlcommand");




      }
      if( substr($pair,8,12) eq "=CLASSDELETE" )
     {
      $y = 0;
      my($sdatastring2) = "";
      foreach $sfield (@afields)
      {


        #print("$sfield");

        if( $sfield eq "STUDENTNO" )
        {
          $sinsertstudentno = "@afieldvalues[$y]";

        }


        $y=$y+1;
      }

      my($sqlcommand) = "DELETE FROM STUDCLAS WHERE (CLASSNO = '$sclassno')";
     #print("$sqlcommand");
     $connection->Sql("$sqlcommand");

      }

       if( substr($pair,8,15) eq "=CLASSNOWDELETE" )
     {
      $y = 0;
      my($sdatastring2) = "";


      my($sqlcommand) = "DELETE FROM STUDCLAS WHERE (CLASSNO = '$sclassno')";
     #print("$sqlcommand");
     $connection->Sql("$sqlcommand");

      my($sqlcommand) = "DELETE FROM CLASS WHERE (CLASSNO = '$sclassno')";
     #print("$sqlcommand");
     $connection->Sql("$sqlcommand");


      }

      
      if( substr($pair,8,7) eq "=DELETE" )
     {
      $y = 0;
      my($sdatastring2) = "";
      foreach $sfield (@afields)
      {
       
       
        #print("$sfield");
        
        if( $sfield eq "STUDENTNO" )
        {
          $sinsertstudentno = "@afieldvalues[$y]";
         
        }
        
       
        $y=$y+1;
      }  
      if( $sstudentno ne "4" )
      {
         my($sqlcommand) = "UPDATE STUDENT SET ACTIVE = 0 WHERE (STUDENTNO = '$sstudentno') and ADMIN <> '1'";
      }
      else
      {
       print("You are not permitted to remove an administrator!");
      }
     #print("$sqlcommand");
     $connection->Sql("$sqlcommand"); 
       
      }
      
       if( substr($pair,9,14) eq "STANDARDDELETE" )
     {
     

       my($sqlcommand) = "DELETE FROM STANDARDS WHERE BLOGID = '$sblogid'";
       #print("$sqlcommand");
       $connection->Sql("$sqlcommand");
      
     }
      if( substr($pair,9,13) eq "CONCEPTDELETE" )
     {


      my($sqlcommand) = "DELETE FROM CONCEPT WHERE (CONCEPTKEY = '$sconceptkey')";
     #print("$sqlcommand");
     $connection->Sql("$sqlcommand");
     
        my($sqlcommand) = "DELETE FROM QUESTION WHERE (QUESTIONNO = '$sconceptkey')";
     #print("$sqlcommand");
     $connection->Sql("$sqlcommand");
     
        my($sqlcommand) = "DELETE FROM ANSWER WHERE (QUESTIONNO = '$sconceptkey')";
     #print("$sqlcommand");
     $connection->Sql("$sqlcommand");
     

      }

        if( substr($pair,9,16) eq "DISCIPLINEDELETE" )
     {


      my($sqlcommand) = "DELETE FROM DISCIPLINE WHERE (DISCIPLINENO = '$sdisciplineno')";
     print("$sqlcommand");
     $connection->Sql("$sqlcommand");

      }

       if( substr($pair,9,10) eq "REMOVEBLOG" )
     {
      $y = 0;


      my($sqlcommand) = "DELETE FROM BLOG WHERE (BLOGID = '$sblogid')";
     #print("$sqlcommand");
     $connection->Sql("$sqlcommand");





      }
      
      
      
       if( substr($pair,9,14) eq "HOMEWORKDELETE" )
     {
      $y = 0;
     

      my($sqlcommand) = "DELETE FROM HOMEWORK WHERE (BLOGID = '$sblogid')";
     #print("$sqlcommand");
     $connection->Sql("$sqlcommand"); 
      
      
      
      
 
      }
      

       if( substr($pair,9,16) eq "CURRICULUMDELETE" )
     {
      $y = 0;


      my($sqlcommand) = "DELETE FROM CURRICULUM WHERE (BLOGID = '$sblogid')";
     #print("$sqlcommand");
     $connection->Sql("$sqlcommand");





      }
      

      
      
       if( substr($pair,9,12) eq "LESSONDELETE" )
     {
      $y = 0;


      my($sqlcommand) = "DELETE FROM LESSON WHERE (LESSONNO = '$slessonno')";
     #print("$sqlcommand");
     $connection->Sql("$sqlcommand");

        my($sqlcommand) = "DELETE FROM CONCEPT WHERE (LESSONNO = '$slessonno')";
     #print("$sqlcommand");
     $connection->Sql("$sqlcommand");

     my($sqlcommand) = "DELETE FROM QUESTION WHERE (LESSONNO = '$slessonno')";
     #print("$sqlcommand");
     $connection->Sql("$sqlcommand");

     my($sqlcommand) = "DELETE FROM ANSWER WHERE (LESSONNO = '$slessonno')";
     #print("$sqlcommand");
     $connection->Sql("$sqlcommand");
     
      my($sqlcommand) = "DELETE FROM STUDLESS WHERE (LESSONNO = '$slessonno')";
     #print("$sqlcommand");
     $connection->Sql("$sqlcommand");
     

      }
      
      
      
     }
     if( substr($pair,0,8) eq "PASSWORD" )
   {
      $spassword = substr($pair,9,100);
      
   }
    if( substr($pair,0,4) eq "SORT" )
   {
      $ssort = substr($pair,5,100);
      if( $ssort eq "PERCENT" )
      {
         $ssort = "[PERCENT] DESC";
      }
   }
    if( substr($pair,0,8) eq "PRIMEKEY" )
   {
      $skey = substr($pair,9,100);
      $sprimekey = substr($pair,9,100);
      $sstudentno = substr($pair,9,100);

      #print("Key - $skey<P>");
   }
  
    if( substr($pair,0,9) eq "STUDENTNO" )
   {
      $sstudentno = substr($pair,10,100);
      # print("Student No - $sstudentno<P>");
   }
    if( substr($pair,0,13) eq "STUDENTUSERID" )
   {
      $sstudentuserid = substr($pair,14,100);
      # print("Student No - $sstudentno<P>");
   }
    if( substr($pair,0,13) eq "TEACHERUSERID" )
   {
      $steacheruserid = substr($pair,14,100);
      # print("Student No - $sstudentno<P>");
   }

  if( substr($pair,0,7) eq "KEYWORD" )
   {
      $skeywork = substr($pair,9,100);
      # print("Student No - $sstudentno<P>");
   }
   
   if( substr($pair,0,8) eq "SCHOOLNO" )
   {
      $schoolno = substr($pair,9,4);
      # print("Student No - $sstudentno<P>");
   }


   if( substr($pair,0,10) eq "QUESTIONNO" )
   {

      
      $squestionno =  substr($pair,11,15);

      # print( $sorderno );
   }


if( substr($pair,0,7) eq "ORDERNO" )
   {

      $sorderno =  substr($pair,8,10);

   }
   

 if( substr($pair,0,10) eq "MISORDERNO" )
   {

       $smisorderno =  substr($pair,11,3);

       my($sqlcommand) = "SELECT MAX(ORDERNO) AS LASTORDER FROM CONCEPT WHERE LESSONNO = $slessonno";


       $connection->Sql("$sqlcommand");
       $connection->FetchRow();

       my($lastorder) = $connection->Data("LASTORDER");
       

      if(  index($lastorder,".") > 0 )
      {
        $lastorder = substr($lastorder,0, index($lastorder,".")) ;
      }
      if(  index($sorderno,".") > 0 )
      {
        $sorderno = substr($sorderno,0, index($sorderno,".")) ;
      }
      
       if( $lastorder eq $sorderno )
       {

          $smisorderno = "99";

       }


   }




  if( substr($pair,0,11) eq "ANSWERTEXT=" && substr($pair,11,50) ne "")
   {
      
      $sanswer =  substr($pair,11,50);
      $sanswer =~ tr/[a-z]/[A-Z]/;


      
     $sactualanswer = $sanswer; 
      





      if( index($sanswerlist,$sanswer) > -1 )
      {
           $siscorrect = "Correct Answer";
           $sanswer = "1";
      }
      else
      {
          $sanswer = "0";
          $sorderno = $smisorderno;
          $siscorrect = "Wrong Answer";
      }
      

       if( substr($smisorderno,0,2) eq "99" )
       {
          #print("-1-");
          putfinalanswer();
         
       }
       else
       {
        
        putstoreanswer();      
        
        
       }
       
   }
     #herehere
    if( substr($pair,0,13) eq "ANSWERNUMBER=" && substr($pair,13,50) ne "")
   {

      $sanswer =  substr($pair,13,50);
      $sanswer =~ tr/[a-z]/[A-Z]/;



     $sactualanswer = $sanswer;

#print("$sanswerlist=$sanswer");
#print(index($sanswerlist,$sanswer));




      if( $sanswerlist eq $sanswer )
      {
           $siscorrect = "Correct Answer";
           $sanswer = "1";
      }
      else
      {
          $sanswer = "0";
          $sorderno = $smisorderno;
          $siscorrect = "Wrong Answer";
      }


       if( substr($smisorderno,0,2) eq "99" )
       {
          #print("-1-");
          putfinalanswer();

       }
       else
       {

        putstoreanswer();


       }

   }

   
   if( substr($pair,0,7) eq "ANSWER_" )
   {
   
   
      my($ngoto) = index($pair,'=');

      $sanswer =  substr($pair,$ngoto + 1,20);
      my($sgoto) = substr($pair,7,$ngoto - 7 );


      #print("$sanswer - GOTO $sgoto");
      if( "$sanswer" eq "0" )
      {
          if( $sgoto eq "" )
          {
            $sorderno = $smisorderno;
          }
          else
          {
            $sorderno = $sgoto - 1;
            $smisorderno = $sgoto - 1;
          }
          
          
          $siscorrect = "Wrong Answer";
      }
      if( "$sanswer" eq "1" )
      {
          $siscorrect = "Correct Answer";

          if( $sgoto ne "" )
          {
             $sorderno = $sgoto - 1;
          }
          #print("$sorderno - $sgoto");
      }
      


       if( substr($smisorderno,0,2) eq "99" )
       {
          #print("-1-");
          putfinalanswer();

       }
       else
       {
        
        putstoreanswer();      

        
       }

   }
   
     if( $sorderno eq "-1" )
   {
      #print("sorderno = $sorderno");
     $sorderno = "0";
   }

   if( $smisorderno eq "-1" )
   {
      #print("smisorderno = $smisorderno");
     #$smisorderno = "0";
   }
   
   
   if( substr($pair,0,7) eq "CLASSNO" )
   {
      $sclassno = substr($pair,8,100);
     #print("class: $sclassno");
       if( index($sclassno,'.') > -1 )
      {
            $sclassno = substr( $sclassno, 0, index($sclassno,".") );
       }  
   }
if( substr($pair,0,8) eq "LESSONNO" )
   {
    if( substr($pair,9,6) eq "SUBMIT" )
    {

       # comment
      }
      else
      {

       $slessonno = substr($pair,9,100);
       if( index($slessonno,'.') > 0 )
      {
           $slessonno = substr( $slessonno, 0, index($slessonno,".") ); 
       }
     } 
      #print("lessonno - $slessonno<P>");
   }
if( substr($pair,0,7) eq "PERIOD=" )
   {
      $speriod = substr($pair,7,10);
      #print("period  - $speriod <P>");
   }
   if( substr($pair,0,9) eq "PERIODNO=" )
   {
      $speriod = substr($pair,9,10);
      #print("period  - $speriod <P>");
   }



   $number += 1;

 }

# print("<p>---------------- $number -------------------<p>");

 my($i);
 for ($i = 0; $i < $number; $i++)
 {

# print($array[$number]);



  if( substr($array[$i],0,14) eq "LOADOBJECTPAGE" )
   {
     $snextpage = substr($array[$i],15,50);
     if( substr($sorderno,0,2) eq "99" )
     {  

         $sorderno = "0";
      }


#check if last 


   if( substr($smisorderno,0,2) eq "99" )
   {
      
      $snextpage = "nSTUDENTSUMMARY.HTML";


    }


     &displayobjectform();

   }

  if( substr($array[$i],0,8) eq "LOADPAGE" )
   {
     #print("Loading: $array[$i] \n");
     &displayform();

   }

    if( substr($array[$i],0,6) eq "ACTION" )
   {
     #print("Loading: $array[$i] \n");
     &storeobject();

   }


 }

#print "<p>End of File: Version 1.8";


sub displayform()
{
  my($filename) = $temp;
  $filename = substr($array[$i],9,50);

  print "File: $filename\n";
  open(MYINPUTFILE, "<$filename");
  # open for input
  my(@lines) = <MYINPUTFILE>;
  # read file into list@lines = sort(@lines);
  # sort the listmy($line);
  my($ino) = 0;
   my($inoend) = 0;
  my($sdata2) = "";
  my($sdata3) = "";
  foreach $line (@lines) # loop thru list
  {
     $ino = 0;


     $ino = index($line,"^");
     my($skip) = "0";
     my($line1) = "";
     my($line2) = "";
     if( $ino > 0 )
     {
       $sdata2 = substr($line, $ino + 1 , 2000);
       $inoend = index($sdata2,"^");

       $sdata3 = substr($sdata2,0,$inoend  );

         if( $sdata3 eq "TEACHERNO" )
         {
           $sdata2 = $steacherno;
           $skip = "1";
         }




        if( $sdata3 eq "PERIODNO" )
       {
        $sdata2 = $speriod;
        $skip = "1";
       }

        if( $sdata3 eq "LESSONNO" )
       {
        $sdata2 = $slessonno;
        $skip = "1";
       }
       
        if( $sdata3 eq "CONCEPTNO" )
       {
        $sdata2 = $sconceptno;
        $skip = "1";
       }
       
       if( $sdata3 eq "IPADDRESS" )
       {
        $sdata2 = "http://vjr-tch-rm21/";
         $skip = "1";
       }

         if( $sdata3 eq "STUDENTNO" )
         {
           $sdata2 = $sstudentno;
           $skip = "1";
         }

          if( $skip eq "0" )
          {
            print("Error: old access $sdata3");       
            #$sdata2 = &getdata("$sdata3");
        }





      #print("$sdata2");

       $line1 = substr($line,0,$ino);

       $line2 = substr($line,$ino+$inoend+2,8000);

      $line = "$line1"."$sdata2"."$line2";
     }
     print("$line");
      #  print("<p>");
  # print in sort order
  }
  close(MYINPUTFILE);

$connection->Close();


}



sub displayobjectform()
{
  my($filename) = $temp;
  $filename =$snextpage;

  #print "File Object Form: $filename\n";

  open(MYINPUTFILE, "<$filename");
  # open for input
  my(@lines) = <MYINPUTFILE>;
  # read file into list@lines = sort(@lines);
  # sort the listmy($line);
  my($ino) = 0;
  my($stype) = 0;
  my($sgetout) = 0;
  my($inoend) = 0;
  my($sdata2) = "";
  my($sdata3) = "";
  my($sprint) = 0;
  my($sdataobject) = "";
  foreach $line (@lines) # loop thru list
  {
     $ino = 0;
     $ino = index($line,"^");
     #$stype = 0;
   # print(substr($line,1,14));
     $sprint = 0;
       if( substr($line,1,14) eq "LOADDATAOBJECT" )
       {

           $stype = 0;
           $sdata2 = substr($line, $ino + 1 , 800000);
           $inoend = index($sdata2,"^");

           $sdata3 = substr($sdata2,0,$inoend  );
           #print("$sdata3");
           $sdataobject = &getobject("$sdata3");
           $sdata2 = "";
           $line =  "";
           $ino = 0;

           if( substr($sdataobject,0,8) eq "Abnormal" )
           {
               $sdata3 = "";
           }


           #print("Dataobject:$sdataobject");


       }


        if( substr($line,1,14) eq "LOADMULTOBJECT" )
       {

          
          $sprint = 1;
           $stype = 1;
           $sdata2 = substr($line, $ino + 1 , 800000);
           $inoend = index($sdata2,"^");

           $sdata3 = substr($sdata2,0,$inoend  );
           #$print("sDATA3 $sdata3");
           $sdataobject = "";
           $sdataobject = &getmultiobject("$sdata3");

            if( substr($sdataobject,0,8) eq "Abnormal" )
           {
               $sdata3 = "";
           }

           $ino = index($sdataobject,"^");
          
         
           while( $ino > 0 )
           {
               $sdata2 = substr($sdataobject, $ino + 1 , 800000);
         
               $inoend = index($sdata2,"^");
        
               $sdata3 = substr($sdata2,0,$inoend  );
        



               if( $sdata3 eq "STUDENTNO" )
               {
                 $sdata2 = $sstudentno;
                 $sgetout = 1;
               }
                #print("Data: $sdata3");
                if( $sdata3 eq "CLASSNO" )
               {
                 $sdata2 = $sclassno;
                 $sgetout = 1;
               }
                if( $sdata3 eq "LESSONNO" )
               {
                 $sdata2 = $slessonno;
                 $sgetout = 1;
               }
               if( $sdata3 eq "TEACHERNO" )
               {
                 $sdata2 = $steacherno;
                 $sgetout = 1;
               }
                if( $sdata3 eq "SCHOOL" )
               {
                 $sdata2 = $schoolno;
                 $sgetout = 1;
               }


               if( $sdata3 eq "PERIODNO" )
               {
                 $sdata2 = $speriod;
                 $sgetout = 1;
               }
    
              $line1 = substr($sdataobject,0,$ino);
       
              $line2 = substr($sdataobject,$ino+$inoend+2,800000);
       
              $sdataobject = "$line1"."$sdata2"."$line2";
    
              $ino = index($sdataobject,"^");
           }
    
           
    
           #print("$sdataobject");
           $sdata2 = "";
           $line =  "";
           $ino = 0;
          
       }


     my($line1) = "";
     my($line2) = "";

     if( $ino > 0 )
     {
       $sdata2 = substr($line, $ino + 1 , 800000);


       $inoend = index($sdata2,"^");

       $sdata3 = substr($sdata2,0,$inoend  );

      $sgetout = 0;
      

      if( $sdata3 eq "CLASSCHART" )
{

	  my($filedelete) = "$sorgclassno.png";
      #print("File: $filedelete");

      unlink($filedelete);


      # Create a XYChart object of size 250 x 250 pixels
      my $c = new XYChart(600, 600);
      $c->xAxis()->setLabelStyle("arial.ttf", 8, 0x8000,90);
      # Set the plotarea at (30, 20) and of size 200 x 200 pixels
      $c->setPlotArea(30, 20, 550, 450);

      my @sdata = [6,5,88,4];
	  # The data for the bar chart
       #print($sclassno);
       #print("$sclassno");
       my($sqlcommand5) = "SELECT STUDENT, [PERCENT] FROM CLASSLISTING WHERE CLASSNO = $sorgclassno";

       $connection->Sql("$sqlcommand5");

       my($xx) = 0;
	     my(@check);
	     my(@dataarray);

       while($connection->FetchRow() )
       {


           #$check = $connection->Data("PERCENTAGE");
          push(@check,$connection->Data("PERCENT"));

		      $c->xAxis()->addLabel( $xx,$connection->Data("STUDENT"));
          #push(@dataarray, $check[$xx] );

          $xx = $xx + 1;

         #@dataarray = ( @dataarray , $check[0] );


		      if( $xx eq 30 )
		      {
		        last;
		      }



       }


        if( $xx eq 1)	{  @dataarray = [ $check[0] ]; }
        if( $xx eq 2)	{  @dataarray = [ $check[0],  $check[1] ]; }
        if( $xx eq 3)	{  @dataarray = [ $check[0],  $check[1],  $check[2] ]; }
        if( $xx eq 4)	{  @dataarray = [ $check[0],  $check[1],  $check[2],  $check[3] ]; }
        if( $xx eq 5) {  @dataarray = [ $check[0],  $check[1],  $check[2],  $check[3],  $check[4] ]; }
        if( $xx eq 6)	{  @dataarray = [ $check[0],  $check[1],  $check[2],  $check[3],  $check[4],  $check[5] ]; }
        if( $xx eq 7)	{  @dataarray = [ $check[0],  $check[1],  $check[2],  $check[3],  $check[4],  $check[5],  $check[6] ]; }
        if( $xx eq 8)	{  @dataarray = [ $check[0],  $check[1],  $check[2],  $check[3],  $check[4],  $check[5],  $check[6],  $check[7] ]; }
        if( $xx eq 8)	{  @dataarray = [ $check[0],  $check[1],  $check[2],  $check[3],  $check[4],  $check[5],  $check[6],  $check[7],  $check[8] ]; }
        if( $xx eq 9)	{  @dataarray = [ $check[0],  $check[1],  $check[2],  $check[3],  $check[4],  $check[5],  $check[6],  $check[7],  $check[8],  $check[9] ]; }
        if( $xx eq 10){  @dataarray = [ $check[0],  $check[1],  $check[2],  $check[3],  $check[4],  $check[5],  $check[6],  $check[7],  $check[8],  $check[9],  $check[10] ]; }
        if( $xx eq 11){  @dataarray = [ $check[0],  $check[1],  $check[2],  $check[3],  $check[4],  $check[5],  $check[6],  $check[7],  $check[8],  $check[9],  $check[10],  $check[11] ]; }
        if( $xx eq 12){  @dataarray = [ $check[0],  $check[1],  $check[2],  $check[3],  $check[4],  $check[5],  $check[6],  $check[7],  $check[8],  $check[9],  $check[10],  $check[11],  $check[12] ]; }
        if( $xx eq 13){  @dataarray = [ $check[0],  $check[1],  $check[2],  $check[3],  $check[4],  $check[5],  $check[6],  $check[7],  $check[8],  $check[9],  $check[10],  $check[11],  $check[12],  $check[13] ]; }
        if( $xx eq 14){  @dataarray = [ $check[0],  $check[1],  $check[2],  $check[3],  $check[4],  $check[5],  $check[6],  $check[7],  $check[8],  $check[9],  $check[10],  $check[11],  $check[12],  $check[13],  $check[14] ]; }
        if( $xx eq 15){  @dataarray = [ $check[0],  $check[1],  $check[2],  $check[3],  $check[4],  $check[5],  $check[6],  $check[7],  $check[8],  $check[9],  $check[10],  $check[11],  $check[12],  $check[13],  $check[14],  $check[15] ]; }
        if( $xx eq 16){  @dataarray = [ $check[0],  $check[1],  $check[2],  $check[3],  $check[4],  $check[5],  $check[6],  $check[7],  $check[8],  $check[9],  $check[10],  $check[11],  $check[12],  $check[13],  $check[14],  $check[15],  $check[16] ]; }
        if( $xx eq 17){  @dataarray = [ $check[0],  $check[1],  $check[2],  $check[3],  $check[4],  $check[5],  $check[6],  $check[7],  $check[8],  $check[9],  $check[10],  $check[11],  $check[12],  $check[13],  $check[14],  $check[15],  $check[16],  $check[17] ]; }
        if( $xx eq 18){  @dataarray = [ $check[0],  $check[1],  $check[2],  $check[3],  $check[4],  $check[5],  $check[6],  $check[7],  $check[8],  $check[9],  $check[10],  $check[11],  $check[12],  $check[13],  $check[14],  $check[15],  $check[16],  $check[17],  $check[18] ]; }
        if( $xx eq 19){  @dataarray = [ $check[0],  $check[1],  $check[2],  $check[3],  $check[4],  $check[5],  $check[6],  $check[7],  $check[8],  $check[9],  $check[10],  $check[11],  $check[12],  $check[13],  $check[14],  $check[15],  $check[16],  $check[17],  $check[18],  $check[19] ]; }
        if( $xx eq 20){  @dataarray = [ $check[0],  $check[1],  $check[2],  $check[3],  $check[4],  $check[5],  $check[6],  $check[7],  $check[8],  $check[9],  $check[10],  $check[11],  $check[12],  $check[13],  $check[14],  $check[15],  $check[16],  $check[17],  $check[18],  $check[19],  $check[20] ]; }
        if( $xx eq 21){  @dataarray = [ $check[0],  $check[1],  $check[2],  $check[3],  $check[4],  $check[5],  $check[6],  $check[7],  $check[8],  $check[9],  $check[10],  $check[11],  $check[12],  $check[13],  $check[14],  $check[15],  $check[16],  $check[17],  $check[18],  $check[19],  $check[20],  $check[21] ]; }
        if( $xx eq 22){  @dataarray = [ $check[0],  $check[1],  $check[2],  $check[3],  $check[4],  $check[5],  $check[6],  $check[7],  $check[8],  $check[9],  $check[10],  $check[11],  $check[12],  $check[13],  $check[14],  $check[15],  $check[16],  $check[17],  $check[18],  $check[19],  $check[20],  $check[21],  $check[22] ]; }
        if( $xx eq 23){  @dataarray = [ $check[0],  $check[1],  $check[2],  $check[3],  $check[4],  $check[5],  $check[6],  $check[7],  $check[8],  $check[9],  $check[10],  $check[11],  $check[12],  $check[13],  $check[14],  $check[15],  $check[16],  $check[17],  $check[18],  $check[19],  $check[20],  $check[21],  $check[22],  $check[23] ]; }
        if( $xx eq 24){  @dataarray = [ $check[0],  $check[1],  $check[2],  $check[3],  $check[4],  $check[5],  $check[6],  $check[7],  $check[8],  $check[9],  $check[10],  $check[11],  $check[12],  $check[13],  $check[14],  $check[15],  $check[16],  $check[17],  $check[18],  $check[19],  $check[20],  $check[21],  $check[22],  $check[23],  $check[24] ]; }
        if( $xx eq 25){  @dataarray = [ $check[0],  $check[1],  $check[2],  $check[3],  $check[4],  $check[5],  $check[6],  $check[7],  $check[8],  $check[9],  $check[10],  $check[11],  $check[12],  $check[13],  $check[14],  $check[15],  $check[16],  $check[17],  $check[18],  $check[19],  $check[20],  $check[21],  $check[22],  $check[23],  $check[24],  $check[25] ]; }
        if( $xx eq 26){  @dataarray = [ $check[0],  $check[1],  $check[2],  $check[3],  $check[4],  $check[5],  $check[6],  $check[7],  $check[8],  $check[9],  $check[10],  $check[11],  $check[12],  $check[13],  $check[14],  $check[15],  $check[16],  $check[17],  $check[18],  $check[19],  $check[20],  $check[21],  $check[22],  $check[23],  $check[24],  $check[25],  $check[26] ]; }
        if( $xx eq 27){  @dataarray = [ $check[0],  $check[1],  $check[2],  $check[3],  $check[4],  $check[5],  $check[6],  $check[7],  $check[8],  $check[9],  $check[10],  $check[11],  $check[12],  $check[13],  $check[14],  $check[15],  $check[16],  $check[17],  $check[18],  $check[19],  $check[20],  $check[21],  $check[22],  $check[23],  $check[24],  $check[25],  $check[26],  $check[27] ]; }
        if( $xx eq 28){  @dataarray = [ $check[0],  $check[1],  $check[2],  $check[3],  $check[4],  $check[5],  $check[6],  $check[7],  $check[8],  $check[9],  $check[10],  $check[11],  $check[12],  $check[13],  $check[14],  $check[15],  $check[16],  $check[17],  $check[18],  $check[19],  $check[20],  $check[21],  $check[22],  $check[23],  $check[24],  $check[25],  $check[26],  $check[27],  $check[28] ]; }
        if( $xx eq 29){  @dataarray = [ $check[0],  $check[1],  $check[2],  $check[3],  $check[4],  $check[5],  $check[6],  $check[7],  $check[8],  $check[9],  $check[10],  $check[11],  $check[12],  $check[13],  $check[14],  $check[15],  $check[16],  $check[17],  $check[18],  $check[19],  $check[20],  $check[21],  $check[22],  $check[23],  $check[24],  $check[25],  $check[26],  $check[27],  $check[28],  $check[29] ]; }
        if( $xx eq 30){  @dataarray = [ $check[0],  $check[1],  $check[2],  $check[3],  $check[4],  $check[5],  $check[6],  $check[7],  $check[8],  $check[9],  $check[10],  $check[11],  $check[12],  $check[13],  $check[14],  $check[15],  $check[16],  $check[17],  $check[18],  $check[19],  $check[20],  $check[21],  $check[22],  $check[23],  $check[24],  $check[25],  $check[26],  $check[27],  $check[28],  $check[29],  $check[30] ]; }



     #@dataarray = [ $check[0],$check[1],$check[2],$check[3], $check[4],$check[5] ];

      # Add a bar chart layer using the given data
      #$c->addBarLayer(@dataarray);
      #$c->addBarLayer($check[0],$check[1],$check[2]];
      #$c->addBarLayer(check, 0x99ff99, "Vol (Up day)");
      #$c->addLineLayer(@dataarray);

      #$c->setFontAngle(0,1);
      # output the chart

       $c->addBarLayer(@dataarray);


      $c->makeChart("$filedelete");


      print("<img src=$filedelete border=0  />");








}


  if( $sdata3 eq "CONCEPTCHART" )
{

	  my($filedelete) = "$slessonno"."answers.png";
      #print("File: $filedelete");

      unlink($filedelete);


      # Create a XYChart object of size 250 x 250 pixels
      my $c = new XYChart(600, 700);
      $c->xAxis()->setLabelStyle("arial.ttf", 8, 0x8000,60);
      # Set the plotarea at (30, 20) and of size 200 x 200 pixels
      $c->setPlotArea(30, 20, 550, 450);

      my @sdata = [6,5,88,4];
	  # The data for the bar chart
       #print($sclassno);
       #print("$sclassno");
       my($sqlcommand5) = "SELECT CONCEPT+': '+LTRIM(STR(CONCEPTNO)) AS CONCEPT, CLASSGPA AS CLASSGPA FROM CONCEPT WHERE LESSONNO = '$slessonno' ORDER BY CONCEPTNO";
       #print($sqlcommand5);
       $connection->Sql("$sqlcommand5");

       my($xx) = 0;
	     my(@check);
	     my(@dataarray);

       while($connection->FetchRow() )
       {


           #$check = $connection->Data("PERCENTAGE");
          push(@check,$connection->Data("CLASSGPA"));

		      $c->xAxis()->addLabel( $xx,$connection->Data("CONCEPT"));
          #push(@dataarray, $check[$xx] );

          $xx = $xx + 1;

         #@dataarray = ( @dataarray , $check[0] );


		      if( $xx eq 30 )
		      {
		        last;
		      }



       }


        if( $xx eq 1)	{  @dataarray = [ $check[0] ]; }
        if( $xx eq 2)	{  @dataarray = [ $check[0],  $check[1] ]; }
        if( $xx eq 3)	{  @dataarray = [ $check[0],  $check[1],  $check[2] ]; }
        if( $xx eq 4)	{  @dataarray = [ $check[0],  $check[1],  $check[2],  $check[3] ]; }
        if( $xx eq 5) {  @dataarray = [ $check[0],  $check[1],  $check[2],  $check[3],  $check[4] ]; }
        if( $xx eq 6)	{  @dataarray = [ $check[0],  $check[1],  $check[2],  $check[3],  $check[4],  $check[5] ]; }
        if( $xx eq 7)	{  @dataarray = [ $check[0],  $check[1],  $check[2],  $check[3],  $check[4],  $check[5],  $check[6] ]; }
        if( $xx eq 8)	{  @dataarray = [ $check[0],  $check[1],  $check[2],  $check[3],  $check[4],  $check[5],  $check[6],  $check[7] ]; }
        if( $xx eq 8)	{  @dataarray = [ $check[0],  $check[1],  $check[2],  $check[3],  $check[4],  $check[5],  $check[6],  $check[7],  $check[8] ]; }
        if( $xx eq 9)	{  @dataarray = [ $check[0],  $check[1],  $check[2],  $check[3],  $check[4],  $check[5],  $check[6],  $check[7],  $check[8],  $check[9] ]; }
        if( $xx eq 10){  @dataarray = [ $check[0],  $check[1],  $check[2],  $check[3],  $check[4],  $check[5],  $check[6],  $check[7],  $check[8],  $check[9],  $check[10] ]; }
        if( $xx eq 11){  @dataarray = [ $check[0],  $check[1],  $check[2],  $check[3],  $check[4],  $check[5],  $check[6],  $check[7],  $check[8],  $check[9],  $check[10],  $check[11] ]; }
        if( $xx eq 12){  @dataarray = [ $check[0],  $check[1],  $check[2],  $check[3],  $check[4],  $check[5],  $check[6],  $check[7],  $check[8],  $check[9],  $check[10],  $check[11],  $check[12] ]; }
        if( $xx eq 13){  @dataarray = [ $check[0],  $check[1],  $check[2],  $check[3],  $check[4],  $check[5],  $check[6],  $check[7],  $check[8],  $check[9],  $check[10],  $check[11],  $check[12],  $check[13] ]; }
        if( $xx eq 14){  @dataarray = [ $check[0],  $check[1],  $check[2],  $check[3],  $check[4],  $check[5],  $check[6],  $check[7],  $check[8],  $check[9],  $check[10],  $check[11],  $check[12],  $check[13],  $check[14] ]; }
        if( $xx eq 15){  @dataarray = [ $check[0],  $check[1],  $check[2],  $check[3],  $check[4],  $check[5],  $check[6],  $check[7],  $check[8],  $check[9],  $check[10],  $check[11],  $check[12],  $check[13],  $check[14],  $check[15] ]; }
        if( $xx eq 16){  @dataarray = [ $check[0],  $check[1],  $check[2],  $check[3],  $check[4],  $check[5],  $check[6],  $check[7],  $check[8],  $check[9],  $check[10],  $check[11],  $check[12],  $check[13],  $check[14],  $check[15],  $check[16] ]; }
        if( $xx eq 17){  @dataarray = [ $check[0],  $check[1],  $check[2],  $check[3],  $check[4],  $check[5],  $check[6],  $check[7],  $check[8],  $check[9],  $check[10],  $check[11],  $check[12],  $check[13],  $check[14],  $check[15],  $check[16],  $check[17] ]; }
        if( $xx eq 18){  @dataarray = [ $check[0],  $check[1],  $check[2],  $check[3],  $check[4],  $check[5],  $check[6],  $check[7],  $check[8],  $check[9],  $check[10],  $check[11],  $check[12],  $check[13],  $check[14],  $check[15],  $check[16],  $check[17],  $check[18] ]; }
        if( $xx eq 19){  @dataarray = [ $check[0],  $check[1],  $check[2],  $check[3],  $check[4],  $check[5],  $check[6],  $check[7],  $check[8],  $check[9],  $check[10],  $check[11],  $check[12],  $check[13],  $check[14],  $check[15],  $check[16],  $check[17],  $check[18],  $check[19] ]; }
        if( $xx eq 20){  @dataarray = [ $check[0],  $check[1],  $check[2],  $check[3],  $check[4],  $check[5],  $check[6],  $check[7],  $check[8],  $check[9],  $check[10],  $check[11],  $check[12],  $check[13],  $check[14],  $check[15],  $check[16],  $check[17],  $check[18],  $check[19],  $check[20] ]; }
        if( $xx eq 21){  @dataarray = [ $check[0],  $check[1],  $check[2],  $check[3],  $check[4],  $check[5],  $check[6],  $check[7],  $check[8],  $check[9],  $check[10],  $check[11],  $check[12],  $check[13],  $check[14],  $check[15],  $check[16],  $check[17],  $check[18],  $check[19],  $check[20],  $check[21] ]; }
        if( $xx eq 22){  @dataarray = [ $check[0],  $check[1],  $check[2],  $check[3],  $check[4],  $check[5],  $check[6],  $check[7],  $check[8],  $check[9],  $check[10],  $check[11],  $check[12],  $check[13],  $check[14],  $check[15],  $check[16],  $check[17],  $check[18],  $check[19],  $check[20],  $check[21],  $check[22] ]; }
        if( $xx eq 23){  @dataarray = [ $check[0],  $check[1],  $check[2],  $check[3],  $check[4],  $check[5],  $check[6],  $check[7],  $check[8],  $check[9],  $check[10],  $check[11],  $check[12],  $check[13],  $check[14],  $check[15],  $check[16],  $check[17],  $check[18],  $check[19],  $check[20],  $check[21],  $check[22],  $check[23] ]; }
        if( $xx eq 24){  @dataarray = [ $check[0],  $check[1],  $check[2],  $check[3],  $check[4],  $check[5],  $check[6],  $check[7],  $check[8],  $check[9],  $check[10],  $check[11],  $check[12],  $check[13],  $check[14],  $check[15],  $check[16],  $check[17],  $check[18],  $check[19],  $check[20],  $check[21],  $check[22],  $check[23],  $check[24] ]; }
        if( $xx eq 25){  @dataarray = [ $check[0],  $check[1],  $check[2],  $check[3],  $check[4],  $check[5],  $check[6],  $check[7],  $check[8],  $check[9],  $check[10],  $check[11],  $check[12],  $check[13],  $check[14],  $check[15],  $check[16],  $check[17],  $check[18],  $check[19],  $check[20],  $check[21],  $check[22],  $check[23],  $check[24],  $check[25] ]; }
        if( $xx eq 26){  @dataarray = [ $check[0],  $check[1],  $check[2],  $check[3],  $check[4],  $check[5],  $check[6],  $check[7],  $check[8],  $check[9],  $check[10],  $check[11],  $check[12],  $check[13],  $check[14],  $check[15],  $check[16],  $check[17],  $check[18],  $check[19],  $check[20],  $check[21],  $check[22],  $check[23],  $check[24],  $check[25],  $check[26] ]; }
        if( $xx eq 27){  @dataarray = [ $check[0],  $check[1],  $check[2],  $check[3],  $check[4],  $check[5],  $check[6],  $check[7],  $check[8],  $check[9],  $check[10],  $check[11],  $check[12],  $check[13],  $check[14],  $check[15],  $check[16],  $check[17],  $check[18],  $check[19],  $check[20],  $check[21],  $check[22],  $check[23],  $check[24],  $check[25],  $check[26],  $check[27] ]; }
        if( $xx eq 28){  @dataarray = [ $check[0],  $check[1],  $check[2],  $check[3],  $check[4],  $check[5],  $check[6],  $check[7],  $check[8],  $check[9],  $check[10],  $check[11],  $check[12],  $check[13],  $check[14],  $check[15],  $check[16],  $check[17],  $check[18],  $check[19],  $check[20],  $check[21],  $check[22],  $check[23],  $check[24],  $check[25],  $check[26],  $check[27],  $check[28] ]; }
        if( $xx eq 29){  @dataarray = [ $check[0],  $check[1],  $check[2],  $check[3],  $check[4],  $check[5],  $check[6],  $check[7],  $check[8],  $check[9],  $check[10],  $check[11],  $check[12],  $check[13],  $check[14],  $check[15],  $check[16],  $check[17],  $check[18],  $check[19],  $check[20],  $check[21],  $check[22],  $check[23],  $check[24],  $check[25],  $check[26],  $check[27],  $check[28],  $check[29] ]; }
        if( $xx eq 30){  @dataarray = [ $check[0],  $check[1],  $check[2],  $check[3],  $check[4],  $check[5],  $check[6],  $check[7],  $check[8],  $check[9],  $check[10],  $check[11],  $check[12],  $check[13],  $check[14],  $check[15],  $check[16],  $check[17],  $check[18],  $check[19],  $check[20],  $check[21],  $check[22],  $check[23],  $check[24],  $check[25],  $check[26],  $check[27],  $check[28],  $check[29],  $check[30] ]; }



     #@dataarray = [ $check[0],$check[1],$check[2],$check[3], $check[4],$check[5] ];

      # Add a bar chart layer using the given data
      #$c->addBarLayer(@dataarray);
      #$c->addBarLayer($check[0],$check[1],$check[2]];
      #$c->addBarLayer(check, 0x99ff99, "Vol (Up day)");
      #$c->addLineLayer(@dataarray);

      #$c->setFontAngle(0,1);
      # output the chart

       $c->addBarLayer(@dataarray);


      $c->makeChart("$filedelete");


      print("<img src=$filedelete border=0  />");

}

if( $sdata3 eq "CSS")
{
print <<ENDHTML;
<style type="text/css">
<!--
.nav {
	background:#006f92;
	border:1px solid #b0b0b0;
	color:#FFFFFF;
	display:block;
	margin-top:8px;
	padding:5px 4px 4px 10px;
	position:relative;
	text-transform:uppercase;
	width:175px;
	text-decoration:none;
	font-family: Arial, Helvetica, sans-serif;
}

.button {
	background:#006f92;
	border:1px solid #b0b0b0;
	color:#FFFFFF;
	display:block;
	margin-top:8px;
	padding:5px 4px 4px 10px;
	position:relative;
	text-transform:uppercase;
	width:100px;
	text-decoration:none;
	font-family: Arial, Helvetica, sans-serif;
	text-align: center;
	font-size: 12px;
}

.nav:hover,.active {
  background:#006f92;
	border:1px solid #b0b0b0;
	color:#FFFFFF;
	display:block;
	margin-top:8px;
	padding:5px 4px 4px 10px;
	position:relative;
	text-transform:uppercase;
	width:175px;
	text-decoration:none;
	font-family: Arial, Helvetica, sans-serif;
}

img {
	border: none;
}
.tah9 {
	font-family: Tahoma;
	font-size: 9px;
	color: 626262;
	text-decoration: none;
}
.tah11 {
	font-family: Tahoma;
	font-size: 11px;
	font-weight: bold;
	color: 006F92;
}

.f1 {
	font-family: Tahoma;
	font-size: 10px;
	font-weight: bold;
	color: 9D5E2D;
}

.tah10 {
	font-family: Tahoma;
	font-size: 10px;
	color: 545454;
}

.linktah {
	font-family: Tahoma;
	font-size: 10px;
	color: 0F7C9D;
	text-decoration: none;
}

.style5 {font-family: Arial, Helvetica, sans-serif;
	font-size: 20px;
  color:#006f92;
 }
.style16 {font-size: 16px}
.style20 {
	font-family: Tahoma;
}

.topmenu {
  color:#666666;
	text-transform:uppercase;

	text-decoration:none;
	font-family: Arial, Helvetica, sans-serif;
  
  
}

.style21 {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
}

.style22 {font-size: 14px}

.style8{
    color:#666666;
	text-transform:uppercase;
	width:50px;
	text-decoration:none;
	font-family: Arial, Helvetica, sans-serif;
}
.style9{
    color:#666666;
	text-transform:uppercase;
	width:50px;
	text-decoration:none;
	font-family: Arial, Helvetica, sans-serif;
}

.styleselect{
    color:#666666;
	text-transform:uppercase;
	width:50px;
	text-decoration:none;
	font-family: Arial, Helvetica, sans-serif;
}

-->
</style>
ENDHTML
}



if( $sdata3 eq "SIDEMENU")
{
print <<ENDHTML;

<style type="text/css">
<!--
.linktah {
	font-family: Tahoma;
	font-size: 10px;
	color: 0F7C9D;
	text-decoration: none;
}
.style5 {font-size: 18px}
.style16 {font-size: 16px}
.style20 {font-size: 12px}
.style21 {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
}
-->
</style>
<TR>   	<TD valign="top">
      <p class="tah11">&nbsp;&nbsp; &nbsp;&nbsp;User:  &nbsp;
( $steacherno )</p>
</TR>
	<TR>
       <TR>
		<TD valign="top"">
			<div  " align="center"><a  href=javascript:myclasses.submit() class="nav active style21">My Classes </a></div></TD>
	</TR>
	<TR>
		<TD valign="top">
			<div align="center"><a  href=javascript:currentlessons.submit() class="nav active style21">Current Lessons</a></div></TD>
	</TR>
	<TR>
		<TD valign="top">
			<div align="center"><a  href=javascript:enrollment.submit() class="nav active style21">Class Enrollment</a></div></TD>
	</TR>
	<TR>
		<TD valign="top">
			<div align="center"><a  href=javascript:addalesson.submit() class="nav active style21">Add a Lesson</a></div></TD>
	</TR>
	<TR>
		<TD valign="top">
			<div align="center"><a  href=javascript:addastudent.submit() class="nav active style21">Add a student </a></div></TD>
	</TR>
	<TR>
		<TD valign="top">
			<div align="center"><a  href=javascript:teams.submit() class="nav active style21">CLASS TEAMS </a></div></TD>
	</TR>
	<TR>
		<TD valign="top">
			<div align="center"><a  href=javascript:seatingcharts.submit() class="nav active style21">SEATING CHART</a></div></TD>
	</TR>
 <TR>
		<TD valign="top">
			<div align="center"><a  href=javascript:gradebook.submit() class="nav active style21">GRADEBOOK</a></div></TD>
	</TR>
	<TR>
		<TD valign="top">
			<div align="center"><a  href=javascript:discipline.submit() class="nav active style21">DISCIPLINE</a></div></TD>
	</TR>
	<TR>
		<TD valign="top">
			<div align="center"><a  href=javascript:announcements.submit() class="nav active style21">ANNOUNCEMENTS</a></div></TD>
	</TR>
	<TR>
		<TD valign="top">
			<div align="center"><a  href=javascript:discussions.submit() class="nav active style21">DISCUSSIONS</a></div></TD>
	</TR>
	<TR>
		<TD valign="top">
			<div align="center"><a  href=javascript:lessonplans.submit() class="nav active style21">LESSON PLANS</a></div></TD>
	</TR>
	<TR>
		<TD valign="top">
			<div align="center"><a  href=javascript:observations.submit() class="nav active style21">OBSERVATIONS</a></div></TD>
	</TR>
	<TR>
		<TD valign="top">
			<div align="center"><a  href=javascript:standards.submit() class="nav active style21">STANDARDS</a></div></TD>
	</TR>
	<TR>
		<TD valign="top">
			<div align="center"><a  href=javascript:curriculum.submit() class="nav active style21">CURRICULUM</a></div></TD>
	</TR>
	<TR>
		<TD valign="top">
			<div align="center"><a  href=javascript:chats.submit() class="nav active style21">INTERNATIONAL CHATS</a></div></TD>
	</TR>
 <TR>
		<TD valign="top">
			<div align="center"><a  href=javascript:teacherresources.submit() class="nav active style21">TEACHER RESOURCES</a></div></TD>
	</TR>
ENDHTML
}
  if( $sdata3 eq "MENUFORMS")
{
print <<ENDHTML;
      <form NAME=addastudent ACTION=getdata.pl METHOD=POST>
                <input type=HIDDEN NAME=LOADOBJECTPAGE VALUE=nstudentinfoadd.HTML>
<input type=HIDDEN NAME=LESSONNO VALUE=$slessonno>
<input type=HIDDEN NAME=PRIMEKEY VALUE=$sstudentno>
<input type=HIDDEN NAME=STUDENTNO VALUE=$sstudentno>
<input type=HIDDEN NAME=TEACHERNO VALUE=$steacherno>
<input type=HIDDEN NAME=CLASSNO VALUE=$sclassno>
<input type=HIDDEN NAME=ORDERNO VALUE=$sorderno>
<input type=HIDDEN name=PERIOD value=$speriod>
<input type=HIDDEN NAME=LOADFORM VALUE=SUBMIT>
</form>




<form NAME=addalesson ACTION=getdata.pl METHOD=POST>
                <input type=HIDDEN NAME=LOADOBJECTPAGE VALUE=nteacherlessonadd.HTML>
<input type=HIDDEN NAME=LESSONNO VALUE=$slessonno>
<input type=HIDDEN NAME=PRIMEKEY VALUE=$sstudentno>
<input type=HIDDEN NAME=STUDENTNO VALUE=$sstudentno>
<input type=HIDDEN NAME=TEACHERNO VALUE=$steacherno>
<input type=HIDDEN NAME=CLASSNO VALUE=$sclassno>
<input type=HIDDEN NAME=ORDERNO VALUE=$sorderno>
<input type=HIDDEN NAME=SELECTDEPARTMENT VALUE=$sselectdepartment>
<input type=HIDDEN name=PERIOD value=$speriod>
<input type=HIDDEN NAME=LOADFORM VALUE=SUBMIT>
</form>


<form NAME=editlesson ACTION=getdata.pl METHOD=POST>
                <input type=HIDDEN NAME=LOADOBJECTPAGE VALUE=nteacherlessonedit.HTML>
<input type=HIDDEN NAME=LESSONNO VALUE=$slessonno>
<input type=HIDDEN NAME=PRIMEKEY VALUE=$sstudentno>
<input type=HIDDEN NAME=STUDENTNO VALUE=$sstudentno>
<input type=HIDDEN NAME=TEACHERNO VALUE=$steacherno>
<input type=HIDDEN NAME=CLASSNO VALUE=$sclassno>
<input type=HIDDEN NAME=ORDERNO VALUE=$sorderno>
<input type=HIDDEN name=PERIOD value=$speriod>
<input type=HIDDEN NAME=LOADFORM VALUE=SUBMIT>
</form>

<form NAME=addconcept ACTION=getdata.pl METHOD=POST>
                <input type=HIDDEN NAME=LOADOBJECTPAGE VALUE=nteacherconceptadd.HTML>
<input type=HIDDEN NAME=LESSONNO VALUE=$slessonno>
<input type=HIDDEN NAME=PRIMEKEY VALUE=$sstudentno>
<input type=HIDDEN NAME=STUDENTNO VALUE=$sstudentno>
<input type=HIDDEN NAME=TEACHERNO VALUE=$steacherno>
<input type=HIDDEN NAME=CLASSNO VALUE=$sclassno>
<input type=HIDDEN NAME=ORDERNO VALUE=$sorderno>
<input type=HIDDEN name=PERIOD value=$speriod>
<input type=HIDDEN NAME=LOADFORM VALUE=SUBMIT>
</form>

<form NAME=addhomework ACTION=getdata.pl METHOD=POST>
                <input type=HIDDEN NAME=LOADOBJECTPAGE VALUE=nteacherhomeworkadd.HTML>
<input type=HIDDEN NAME=LESSONNO VALUE=$slessonno>
<input type=HIDDEN NAME=PRIMEKEY VALUE=$sstudentno>
<input type=HIDDEN NAME=STUDENTNO VALUE=$sstudentno>
<input type=HIDDEN NAME=TEACHERNO VALUE=$steacherno>
<input type=HIDDEN NAME=CLASSNO VALUE=$sclassno>
<input type=HIDDEN NAME=ORDERNO VALUE=$sorderno>
<input type=HIDDEN name=PERIOD value=$speriod>
<input type=HIDDEN NAME=LOADFORM VALUE=SUBMIT>
</form>

<form NAME=addcurriculum ACTION=getdata.pl METHOD=POST>
                <input type=HIDDEN NAME=LOADOBJECTPAGE VALUE=nteachercurriculumadd.HTML>
<input type=HIDDEN NAME=LESSONNO VALUE=$slessonno>
<input type=HIDDEN NAME=PRIMEKEY VALUE=$sstudentno>
<input type=HIDDEN NAME=STUDENTNO VALUE=$sstudentno>
<input type=HIDDEN NAME=TEACHERNO VALUE=$steacherno>
<input type=HIDDEN NAME=CLASSNO VALUE=$sclassno>
<input type=HIDDEN NAME=ORDERNO VALUE=$sorderno>
<input type=HIDDEN name=PERIOD value=$speriod>
<input type=HIDDEN NAME=LOADFORM VALUE=SUBMIT>
</form>

<form NAME=concepts ACTION=getdata.pl METHOD=POST>
                <input type=HIDDEN NAME=LOADOBJECTPAGE VALUE=nteacherconcepts.HTML>
<input type=HIDDEN NAME=LESSONNO VALUE=$slessonno>
<input type=HIDDEN NAME=PRIMEKEY VALUE=$sstudentno>
<input type=HIDDEN NAME=STUDENTNO VALUE=$sstudentno>
<input type=HIDDEN NAME=TEACHERNO VALUE=$steacherno>
<input type=HIDDEN NAME=CLASSNO VALUE=$sclassno>
<input type=HIDDEN NAME=ORDERNO VALUE=$sorderno>
<input type=HIDDEN name=PERIOD value=$speriod>
<input type=HIDDEN NAME=LOADFORM VALUE=SUBMIT>
</form>


<form NAME=lessons ACTION=getdata.pl METHOD=POST>
                <input type=HIDDEN NAME=LOADOBJECTPAGE VALUE=nteacherclasspage1.HTML>
<input type=HIDDEN NAME=LESSONNO VALUE=$slessonno>
<input type=HIDDEN NAME=PRIMEKEY VALUE=$sstudentno>
<input type=HIDDEN NAME=STUDENTNO VALUE=$sstudentno>
<input type=HIDDEN NAME=TEACHERNO VALUE=$steacherno>
<input type=HIDDEN NAME=CLASSNO VALUE=$sclassno>
<input type=HIDDEN NAME=ORDERNO VALUE=$sorderno>
<input type=HIDDEN name=PERIOD value=$speriod>
<input type=HIDDEN name=SELECTCATEGORY value=Select>
<input type=HIDDEN NAME=LOADFORM VALUE=SUBMIT>
</form>

<form NAME=currentlessons ACTION=getdata.pl METHOD=POST>
                <input type=HIDDEN NAME=LOADOBJECTPAGE VALUE=nteacherclasspage1.HTML>
<input type=HIDDEN NAME=LESSONNO VALUE=$slessonno>
<input type=HIDDEN NAME=PRIMEKEY VALUE=$sstudentno>
<input type=HIDDEN NAME=STUDENTNO VALUE=$sstudentno>
<input type=HIDDEN NAME=TEACHERNO VALUE=$steacherno>
<input type=HIDDEN NAME=CLASSNO VALUE=$sclassno>
<input type=HIDDEN NAME=ORDERNO VALUE=$sorderno>
<input type=HIDDEN name=PERIOD value=$speriod>
<input type=HIDDEN NAME=LOADFORM VALUE=SUBMIT>
</form>

<form NAME=teacherinfo ACTION=getdata.pl METHOD=POST>
                <input type=HIDDEN NAME=LOADOBJECTPAGE VALUE=nteacherinfo1.HTML>
<input type=HIDDEN NAME=LESSONNO VALUE=$slessonno>
<input type=HIDDEN NAME=PRIMEKEY VALUE=$sstudentno>
<input type=HIDDEN NAME=STUDENTNO VALUE=$sstudentno>
<input type=HIDDEN NAME=TEACHERNO VALUE=$steacherno>
<input type=HIDDEN NAME=CLASSNO VALUE=$sclassno>
<input type=HIDDEN NAME=ORDERNO VALUE=$sorderno>
<input type=HIDDEN name=PERIOD value=$speriod>
<input type=HIDDEN NAME=LOADFORM VALUE=SUBMIT>
</form>

<form NAME=myschools ACTION=getdata.pl METHOD=POST>
                <input type=HIDDEN NAME=LOADOBJECTPAGE VALUE=nteacherschools.HTML>
<input type=HIDDEN NAME=LESSONNO VALUE=$slessonno>
<input type=HIDDEN NAME=PRIMEKEY VALUE=$sstudentno>
<input type=HIDDEN NAME=STUDENTNO VALUE=$sstudentno>
<input type=HIDDEN NAME=TEACHERNO VALUE=$steacherno>
<input type=HIDDEN NAME=CLASSNO VALUE=$sclassno>
<input type=HIDDEN NAME=ORDERNO VALUE=$sorderno>
<input type=HIDDEN name=PERIOD value=$speriod>
<input type=HIDDEN NAME=LOADFORM VALUE=SUBMIT>
</form>

<form NAME=inactivelessons ACTION=getdata.pl METHOD=POST>
                <input type=HIDDEN NAME=LOADOBJECTPAGE VALUE=nteacherclasspage1na.HTML>
<input type=HIDDEN NAME=LESSONNO VALUE=$slessonno>
<input type=HIDDEN NAME=PRIMEKEY VALUE=$sstudentno>
<input type=HIDDEN NAME=STUDENTNO VALUE=$sstudentno>
<input type=HIDDEN NAME=TEACHERNO VALUE=$steacherno>
<input type=HIDDEN NAME=CLASSNO VALUE=$sclassno>
<input type=HIDDEN NAME=ORDERNO VALUE=$sorderno>
<input type=HIDDEN name=PERIOD value=$speriod>
<input type=HIDDEN NAME=LOADFORM VALUE=SUBMIT>
</form>

<form NAME=inactiveclasses ACTION=getdata.pl METHOD=POST>
                <input type=HIDDEN NAME=LOADOBJECTPAGE VALUE=nteacherinactiveclasses.HTML>
<input type=HIDDEN NAME=LESSONNO VALUE=$slessonno>
<input type=HIDDEN NAME=PRIMEKEY VALUE=$sstudentno>
<input type=HIDDEN NAME=STUDENTNO VALUE=$sstudentno>
<input type=HIDDEN NAME=TEACHERNO VALUE=$steacherno>
<input type=HIDDEN NAME=CLASSNO VALUE=$sclassno>
<input type=HIDDEN NAME=ORDERNO VALUE=$sorderno>
<input type=HIDDEN name=PERIOD value=$speriod>
<input type=HIDDEN NAME=LOADFORM VALUE=SUBMIT>
</form>

<form NAME=addaschool ACTION=getdata.pl METHOD=POST>
                <input type=HIDDEN NAME=LOADOBJECTPAGE VALUE=nteacheraddaschool.HTML>
<input type=HIDDEN NAME=LESSONNO VALUE=$slessonno>
<input type=HIDDEN NAME=PRIMEKEY VALUE=$sstudentno>
<input type=HIDDEN NAME=STUDENTNO VALUE=$sstudentno>
<input type=HIDDEN NAME=TEACHERNO VALUE=$steacherno>
<input type=HIDDEN NAME=CLASSNO VALUE=$sclassno>
<input type=HIDDEN NAME=ORDERNO VALUE=$sorderno>
<input type=HIDDEN name=PERIOD value=$speriod>
<input type=HIDDEN NAME=LOADFORM VALUE=SUBMIT>
</form>

<form NAME=addaclass ACTION=getdata.pl METHOD=POST>
                <input type=HIDDEN NAME=LOADOBJECTPAGE VALUE=nteacheraddaclass.HTML>
<input type=HIDDEN NAME=LESSONNO VALUE=$slessonno>
<input type=HIDDEN NAME=PRIMEKEY VALUE=$sstudentno>
<input type=HIDDEN NAME=STUDENTNO VALUE=$sstudentno>
<input type=HIDDEN NAME=TEACHERNO VALUE=$steacherno>
<input type=HIDDEN NAME=CLASSNO VALUE=$sclassno>
<input type=HIDDEN NAME=ORDERNO VALUE=$sorderno>
<input type=HIDDEN name=PERIOD value=$speriod>
<input type=HIDDEN NAME=LOADFORM VALUE=SUBMIT>
</form>

<form NAME=homework ACTION=getdata.pl METHOD=POST>
                <input type=HIDDEN NAME=LOADOBJECTPAGE VALUE=nteacherhomeworkclass.HTML>
<input type=HIDDEN NAME=LESSONNO VALUE=$slessonno>
<input type=HIDDEN NAME=PRIMEKEY VALUE=$sstudentno>
<input type=HIDDEN NAME=STUDENTNO VALUE=$sstudentno>
<input type=HIDDEN NAME=TEACHERNO VALUE=$steacherno>
<input type=HIDDEN NAME=CLASSNO VALUE=$sclassno>
<input type=HIDDEN NAME=ORDERNO VALUE=$sorderno>
<input type=HIDDEN name=PERIOD value=$speriod>
<input type=HIDDEN NAME=LOADFORM VALUE=SUBMIT>
</form>

<form NAME=grades ACTION=getdata.pl METHOD=POST>
                <input type=HIDDEN NAME=LOADOBJECTPAGE VALUE=nteacherclasslist.HTML>
<input type=HIDDEN NAME=LESSONNO VALUE=$slessonno>
<input type=HIDDEN NAME=PRIMEKEY VALUE=$sstudentno>
<input type=HIDDEN NAME=STUDENTNO VALUE=$sstudentno>
<input type=HIDDEN NAME=TEACHERNO VALUE=$steacherno>
<input type=HIDDEN NAME=CLASSNO VALUE=$sclassno>
<input type=HIDDEN NAME=ORDERNO VALUE=$sorderno>
<input type=HIDDEN name=PERIOD value=$speriod>
<input type=HIDDEN NAME=LOADFORM VALUE=SUBMIT>
</form>

<form NAME=lessongrades ACTION=getdata.pl METHOD=POST>
                <input type=HIDDEN NAME=LOADOBJECTPAGE VALUE=nteacherclassgrades.HTML>
<input type=HIDDEN NAME=LESSONNO VALUE=$slessonno>
<input type=HIDDEN NAME=PRIMEKEY VALUE=$sstudentno>
<input type=HIDDEN NAME=STUDENTNO VALUE=$sstudentno>
<input type=HIDDEN NAME=TEACHERNO VALUE=$steacherno>
<input type=HIDDEN NAME=CLASSNO VALUE=$sclassno>
<input type=HIDDEN NAME=ORDERNO VALUE=$sorderno>
<input type=HIDDEN name=PERIOD value=$speriod>
<input type=HIDDEN NAME=LOADFORM VALUE=SUBMIT>
</form>

<form NAME=tests ACTION=getdata.pl METHOD=POST>
                <input type=HIDDEN NAME=LOADOBJECTPAGE VALUE=nteacherassessmentpage1.HTML>
<input type=HIDDEN NAME=LESSONNO VALUE=$slessonno>
<input type=HIDDEN NAME=PRIMEKEY VALUE=$sstudentno>
<input type=HIDDEN NAME=STUDENTNO VALUE=$sstudentno>
<input type=HIDDEN NAME=TEACHERNO VALUE=$steacherno>
<input type=HIDDEN NAME=CLASSNO VALUE=$sclassno>
<input type=HIDDEN NAME=ORDERNO VALUE=$sorderno>
<input type=HIDDEN name=PERIOD value=$speriod>
<input type=HIDDEN NAME=LOADFORM VALUE=SUBMIT>
</form>

<form NAME=editclass ACTION=getdata.pl METHOD=POST>
                <input type=HIDDEN NAME=LOADOBJECTPAGE VALUE=nteacherclassedit.HTML>
<input type=HIDDEN NAME=LESSONNO VALUE=$slessonno>
<input type=HIDDEN NAME=PRIMEKEY VALUE=$sstudentno>
<input type=HIDDEN NAME=STUDENTNO VALUE=$sstudentno>
<input type=HIDDEN NAME=TEACHERNO VALUE=$steacherno>
<input type=HIDDEN NAME=CLASSNO VALUE=$sclassno>
<input type=HIDDEN NAME=ORDERNO VALUE=$sorderno>
<input type=HIDDEN name=PERIOD value=$speriod>
<input type=HIDDEN NAME=LOADFORM VALUE=SUBMIT>
</form>

<form NAME=teams ACTION=getdata.pl METHOD=POST>
                <input type=HIDDEN NAME=LOADOBJECTPAGE VALUE=nteacherteampage1.HTML>
<input type=HIDDEN NAME=LESSONNO VALUE=$slessonno>
<input type=HIDDEN NAME=PRIMEKEY VALUE=$sstudentno>
<input type=HIDDEN NAME=STUDENTNO VALUE=$sstudentno>
<input type=HIDDEN NAME=TEACHERNO VALUE=$steacherno>
<input type=HIDDEN NAME=CLASSNO VALUE=$sclassno>
<input type=HIDDEN NAME=ORDERNO VALUE=$sorderno>
<input type=HIDDEN name=PERIOD value=$speriod>
<input type=HIDDEN NAME=LOADFORM VALUE=SUBMIT>
</form>
<form NAME=discipline ACTION=getdata.pl METHOD=POST>
                <input type=HIDDEN NAME=LOADOBJECTPAGE VALUE=nteacherdiscipline1.HTML>
<input type=HIDDEN NAME=LESSONNO VALUE=$slessonno>
<input type=HIDDEN NAME=PRIMEKEY VALUE=$sstudentno>
<input type=HIDDEN NAME=STUDENTNO VALUE=$sstudentno>
<input type=HIDDEN NAME=TEACHERNO VALUE=$steacherno>
<input type=HIDDEN NAME=CLASSNO VALUE=$sclassno>
<input type=HIDDEN NAME=ORDERNO VALUE=$sorderno>
<input type=HIDDEN name=PERIOD value=$speriod>
<input type=HIDDEN NAME=LOADFORM VALUE=SUBMIT>
</form>
<form NAME=announcements ACTION=getdata.pl METHOD=POST>
                <input type=HIDDEN NAME=LOADOBJECTPAGE VALUE=nteacherannouncements.HTML>
<input type=HIDDEN NAME=LESSONNO VALUE=$slessonno>
<input type=HIDDEN NAME=PRIMEKEY VALUE=$sstudentno>
<input type=HIDDEN NAME=STUDENTNO VALUE=$sstudentno>
<input type=HIDDEN NAME=TEACHERNO VALUE=$steacherno>
<input type=HIDDEN NAME=CLASSNO VALUE=$sclassno>
<input type=HIDDEN NAME=ORDERNO VALUE=$sorderno>
<input type=HIDDEN name=PERIOD value=$speriod>
<input type=HIDDEN NAME=LOADFORM VALUE=SUBMIT>
</form>


<form NAME=lessonplans ACTION=getdata.pl METHOD=POST>
                <input type=HIDDEN NAME=LOADOBJECTPAGE VALUE=nteacherlessonplans.HTML>
<input type=HIDDEN NAME=LESSONNO VALUE=$slessonno>
<input type=HIDDEN NAME=PRIMEKEY VALUE=$sstudentno>
<input type=HIDDEN NAME=STUDENTNO VALUE=$sstudentno>
<input type=HIDDEN NAME=TEACHERNO VALUE=$steacherno>
<input type=HIDDEN NAME=CLASSNO VALUE=$sclassno>
<input type=HIDDEN NAME=ORDERNO VALUE=$sorderno>
<input type=HIDDEN name=PERIOD value=$speriod>
<input type=HIDDEN NAME=LOADFORM VALUE=SUBMIT>
</form>

<form NAME=observations ACTION=getdata.pl METHOD=POST>
                <input type=HIDDEN NAME=LOADOBJECTPAGE VALUE=nteacherobservations.HTML>
<input type=HIDDEN NAME=LESSONNO VALUE=$slessonno>
<input type=HIDDEN NAME=PRIMEKEY VALUE=$sstudentno>
<input type=HIDDEN NAME=STUDENTNO VALUE=$sstudentno>
<input type=HIDDEN NAME=TEACHERNO VALUE=$steacherno>
<input type=HIDDEN NAME=CLASSNO VALUE=$sclassno>
<input type=HIDDEN NAME=ORDERNO VALUE=$sorderno>
<input type=HIDDEN name=PERIOD value=$speriod>
<input type=HIDDEN NAME=LOADFORM VALUE=SUBMIT>
</form>

<form NAME=standards ACTION=getdata.pl METHOD=POST>
                <input type=HIDDEN NAME=LOADOBJECTPAGE VALUE=nteacherstandards.HTML>
<input type=HIDDEN NAME=LESSONNO VALUE=$slessonno>
<input type=HIDDEN NAME=PRIMEKEY VALUE=$sstudentno>
<input type=HIDDEN NAME=STUDENTNO VALUE=$sstudentno>
<input type=HIDDEN NAME=TEACHERNO VALUE=$steacherno>
<input type=HIDDEN NAME=CLASSNO VALUE=$sclassno>
<input type=HIDDEN NAME=ORDERNO VALUE=$sorderno>
<input type=HIDDEN name=PERIOD value=$speriod>
<input type=HIDDEN NAME=LOADFORM VALUE=SUBMIT>
</form>

<form NAME=curriculum ACTION=getdata.pl METHOD=POST>
                <input type=HIDDEN NAME=LOADOBJECTPAGE VALUE=nteachercurriculumlist.HTML>
<input type=HIDDEN NAME=LESSONNO VALUE=$slessonno>
<input type=HIDDEN NAME=PRIMEKEY VALUE=$sstudentno>
<input type=HIDDEN NAME=STUDENTNO VALUE=$sstudentno>
<input type=HIDDEN NAME=TEACHERNO VALUE=$steacherno>
<input type=HIDDEN NAME=CLASSNO VALUE=$sclassno>
<input type=HIDDEN NAME=ORDERNO VALUE=$sorderno>
<input type=HIDDEN name=PERIOD value=$speriod>
<input type=HIDDEN NAME=LOADFORM VALUE=SUBMIT>
</form>
<form NAME=enrollment ACTION=getdata.pl METHOD=POST>
                <input type=HIDDEN NAME=LOADOBJECTPAGE VALUE=nteacherclasslist.HTML>
<input type=HIDDEN NAME=LESSONNO VALUE=$slessonno>
<input type=HIDDEN NAME=PRIMEKEY VALUE=$sstudentno>
<input type=HIDDEN NAME=STUDENTNO VALUE=$sstudentno>
<input type=HIDDEN NAME=TEACHERNO VALUE=$steacherno>
<input type=HIDDEN NAME=CLASSNO VALUE=$sclassno>
<input type=HIDDEN NAME=ORDERNO VALUE=$sorderno>
<input type=HIDDEN name=PERIOD value=$speriod>
<input type=HIDDEN NAME=LOADFORM VALUE=SUBMIT>
</form>

<form NAME=seatingcharts ACTION=getdata.pl METHOD=POST>
                <input type=HIDDEN NAME=LOADOBJECTPAGE VALUE=nteacherclassseating.HTML>
<input type=HIDDEN NAME=LESSONNO VALUE=$slessonno>
<input type=HIDDEN NAME=PRIMEKEY VALUE=$sstudentno>
<input type=HIDDEN NAME=STUDENTNO VALUE=$sstudentno>
<input type=HIDDEN NAME=TEACHERNO VALUE=$steacherno>
<input type=HIDDEN NAME=CLASSNO VALUE=$sclassno>
<input type=HIDDEN NAME=ORDERNO VALUE=$sorderno>
<input type=HIDDEN name=PERIOD value=$speriod>
<input type=HIDDEN NAME=LOADFORM VALUE=SUBMIT>
</form>

<form NAME=addchat ACTION=getdata.pl METHOD=POST>
                <input type=HIDDEN NAME=LOADOBJECTPAGE VALUE=nteacherchatadd.HTML>
<input type=HIDDEN NAME=LESSONNO VALUE=$slessonno>
<input type=HIDDEN NAME=PRIMEKEY VALUE=$sstudentno>
<input type=HIDDEN NAME=STUDENTNO VALUE=$sstudentno>
<input type=HIDDEN NAME=TEACHERNO VALUE=$steacherno>
<input type=HIDDEN NAME=CLASSNO VALUE=$sclassno>
<input type=HIDDEN NAME=ORDERNO VALUE=$sorderno>
<input type=HIDDEN name=PERIOD value=$speriod>
<input type=HIDDEN NAME=LOADFORM VALUE=SUBMIT>
</form>

<form NAME=chats ACTION=getdata.pl METHOD=POST>
                <input type=HIDDEN NAME=LOADOBJECTPAGE VALUE=nteacherchats.HTML>
<input type=HIDDEN NAME=LESSONNO VALUE=$slessonno>
<input type=HIDDEN NAME=PRIMEKEY VALUE=$sstudentno>
<input type=HIDDEN NAME=STUDENTNO VALUE=$sstudentno>
<input type=HIDDEN NAME=TEACHERNO VALUE=$steacherno>
<input type=HIDDEN NAME=CLASSNO VALUE=$sclassno>
<input type=HIDDEN NAME=ORDERNO VALUE=$sorderno>
<input type=HIDDEN name=PERIOD value=$speriod>
<input type=HIDDEN NAME=LOADFORM VALUE=SUBMIT>
</form>

<form NAME=discussions  ACTION=getdata.pl METHOD=POST>
                <input type=HIDDEN NAME=LOADOBJECTPAGE VALUE=nteacherblogpage1.HTML>
<input type=HIDDEN NAME=LESSONNO VALUE=$slessonno>
<input type=HIDDEN NAME=PRIMEKEY VALUE=$sstudentno>
<input type=HIDDEN NAME=STUDENTNO VALUE=$sstudentno>
<input type=HIDDEN NAME=TEACHERNO VALUE=$steacherno>
<input type=HIDDEN NAME=CLASSNO VALUE=$sclassno>
<input type=HIDDEN NAME=ORDERNO VALUE=$sorderno>
<input type=HIDDEN name=PERIOD value=$speriod>
<input type=HIDDEN NAME=LOADFORM VALUE=SUBMIT>
</form>

<form NAME=myclasses ACTION=getdata.pl METHOD=POST>
                <input type=HIDDEN NAME=LOADOBJECTPAGE VALUE=nteacherclasses.HTML>
<input type=HIDDEN NAME=LESSONNO VALUE=$slessonno>
<input type=HIDDEN NAME=PRIMEKEY VALUE=$sstudentno>
<input type=HIDDEN NAME=STUDENTNO VALUE=$sstudentno>
<input type=HIDDEN NAME=TEACHERNO VALUE=$steacherno>
<input type=HIDDEN NAME=CLASSNO VALUE=$sclassno>
<input type=HIDDEN NAME=ORDERNO VALUE=$sorderno>
<input type=HIDDEN name=PERIOD value=$speriod>
<input type=HIDDEN NAME=LOADFORM VALUE=SUBMIT>
</form>

<form NAME=manageseats ACTION=getdata.pl METHOD=POST>
                <input type=HIDDEN NAME=LOADOBJECTPAGE VALUE=nteacherseatedit.HTML>
<input type=HIDDEN NAME=LESSONNO VALUE=$slessonno>
<input type=HIDDEN NAME=PRIMEKEY VALUE=$sstudentno>
<input type=HIDDEN NAME=STUDENTNO VALUE=$sstudentno>
<input type=HIDDEN NAME=TEACHERNO VALUE=$steacherno>
<input type=HIDDEN NAME=CLASSNO VALUE=$sclassno>
<input type=HIDDEN NAME=ORDERNO VALUE=$sorderno>
<input type=HIDDEN name=PERIOD value=$speriod>
<input type=HIDDEN NAME=LOADFORM VALUE=SUBMIT>
</form>

<form NAME=gradebook ACTION=getdata.pl METHOD=POST>
                <input type=HIDDEN NAME=LOADOBJECTPAGE VALUE=nteacherlessongrades2.HTML>
<input type=HIDDEN NAME=LESSONNO VALUE=$slessonno>
<input type=HIDDEN NAME=PRIMEKEY VALUE=$sstudentno>
<input type=HIDDEN NAME=STUDENTNO VALUE=$sstudentno>
<input type=HIDDEN NAME=TEACHERNO VALUE=$steacherno>
<input type=HIDDEN NAME=CLASSNO VALUE=$sclassno>
<input type=HIDDEN NAME=ORDERNO VALUE=$sorderno>
<input type=HIDDEN name=PERIOD value=$speriod>
<input type=HIDDEN NAME=LOADFORM VALUE=SUBMIT>
</form>

<form NAME=teacherresources ACTION=getdata.pl METHOD=POST>
                <input type=HIDDEN NAME=LOADOBJECTPAGE VALUE=nteacherresources1.HTML>
<input type=HIDDEN NAME=LESSONNO VALUE=$slessonno>
<input type=HIDDEN NAME=PRIMEKEY VALUE=$sstudentno>
<input type=HIDDEN NAME=STUDENTNO VALUE=$sstudentno>
<input type=HIDDEN NAME=TEACHERNO VALUE=$steacherno>
<input type=HIDDEN NAME=CLASSNO VALUE=$sclassno>
<input type=HIDDEN NAME=ORDERNO VALUE=$sorderno>
<input type=HIDDEN name=PERIOD value=$speriod>
<input type=HIDDEN NAME=LOADFORM VALUE=SUBMIT>
</form>


<form NAME=manageteams ACTION=getdata.pl METHOD=POST>
                <input type=HIDDEN NAME=LOADOBJECTPAGE VALUE=nteacherteamedit.HTML>
<input type=HIDDEN NAME=LESSONNO VALUE=$slessonno>
<input type=HIDDEN NAME=PRIMEKEY VALUE=$sstudentno>
<input type=HIDDEN NAME=STUDENTNO VALUE=$sstudentno>
<input type=HIDDEN NAME=TEACHERNO VALUE=$steacherno>
<input type=HIDDEN NAME=CLASSNO VALUE=$sclassno>
<input type=HIDDEN NAME=ORDERNO VALUE=$sorderno>
<input type=HIDDEN name=PERIOD value=$speriod>
<input type=HIDDEN NAME=LOADFORM VALUE=SUBMIT>
</form>


 <form NAME=questions ACTION=getdata.pl METHOD=POST>
<input type=HIDDEN NAME=LOADOBJECTPAGE VALUE=nteacherquestionpage1.html>
<input type=HIDDEN NAME=LESSONNO VALUE=$slessonno>
<input type=HIDDEN NAME=PRIMEKEY VALUE=$sstudentno>
<input type=HIDDEN NAME=STUDENTNO VALUE=$sstudentno>
<input type=HIDDEN NAME=TEACHERNO VALUE=$steacherno>
<input type=HIDDEN NAME=CLASSNO VALUE=$sclassno>
<input type=HIDDEN NAME=ORDERNO VALUE=$sorderno>
<input type=HIDDEN name=PERIOD value=$speriod>
<input type="HIDDEN" size="20" name="TEACHER" VALUE="YES">
<input type=HIDDEN NAME=LOADFORM VALUE=NONE>
<input type=HIDDEN NAME=CONCEPTNO VALUE=$sconceptno>
<input type=HIDDEN NAME=QUESTIONNO VALUE=$squestionno>
</form>


ENDHTML
}


if( $sdata3 eq "SAMPLECHART" )
{    

	  my($filedelete) = "$slessonno.png";
      unlink($filedelete);


      # Create a XYChart object of size 250 x 250 pixels
      my $c = new XYChart(600, 600);
      $c->xAxis()->setLabelStyle("arial.ttf", 8, 0x8000,90);
      # Set the plotarea at (30, 20) and of size 200 x 200 pixels
      $c->setPlotArea(30, 20, 550, 450);

      my @sdata = [6,5,88,4];
	  # The data for the bar chart
     
       my($sqlcommand) = "SELECT STUDENT,PERCENTAGE FROM GRADEBOOK_LESSON WHERE LESSONNO = $slessonno";
       
       $connection->Sql("$sqlcommand");
     
       my($xx) = 0;
	     my(@check);
	     my(@dataarray);
	              
       while($connection->FetchRow() )
       {


           #$check = $connection->Data("PERCENTAGE");
          push(@check,$connection->Data("PERCENTAGE"));
                 
		      $c->xAxis()->addLabel( $xx,$connection->Data("STUDENT"));
          #push(@dataarray, $check[$xx] );

          $xx = $xx + 1;
		  
         #@dataarray = ( @dataarray , $check[0] );

    
		      if( $xx eq 30 )
		      {
		        last;
		      }


         
       }


        if( $xx eq 1)	{  @dataarray = [ $check[0] ]; }
        if( $xx eq 2)	{  @dataarray = [ $check[0],  $check[1] ]; }
        if( $xx eq 3)	{  @dataarray = [ $check[0],  $check[1],  $check[2] ]; }
        if( $xx eq 4)	{  @dataarray = [ $check[0],  $check[1],  $check[2],  $check[3] ]; }
        if( $xx eq 5) {  @dataarray = [ $check[0],  $check[1],  $check[2],  $check[3],  $check[4] ]; }
        if( $xx eq 6)	{  @dataarray = [ $check[0],  $check[1],  $check[2],  $check[3],  $check[4],  $check[5] ]; }
        if( $xx eq 7)	{  @dataarray = [ $check[0],  $check[1],  $check[2],  $check[3],  $check[4],  $check[5],  $check[6] ]; }
        if( $xx eq 8)	{  @dataarray = [ $check[0],  $check[1],  $check[2],  $check[3],  $check[4],  $check[5],  $check[6],  $check[7] ]; }
        if( $xx eq 8)	{  @dataarray = [ $check[0],  $check[1],  $check[2],  $check[3],  $check[4],  $check[5],  $check[6],  $check[7],  $check[8] ]; }
        if( $xx eq 9)	{  @dataarray = [ $check[0],  $check[1],  $check[2],  $check[3],  $check[4],  $check[5],  $check[6],  $check[7],  $check[8],  $check[9] ]; }
        if( $xx eq 10){  @dataarray = [ $check[0],  $check[1],  $check[2],  $check[3],  $check[4],  $check[5],  $check[6],  $check[7],  $check[8],  $check[9],  $check[10] ]; }
        if( $xx eq 11){  @dataarray = [ $check[0],  $check[1],  $check[2],  $check[3],  $check[4],  $check[5],  $check[6],  $check[7],  $check[8],  $check[9],  $check[10],  $check[11] ]; }
        if( $xx eq 12){  @dataarray = [ $check[0],  $check[1],  $check[2],  $check[3],  $check[4],  $check[5],  $check[6],  $check[7],  $check[8],  $check[9],  $check[10],  $check[11],  $check[12] ]; }
        if( $xx eq 13){  @dataarray = [ $check[0],  $check[1],  $check[2],  $check[3],  $check[4],  $check[5],  $check[6],  $check[7],  $check[8],  $check[9],  $check[10],  $check[11],  $check[12],  $check[13] ]; }
        if( $xx eq 14){  @dataarray = [ $check[0],  $check[1],  $check[2],  $check[3],  $check[4],  $check[5],  $check[6],  $check[7],  $check[8],  $check[9],  $check[10],  $check[11],  $check[12],  $check[13],  $check[14] ]; }
        if( $xx eq 15){  @dataarray = [ $check[0],  $check[1],  $check[2],  $check[3],  $check[4],  $check[5],  $check[6],  $check[7],  $check[8],  $check[9],  $check[10],  $check[11],  $check[12],  $check[13],  $check[14],  $check[15] ]; }
        if( $xx eq 16){  @dataarray = [ $check[0],  $check[1],  $check[2],  $check[3],  $check[4],  $check[5],  $check[6],  $check[7],  $check[8],  $check[9],  $check[10],  $check[11],  $check[12],  $check[13],  $check[14],  $check[15],  $check[16] ]; }
        if( $xx eq 17){  @dataarray = [ $check[0],  $check[1],  $check[2],  $check[3],  $check[4],  $check[5],  $check[6],  $check[7],  $check[8],  $check[9],  $check[10],  $check[11],  $check[12],  $check[13],  $check[14],  $check[15],  $check[16],  $check[17] ]; }
        if( $xx eq 18){  @dataarray = [ $check[0],  $check[1],  $check[2],  $check[3],  $check[4],  $check[5],  $check[6],  $check[7],  $check[8],  $check[9],  $check[10],  $check[11],  $check[12],  $check[13],  $check[14],  $check[15],  $check[16],  $check[17],  $check[18] ]; }
        if( $xx eq 19){  @dataarray = [ $check[0],  $check[1],  $check[2],  $check[3],  $check[4],  $check[5],  $check[6],  $check[7],  $check[8],  $check[9],  $check[10],  $check[11],  $check[12],  $check[13],  $check[14],  $check[15],  $check[16],  $check[17],  $check[18],  $check[19] ]; }
        if( $xx eq 20){  @dataarray = [ $check[0],  $check[1],  $check[2],  $check[3],  $check[4],  $check[5],  $check[6],  $check[7],  $check[8],  $check[9],  $check[10],  $check[11],  $check[12],  $check[13],  $check[14],  $check[15],  $check[16],  $check[17],  $check[18],  $check[19],  $check[20] ]; }
        if( $xx eq 21){  @dataarray = [ $check[0],  $check[1],  $check[2],  $check[3],  $check[4],  $check[5],  $check[6],  $check[7],  $check[8],  $check[9],  $check[10],  $check[11],  $check[12],  $check[13],  $check[14],  $check[15],  $check[16],  $check[17],  $check[18],  $check[19],  $check[20],  $check[21] ]; }
        if( $xx eq 22){  @dataarray = [ $check[0],  $check[1],  $check[2],  $check[3],  $check[4],  $check[5],  $check[6],  $check[7],  $check[8],  $check[9],  $check[10],  $check[11],  $check[12],  $check[13],  $check[14],  $check[15],  $check[16],  $check[17],  $check[18],  $check[19],  $check[20],  $check[21],  $check[22] ]; }
        if( $xx eq 23){  @dataarray = [ $check[0],  $check[1],  $check[2],  $check[3],  $check[4],  $check[5],  $check[6],  $check[7],  $check[8],  $check[9],  $check[10],  $check[11],  $check[12],  $check[13],  $check[14],  $check[15],  $check[16],  $check[17],  $check[18],  $check[19],  $check[20],  $check[21],  $check[22],  $check[23] ]; }
        if( $xx eq 24){  @dataarray = [ $check[0],  $check[1],  $check[2],  $check[3],  $check[4],  $check[5],  $check[6],  $check[7],  $check[8],  $check[9],  $check[10],  $check[11],  $check[12],  $check[13],  $check[14],  $check[15],  $check[16],  $check[17],  $check[18],  $check[19],  $check[20],  $check[21],  $check[22],  $check[23],  $check[24] ]; }
        if( $xx eq 25){  @dataarray = [ $check[0],  $check[1],  $check[2],  $check[3],  $check[4],  $check[5],  $check[6],  $check[7],  $check[8],  $check[9],  $check[10],  $check[11],  $check[12],  $check[13],  $check[14],  $check[15],  $check[16],  $check[17],  $check[18],  $check[19],  $check[20],  $check[21],  $check[22],  $check[23],  $check[24],  $check[25] ]; }
        if( $xx eq 26){  @dataarray = [ $check[0],  $check[1],  $check[2],  $check[3],  $check[4],  $check[5],  $check[6],  $check[7],  $check[8],  $check[9],  $check[10],  $check[11],  $check[12],  $check[13],  $check[14],  $check[15],  $check[16],  $check[17],  $check[18],  $check[19],  $check[20],  $check[21],  $check[22],  $check[23],  $check[24],  $check[25],  $check[26] ]; }
        if( $xx eq 27){  @dataarray = [ $check[0],  $check[1],  $check[2],  $check[3],  $check[4],  $check[5],  $check[6],  $check[7],  $check[8],  $check[9],  $check[10],  $check[11],  $check[12],  $check[13],  $check[14],  $check[15],  $check[16],  $check[17],  $check[18],  $check[19],  $check[20],  $check[21],  $check[22],  $check[23],  $check[24],  $check[25],  $check[26],  $check[27] ]; }
        if( $xx eq 28){  @dataarray = [ $check[0],  $check[1],  $check[2],  $check[3],  $check[4],  $check[5],  $check[6],  $check[7],  $check[8],  $check[9],  $check[10],  $check[11],  $check[12],  $check[13],  $check[14],  $check[15],  $check[16],  $check[17],  $check[18],  $check[19],  $check[20],  $check[21],  $check[22],  $check[23],  $check[24],  $check[25],  $check[26],  $check[27],  $check[28] ]; }
        if( $xx eq 29){  @dataarray = [ $check[0],  $check[1],  $check[2],  $check[3],  $check[4],  $check[5],  $check[6],  $check[7],  $check[8],  $check[9],  $check[10],  $check[11],  $check[12],  $check[13],  $check[14],  $check[15],  $check[16],  $check[17],  $check[18],  $check[19],  $check[20],  $check[21],  $check[22],  $check[23],  $check[24],  $check[25],  $check[26],  $check[27],  $check[28],  $check[29] ]; }
        if( $xx eq 30){  @dataarray = [ $check[0],  $check[1],  $check[2],  $check[3],  $check[4],  $check[5],  $check[6],  $check[7],  $check[8],  $check[9],  $check[10],  $check[11],  $check[12],  $check[13],  $check[14],  $check[15],  $check[16],  $check[17],  $check[18],  $check[19],  $check[20],  $check[21],  $check[22],  $check[23],  $check[24],  $check[25],  $check[26],  $check[27],  $check[28],  $check[29],  $check[30] ]; }



     #@dataarray = [ $check[0],$check[1],$check[2],$check[3], $check[4],$check[5] ];
       
      # Add a bar chart layer using the given data
      #$c->addBarLayer(@dataarray);
      #$c->addBarLayer($check[0],$check[1],$check[2]];
      #$c->addBarLayer(check, 0x99ff99, "Vol (Up day)");
      #$c->addLineLayer(@dataarray);

      #$c->setFontAngle(0,1);
      # output the chart

       $c->addBarLayer(@dataarray);


      $c->makeChart("$filedelete");

	 
      print("<img src=$filedelete border=0  />");

  

 




}

     if( $sdata3 eq "ANALYZECLASS" )
      {
        $sqlcommand = "SELECT DISTINCT A.STANDARD, B.DESCRIPTION FROM LESSON A , STANDARDS B WHERE A.CLASSNO = $sclassno AND A.STANDARD = B.STANDARD AND B.SCHOOLNO = $schoolno ORDER BY A.STANDARD";
        #print("$sqlcommand");
        #print("$sqlcommand");
        $connection->Sql("$sqlcommand");

        my($analyzestandard) = "";
        my($analyzedescription) = "";

        my($sqlcommand2) = "";

        while( $connection->FetchRow() )
        {
      
             $analyzestandard = $connection->Data("STANDARD");
             $analyzedescription = $connection->Data("DESCRIPTION");
             print("<li><b>$analyzestandard</b> - $analyzedescription </li>");
             print("<BR>");
             
             $sqlcommand2 = "SELECT DISTINCT B.STUDENTNO, B.[PERCENT] AS PERCENTAGE, C.STUDENT, A.LESSON FROM LESSON A, STUDLESS B, STUDENT C WHERE A.STANDARD = '$analyzestandard' AND A.LESSONNO = B.LESSONNO AND B.STUDENTNO = C.STUDENTNO AND B.[PERCENT] > 0 ORDER BY B.[PERCENT]";
             #print("$sqlcommand2");
             #print("$sqlcommand");
             $connection2->Sql("$sqlcommand2");

             my($analyzestudentno) = "";
              my($analyzelesson) = "";
             my($analyzestudent) = "";
             my($analyzepercentage) = "";

             while( $connection2->FetchRow() )
             {

               $analyzestudentno = $connection2->Data("STUDENTNO");
               $analyzestudent = $connection2->Data("STUDENT");
               $analyzepercentage = $connection2->Data("PERCENTAGE");
               $analyzelesson = $connection2->Data("LESSON");
               #$analyzestudent = sprintf("%-30s", $analyzestudent);
               #$analyzestudentno = sprintf("%-15s", $analyzestudentno);
               
               print("<BR>%$analyzepercentage - <b>$analyzestudent</b> : $analyzelesson");

             }
             print("<BR><BR>");
             
             
        }




	  
	 }
    if($sdata3 eq "LESSONPROGRESSREPORT"  )
        {

       my($sqlcommand) = "SELECT PARENT1,ADDRESS1,ADDRESS2,CITY,STATE,ZIP,STUDENTNO,LETTERGRADE, STUDENT, CLASS , PERIOD, [PERCENT] FROM CLASSLISTING WHERE CLASSNO = '$sclassno' AND STUDENTNO = '$sstudentno'";
       #fixit
      # print("$sqlcommand");
       $connection->Sql("$sqlcommand");

       my($pr_studentno) = "";
       my($pr_student) = "";
       my($pr_class) = "";
       my($pr_period) = "";
       my($pr_percent) = "";
       my($pr_parent1) = "";
       my($pr_address1) = "";
       my($pr_address2) = "";
       my($pr_city) = "";
       my($pr_state) = "";
       my($pr_zip) = "";

       while($connection->FetchRow() )
       {
          #print("found record...");
          $pr_studentno = $connection->Data("STUDENTNO");
          $pr_student = $connection->Data("STUDENT");
          $pr_classgrade = $connection->Data("LETTERGRADE");
           $pr_class = $connection->Data("CLASS");
          $pr_period = $connection->Data("PERIOD");
          $pr_percent = $connection->Data("PERCENT");
          $pr_parent1 = $connection->Data("PARENT1");
          $pr_address1 = $connection->Data("ADDRESS1");
          $pr_address2 = $connection->Data("ADDRESS2");
          $pr_city = $connection->Data("CITY");
          $pr_state = $connection->Data("STATE");
          $pr_zip = $connection->Data("ZIP");

           my($tm) = localtime;
         printf("Report Date: %04d-%02d-%02d <br>", $tm->year+1900,($tm->mon)+1, $tm->mday);

          print(" &nbsp; &nbsp; <h1 class=page_title_lev_1 >Lesson Progress Report for $pr_student<br>");
          print(" &nbsp; &nbsp; Class: $pr_class</h1>");


          if( $pr_parent1 ne "" )
          {
             print( "&nbsp; &nbsp;  $pr_parent1 <br>" );
          }
          else
          {
             print( "&nbsp;&nbsp;  Parents of  $pr_student <br>" );

          }


          print( "&nbsp;&nbsp;  $pr_address1 <br>" );

          if( $pr_address2 ne "" )
          {
             print( "&nbsp;&nbsp;  $pr_address2 <br>" );
          }


          if( $pr_city ne "" )
          {
            print( " &nbsp;&nbsp; $pr_city, $pr_state  $pr_zip <br><br><br>" );
          }
           else
          {
             print("<br><br><br><br>");
          }
           print("&nbsp;&nbsp;_________________________________________________________________________________<br>");
          print(" &nbsp;&nbsp;<b> Student Number: $pr_studentno </b> <b>Student Name:  $pr_student</span></b><br>");
          print(" &nbsp;&nbsp; Period: $pr_period &nbsp;&nbsp;Class:<b> $pr_class </b>($sclassno)  -  Current Grade:<b> $pr_classgrade</b> ($pr_percent %)<br>");



                my($sqlcommand2) = "SELECT * FROM PROGRESSREPORT WHERE CLASSNO = '$sclassno' AND STUDENTNO = $sstudentno AND LESSONNO = $slessonno";
          #fixit
          #print("$sqlcommand");
          $connection2->Sql("$sqlcommand2");

          my($pr_lesson) = "";
          my($pr_lessonno) = "";
          my($pr_lettergrade) = "";
          my($pr_percent) = "";
          my($pr_attempts) = "";
          my($pr_datetime) = "";
          my($pr_chapterno) = "";
          my($pr_objective) = "";



           $semailname = $semailname."--------------------------------------------------------------------------<br>";
           $semailname = $semailname."Lesson<br><br>";
          while($connection2->FetchRow() )
          {
             $pr_lesson  = $connection2->Data("LESSON");
             $pr_lessonno  = $connection2->Data("LESSONNO");
             $pr_lettergrade = $connection2->Data("GRADE");
             $pr_percent  = $connection2->Data("LESSONPERCENT");
             $pr_attempts = $connection2->Data("ATTEMPTS");
             $pr_datetime = $connection2->Data("DATETIME");
             $pr_chapterno = $connection2->Data("CHAPTERNO");
             $pr_objective = $connection2->Data("OBJECTIVE");

             $pr_datetime = substr($pr_datetime,0,10);

             $semailname = $semailname."$pr_lettergrade ($pr_percent %) Lesson: $pr_lesson ($pr_lessonno) <br>";
             $semailname = $semailname."    Objective: $pr_objective <br>    Next Attempt: $pr_attempts <br>";
             #print( " &nbsp;&nbsp; ----- Chapter: $pr_chapterno  Date Completed: $pr_datetime  Attempts: $pr_attempts <br>");



          }



         my($sqlcommand2) = "SELECT DISTINCT D.TEXTCAPTION, D.TEXT, D.STANDARDNO,A.ANSWERTEXT, B.CATEGORY1, B.CATEGORY2, B.LESSONLINK,L.LESSON, B.ORDERNO, B.QUESTION, C.CHOICE1,C.CHOICE2,C.CHOICE3,C.CHOICE4,A.CORRECT,C.CORRECT1,C.CORRECT2,C.CORRECT3,C.CORRECT4 FROM STUDQUES A, QUESTION B, ANSWER C, CONCEPT D, LESSON L WHERE L.LESSONNO = B.LESSONLINK AND B.LESSONNO = D.LESSONNO AND B.CONCEPTNO = D.CONCEPTNO AND A.QUESTIONNO = B.QUESTIONNO AND B.QUESTIONNO = C.QUESTIONNO AND A.LESSONNO = $slessonno AND A.STUDENTNO = $sstudentno AND A.ATTEMPT = $pr_attempts - 1  ORDER BY B.ORDERNO";
          #fixit
          #print("$sqlcommand2");
          $connection2->Sql("$sqlcommand2");

          my($pr_question) = "";
          my($choice1) = "";
          my($choice2) = "";
          my($choice3) = "";
          my($choice4) = "";
          my($correct) = "";
           my($correct1) = "";
            my($correct2) = "";
             my($correct3) = "";
              my($correct4) = "";
               my($orderno) = "";
               
                my($category1) = "";
                 my($category2) = "";
                  my($lessonlink) = "";
                  my($lessondescription) = "";
                   my($answertext) = "";
                   
                    my($textcaption) = "";
                     my($text) = "";
                      my($standardno) = "";
              


           $semailname = $semailname."---------------------------------------------------------------------------<br>";
           $semailname = $semailname."Concept with Questions and Answers<br>";
          while($connection2->FetchRow() )
          {
             $pr_question  = $connection2->Data("QUESTION");
             $choice1  = $connection2->Data("CHOICE1");
             $choice2  = $connection2->Data("CHOICE2");
             $choice3  = $connection2->Data("CHOICE3");
             $choice4  = $connection2->Data("CHOICE4");
              $correct  = $connection2->Data("CORRECT");
               $correct1  = $connection2->Data("CORRECT1");
                $correct2  = $connection2->Data("CORRECT2");
                 $correct3  = $connection2->Data("CORRECT3");
                  $correct4  = $connection2->Data("CORRECT4");
                    $orderno  = $connection2->Data("ORDERNO");
                    
                     $category1  = $connection2->Data("CATEGORY1");
                      $category2  = $connection2->Data("CATEGORY2");
                      $lessondescription  = $connection2->Data("LESSON");
                       $lessonlink  = $connection2->Data("LESSONLINK");
                        $answertext  = $connection2->Data("ANSWERTEXT");
                        
                          $textcaption  = $connection2->Data("TEXTCAPTION");
                            $text  = $connection2->Data("TEXT");
                              $standardno  = $connection2->Data("STANDARDNO");
              
                        $semailname = $semailname."<b>$textcaption</b><br> $text<br><b>Standard: $standardno</b><br><br>";
              
              
             if( $correct eq "0" )
             {
                $semailname = $semailname."<b>WRONG</b><br> $orderno Question:<b>  $pr_question</b><br>";


             }
             else
             {
                $semailname = $semailname."<b>RIGHT</b><br> $orderno Question: <b> $pr_question </b><br>";


             }
               $semailname = $semailname."Lesson Link: $lessonlink  -  $lessondescription <br>  ";
               $semailname = $semailname."Question Categories: $category1  $category2<br>  ";
              $semailname = $semailname."Choices: $choice1  ";
              if( $correct1 eq "1" )
              {
                   $semailname = $semailname."<b>      Correct Answer</b> <br>";
              }
              else
              {
                   $semailname = $semailname."<br>";
              }
               $semailname = $semailname."Choices: $choice2 ";
              if( $correct2 eq "1" )
              {
               $semailname = $semailname."<b>      Correct Answer</b> <br>";
              }
               else
              {
                   $semailname = $semailname."<br>";
              }
               $semailname = $semailname."Choices: $choice3 ";
              if( $correct3 eq "1" )
              {
                 $semailname = $semailname."<b>      Correct Answer</b> <br>";
              }
               else
              {
                   $semailname = $semailname."<br>";
              }
               $semailname = $semailname."Choices: $choice4 ";
              if( $correct4 eq "1" )
              {
                   $semailname = $semailname."<b>      Correct Answer</b> <br>";
              }
               else
              {
                   $semailname = $semailname."<br>";
              }
                  $semailname = $semailname."Text Answer: $answertext <br>";
             print("$semailname");
             $semailname = "";
                $semailname = $semailname."---------------------------------------------------------------------------<br>";


          }

               if( $pr_attempts eq "0.0" )
               {
                print( " &nbsp;&nbsp; ----- Chapter: $pr_chapterno   <b>Not Attempted</b><br>");

               
               }
               else
               {
                 print( " &nbsp;&nbsp; ----- Chapter: $pr_chapterno  Date Completed: $pr_datetime  Next Attempt: $pr_attempts <br>");
               }


            my($sqlcommand2) = "SELECT * FROM DISCIPLINE WHERE CLASSNO = '$sclassno' AND STUDENTNO = $pr_studentno AND lettersent = 1 AND ACTIVE=1";
          #fixit
          #print("$sqlcommand");
          $connection2->Sql("$sqlcommand2");

          my($pr_offencedate) = "";
          my($pr_offencedesc) = "";
          my($pr_offencememo) = "";
          my($pr_period) = "";
          my($pr_consequences) = "";
          my($pr_detentioninfo) = "";


           print("&nbsp;&nbsp;_________________________________________________________________________________<br>");
           print("<b>&nbsp;&nbsp;Referrals and Discipline Information</b><br><br>");
          while($connection2->FetchRow() )
          {
             $pr_offencedate  = $connection2->Data("OFFENCEDATE");
             $pr_offencedesc  = $connection2->Data("OFFENCEDESC");
             $pr_disciplineno  = $connection2->Data("DISCIPLINENO");
             $pr_offencememo = $connection2->Data("OFFENCEMEMO");
             $pr_period  = $connection2->Data("PERIOD");
             $pr_consequences = $connection2->Data("CONCEQUENCES");
             $pr_detentioninfo = $connection2->Data("DETENTIONINTO");

             $pr_offencedate = substr($pr_offencedate,0,10);


             print( " &nbsp;&nbsp; ($pr_disciplineno) $pr_offencedate Period: $pr_period ($pr_offencedesc) $pr_offencememo<BR> ");
             print( " &nbsp;&nbsp; ---- $pr_consequences ($pr_detentioninfo)<br>");
             #print( " &nbsp;&nbsp; ----- Chapter: $pr_chapterno  Date Completed: $pr_datetime  Attempts: $pr_attempts <br>");



          }

             my($sqlcommand2) = "SELECT * FROM STUDENTSTANDARDS WHERE CLASSNO = '$sclassno' AND STUDENTNO = $pr_studentno";
          #fixit
          #print("$sqlcommand");
          $connection2->Sql("$sqlcommand2");

          my($pr_standard) = "";
          my($pr_description) = "";
          my($pr_grade) = "";
          my($pr_subject) = "";



          print("&nbsp;&nbsp;_________________________________________________________________________________<br>");
           print("<b>&nbsp;&nbsp;Standards that need focus</b><br><br>");
          while($connection2->FetchRow() )
          {
             $pr_standard  = $connection2->Data("STANDARD");
             $pr_description  = $connection2->Data("DESCRIPTION");
             $pr_grade  = $connection2->Data("GRADE");
             $pr_subject = $connection2->Data("SUBJECT");



             print( " &nbsp;&nbsp; Grade: $pr_grade Subject: $pr_subject ($pr_standard) $pr_description <BR> ");
             #print( " &nbsp;&nbsp; ---- $pr_consequences ($pr_detentioninfo)<br>");
             #print( " &nbsp;&nbsp; ----- Chapter: $pr_chapterno  Date Completed: $pr_datetime  Attempts: $pr_attempts <br>");



          }

           print("<br><br>&nbsp;&nbsp;<b>Teacher Signature: __________________________ <br><br>&nbsp;&nbsp;Required: Yes&nbsp;&nbsp; No <br>&nbsp;&nbsp;  Parent Signature _________________________<br>");


          # end of form next page
          #print("  <H3></H3>"); # form feed - This requires the style on the page first: <STYLE> H3 { page-break-before: always }</STYLE>


        }
      }


      #stub for grades
      if( $sdata3 eq "STUDENTPROGRESSREPORT" )
      {

       my($sqlcommand) = "SELECT PARENT1,ADDRESS1,ADDRESS2,CITY,STATE,ZIP,STUDENTNO,LETTERGRADE, STUDENT, CLASS , PERIOD, [PERCENT] FROM CLASSLISTING WHERE CLASSNO = '$sclassno' AND STUDENTNO = '$sstudentno'";
       #fixit
       #print("$sqlcommand");
       $connection->Sql("$sqlcommand");

       my($pr_studentno) = "";
       my($pr_student) = "";
       my($pr_class) = "";
       my($pr_period) = "";
       my($pr_percent) = "";
       my($pr_parent1) = "";
       my($pr_address1) = "";
       my($pr_address2) = "";
       my($pr_city) = "";
       my($pr_state) = "";
       my($pr_zip) = "";

       while($connection->FetchRow() )
       {
          #print("found record...");
          $pr_studentno = $connection->Data("STUDENTNO");
          $pr_student = $connection->Data("STUDENT");
          $pr_classgrade = $connection->Data("LETTERGRADE");
           $pr_class = $connection->Data("CLASS");
          $pr_period = $connection->Data("PERIOD");
          $pr_percent = $connection->Data("PERCENT");
          $pr_parent1 = $connection->Data("PARENT1");
          $pr_address1 = $connection->Data("ADDRESS1");
          $pr_address2 = $connection->Data("ADDRESS2");
          $pr_city = $connection->Data("CITY");
          $pr_state = $connection->Data("STATE");
          $pr_zip = $connection->Data("ZIP");

           my($tm) = localtime;
         printf("Report Date: %04d-%02d-%02d <br>", $tm->year+1900,($tm->mon)+1, $tm->mday);

          print("Class Progress Report for $pr_student<br><br>");
          print("Class: $pr_class <br>");


          if( $pr_parent1 ne "" )
          {
             print( "&nbsp; &nbsp;  $pr_parent1 <br>" );
          }
          else
          {
             print( "&nbsp;&nbsp;  Parents of  $pr_student <br>" );

          }


          print( "&nbsp;&nbsp;  $pr_address1 <br>" );

          if( $pr_address2 ne "" )
          {
             print( "&nbsp;&nbsp;  $pr_address2 <br>" );
          }


          if( $pr_city ne "" )
          {
            print( " &nbsp;&nbsp; $pr_city, $pr_state  $pr_zip <br><br><br>" );
          }
           else
          {
             print("<br><br><br><br>");
          }
           print("&nbsp;&nbsp;_________________________________________________________________________________<br>");
          print(" &nbsp;&nbsp;<b> Student Number: $pr_studentno </b> <b>Student Name:  $pr_student</span></b><br>");
          print(" &nbsp;&nbsp; Period: $pr_period &nbsp;&nbsp;Class:<b> $pr_class </b>($sclassno)  -  Current Grade:<b> $pr_classgrade</b> ($pr_percent %)<br>");



          my($sqlcommand2) = "SELECT * FROM PROGRESSREPORT WHERE CLASSNO = '$sclassno' AND STUDENTNO = $pr_studentno";
          #fixit
          #print("$sqlcommand");
          $connection2->Sql("$sqlcommand2");

          my($pr_lesson) = "";
          my($pr_lessonno) = "";
          my($pr_lettergrade) = "";
          my($pr_percent) = "";
          my($pr_attempts) = "";
          my($pr_datetime) = "";
          my($pr_chapterno) = "";
          my($pr_objective) = "";
           my($pr_standard) = "";
          my($pr_classgpa) = "";



           print("&nbsp;&nbsp;_________________________________________________________________________________<br>");
           print("&nbsp;&nbsp;<b>Assignments and Homework</b><br>");

          while($connection2->FetchRow() )
          {
             $pr_lesson  = $connection2->Data("LESSON");
             $pr_lessonno  = $connection2->Data("LESSONNO");
             $pr_lettergrade = $connection2->Data("GRADE");
             $pr_percent  = $connection2->Data("LESSONPERCENT");
             $pr_attempts = $connection2->Data("ATTEMPTS");
             $pr_datetime = $connection2->Data("DATETIME");
             $pr_chapterno = $connection2->Data("CHAPTERNO");
             $pr_objective = $connection2->Data("OBJECTIVE");

                         $pr_standard  = $connection2->Data("STANDARD");
                $pr_classgpa = $connection2->Data("CLASSGPA");

             $pr_datetime = substr($pr_datetime,0,10);

             print( " &nbsp;&nbsp;<b> $pr_lettergrade</b> ($pr_percent %) $pr_lesson ");
             print( " &nbsp;&nbsp; Standard: $pr_standard  Class Average: $pr_classgpa % <br>&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; Objective: $pr_objective ($pr_lessonno)<br>");
             #print( " &nbsp;&nbsp; ----- Chapter: $pr_chapterno  Date Completed: $pr_datetime  Attempts: $pr_attempts <br>");



          }

            my($sqlcommand2) = "SELECT * FROM DISCIPLINE WHERE CLASSNO = '$sclassno' AND STUDENTNO = $pr_studentno AND lettersent = 1 AND ACTIVE=1";
          #fixit
          #print("$sqlcommand");
          $connection2->Sql("$sqlcommand2");

          my($pr_offencedate) = "";
          my($pr_offencedesc) = "";
          my($pr_offencememo) = "";
          my($pr_period) = "";
          my($pr_consequences) = "";
          my($pr_detentioninfo) = "";


           print("&nbsp;&nbsp;_________________________________________________________________________________<br>");
           print("<b>&nbsp;&nbsp;Referrals and Discipline Information</b><br><br>");
          while($connection2->FetchRow() )
          {
             $pr_offencedate  = $connection2->Data("OFFENCEDATE");
             $pr_offencedesc  = $connection2->Data("OFFENCEDESC");
             $pr_disciplineno  = $connection2->Data("DISCIPLINENO");
             $pr_offencememo = $connection2->Data("OFFENCEMEMO");
             $pr_period  = $connection2->Data("PERIOD");
             $pr_consequences = $connection2->Data("CONCEQUENCES");
             $pr_detentioninfo = $connection2->Data("DETENTIONINTO");

             $pr_offencedate = substr($pr_offencedate,0,10);


             print( " &nbsp;&nbsp; ($pr_disciplineno) $pr_offencedate Period: $pr_period ($pr_offencedesc) $pr_offencememo<BR> ");
             print( " &nbsp;&nbsp; ---- $pr_consequences ($pr_detentioninfo)<br>");
             #print( " &nbsp;&nbsp; ----- Chapter: $pr_chapterno  Date Completed: $pr_datetime  Attempts: $pr_attempts <br>");



          }

             my($sqlcommand2) = "SELECT * FROM STUDENTSTANDARDS WHERE CLASSNO = '$sclassno' AND STUDENTNO = $pr_studentno";
          #fixit
          #print("$sqlcommand");
          $connection2->Sql("$sqlcommand2");

          my($pr_standard) = "";
          my($pr_description) = "";
          my($pr_grade) = "";
          my($pr_subject) = "";



          print("&nbsp;&nbsp;_________________________________________________________________________________<br>");
           print("<b>&nbsp;&nbsp;Standards that need focus</b><br><br>");
          while($connection2->FetchRow() )
          {
             $pr_standard  = $connection2->Data("STANDARD");
             $pr_description  = $connection2->Data("DESCRIPTION");
             $pr_grade  = $connection2->Data("GRADE");
             $pr_subject = $connection2->Data("SUBJECT");



             print( " &nbsp;&nbsp; Grade: $pr_grade Subject: $pr_subject ($pr_standard) $pr_description <BR> ");
             #print( " &nbsp;&nbsp; ---- $pr_consequences ($pr_detentioninfo)<br>");
             #print( " &nbsp;&nbsp; ----- Chapter: $pr_chapterno  Date Completed: $pr_datetime  Attempts: $pr_attempts <br>");



          }



          # end of form next page
          #print("  <H3></H3>"); # form feed - This requires the style on the page first: <STYLE> H3 { page-break-before: always }</STYLE>


        }
    }
      
      
       if( $sdata3 eq "CURRENTSCORE" )
      {
      $sqlcommand = "SELECT MAX(ATTEMPT) ATTEMPTS FROM STUDQUES WHERE STUDENTNO = $sstudentno  AND LESSONNO = $slessonno";
     #print("$sqlcommand");
       #print("$sqlcommand");
       $connection->Sql("$sqlcommand");

       my($returnvalue) = "";
      $connection->FetchRow();

       my($attempts) = $connection->Data("ATTEMPTS");


        if( substr($attempts,0,1) eq "0" || $attempts eq "" )
        {
               $attempts = "1";
         }



      $sqlcommand = "SELECT COUNT(*) AS TOTALQUES FROM STUDQUES WHERE STUDENTNO = $sstudentno AND LESSONNO = $slessonno AND ATTEMPT = $attempts";
     #print("$sqlcommand");
      #print("$sqlcommand");
       $connection->Sql("$sqlcommand");

       my($returnvalue) = "";
      $connection->FetchRow();

       my($totalquestions) = $connection->Data("TOTALQUES");



$sqlcommand = "SELECT COUNT(*) AS TOTCORRECT FROM STUDQUES WHERE STUDENTNO = $sstudentno AND LESSONNO = $slessonno AND ATTEMPT = $attempts AND CORRECT = 1";
#print("$sqlcommand");
       #print("$sqlcommand");
       $connection->Sql("$sqlcommand");

       my($returnvalue) = "";
      $connection->FetchRow();

       my($right) = $connection->Data("TOTCORRECT");
      my($active) = "1";
      my %dttime = ();

my($ipercent) = 0;
if( $totalquestions ne "" && $totalquestions ne 0 )
{
$ipercent = (100 / $totalquestions) * $right;
}


my($grade) = "F";

if( $ipercent < 0 )
{
    $grade = "NA";
}

if( $ipercent < 0 )
{
    $grade = "NA";
}

if( $ipercent > 97 )
{
    $grade = "A+";
}

if( $ipercent > 93 && ($ipercent < 98 ))
{
    $grade = "A";
}

if( ($ipercent > 89 ) && ($ipercent < 94 ))
{
    $grade = "A-";
}

if( ($ipercent > 87 ) && ($ipercent < 90 ))
{
    $grade = "B+";
}

if( ($ipercent > 83 ) && ($ipercent < 88 ))
{
    $grade = "B";
}

if( ($ipercent > 79 ) && ($ipercent < 84 ))
{
    $grade = "B-";
}

if( ($ipercent > 77 ) && ($ipercent < 80 ))
{
    $grade = "C+";
}

if( ($ipercent > 73 ) && ($ipercent < 78 ))
{
    $grade = "C";
}

if( ($ipercent > 69 ) && ($ipercent < 74 ))
{
    $grade = "C-";
}
if( ($ipercent > 67 ) && ($ipercent < 70 ))
{
    $grade = "D+";
}

if( ($ipercent > 63 ) && ($ipercent < 68 ))
{
    $grade = "D";
}

if( ($ipercent > 59 ) && ($ipercent < 64 ))
{
    $grade = "D-";
}

my($spercent) = substr($ipercent,0,4);
       if( $orderno ne "1.0"  )
       {
        print("<li>Score: $spercent % -<b>  $grade</b></br></li><li>Attempt: $attempts</br></li>");
       }
      }



     if( $sdata3 eq "MYGRADES" )
        {

       my($sqlcommand) = "SELECT PARENT1,ADDRESS1,ADDRESS2,CITY,STATE,ZIP,STUDENTNO,LETTERGRADE, STUDENT, CLASS , PERIOD, [PERCENT] FROM CLASSLISTING WHERE CLASSNO = $sclassno AND STUDENTNO = '$sstudentno'";
       #fixit
       #print("$sqlcommand");
       $connection->Sql("$sqlcommand");

       my($pr_studentno) = "";
       my($pr_student) = "";
       my($pr_class) = "";
       my($pr_period) = "";
       my($pr_percent) = "";
       my($pr_parent1) = "";
       my($pr_address1) = "";
       my($pr_address2) = "";
       my($pr_city) = "";
       my($pr_state) = "";
       my($pr_zip) = "";

       while($connection->FetchRow() )
       {
          #print("found record...");
          $pr_studentno = $connection->Data("STUDENTNO");
          $pr_student = $connection->Data("STUDENT");
          $pr_classgrade = $connection->Data("LETTERGRADE");
           $pr_class = $connection->Data("CLASS");
          $pr_period = $connection->Data("PERIOD");
          $pr_percent = $connection->Data("PERCENT");
          $pr_parent1 = $connection->Data("PARENT1");
          $pr_address1 = $connection->Data("ADDRESS1");
          $pr_address2 = $connection->Data("ADDRESS2");
          $pr_city = $connection->Data("CITY");
          $pr_state = $connection->Data("STATE");
          $pr_zip = $connection->Data("ZIP");


         my($tm) = localtime;
         printf("Report Date: %04d-%02d-%02d <br>", $tm->year+1900,($tm->mon)+1, $tm->mday);


          print("<B>Student Schedule Report for $pr_student</B>&nbsp; ($pr_studentno)<br><br><br>");



          if( $pr_parent1 ne "" )
          {
             print( "&nbsp; &nbsp;  $pr_parent1 <br>" );
          }
          else
          {
             print( "&nbsp;&nbsp;  $pr_student <br>" );

          }


          print( "&nbsp;&nbsp;  $pr_address1 <br>" );

          if( $pr_address2 ne "" )
          {
             print( "&nbsp;&nbsp;  $pr_address2 <br>" );
          }


          if( $pr_city ne "" )
          {
            print( " &nbsp;&nbsp; $pr_city, $pr_state  $pr_zip <br><br><br></span>" );
          }
           else
          {
             print("<br><br><br><br></span>");
          }

          #print(" &nbsp;&nbsp; Student Number: $pr_studentno  Student Name:  $pr_student</span><br>");


          my($sqlcommand2) = "SELECT B.LETTERGRADE, B.[PERCENT],A.PERIOD,A.TEACHER,A.CLASSNO,A.CLASS,A.CODE,A.DEPARTMENT, A.ROOM, A.BEGTIME, A.ENDTIME, A.CLASSLEVEL, A.CLASSTYPE FROM CLASS A, STUDCLAS B WHERE  B.STUDENTNO = $sstudentno AND A.CLASSNO = B.CLASSNO AND B.ACTIVE = 'Y' ORDER BY A.PERIOD";
          #fixit
          #print("$sqlcommand");
          $connection2->Sql("$sqlcommand2");

          my($pr_period) = "";
          my($pr_teacher) = "";
          my($pr_classno) = "";
          my($pr_class) = "";
          my($pr_code) = "";
          my($pr_department) = "";
          my($pr_room) = "";
          my($pr_begtime) = "";
          my($pr_endtime) = "";
          my($pr_classlevel) = "";
          my($pr_classtype) = "";
          my($pr_grade) = "";
          my($pr_percent) = "";


           print("&nbsp;&nbsp;---------------------------------------------------------------------------<br>");
           print("Classes by Period<br><br>");
          while($connection2->FetchRow() )
          {
             $pr_period  = $connection2->Data("PERIOD");
             $pr_teacher  = $connection2->Data("TEACHER");
             $pr_classno = $connection2->Data("CLASSNO");
             $pr_class  = $connection2->Data("CLASS");
             $pr_code = $connection2->Data("CODE");
             $pr_department = $connection2->Data("DEPARTMENT");
             $pr_room = $connection2->Data("ROOM");
             $pr_begtime = $connection2->Data("BEGTIME");
             $pr_endtime = $connection2->Data("ENDTIME");
             $pr_classlevel = $connection2->Data("CLASSLEVEL");
             $pr_classtype = $connection2->Data("CLASSTYPE");
             $pr_grade = $connection2->Data("LETTERGRADE");
             $pr_percent = $connection2->Data("PERCENT");

             print( " &nbsp;&nbsp; <b>Class $pr_period ($pr_classno) $pr_code:$pr_class - $pr_teacher </b><br>");
             print( " &nbsp;&nbsp; $pr_department ($pr_room)<br>");
             print( " &nbsp;&nbsp; Beginning Time: $pr_begtime Ending Time: $pr_endtime<br>");
             print( " &nbsp;&nbsp; Level: $pr_classlevel ($pr_classtype)<br>");
             print( " &nbsp;&nbsp; Current Grade: $pr_grade ($pr_percent %)<br><br>");
             #print( " &nbsp;&nbsp; ----- Chapter: $pr_chapterno  Date Completed: $pr_datetime  Attempts: $pr_attempts <br>");


              my($sqlcommand3) = "SELECT * FROM PROGRESSREPORT WHERE CLASSNO = '$pr_classno' AND STUDENTNO = $pr_studentno";
          #fixit
          #print("$sqlcommand");
          $connection3->Sql("$sqlcommand3");

          my($pr_lesson) = "";
          my($pr_lessonno) = "";
          my($pr_lettergrade) = "";
          my($pr_percent) = "";
          my($pr_attempts) = "";
          my($pr_datetime) = "";
          my($pr_chapterno) = "";
          my($pr_objective) = "";



             print("&nbsp;&nbsp;<B>Assignments and Homework</B><br><br>");
          while($connection3->FetchRow() )
          {
             $pr_lesson  = $connection3->Data("LESSON");
             $pr_lessonno  = $connection3->Data("LESSONNO");
             $pr_lettergrade = $connection3->Data("GRADE");
             $pr_percent  = $connection3->Data("LESSONPERCENT");
             $pr_attempts = $connection3->Data("ATTEMPTS");
             $pr_datetime = $connection3->Data("DATETIME");
             $pr_chapterno = $connection3->Data("CHAPTERNO");
             $pr_objective = $connection3->Data("OBJECTIVE");

             $pr_datetime = substr($pr_datetime,0,10);

             print( " &nbsp;&nbsp; $pr_lettergrade ($pr_percent %) $pr_lesson ");
             print( " &nbsp;&nbsp; $pr_objective ($pr_lessonno)<br>");
             #print( " &nbsp;&nbsp; ----- Chapter: $pr_chapterno  Date Completed: $pr_datetime  Attempts: $pr_attempts <br>");



          }
            print("&nbsp;&nbsp;---------------------------------------------------------------------------<br><br>");



          }





          # end of form next page
          #print("  <H3></H3>"); # form feed - This requires the style on the page first: <STYLE> H3 { page-break-before: always }</STYLE>


        }
      }
   # print("$sdata3");

   #if( substr($line,1,14) eq "LOADDATAOBJECT" )
if( $sdata3 eq "STANDARDSEARCH" )
{

  my($sqlcommand) = "SELECT DEPARTMENT FROM CLASS WHERE CLASSNO = '$sclassno'";

       #print("$sqlcommand");
       my($pr_department) = "";
       $connection->Sql("$sqlcommand");

       if($connection->FetchRow() )
       {
          #print("found record...");
          $pr_department = $connection->Data("DEPARTMENT");
          }


           my($sqlcommand) = "SELECT STATE FROM SCHOOL WHERE SCHOOLNO = '$schoolno'";

       #print("$sqlcommand");
       my($pr_state) = "";
       $connection->Sql("$sqlcommand");

       if($connection->FetchRow() )
       {
          #print("found record...");
          $pr_state = $connection->Data("STATE");
       }


       my($sqlcommand) = "SELECT * FROM STANDARDS WHERE UPPER(STATE) = UPPER('$pr_state')  AND  SUBJECT = '$pr_department' ORDER BY GRADE,SUBJECT,STANDARD";

       #print("$sqlcommand");
       my($pr_studentlesson) = "";
       $connection->Sql("$sqlcommand");
        print("<option value=''></option>");
       while($connection->FetchRow() )
       {
          #print("found record...");
          $pr_grade = $connection->Data("GRADE");
          $pr_subject = $connection->Data("SUBJECT");
          $pr_standard = $connection->Data("STANDARD");
          $pr_description = $connection->Data("DESCRIPTION");

          $pr_description = substr($pr_description,0,70);

          #print("<LI>$sqlcommand</li>");
          print("<option value='$pr_standard'>$pr_standard - $pr_description</option>");
       }



}

if( $sdata3 eq "TEACHERLISTING" )
{

       my($sqlcommand) = "SELECT DISTINCT STUDENTNO, STUDENT FROM STUDENT WHERE SCHOOLNO = $schoolno AND TEACHER = '1' ORDER BY STUDENT";

       #print("$sqlcommand");
       my($pr_studentlesson) = "";
       $connection->Sql("$sqlcommand");
        print("<option value=''></option>");
       while($connection->FetchRow() )
       {
          #print("found record...");
          $pr_studentno = $connection->Data("STUDENTNO");
          $pr_student = $connection->Data("STUDENT");

          #print("<LI>$sqlcommand</li>");
          print("<option value='$pr_studentno'>$pr_studentno - $pr_student</option>");
       }



}


if( $sdata3 eq "SEARCHCATEGORIES" )
{

       my($sqlcommand) = "SELECT DISTINCT IMAGEPATH FROM LESSON WHERE CLASSNO = $sclassno AND IMAGEPATH IS NOT NULL AND IMAGEPATH <> ''ORDER BY IMAGEPATH";

       #print("$sqlcommand");
       my($pr_imagepath) = "";
        my($pr_catstandard) = "";
       $connection->Sql("$sqlcommand");
       print("<option value=''>All</option>");
       while($connection->FetchRow() )
       {
          #print("found record...");
          $pr_imagepath = $connection->Data("IMAGEPATH");
          #$pr_catstandard  = $connection->Data("STANDARD");

          #print("<LI>$sqlcommand</li>");
          print("<option value='$pr_imagepath'>$pr_imagepath</option>");
       }



}


if( $sdata3 eq "LISTOFCLASSES" )
{

       my($sqlcommand) = "SELECT * FROM CLASS WHERE SCHOOLNO = '$schoolno' ORDER BY CODE, CLASS";

       #print("$sqlcommand");
       my($pr_studentlesson) = "";
       $connection->Sql("$sqlcommand");
       while($connection->FetchRow() )
       {
          #print("found record...");
          $pr_classlevel = $connection->Data("CLASSLEVEL");
          $pr_code = $connection->Data("CODE");
          $pr_class = $connection->Data("CLASS");
          $pr_teacher = $connection->Data("TEACHER");
          $pr_classno = $connection->Data("CLASSNO");

          $pr_class = substr($pr_class,0,40);

          #print("<LI>$sqlcommand</li>");
          print("<option value=$pr_classno>$pr_code - $pr_teacher: $pr_class</option>");
       }



}

 if( $sdata3 eq "MYCERTIFICATES" )
      {

       #my($sqlcommand) = "SELECT PARENT1,ADDRESS1,ADDRESS2,CITY,STATE,ZIP,STUDENTNO,LETTERGRADE, STUDENT, CLASS , PERIOD, [PERCENT], CLASSNO FROM CLASSLISTING WHERE  STUDENTNO = '$sstudentno' ORDER BY PERIOD";


       my($sqlcommand) = "SELECT STUDENTLESSON FROM STUDENTCERTIFICATES WHERE STUDENTNO = $sstudentno AND CLASSNO = $sclassno ORDER BY CLASSNO";

       #print("$sqlcommand");
        my($pr_studentlesson) = "";
       $connection->Sql("$sqlcommand");
       while($connection->FetchRow() )
       {
          #print("found record...");
          $pr_studentlesson = $connection->Data("STUDENTLESSON");

          #print("<LI>$sqlcommand</li>");
          print("<li>$pr_studentlesson</li>");
       }
       $sgetout = 1;
       $sdata2 = "";
      $sdata3 = "";
      $sdataobject = "";
       # my($pr_studentno) = "";

      }

      
      if( $sdata3 eq "REWARDURLGET" )
      {

         my($sqlcommand) = "SELECT SUM(DOLLARPOINTS) DOLLARPOINTS FROM STUDLESS WHERE  STUDENTNO = '$sstudentno' AND CLASSNO = '$sclassno'";

       $connection->Sql("$sqlcommand");

       my($dollarpoints) = 0;
       if($connection->FetchRow() )
       {
          #print("found record...");
          $dollarpoints = $connection->Data("DOLLARPOINTS");

       }


       $sqlcommand = "SELECT REWARDURL, DOLLARLEVEL FROM REWARDS WHERE DOLLARLEVEL <= $dollarpoints AND ACTIVE = 1 ORDER BY REWARD";

       $connection->Sql("$sqlcommand");

       my($sreward) = "";


       while($connection->FetchRow() )
       {

          $sreward = $connection->Data("REWARDURL");
          $dollarpoints =  $connection->Data("DOLLARLEVEL");
          print("Prize: $sreward  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Price: $dollarpoints<br><br>");


       }

      }


       if( $sdata3 eq "DOLLARPOINTS" )
      {

          my($sqlcommand) = "SELECT SUM(DOLLARPOINTS) DOLLARPOINTS FROM STUDLESS WHERE  STUDENTNO = '$sstudentno' AND CLASSNO = '$sclassno'";

       $connection->Sql("$sqlcommand");

       my($dollarpoints) = 0;
       if($connection->FetchRow() )
       {
          #print("found record...");
          $dollarpoints = $connection->Data("DOLLARPOINTS");

       }
         print("Class Balance: $dollarpoints Dollars");
       my($sqlcommand) = "UPDATE STUDCLAS SET DOLLARPOINTS = DOLLARPOINTS + $idollars WHERE STUDENTNO = '$sstudentno' AND CLASSNO = '$sclassno'";

#print("-6 $sqlcommand");

$connection->Sql("$sqlcommand");

       }

        if( $sdata3 eq "STUDENTNO" )
       {

         $sdata2 = $sstudentno;
         $sgetout = 1;
       }
       
       if( $sdata3 eq "PERIOD" )
       {
         $sdata2 = $speriod;
         $sgetout = 1;
       }
       
        if( $sdata3 eq "TEACHERNO" )
         {
           $sdata2 = $steacherno;
           $sgetout = 1;
         }
         
         if( $sdata3 eq "CLASSNO" )
         {
           $sdata2 = $sclassno;
           $sgetout = 1;
         }
         
          if( $sdata3 eq "LESSONNO" )
         {
           $sdata2 = $slessonno;
           $sgetout = 1;
         }
         
           if( $sdata3 eq "SCHOOLNO" )
         {
           $sdata2 = $schoolno;
           $sgetout = 1;
         }
         
           if( $sdata3 eq "NEXTCONCEPTNO" )
         {

           my($sqlcommand) = "SELECT MAX(CONCEPTNO)+1 AS MAXCON FROM CONCEPT WHERE LESSONNO = $slessonno";
            #print($sqlcommand);
           $connection->Sql("$sqlcommand");

           $sdata2 = "1";
            $sgetout = 1;
            if($connection->FetchRow())
            {
              $sdata2 = $connection->Data("MAXCON");
              $sgetout = 1;
            }
            if( $sdata2 eq "" )
            {
              $sdata2 = "1";
            }
           #print("$sdata2");

         }
         
         
       if( $sdata3 eq "LASTANSWER" )
       {
         $sgetout = 1;
         $sdata2 = $siscorrect;
         
         if( $sdata2 eq "" )
         {
           $sdata2 = "welcome";
         }
         
       }


     if( $sdata3 eq "GETDEPARTMENTIMAGES" )
     {
       my($sqlcommand) = "SELECT distinct FILENAME FROM CONCEPT ORDER BY FILENAME";

       $connection->Sql("$sqlcommand");

       my($sfilename) = "";
       while($connection->FetchRow())
       {
        $sfilename = $connection->Data("FILENAME");

        print("<a href=$sfilename rel=lightbox title=$sfilename><img src=$sfilename width=100 height=66 /></a>$sfilename&nbsp;&nbsp;");
       }
     }

 if( $sdata3 eq "GRADEBOOK" )
 {
 

       my($sqlcommand) = "SELECT STUDENTNO, GRADENAME FROM GRADEBOOK_CLASS2 WHERE CLASSNO = $sclassno ORDER BY STUDENT";
      
       $connection->Sql("$sqlcommand");

  
    my($returnvalue) = "";
    my($sstudentvalue) = "";
   while ($connection->FetchRow())
  {
     my(%hash) = $connection->DataHash;

     foreach $key (keys %hash) 
    {

        if( $key eq "STUDENTNO" )
       {
            $sstudentvalue = "$hash{$key}";

       }
       else
      {
           $returnvalue = "$returnvalue"."$hash{$key}"; 

       }

       if( $key eq "GRADENAME" )
       {

            my($sqlcommand2) = "SELECT GRADES FROM GRADEBOOK_CLASS3 WHERE STUDENTNO = $sstudentvalue and CLASSNO = $sclassno and GRADES IS NOT NULL ORDER BY LESSONNO";
  

            $connection2->Sql("$sqlcommand2");

            while ($connection2->FetchRow())
           {
      
   
                   my(%hash2) = $connection2->DataHash;
        
  
                  foreach $key2(keys %hash2) 
                 {
	             $returnvalue = "$returnvalue"."$hash2{$key2}"; 
    

                 }
	   }
    
     }

    }
       
}

 $returnvalue = "$returnvalue"." </tr>";       
  $sgetout = 1;
         $sdata2 = $returnvalue;
       }



if( $sdata3 eq "GRADEBOOKREPORT" )
 {


       my($sqlcommand) = "SELECT STUDENTNO, GRADENAME FROM GRADEBOOK_CLASS2 WHERE CLASSNO = $sclassno ORDER BY STUDENT";

       $connection->Sql("$sqlcommand");


    my($returnvalue) = "";
    my($sstudentvalue) = "";
   while ($connection->FetchRow())
  {
     my(%hash) = $connection->DataHash;

     foreach $key (keys %hash)
    {

        if( $key eq "STUDENTNO" )
       {
            $sstudentvalue = "$hash{$key}";

       }
       else
      {
           $returnvalue = "$returnvalue"."$hash{$key}";

       }

       if( $key eq "GRADENAME" )
       {

            my($sqlcommand2) = "SELECT GRADES FROM GRADEBOOKREPORT WHERE STUDENTNO = $sstudentvalue and CLASSNO = $sclassno and GRADES IS NOT NULL ORDER BY LESSONNO";


            $connection2->Sql("$sqlcommand2");

            while ($connection2->FetchRow())
           {


                   my(%hash2) = $connection2->DataHash;


                  foreach $key2(keys %hash2)
                 {
	             $returnvalue = "$returnvalue"."$hash2{$key2}";


                 }
	   }

     }

    }

}

 $returnvalue = "$returnvalue"." </tr>";
  $sgetout = 1;
         $sdata2 = $returnvalue;
       }






       if( $sgetout eq 0 )
       {


       if( index($sdataobject,"BEGTIME") < 1 )
       {
       if( $sdata3 eq "CLASS" )
       {
         $sdata2 = $sdataobject;
         $stype = 3;
       }
      }



        if( $sdata3 eq "IPADDRESS" )
       {
        $sdata2 = "http://vjr-tch-rm21/";
        $stype = -1;
       }

       
       if( $sdata3 eq "NOTEPRINT" )
      {

           my($sqlcommand2) = "SELECT A.STANDARD, A.PERIOD, A.CHAPTERNO, A.LESSONNO, A.LESSON, B.TEACHER, B.CLASS FROM LESSON A, CLASS B WHERE A.LESSONNO = $slessonno AND A.CLASSNO = B.CLASSNO";

          $connection2->Sql("$sqlcommand2");

          my($lessonno) = "";
            my($standard) = "";
              my($period) = "";
                my($chapterno) = "";
          my($class) = "";
          my($teacher) = "";

          my($lesson) = "";

          if($connection2->FetchRow() )
          {
            $lesson  = $connection2->Data("LESSON");
             $standard  = $connection2->Data("STANDARD");
              $period  = $connection2->Data("PERIOD");
               $chapterno  = $connection2->Data("CHAPTERNO");
             $lessonno  = $connection2->Data("LESSONNO");
              $class  = $connection2->Data("CLASS");
               $teacher  = $connection2->Data("TEACHER");

           print("<b> Class $class - $teacher<br></B>");

          print("<b> Lesson: $lessonno - $lesson<br></B>");
          }

         my($sqlcommand2) = "SELECT A.ORDERNO, A.FILENAME,A.CONCEPT, A.TEXTCAPTION, A.TEXT, B.LESSON, B.LESSONNO FROM CONCEPT A, LESSON B WHERE A.LESSONNO = $slessonno AND A.LESSONNO = B.LESSONNO ORDER BY ORDERNO";

          $connection2->Sql("$sqlcommand2");

          my($orderno) = "";
          my($concept) = "";
          my($textcaption) = "";
          my($text) = "";
          my($lesson) = "";

          my($filename) = "";
            print( "<br>Lesson Notes: <BR>"  );

            print( "---------------------------------------------------------------------------<BR>");

          while($connection2->FetchRow() )
          {
             $orderno  = $connection2->Data("ORDERNO");
             $concept  = $connection2->Data("CONCEPT");
             $textcaption  = $connection2->Data("TEXTCAPTION");
             $text  = $connection2->Data("TEXT");
             $filename  = $connection2->Data("FILENAME");


              print("<b> Concept No: $orderno</b>   $concept<br>");

              print("$textcaption <br>");
              print("$text <br>");
              print(" <img src=$filename width=100 height=100 /><BR> ");
              print( "---------------------------------------------------------------------------<BR>");

          }



      }
       
        if( $sdata3 eq "FULLNOTEBOOK" )
      {

           my($sqlcommand2) = "SELECT C.SCHOOL,A.IMAGEPATH, A.STANDARD, B.PERIOD, A.CHAPTERNO,A.OBJECTIVE, A.LESSONNO, A.LESSON, B.TEACHER, B.CLASS FROM LESSON A, CLASS B, SCHOOL C WHERE  A.LESSONNO = $slessonno AND A.CLASSNO = B.CLASSNO AND B.SCHOOLNO = C.SCHOOLNO";

          $connection2->Sql("$sqlcommand2");
           #print("$sqlcommand2");
          my($lessonno) = "";
          my($objective) = "";
          my($class) = "";
            my($standard) = "";
               my($schoolname) = "";
              my($category) = "";
              my($period) = "";
                my($chapterno) = "";
          my($teacher) = "";

          my($lesson) = "";

          if($connection2->FetchRow() )
          {
            $objective  = $connection2->Data("OBJECTIVE");
             $standard  = $connection2->Data("STANDARD");
              $schoolname  = $connection2->Data("SCHOOL");
              $period  = $connection2->Data("PERIOD");
               $category =   $connection2->Data("IMAGEPATH");
               $chapterno  = $connection2->Data("CHAPTERNO");
             $lesson  = $connection2->Data("LESSON");
             $lessonno  = $connection2->Data("LESSONNO");
              $class  = $connection2->Data("CLASS");
               $teacher  = $connection2->Data("TEACHER");
               
                     print("<BR><BR><BR>");
                        print("<BR><BR><BR>");
                        

                   print("<DIV align=center class=style11><B>$schoolname</B><BR><BR>");
                 print("Lesson Package");
                  print("<BR>");
           print("<SPAN><b> Class $class<br></B>");

          print("<b> Lesson: $lessonno - $lesson<br></B></SPAN>");
          print("<b> Chapter No:  $chapterno<br></B>");
            print("<BR><BR><BR>");
             print("<b> Objective: $objective - $lesson<br></B>");
             print("<BR><BR><BR><BR><BR>");
             
              print("<b> Standard: $standard<br></B>");
               print("<b>$category<br></B>");
               print("<b> Period No:  $period<br></B>");
                print("<b> Teacher:  $teacher<br></B>");

               
             


          }

            my($sqlcommand2) = "SELECT DESCRIPTION FROM STANDARDS WHERE UPPER(STATE) = UPPER('$sstate') AND STANDARD = '$standard'";
            #print("$sqlcommand2");
          $connection2->Sql("$sqlcommand2");

          my($standarddesc) = "";
          if($connection2->FetchRow() )
          {
             $standarddesc  = $connection2->Data("DESCRIPTION");
              print("<BR><BR> <BR><BR>Standard: $standarddesc<br><br>");
          }

            print("<BR><BR><BR>");
               print("<b> Student Name:<br><br> ______________________________________</DIV>");


          print("<H3></H3> ");

         $sqlcommand2 = "SELECT A.CLASSGPA, A.ORDERNO, A.FILENAME,A.CONCEPT, A.TEXTCAPTION, A.TEXT, B.LESSON, B.LESSONNO,A.QUESTIONNO FROM CONCEPT A, LESSON B WHERE A.LESSONNO = $slessonno AND A.LESSONNO = B.LESSONNO ORDER BY ORDERNO";

          $connection2->Sql("$sqlcommand2");

          my($orderno) = "";
          my($concept) = "";
          my($classgpa) = "";
          my($textcaption) = "";
          my($text) = "";
          my($lesson) = "";
          my($questionno) = "";
          my($filename) = "";
            print( "<SPAN align=top class=style11></SPAN>"  );

            print( "____________________________________________________________________________________<BR>");

          while($connection2->FetchRow() )
          {
             $orderno  = $connection2->Data("ORDERNO");
             $concept  = $connection2->Data("CONCEPT");
             $classgpa  = $connection2->Data("CLASSGPA");
             $textcaption  = $connection2->Data("TEXTCAPTION");
             $text  = $connection2->Data("TEXT");
             $filename  = $connection2->Data("FILENAME");
             $questionno = $connection2->Data("QUESTIONNO");
               print("<span  class=style9>");
              print("<b> Concept No: $orderno</b>   $concept - Class Average: $classgpa %<br>");

              print("<SPAN class=nav_portletBody style11>$textcaption <br>");
              print("$text <br><br><br>");
              print(" <img src=$filename width=300 height=300 /><BR><br><br> ");




            my($sqlcommand3) = "SELECT A.QUESTION, B.CHOICE1, B.CHOICE2,B.CHOICE3, B.CHOICE4 FROM QUESTION A, ANSWER B WHERE A.QUESTIONNO = $questionno AND A.QUESTIONNO = B.QUESTIONNO";

          $connection3->Sql("$sqlcommand3");

          my($question) = "";
          my($choice1) = "";
          my($choice2) = "";

           my($choice3) = "";

            my($choice4) = "";

          if($connection3->FetchRow() )
          {
            $question  = $connection3->Data("QUESTION");
             $choice1  = $connection3->Data("CHOICE1");
              $choice2  = $connection3->Data("CHOICE2");
               $choice3  = $connection3->Data("CHOICE3");
               $choice4  = $connection3->Data("CHOICE4");

           print("<b>Question:  $question<br></B></SPAN>");

          print("$choice1 <br>");
           print("$choice2 <br>");
            print("$choice3 <br>");
             print("$choice4 <br>");
              print("</span>");
             print("<H3></H3> ");
          }
                print( "____________________________________________________________________________________<BR>");




          }

          my($sqlcommand3) = "SELECT * FROM LESSONPLANS WHERE LESSONNOLINK = $slessonno";

          $connection3->Sql("$sqlcommand3");

          my($slessondesc) = "";
          my($lpstandard) = "";
          my($lpsubject) = "";
          my($lpgrade) = "";
          my($lpplannumber) = "";
          my($lplessonplandate) = "";
          my($lpweeknumber) = "";
          my($lpmaterials) = "";
          my($lpbigidea) = "";
          my($lpreview) = "";
          my($lpdirectinstruction) = "";
my($lpguided) = "";
my($lpindependent) = "";
my($lpclosure) = "";
my($lpbellactivity) = "";
my($lpassessment) = "";
my($lpshortsummary) = "";
        #$standarddesc
          if($connection3->FetchRow() )
          {
            $lpshortsummary  = $connection3->Data("SHORTSUMMARY");
            $lpassessment  = $connection3->Data("ASSESSMENT");
$lpbellactivity  = $connection3->Data("BELLACTIVITY");
$lpclosure  = $connection3->Data("CLOSURE");
$lpindependent  = $connection3->Data("INDEPENDENT");
$lpguided  = $connection3->Data("GUIDED");
$lpdirectinstruction  = $connection3->Data("DIRECTINSTRUCTION");
$lpreview  = $connection3->Data("REVIEW");
$lpbigidea  = $connection3->Data("BIGIDEA");

$lpmaterials  = $connection3->Data("MATERIALS");
$lpweeknumber  = $connection3->Data("WEEKNUMBER");
$lplessonplandate  = $connection3->Data("LESSONPLANDATE");
$lpplannumber  = $connection3->Data("BLOGID");

$lpgrade  = $connection3->Data("GRADE");
$lpsubject  = $connection3->Data("SUBJECT");
$lpstandard  = $connection3->Data("STANDARD");


               print("<b>Subject:</b> <SPAN class=nav_portletBody style11> $lpsubject  Grade: $lpgrade<br><br></SPAN>");
                  print("<b> Period No:  $period<br></B>");
                print("<b> Teacher:  $teacher<br></B>");


                print( "____________________________________________________________________________________<BR>");


             print("<b>Lesson Plan<br><br> <SPAN class=nav_portletBody style11>Objective: $lpbigidea<br></B></SPAN>");
              print("<b>Lesson Plan Number:  $lpplannumber<br></B>");
               print("<b>Week Number: </B> <SPAN class=nav_portletBody style11> $lpweeknumber <br><br> Plan Date: $lplessonplandate <br></SPAN>");

                print("<br><b>State Standard:</b> <SPAN class=nav_portletBody style11> $lpstandard<br>$standarddesc <br><br></SPAN>");
                    print( "____________________________________________________________________________________<BR>");

                  print("<b>Big Idea:</b> <SPAN class=nav_portletBody style11> $lpbigidea <br></SPAN>");
                   print( "____________________________________________________________________________________<BR>");

                   print("<b>Material:</b> <br><SPAN class=nav_portletBody style11> $lpmaterials <br><br></SPAN>");
                      print( "____________________________________________________________________________________<BR>");

                    print("<b>Bell Activity: </b><br> <SPAN class=nav_portletBody style11> $lpbellactivity <br><br></SPAN>");

                       print( "____________________________________________________________________________________<BR>");

                      print("<b>Review:</b><br> <SPAN class=nav_portletBody style11> $lpreview <br><br></SPAN>");
                        print( "____________________________________________________________________________________<BR>");

                        print("<b>Short Summary:</b><br> <SPAN class=nav_portletBody style11> $lpshortsummary <br><br></SPAN>");
                           print( "____________________________________________________________________________________<BR>");

                          print("<b>Direct Instruction:</b><br> <SPAN class=nav_portletBody style11> $lpdirectinstruction <br><br></SPAN>");
                            print( "____________________________________________________________________________________<BR>");

                            print("<b>Guided Practice:</b><br> <SPAN class=nav_portletBody style11> $lpguided <br><br></SPAN>");
                               print( "____________________________________________________________________________________<BR>");

                              print("<b>Independent Practice: </b><br> <SPAN class=nav_portletBody style11> $lpindependent <br><br></SPAN>");
                                print( "____________________________________________________________________________________<BR>");

                                 print("<b>Assessment: </b><br> <SPAN class=nav_portletBody style11> $lpassessment <br><br></SPAN>");
                                   print( "____________________________________________________________________________________<BR>");

                                    print("<b>Worksheet: </b><br> <SPAN class=nav_portletBody style11> $lpclosure <br></SPAN>");
                                    print( "____________________________________________________________________________________<BR>");



             print("<H3></H3> ");
          }

          print("<SPAN><b>Student Notes - Cornell Note Style<br><br> Class $class<br></B>");

          print("<b> Lesson:</B> $lessonno - $lesson<br></SPAN>");
          print("<b> Chapter No:</B>  $chapterno<br>");

             print("<b> Objective:</B> $objective - $lesson<br>");


              print("<b> Standard:</B> $standard - $standarddesc<br>");
               print("<b>$category<br></B>");
               print("<b> Period No: </B> $period");
                print("<b>   Teacher:</B>  $teacher<br>");
                print("<b>Reflection/Questions&nbsp;&nbsp;&nbsp;   Notes<br></b></SPAN>");
                print( "______________________   _____________________________________________<BR>");



      }

     if( $sdata3 eq "PRINTLESSONPLAN" )
      {

       my($sqlcommand3) = "SELECT * FROM LESSONPLANS WHERE BLOGID = $sblogid";
        #print($sqlcommand3);
          $connection3->Sql("$sqlcommand3");

          my($slessondesc) = "";
          my($lpstandard) = "";
          my($lpsubject) = "";
             my($lpdescription) = "";
          my($lpgrade) = "";
          my($lpplannumber) = "";
          my($lplessonplandate) = "";
          my($lpweeknumber) = "";
          my($lpmaterials) = "";
          my($lpbigidea) = "";
          my($lpreview) = "";
          my($lpdirectinstruction) = "";
my($lpguided) = "";
my($lpclassno) = "";
my($department) = "";
my($class) = "";
my($standardtext) = "";
my($lpindependent) = "";
my($lpclosure) = "";
my($lpbellactivity) = "";
my($lpassessment) = "";
my($lpshortsummary) = "";
        #$standarddesc
          if($connection3->FetchRow() )
          {
            $lpshortsummary  = $connection3->Data("SHORTSUMMARY");
            $lpassessment  = $connection3->Data("ASSESSMENT");
$lpbellactivity  = $connection3->Data("BELLACTIVITY");
$lpclosure  = $connection3->Data("CLOSURE");
$lpindependent  = $connection3->Data("INDEPENDENT");
$lpguided  = $connection3->Data("GUIDED");
$lpdirectinstruction  = $connection3->Data("DIRECTINSTRUCTION");
$lpreview  = $connection3->Data("REVIEW");
$lpbigidea  = $connection3->Data("BIGIDEA");

$lpmaterials  = $connection3->Data("MATERIALS");
$lpweeknumber  = $connection3->Data("WEEKNUMBER");
$lplessonplandate  = $connection3->Data("LESSONPLANDATE");
$lpplannumber  = $connection3->Data("BLOGID");
  $lpclassno  = $connection3->Data("CLASSNO");
$lpgrade  = $connection3->Data("GRADE");
$lpsubject  = $connection3->Data("SUBJECT");
$lpstandard  = $connection3->Data("STANDARD");
$lpdescription =  $connection3->Data("DESCRIPTION");
     }

     
  my($sqlcommand3) = "SELECT * FROM CLASS WHERE CLASSNO = $lpclassno";
        #print($sqlcommand3);
          $connection3->Sql("$sqlcommand3");
          if($connection3->FetchRow() )
          {
            $class  = $connection3->Data("CLASS");
            $teacher = $connection3->Data("TEACHER");
            $period =  $connection3->Data("PERIOD");
            $department =  $connection3->Data("DEPARTMENT");
            $schoolno =  $connection3->Data("SCHOOLNO");
            }
             my($sqlcommand3) = "SELECT * FROM STANDARDS WHERE UPPER(STATE) = UPPER('$sstate') AND STANDARD = '$lpstandard'";
        #print($sqlcommand3);
          $connection3->Sql("$sqlcommand3");
          if($connection3->FetchRow() )
          {
            $standardtext  = $connection3->Data("DESCRIPTION");

            }


               print("<b>Subject:</b> <SPAN class=nav_portletBody style11> $lpsubject  Grade: $lpgrade<br><br></SPAN>");
                  print("<b>Class: ($lpclassno) $class <br>Department: $department<br> Period No: $period<br></B>");
                print("<b> Teacher: $teacher<br></B>");


                print( "____________________________________________________________________________________<BR>");


             print("<b>Lesson Plan<br><br> <SPAN class=nav_portletBody style11>Objective: $lpbigidea<br></B></SPAN>");
              print("<b>Lesson Plan Number:  $lpplannumber<br></B>");
               print("<b>Week Number: </B> <SPAN class=nav_portletBody style11> $lpweeknumber <br><br> Plan Date: $lplessonplandate <br></SPAN>");

                print("<br><b>State Standard:</b> <SPAN class=nav_portletBody style11> $lpstandard<br>$standardtext <br><br></SPAN>");
                    print( "____________________________________________________________________________________<BR>");

                  print("<b>Big Idea:</b> <SPAN class=nav_portletBody style11> $lpbigidea <br></SPAN>");
                   print( "____________________________________________________________________________________<BR>");

                   print("<b>Material:</b> <br><SPAN class=nav_portletBody style11> $lpmaterials <br><br></SPAN>");
                      print( "____________________________________________________________________________________<BR>");

                    print("<b>Bell Activity: </b><br> <SPAN class=nav_portletBody style11> $lpbellactivity <br><br></SPAN>");

                       print( "____________________________________________________________________________________<BR>");

                      print("<b>Review:</b><br> <SPAN class=nav_portletBody style11> $lpreview <br><br></SPAN>");
                        print( "____________________________________________________________________________________<BR>");

                        print("<b>Short Summary:</b><br> <SPAN class=nav_portletBody style11> $lpshortsummary <br><br></SPAN>");
                           print( "____________________________________________________________________________________<BR>");

                          print("<b>Direct Instruction:</b><br> <SPAN class=nav_portletBody style11> $lpdirectinstruction <br><br></SPAN>");
                            print( "____________________________________________________________________________________<BR>");

                            print("<b>Guided Practice:</b><br> <SPAN class=nav_portletBody style11> $lpguided <br><br></SPAN>");
                               print( "____________________________________________________________________________________<BR>");

                              print("<b>Independent Practice: </b><br> <SPAN class=nav_portletBody style11> $lpindependent <br><br></SPAN>");
                                print( "____________________________________________________________________________________<BR>");

                                 print("<b>Assessment: </b><br> <SPAN class=nav_portletBody style11> $lpassessment <br><br></SPAN>");
                                   print( "____________________________________________________________________________________<BR>");

                                    print("<b>Worksheet: </b><br> <SPAN class=nav_portletBody style11> $lpclosure <br></SPAN>");
                                    print( "____________________________________________________________________________________<BR>");
                                    print("<b>Description </b><br> <SPAN class=nav_portletBody style11> $lpdescription <br></SPAN>");
                                    print( "____________________________________________________________________________________<BR>");



             print("<H3></H3> ");





      }


              if( $sdata3 eq "FULLNOTEPRINT" )
      {

           my($sqlcommand2) = "SELECT A.LESSONNO, A.LESSON, B.TEACHER, B.CLASS FROM LESSON A, CLASS B WHERE A.LESSONNO = $slessonno AND A.CLASSNO = B.CLASSNO";

          $connection2->Sql("$sqlcommand2");

          my($lessonno) = "";
          my($class) = "";
          my($teacher) = "";

          my($lesson) = "";

          if($connection2->FetchRow() )
          {
            $lesson  = $connection2->Data("LESSON");
             $lessonno  = $connection2->Data("LESSONNO");
              $class  = $connection2->Data("CLASS");
               $teacher  = $connection2->Data("TEACHER");
          print("<b>Student Name: ______________________________________<br><br></B>");
          print("<b> Class $class - $teacher<br></B>");

          print("<b> Lesson: $lessonno - $lesson<br></B>");
          }

         my($sqlcommand2) = "SELECT A.ORDERNO, A.FILENAME,A.CONCEPT, A.TEXTCAPTION, A.TEXT, B.LESSON, B.LESSONNO,A.QUESTIONNO FROM CONCEPT A, LESSON B WHERE A.LESSONNO = $slessonno AND A.LESSONNO = B.LESSONNO ORDER BY ORDERNO";

          $connection2->Sql("$sqlcommand2");

          my($orderno) = "";
          my($concept) = "";
          my($textcaption) = "";
          my($text) = "";
          my($lesson) = "";
          my($questionno) = "";
          my($filename) = "";
            print( "<br>Full Lesson Notes: <BR>"  );

            print( "---------------------------------------------------------------------------<BR>");

          while($connection2->FetchRow() )
          {
             $orderno  = $connection2->Data("ORDERNO");
             $concept  = $connection2->Data("CONCEPT");
             $textcaption  = $connection2->Data("TEXTCAPTION");
             $text  = $connection2->Data("TEXT");
             $filename  = $connection2->Data("FILENAME");
             $questionno = $connection2->Data("QUESTIONNO");

              print("<b> Concept No: $orderno</b>   $concept<br>");

              print("$textcaption <br>");
              print("$text <br>");
              print(" <img src=$filename width=100 height=66 /><BR> ");




            my($sqlcommand3) = "SELECT B.ANSWERLIST, B.CORRECT1, B.CORRECT2, B.CORRECT3, B.CORRECT4, A.QUESTION, B.CHOICE1, B.CHOICE2,B.CHOICE3, B.CHOICE4 FROM QUESTION A, ANSWER B WHERE A.QUESTIONNO = $questionno AND A.QUESTIONNO = B.QUESTIONNO";

          $connection3->Sql("$sqlcommand3");

          my($question) = "";
          my($choice1) = "";
          my($choice2) = "";

          my($choice2) = "";
  my($answerlist) = "";

            my($choice4) = "";
            
             my($correct1) = "";
          my($correct2) = "";

           my($correct3) = "";

            my($correct4) = "";
            

          if($connection3->FetchRow() )
          {
            $question  = $connection3->Data("QUESTION");
              $answerlist  = $connection3->Data("ANSWERLIST");

             $choice1  = $connection3->Data("CHOICE1");

                  $choice2  = $connection3->Data("CHOICE2");
               $choice3  = $connection3->Data("CHOICE3");
               $choice4  = $connection3->Data("CHOICE4");
               
                $correct1  = $connection3->Data("CORRECT1");
              $correct2  = $connection3->Data("CORRECT2");
               $correct3  = $connection3->Data("CORRECT3");
               $correct4  = $connection3->Data("CORRECT4");

           print("<b>Question:  $question<br></B>");
           print("Answer: $answerlist<br> ");

          print("$choice1 ");
          if( $correct1 eq "1" )
          {
              print(" - Correct Answer <br>");
          }
          else
          {
              print(" - <br>");
          }
          
           print("$choice2 ");
            if( $correct2 eq "1" )
          {
              print(" - Correct Answer <br>");
          }
          else
          {
              print(" - <br>");
          }
            print("$choice3 ");
              if( $correct3 eq "1" )
          {
              print(" - Correct Answer <br>");
          }
          else
          {
              print(" - <br>");
          }
               print("$choice4 ");
           if( $correct4 eq "1" )
          {
              print(" - Correct Answer <br>");
          }
          else
          {
              print(" - <br>");
          }
          }
              print( "---------------------------------------------------------------------------<BR>");

          }


      }


              if( $sdata3 eq "PRINTASSESSMENT" )
      {

           my($sqlcommand2) = "SELECT A.LESSONNO, A.LESSON, B.TEACHER, B.CLASS FROM LESSON A, CLASS B WHERE A.LESSONNO = $slessonno AND A.CLASSNO = B.CLASSNO";

          $connection2->Sql("$sqlcommand2");

          my($lessonno) = "";
          my($class) = "";
          my($teacher) = "";

          my($lesson) = "";

          if($connection2->FetchRow() )
          {
            $lesson  = $connection2->Data("LESSON");
             $lessonno  = $connection2->Data("LESSONNO");
              $class  = $connection2->Data("CLASS");
               $teacher  = $connection2->Data("TEACHER");
          print("<b>Student Name: ______________________________________<br><br></B>");
          print("<b> Class $class - $teacher<br></B>");

          print("<b> Lesson: $lessonno - $lesson<br></B>");
          
           print("<b> Lesson Assessment<br></B>");
          }

         my($sqlcommand2) = "SELECT A.ORDERNO, A.FILENAME,A.CONCEPT, A.TEXTCAPTION, A.TEXT, B.LESSON, B.LESSONNO,A.QUESTIONNO FROM CONCEPT A, LESSON B WHERE A.LESSONNO = $slessonno AND A.LESSONNO = B.LESSONNO ORDER BY ORDERNO";

          $connection2->Sql("$sqlcommand2");

          my($orderno) = "";
          my($concept) = "";
          my($textcaption) = "";
          my($text) = "";
          my($lesson) = "";
          my($questionno) = "";
          my($filename) = "";
            print( "<br>Lesson Test <BR>"  );

           print( "__________________________________________________________________________<BR>");

          while($connection2->FetchRow() )
          {
             $orderno  = $connection2->Data("ORDERNO");
             $concept  = $connection2->Data("CONCEPT");
             $textcaption  = $connection2->Data("TEXTCAPTION");
             $text  = $connection2->Data("TEXT");
             $filename  = $connection2->Data("FILENAME");
             $questionno = $connection2->Data("QUESTIONNO");

              print("<b> Concept No: $orderno</b>   $concept<br>");

              #print("$textcaption <br>");
              #print("$text <br>");
              #print(" <img src=$filename width=100 height=66 /><BR> ");




            my($sqlcommand3) = "SELECT A.QUESTION, B.CHOICE1, B.CHOICE2,B.CHOICE3, B.CHOICE4 FROM QUESTION A, ANSWER B WHERE A.QUESTIONNO = $questionno AND A.QUESTIONNO = B.QUESTIONNO";

          $connection3->Sql("$sqlcommand3");

          my($question) = "";
          my($choice1) = "";
          my($choice2) = "";

           my($choice3) = "";

            my($choice4) = "";

          if($connection3->FetchRow() )
          {
            $question  = $connection3->Data("QUESTION");
             $choice1  = $connection3->Data("CHOICE1");
              $choice2  = $connection3->Data("CHOICE2");
               $choice3  = $connection3->Data("CHOICE3");
               $choice4  = $connection3->Data("CHOICE4");

           print("<b>Question:  $question<br></B>");

          print("$choice1 <br>");
           print("$choice2 <br>");
            print("$choice3 <br>");
             print("$choice4 <br>");
          }
              print( "__________________________________________________________________________<BR>");

          }


      }



       
       
          if( $sdata3 eq  "CLASSPROGRESSREPORT" )
        {

       my($sqlcommand) = "SELECT PARENT1,ADDRESS1,ADDRESS2,CITY,STATE,ZIP,STUDENTNO, STUDENT, CLASS , PERIOD, LETTERGRADE, [PERCENT] FROM CLASSLISTING WHERE CLASSNO = '$sclassno' AND ACTIVE = 'Y' ";
       #fixit
       #print("$sqlcommand");
       $connection->Sql("$sqlcommand");
       
       my($pr_studentno) = "";
       my($pr_student) = "";
       my($pr_class) = "";
       my($pr_period) = "";
       my($pr_percent) = "";
       my($pr_parent1) = "";
       my($pr_address1) = "";
       my($pr_address2) = "";
       my($pr_city) = "";
       my($pr_state) = "";
       my($pr_zip) = "";
        
       while($connection->FetchRow() )
       {
          #print("found record...");
          $pr_studentno = $connection->Data("STUDENTNO");
          $pr_student = $connection->Data("STUDENT");
          $pr_classgrade = $connection->Data("LETTERGRADE");
           $pr_class = $connection->Data("CLASS");
          $pr_period = $connection->Data("PERIOD");
          $pr_percent = $connection->Data("PERCENT");
          $pr_parent1 = $connection->Data("PARENT1");
          $pr_address1 = $connection->Data("ADDRESS1");
          $pr_address2 = $connection->Data("ADDRESS2");
          $pr_city = $connection->Data("CITY");
          $pr_state = $connection->Data("STATE");
          $pr_zip = $connection->Data("ZIP");
           
           my($tm) = localtime;
         printf("Report Date: %04d-%02d-%02d <br>", $tm->year+1900,($tm->mon)+1, $tm->mday);

          print(" &nbsp; &nbsp; <h1 class=page_title_lev_1 >Progress Report for $pr_student<br>");
          print(" &nbsp; &nbsp; Class: $pr_class</h1>");


          if( $pr_parent1 ne "" )
          {
             print( "&nbsp; &nbsp;  $pr_parent1 <br>" );
          }
          else
          {
             print( "&nbsp;&nbsp;  Parents of  $pr_student <br>" );
          
          }


          print( "&nbsp;&nbsp;  $pr_address1 <br>" );
          
          if( $pr_address2 ne "" )
          {
             print( "&nbsp;&nbsp;  $pr_address2 <br>" );
          }


          if( $pr_city ne "" )
          {
            print( " &nbsp;&nbsp; $pr_city, $pr_state  $pr_zip <br><br><br>" );
          }
           else
          {
             print("<br><br><br><br>");
          }
          
          print(" &nbsp;&nbsp; Student Number: $pr_studentno  Student Name:  $pr_student</span><br>");
          print(" &nbsp;&nbsp; Period: $pr_period &nbsp;&nbsp;Class: $pr_class ($sclassno)  -  Current Grade: $pr_classgrade ($pr_percent %)<br>");



          my($sqlcommand2) = "SELECT * FROM PROGRESSREPORT WHERE CLASSNO = '$sclassno' AND STUDENTNO = $pr_studentno";
          #fixit
          #print("$sqlcommand");
          $connection2->Sql("$sqlcommand2");

          my($pr_lesson) = "";
          my($pr_lessonno) = "";
          my($pr_lettergrade) = "";
          my($pr_percent) = "";
          my($pr_attempts) = "";
          my($pr_datetime) = "";
          my($pr_chapterno) = "";
          my($pr_objective) = "";
            
            

           print("&nbsp;&nbsp;---------------------------------------------------------------------------<br>");
           print("Assignments and Homework<br><br>");
          while($connection2->FetchRow() )
          {
             $pr_lesson  = $connection2->Data("LESSON");
             $pr_lessonno  = $connection2->Data("LESSONNO");
             $pr_lettergrade = $connection2->Data("GRADE");
             $pr_percent  = $connection2->Data("LESSONPERCENT");
             $pr_attempts = $connection2->Data("ATTEMPTS");
             $pr_datetime = $connection2->Data("DATETIME");
             $pr_chapterno = $connection2->Data("CHAPTERNO");
             $pr_objective = $connection2->Data("OBJECTIVE");
             
             $pr_datetime = substr($pr_datetime,0,10);
             
             print( " &nbsp;&nbsp; $pr_lettergrade ($pr_percent %) $pr_lesson ");
             print( " &nbsp;&nbsp; $pr_objective ($pr_lessonno)<br>");
             #print( " &nbsp;&nbsp; ----- Chapter: $pr_chapterno  Date Completed: $pr_datetime  Attempts: $pr_attempts <br>");
             
             
             
          }

            my($sqlcommand2) = "SELECT * FROM DISCIPLINE WHERE CLASSNO = '$sclassno' AND STUDENTNO = $pr_studentno AND LETTERSENT = 1 AND ACTIVE=1";
          #fixit
          #print("$sqlcommand");
          $connection2->Sql("$sqlcommand2");

          my($pr_offencedate) = "";
          my($pr_offencedesc) = "";
          my($pr_offencememo) = "";
          my($pr_period) = "";
          my($pr_consequences) = "";
          my($pr_detentioninfo) = "";


           print("&nbsp;&nbsp;---------------------------------------------------------------------------<br>");
           print("Referrals and Discipline Information<br><br>");
          while($connection2->FetchRow() )
          {
             $pr_offencedate  = $connection2->Data("OFFENCEDATE");
             $pr_offencedesc  = $connection2->Data("OFFENCEDESC");
             $pr_disciplineno  = $connection2->Data("DISCIPLINENO");
             $pr_offencememo = $connection2->Data("OFFENCEMEMO");
             $pr_period  = $connection2->Data("PERIOD");
             $pr_consequences = $connection2->Data("CONCEQUENCES");
             $pr_detentioninfo = $connection2->Data("DETENTIONINTO");

             $pr_offencedate = substr($pr_offencedate,0,10);


             print( " &nbsp;&nbsp; ($pr_disciplineno) $pr_offencedate Period: $pr_period ($pr_offencedesc) $pr_offencememo<BR> ");
             print( " &nbsp;&nbsp; ---- $pr_consequences ($pr_detentioninfo)<br>");
             #print( " &nbsp;&nbsp; ----- Chapter: $pr_chapterno  Date Completed: $pr_datetime  Attempts: $pr_attempts <br>");



          }

          my($sqlcommand2) = "SELECT * FROM STUDENTSTANDARDS WHERE CLASSNO = '$sclassno' AND STUDENTNO = $pr_studentno";
          #fixit
          #print("$sqlcommand");
          $connection2->Sql("$sqlcommand2");

          my($pr_standard) = "";
          my($pr_description) = "";
          my($pr_grade) = "";
          my($pr_subject) = "";



           print("&nbsp;&nbsp;---------------------------------------------------------------------------<br>");
           print("Standards that need focus<br><br>");
          while($connection2->FetchRow() )
          {
             $pr_standard  = $connection2->Data("STANDARD");
             $pr_description  = $connection2->Data("DESCRIPTION");
             $pr_grade  = $connection2->Data("GRADE");
             $pr_subject = $connection2->Data("SUBJECT");



             print( " &nbsp;&nbsp; Grade: $pr_grade Subject: $pr_subject ($pr_standard) $pr_description <BR> ");
             #print( " &nbsp;&nbsp; ---- $pr_consequences ($pr_detentioninfo)<br>");
             #print( " &nbsp;&nbsp; ----- Chapter: $pr_chapterno  Date Completed: $pr_datetime  Attempts: $pr_attempts <br>");



          }



          # end of form next page
          print("  <H3></H3>"); # form feed - This requires the style on the page first: <STYLE> H3 { page-break-before: always }</STYLE>


        }
      }



      
        if( $sdata3 eq "PERIODNO" )
       {
        $sdata2 = $speriod;
        $stype = -1;
       }
       

      
      
      
        if( $sdata3 eq "FORMFEED" )
       {
        $sdata2 = "<H3></H3>";
        $stype = -1;
       }


       if( $stype > 0 )
       {
         $sdata2 = $sdataobject;
       }
       if( $stype == 0 )
       {
       #print("CHECK $questiontype");
       if(  ($questiontype eq "TEXT" || $questiontype eq "HIDDEN") && ($sdata3 eq "CORRECT1" || $sdata3 eq "CORRECT2" || $sdata3 eq "CORRECT3" || $sdata3 eq "CORRECT4") )
       {
              
                    #print($questiontype);
                    $sdata2 = "";
                   
            
       }       
       else
       {

         if( ("$sdata3" eq "ANSWERTYPE1") || ("$sdata3" eq "ANSWERTYPE2")  || ("$sdata3" eq "ANSWERTYPE3")  || ("$sdata3" eq "ANSWERTYPE4") )
         {

           $sdata2 = &parsedata("$sdataobject","$sdata3");

           if( "$sdata2" eq "RADIO" )
           {
              $sdata2 = "CHECKBOX";
           }

           if( "$sdata2" eq "" )
           {
                $sdata2 = "HIDDEN";

           }
           
          $questiontype = $sdata2;

         }
         else
         {
            if( "$sdata3" eq "ANSWERTYPEBUTTON" )
            {
              $sdata2 = &parsedata("$sdataobject","$sdata3");
              if( "$sdata2" eq "" )
              {
                $sdata2 = "HIDDEN";
              }
            }
            else
            {
               if( "$sdata3" eq "RETURNMESSAGE" )
              {

              $sdata2 = &parsedata("$sdataobject","QUESTION");
              if( "$sdata2" eq "" )
              {

                $sdata2 = "Go to Next Page...";
              }
              else
              {
                $sdata2 = "";
              }
            }
            else
            {

             if( $sdata3 eq "LINKLINK")
             {
                 my($snarrmovie) = &parsedata("$sdataobject","NARRMOVIE");
                 $snarrmovie =~ tr/a-z/A-Z/;

                 if(  index($snarrmovie, "HTTP" ) > -1 )
                 {
                   print(" Concept Link (Click Here)");

                 }
 }


if( $sdata3 eq "IFMOVIE")
{

$stype = -1;
$sprint = -1;
$sfilename = &parsedata("$sdataobject","FILENAME");
$sdata3 = "";
my($soldpath) = $sfilename;
$sfilename =~ tr/a-z/A-Z/;
 if(  index($sfilename, ".MOV" ) > -1 )
{
print <<ENDHTML;
<object classid="clsid:02BF25D5-8C17-4B23-BC80-D3488ABDDC6B" codebase="http://www.apple.com/qtactivex/qtplugin.cab" height="320" width="330">

<param name="src" value="$sfilename">
<param name="autoplay" value="true">
<param name="type" value="video/quicktime" height="320" width="330">

<embed src="$sfilename" height="320" width="330" autoplay="true" type="video/quicktime" pluginspage="http://www.apple.com/quicktime/download/">

</object>

ENDHTML
}




if( index($sfilename, ".MPEG") > -1  ||  index($sfilename, ".MPG") > -1   ||  index($sfilename, ".AVI") > -1 )
 {
print <<ENDHTML;
       <EMBED SRC="$sfilename" width="330" height="320" autostart=true></EMBED>
ENDHTML
  }
   if( index($sfilename, ".JPG") > -1  || index($sfilename, ".GIF") > -1 || index($sfilename, ".PNG") > -1 || index($sfilename, ".BMP") > -1)
   {

print <<ENDHTML;
 		 <a href="$sfilename" rel="lightbox" title="IMAGE"> <img src="$sfilename" width="330" height="320" /></a>
ENDHTML
  }
if(  index($sfilename, ".BBC" ) > -1 )
{
print <<ENDHTML;

<embed src=$soldpath type="application/x-shockwave-flash" width="424" height="324"></embed>

ENDHTML
}
else
{
  #http://www.bbc.co.uk/schools/ks2bitesize/blogs/shell.swf


if(  index($sfilename, ".SWF" ) > -1 )
{
print <<ENDHTML;

<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000"
 codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0"
 width="330" height="320" id="CC4819088" align="middle">
<param name="movie" value="$sfilename"/>
<param name="quality" value="high" />
<param name="scale" value="noscale" />
<param name="salign" value="lt" />
<param name="bgcolor" value="#ffffff" />
<embed src="$sfilename" quality="high" bgcolor="#ffffff" width="330" height="320"
 name="CoffeeCup" scale="noscale" salign="lt" align="middle" type="application/x-shockwave-flash"
 pluginspage="http://www.macromedia.com/go/getflashplayer" /></object>

ENDHTML
}

}




}
else
{

               $sdata2 = &parsedata("$sdataobject","$sdata3");
              }

             }
            }
           }
         }
       }

       # This is the end of the main connection
       }

       
       
       $line1 = substr($line,0,$ino);

       $line2 = substr($line,$ino+$inoend+2,8000);


       $line = "$line1"."$sdata2"."$line2";
     }
    if( $sprint eq 0 )
    {
    print("$line");
   }
      #  print("<p>");
  # print in sort order
  }
  close(MYINPUTFILE);




}


sub parsedata
{
 my($param1,$param2) = @_;

$param2 = "~"."$param2"."-";

 my($ipos) = index("$param1","$param2");


#print( "$param1 [<<] $param2" );

 my($return) = "";

 if( $ipos > 0 )
 {
   $param1 = substr($param1,$ipos,8000);
   $ipos = index($param1,"-");
   $param1 = substr($param1,$ipos,8000);
   $ipos = index($param1,"~");
   $return = substr($param1,1,$ipos-1);
   #print("[$return]");
 }
 return("$return");

}



sub parsemultidata
{
 my($param1,$param2) = @_;


$param2 = "~"."$param2"."-";

 my($ipos) = index("$param1","$param2");



 my($return) = "";

 if( $ipos > 0 )
 {
   $param1 = substr($param1,$ipos,8000);
   $ipos = index($param1,"-");
   $param1 = substr($param1,$ipos,8000);
   $ipos = index($param1,"~");
   $return = substr($param1,1,$ipos-1);

 }
 if( $globalcounter eq 1 )
 {
 if( index($return,"<tr") > 0 )
 {
 #tr bgcolor="#CCCCCC"
         #print("Replacing $temphash with ");
         $return =~ s|<tr|<tr bgcolor="#CCCCCC"|;
         $globalcounter = 0;
 }
 }
 else
 {
   $globalcounter = 1;
 }

 return("$return");

}



sub getobject
{
 my($param1) = @_;
 my($returndata) = "";
 my($paramold) = substr($param1,index($param1,":")+1,200);
 #print($paramold);
 my($i) = 0;
#LOADDATAOBJECT:STUDENTSCHOOL.*-STUDENTNO=PRIMEKEY 
#my($paramold) = $param1;
 $param1 = substr($param1,index($param1,"=")+1,100);
 my($sdata) = 1;
 #print($param1);
if( $param1 eq "LESSONNO" )
{
   $sdata = 0;
}

 for ($i = 0; $i < $number; $i++)
 {
    #print("Array $array[$i]");
    if(substr($array[$i],0,9) eq "QUESTION=" )
    {
        $array[$i] = "";
    } 

if( substr($param1,0,8) eq "CLASSVIEW" )
{
  if(substr($array[$i],0,7) eq "CLASSNO" )
  {
  if(substr($array[$i],0,7) eq substr($param1,0,7)  )
   {

    $sdata = 2;
    $skey = substr($array[$i],8,200);

    $param1 = substr($paramold,0,index($paramold,"=")+1);
    $param1 = "$param1"."$sclassno";
   #print("1 $array[$i]");
   }
   }
  }
   if(substr($array[$i],0,8) eq substr($param1,0,8)  )
   {

   if(substr($array[$i],9,2) ne "O=" )
   {
   
     my($stemp10) = "";

     if(substr($array[$i],0,8) eq "LESSONNO" )
     {
      $stemp10 = " AND ORDERNO="."$sorderno+1";

     }

     $sdata = 1;
     $skey = substr($array[$i],9,200);
#print(index($skey, '='));
     if( index($skey, '=') eq -1 )
     {
     $param1 = substr($paramold,0,index($paramold,"=")+1);
       
     #print("<p>key $skey"); 
     $param1 = "$param1"."$skey".$stemp10;
    # print("<p>param $param1");
    }

   }


  
 
   }


    if(substr($array[$i],0,9) eq substr($param1,0,9)  )
   {

   $sdata = 1;
    $skey = substr($array[$i],10,200);

    $param1 = substr($paramold,0,index($paramold,"=")+1);
    $param1 = "$param1"."$skey";
   #print("3 $array[$i]");
   }


 }


 my($output) = "ERROR: $sdata";

 if( substr($param1,index($param1,"=")+1,6) eq "SUBMIT" )
 {
   $sdata = 0;
   $output = "";


 }
$checkval = substr($param1,0,13);

 if( $steacherlogin eq "YES" )
{
  $sdata = 1;
 }

 if( $sdata == 1 )
 {
  
   $paramold = substr($paramold,index($paramold,':')+1,100);

  if( substr($paramold,0,13) eq "STUDENTSCHOOL" )
    {
       #print("dataobject $param1");
      #LOADDATAOBJECT:STUDENTSCHOOL.*-STUDENTNO=PRIMEKEY 
        my($wherecommand) = "STUDENTNO = $sstudentno"; #substr($paramold,16,index($paramold,'=')+1-16);


       if($slogin eq "YES")
       {
           $wherecommand = "STUDENTUSERID = "; #substr($paramold,16,index($paramold,'=')+1-16);
       }



       

      #print($wherecommand);

       if($slogin eq "YES")
       {
        $wherecommand = "STUDENTUSERID = $sstudentuserid AND SCHOOLNO = $schoolno AND PASSWORD = $spassword";

          if( $steacherlogin eq "YES" )
          {
            $wherecommand = "STUDENTUSERID = $steacheruserid AND SCHOOLNO = $schoolno AND PASSWORD = $spassword";
          }


       }
       
       
       my $sqlcommand = "SELECT STUDENT,STUDENTNO,SCHOOL,SCHOOLNO,CITY,STATE,GRADE,TEACHER,ADMIN from STUDENTSCHOOL WHERE $wherecommand";
       

       $connection->Sql("$sqlcommand"); 
       $connection->FetchRow(); 
       ($studentname,$studentid,$school,$schoolno,$city,$state,$grade,$teacher, $admin) = $connection->Data("STUDENT","STUDENTNO","SCHOOL","SCHOOLNO","CITY","STATE","GRADE","TEACHER","ADMIN"); 

        $sstudentno = $studentid;
        $sprimekey = $studentid;

        if( $steacherlogin eq "YES" )
       {
           $steacherno = $studentid;
       }
        $sbackupno = $steacherno;
        #print("Studentno $sstudentno");
 if( $slogin eq "YES" )
 {
  if( $studentname eq "" )
     {
     if( $steacher eq "YES"  )
     {
      #print("Error Code: 1\n");
       $snextpage = "badteacher.HTML";
       $sstudentno = "";
      }
      else
      {
       #print("Error Code: 2\n");
        
       $snextpage = "badstudent.HTML";
       $sstudentno = "";
      }
       #print("Name:[$snextpage]");
       displayobjectform();
    
    } 
    
   # print("$teacher AND $steacher");
     if( $steacher eq "YES"  )
     {
       if( $teacher eq "1"  )
      {
        $sprimekey = $studentid; 
        
      }
      else
      {
       #print("Error Code: 3\n");
      
       $snextpage = "badteacher.HTML";
       #print("Name:[$snextpage]");
       displayobjectform();
      }
    }
   }

       $returndata = "  ~STUDENT-$studentname~STUDENTNO-$studentid~SCHOOL-$school~SCHOOLNO-$schoolno~CITY-$city~STATE-$state~GRADE-$grade~EOF~"; 
       
    }
    else
    {
       
 $paramold = substr($paramold,index($paramold,':')+1,100);
  #print("[$paramold]");
  if( substr($paramold,0,8) eq "CONCEPT.")
  {
   
   #$paramold = $param1;
   
  }
  if( substr($paramold,0,8) eq "QUESTION")
  {
   
   $paramold = $param1;
   
  }
  if( substr($paramold,0,6) eq "ANSWER")
  {
   
   $paramold = $param1;
   
  }
  #print($paramold);

  $returndata = getdataobject("$paramold");

      
}
}
 if( $sdata == 2 )
 {
  

       my $wherecommand = substr($param1,index($param1,'-')+1,50);  
       my $sqlcommand = "select CLASSNO, CLASSINFO from CLASSVIEW WHERE $wherecommand";
       
       #print("$sqlcommand");
       $connection->Sql("$sqlcommand"); 
       $connection->FetchRow(); 
       ($classno, $classinfo) = $connection->Data("CLASSNO","CLASSINFO"); 

     
       $returndata = "  ~CLASSNO-$classno~CLASSINFO-$classinfo~EOF~"; 



  #$output = "dataclassobject $param1";  
  #$returndata = `$output`;
 }
 #print("$output");


 #print("Check: $returndata");
#$connection->Close();
 return("$returndata");

}




sub getclassobject
{
 my($param1) = @_;
 my($returndata) = "";

 my($i) = 0;
 #print( substr($param1,15,100));
 $param1 = substr($param1,15,100);


 for ($i = 0; $i < $number; $i++)
 {

   if(substr($array[$i],0,8) eq "CLASSNO"  )
   {

    $skey = substr($array[$i],8,200);

    $param1 = substr($param1,0,index($param1,"=")+1);
    $param1 = "$param1"."$skey";
   #print("$param1");
   }
 }
 
#print("[$param1]");

my($output) = "dataclassobject $param1";

$returndata = `$output`;


# print("$returndata");
 return("$returndata");

}





sub getmultiobject
{
 my($param1) = @_;
 my($returndata) = "";

 my($i) = 0;
 #print( substr($param1,15,100));
 $param1 = substr($param1,15,100);


 for ($i = 0; $i < $number; $i++)
 {
 if(substr($param1,0,4) eq "BLOG"  )
 {
  

    $param1 = substr($param1,0,index($param1,"=")+1);
    $param1 = "$param1"."$slessonno";
 
  }
  else
  {
   if(substr($param1,0,14) eq "STUDENTCLASSES"  )
   {
   

    $param1 = substr($param1,0,index($param1,"=")+1);
    $param1 = "$param1"."$sclassno";


    }
    else
    {
       if(substr($array[$i],0,8) eq "PRIMEKEY"  )
       {
    
        $skey = substr($array[$i],9,200);
    
        $param1 = substr($param1,0,index($param1,"=")+1);
        $param1 = "$param1"."$skey";
        #print("$param1");
        if( substr($param1,0,8) eq "STUDENTL" )
        {
           $param1 = "$param1"." AND PERIOD="."$speriod";
        }
    
    if( substr($param1,0,10) eq "COMPLETEDL" )
        {
           $param1 = "$param1"." AND PERIOD="."$speriod";
        }
       }
    
       }
 }
}
#print("[$param1]");
#print("$param1");
$returndata = "";
$returndata = getdatamultobject("$param1");
#"datamultiobject $param1";


#$returndata = `$output`;
#print("$returndata");

 #print("$output");
 return("$returndata");

}




sub storeobject
{

 my($returndata) = "";

 my($i) = 0;
 #print( substr($param1,15,100));
 #$param1 = substr($param1,15,100);

 #$number
 for ($i = 0; $i < $number; $i++)
 {

   if( index($array[$i],"=") > 0 )
   {

    chomp($array[$i]);
    $returndata = "$returndata"."*$array[$i]*";

     #print("$param1");
   }
 }



    while( index($returndata," ") > 0)
    {
      if( index($returndata," ") > 0 )
      {
        $returndata = substr($returndata,0,index($returndata," ")-1)."*SPACE*". substr($returndata,index($returndata," ")+1,500);
       # sinput = sinput.Trim();

      }


    }

  while( index($returndata,"%2C") > 0)
    {
      if( index($returndata,"%2C") > 0 )
      {
        $returndata = substr($returndata,0, index($returndata,"%2C"))."*comma*". substr($returndata, index($returndata,"%2C")+3, 500);
       # sinput = sinput.Trim();

      }


    }



        while( index($returndata,",") > 0)
    {
      if( index($returndata,",") > 0 )
      {
        $returndata = substr($returndata,0,index($returndata,","))."*comma*". substr($returndata,index($returndata,",")+1,500);
       # sinput = sinput.Trim();

      }

#print("[$returndata]\n");
$returndata = "";

    }







  my($output) = "storeobject \"$returndata\"";


 # print("$output");

 $returndata = `$output`;


 # print("Return data: $returndata");
 return("$returndata");

}




sub getdata
{
 my($param1) = @_;
 my($returndata) = "";
 my($skey) = "";
 my($i) = 0;
 for ($i = 0; $i < $number; $i++)
 {

   if(substr($array[$i],0,8) eq "PRIMEKEY"  )
   {

    $skey = substr($array[$i],9,200);

    $param1 = substr($param1,0,index($param1,"=")+1);
    $param1 = "$param1"."$skey";
   #print("$param1");
   }
 }



 #my($output) = "dbserver7 $param1";

 #$returndata = `$output`;


# print $returndata;
 return("$returndata");

}

sub storedata()
{


 print "<p>[STORE]<P>";
 print "Populating Variable: $array[0] <p>";
 my($output) = "dbserver7 $array[0]";
 $output = `$output`;
 #print $output;

 #print "<p>System Returns: $output <p> \n";
 #print "END<P>";

 #system("@output");



}


sub displaydata()
{
 print "[DISPLAY]<P>";


 my($data1) = "dbserver7 $array[0]";
 print "$data1";
 print "<p>Accessing Data: ";
 system("$data1");
 print "END<P>";



 #print "<p>System Returns: $output <p> \n";


 #system("@output");



}



sub doopenfile()
{
print "<p>\n";
print "File filename.out Saved: <p>\n";

open(MYINPUTFILE, "<filename.out"); # open for input
while(<MYINPUTFILE>)
 {
 # Good practice to store $_ value because
  # subsequent operations may change it.
  my($line) = $_;
  # Good practice to always strip the trailing
  # newline from the line.
  chomp($line);
  # Convert the line to upper case.
  $line =~ tr/[a-z]/[A-Z]/;
  # Print the line to the screen and add a newline
  print "$line\n";
  print "<p>";
  }
  close(MYINPUTFILE);
 }


sub getdatamultobject()
{



 my($param1) = @_;

    my($sdata) = "";
    my($stable) = "";
    my($sfield) = "";
    my($sinput) = "";


    my($skey) = "";

    
    $sinput = $param1;



my($inbeg) = 0;
$inbeg = index($sinput,"=");

    $sdata = substr($sinput,$inbeg+1,200);
    
#print("Sdata:$sdata");
    


if($sdata eq "PERIODNO")
{
   $sdata = $speriod;
}

if($sdata eq "PRIMEKEY")
{
   $sdata = $sprimekey;
}

 $stable = substr($sinput,0,index($sinput,"."));
   
    
    $sfield = substr($sinput,index($sinput,".")+1,index($sinput,"-") - 1 - index($sinput,".") );

 
   
    $skey = substr($sinput,index($sinput,"-")+1,index($sinput,"=") - 1 - index($sinput,"-",) );

if($skey eq "PRIMEKEY" && $steacher eq "YES")
{

   $sdata = $steacherno;
}

if($skey eq "PRIMEKEY" && $steacher ne "YES")
{

   $sdata = $sstudentno;
}

 #print("Sdata: $sdata");


 if( $skey eq "SCHOOLNO" )
    {
     $sdata = $schoolno;
    }
if( $skey eq "LESSONNO" )
    {
     $sdata = "$slessonno AND CLASSNO = $sclassno" ;
    }
   

    if( $skey eq "CLASSNO" )
    {
     $sdata = $sclassno;
    }
   
     if( index($sclassno,'.') > -1 )
      {
            $sclassno = substr( $sclassno, 0, index($sclassno,".") );
       } 
       
    my($sqlcommand) = "";
    
    if( $skey eq "TEACHERNO" )
    {
       $sdata = $steacherno;     
    }
    
    
    if( $ssort eq "NONE" )
    {
       $sqlcommand = "SELECT $sfield FROM $stable WHERE $skey = $sdata";
       if( $stable eq "TEACHERCLASSES" || $stable eq "STUDENTLESSONSNA" || $stable eq "ATEACHERCLASSES" || $stable eq "ATEACHERCLASSESCOMPLETED")
      {
        if( $ssearchcategory ne "" )
        {
        $sqlcommand = "$sqlcommand AND IMAGEPATH = '$ssearchcategory' AND CLASSNO = $sclassno ORDER BY STANDARD,STUDENTLESSON";

        }
        else
        {
           $sqlcommand = "$sqlcommand AND CLASSNO = $sclassno ORDER BY STANDARD,STUDENTLESSON";
        }
      }
    }
    else
    {
       $sqlcommand = "SELECT $sfield FROM $stable WHERE $skey = $sdata";
       #3print("$sfieldfilter");
       if( $stable eq "TEACHERCLASSES" || $stable eq "STUDENTLESSONSNA" || $stable eq "ATEACHERCLASSES" || $stable eq "ATEACHERCLASSESCOMPLETED")
      {

          $sqlcommand = "$sqlcommand AND CLASSNO = $sclassno";

      }

      if( $stable eq "CLASSLISTINGADD" ||  $stable eq "CLASSLISTINGEDIT")
     {
       if( $sgrade ne "ALL" )
       {
         if( $sfieldfilter eq "STUDENT" )
         {
         $sqlcommand = "SELECT CLASSLIST FROM $stable WHERE SCHOOLNO = '$schoolno' AND STUDENT LIKE '$sgrade%' AND ACTIVE = '1'";
         }
         else
         {
            $sqlcommand = "$sqlcommand  AND GRADE = $sgrade AND ACTIVE = '1'";
         
         }
         
         
         
       }
       else
       {
         $sqlcommand = "$sqlcommand  AND ACTIVE = '1'";
        
       }
     }   
      
      #print($ssort);
      if( $stable ne "SCHOOLANNOUNCEMENTS" )
      {
        if( $stable ne "STUDENTANNOUNCE" )
        {
           if( $stable ne "CLASSSTUDENTLIST" )
        {
          $sqlcommand = "$sqlcommand ORDER BY $ssort";
        }
        }  
     }
    }
 #sort
 
 if( $stable eq "CLASSSTUDENTLIST" )
     {
       if( $sgrade ne "ALL" )
       {
         $sqlcommand = "$sqlcommand  AND GRADE = $sgrade AND ACTIVE = 'Y' ORDER BY STUDENT";
       }
       else
       {
         $sqlcommand = "$sqlcommand  AND ACTIVE = 'Y' ORDER BY STUDENT";

       }
     }
  
if( $stable eq "BLOGCOMMENT" )
{
 
 $sqlcommand = "$sqlcommand AND STUDENTNO = $sstudentno";
 
}

if( $stable eq "STUDENTCLASS" )
{

 $sqlcommand = "SELECT STUDENTCLASS FROM STUDENTCLASS WHERE  STUDENTNO = $sstudentno ORDER BY STUDENTCLASS";

}

if( $stable eq "ASTUDENTCLASS" )
{

 $sqlcommand = "SELECT STUDENTCLASS FROM ASTUDENTCLASS WHERE  STUDENTNO = $sstudentno AND ACTIVE = 'Y' AND CLASSYEARS = '$sclassyears' AND SEMESTER = '$ssemester' ORDER BY PERIOD ";

}


if( $stable eq "LESSONLISTINGADD" )
{

 $sqlcommand = "$sqlcommand AND LESSONNO = $slessonno";

}

if( $stable eq "TEACHERCONCEPTS" )
{

 $sqlcommand = "$sqlcommand AND LESSONNO = $slessonno";

}

if( $stable eq "TEACHERQUESTIONS" )
{

 $sqlcommand = "$sqlcommand and LESSONNO = $slessonno";

}
if( $stable eq "TEAMS" )
{

 $sqlcommand = "SELECT $sfield from $stable where CLASSNO = $sclassno ORDER BY $sfield";

}
    

if( $stable eq "DISCIPLINEVIEW" )
{
  if( $skey eq "CLASSNO")
  {
    $sqlcommand = "SELECT $sfield from $stable where CLASSNO = $sclassno ORDER BY DISCIPLINENO DESC";
  }
  else
  {
    $sqlcommand = "SELECT $sfield from $stable where STUDENTNO = $sstudentno ORDER BY DISCIPLINENO DESC";
  }
}


if( $stable eq "STUDENTLESSONCHECK"  )
{

 $sqlcommand = "SELECT STUDENTLESSON FROM dbo.STUDENTLESSON A WHERE CLASSNO = $sclassno AND A.ASSESSMENT  != '1' AND A.STUDENTNO = $sstudentno AND ((PREREQUISITE IS NULL) OR (PREREQUISITE = 0)) UNION SELECT STUDENTLESSON FROM         dbo.STUDENTLESSON A WHERE   A.CLASSNO = $sclassno AND  A.ASSESSMENT  != '1' AND STUDENTNO = $sstudentno AND   A.PREREQUISITE IS NOT NULL AND ((SELECT     COUNT(*)  FROM  COMPLETEDLESSON B   WHERE A.STUDENTNO = $sstudentno AND  A.STUDENTNO = B.STUDENTNO AND A.CLASSNO = B.CLASSNO AND A.PREREQUISITE = B.LESSONNO) = 1)";

}
  if(  $stable eq "ASTUDENTLESSON" )
{

 $sqlcommand = "SELECT STUDENTLESSON FROM ASTUDENTLESSON A WHERE CLASSNO = $sclassno AND A.ASSESSMENT  != '1' AND A.STUDENTNO = $sstudentno AND ((PREREQUISITE IS NULL) OR (PREREQUISITE = 0)) UNION SELECT STUDENTLESSON FROM        ASTUDENTLESSON A WHERE   A.CLASSNO = $sclassno AND  A.ASSESSMENT  != '1' AND STUDENTNO = $sstudentno AND   A.PREREQUISITE IS NOT NULL AND ((SELECT     COUNT(*)  FROM  COMPLETEDLESSON B   WHERE A.STUDENTNO = $sstudentno AND  A.STUDENTNO = B.STUDENTNO AND A.CLASSNO = B.CLASSNO AND A.PREREQUISITE = B.LESSONNO) = 1)";

}


  if( $stable eq "STUDENTASSESSMENT" )
{

 $sqlcommand = "SELECT STUDENTLESSON from STUDENTASSESSMENT where CLASSNO = $sclassno AND STUDENTNO = $sstudentno AND ASSESSMENT = 1";

}
if( $stable eq "STUDENTASSESSMENTCOMPLETE" )
{

 $sqlcommand = "SELECT STUDENTLESSON from STUDENTASSESSMENTCOMPLETE where CLASSNO = $sclassno AND STUDENTNO = $sstudentno AND ASSESSMENT = 0";

}
if( $stable eq "COMPLETEDLESSONCHECK" ||  $stable eq "ACOMPLETELESSONCHECK" )
{

 $sqlcommand = "SELECT STUDENTLESSON from $stable where STUDENTNO = $sstudentno AND  CLASSNO = $sclassno ORDER BY STUDENTLESSON";

}
      
if( $stable eq "GRADEBOOK_LESSON" )
{

 $sqlcommand = "SELECT CLASSLIST FROM GRADEBOOK_LESSON WHERE LESSONNO = $slessonno AND CLASSNO = $sclassno";

}
if( $stable eq "GRADEBOOK_LESSON_EDIT" )
{

 $sqlcommand = "SELECT CLASSLIST FROM GRADEBOOK_LESSON_EDIT WHERE LESSONNO = $slessonno AND CLASSNO = $sclassno";

}
if( $stable eq "BLOGCOMMENTCLASS" )
{

 $sqlcommand = "SELECT COMMENTS FROM BLOGCOMMENT WHERE CLASSNO = $sclassno ORDER BY LESSONNO";


}
if( $stable eq "BLOGCOMMENT" )
{

 $sqlcommand = "SELECT COMMENTS FROM BLOGCOMMENT WHERE LESSONNO = $slessonno ORDER BY BLOGID";


}

if( $stable eq "BLOGCHILD" )
{

 $sqlcommand = "SELECT COMMENTS FROM BLOGCHILD WHERE CLASSNO = $sclassno AND PARENTBLOG = $sblogid ORDER BY BLOGID";


}

    
    
    
    if(  $stable eq "ATEACHERCLASSNA" )
{

 $sqlcommand = "SELECT TEACHERCLASS FROM $stable WHERE TEACHERNO = $steacherno AND SCHOOLNO = $schoolno ORDER BY PERIOD";


}


if( $stable eq "TEACHERCLASS" || $stable eq "TEACHERCLASSNA" || $stable eq "ATEACHERCLASS" )
{

 $sqlcommand = "SELECT TEACHERCLASS FROM $stable WHERE TEACHERNO = $steacherno AND SCHOOLNO = $schoolno AND CLASSYEARS = '$sclassyears' AND SEMESTER = '$ssemester' ORDER BY PERIOD";


}

  if( $stable eq "COPYTEACHERCLASS" )
{

 $sqlcommand = "SELECT TEACHERCLASS FROM COPYTEACHERCLASS WHERE TEACHERNO = $steacherno AND SCHOOLNO = $schoolno ORDER BY PERIOD";


}

if( $stable eq "REWARDS" )
{

 $sqlcommand = "SELECT REWARDURL FROM REWARDS WHERE ACTIVE = '1' ORDER BY REWARDID";


}
if( $stable eq "STANDARDVIEW" )
{



  if( $sselectdepartment eq "" && $sclasslevel eq "")
  {

    $sqlcommand = "SELECT COMMENTS FROM STANDARDVIEW WHERE CLASSNO = $sclassno  ORDER BY STANDARD";

  }
  else
  {

  if( $sclasslevel eq "" && $sselectdepartment ne "" )
  {

   $sqlcommand = "SELECT COMMENTS FROM STANDARDVIEW WHERE SUBJECT = '$sselectdepartment' AND UPPER(COMMENTS) LIKE '%$sstate%' ORDER BY STANDARD";

  }

   if( $sclasslevel ne "" && $sselectdepartment ne "" )
  {

   $sqlcommand = "SELECT COMMENTS FROM STANDARDVIEW WHERE SUBJECT = '$sselectdepartment' AND GRADE = '$sclasslevel' AND UPPER(COMMENTS) LIKE '%$sstate%'  ORDER BY STANDARD";

  }

   if( $sclasslevel ne "" && $sselectdepartment eq "" )
  {

   $sqlcommand = "SELECT COMMENTS FROM STANDARDVIEW WHERE GRADE = '$sclasslevel' AND UPPER(COMMENTS) LIKE '%$sstate%' ORDER BY STANDARD";

  }
}

}

if( $stable eq "LIBRARYCLASSES" )
{

if( $sstandardsearch ne "" )
{

 $sqlcommand = "SELECT STUDENTLESSON FROM LIBRARYCLASSES WHERE (STANDARD LIKE '%$sstandardsearch%') ORDER BY STUDENTLESSON";

}
else
{

  $sqlcommand = "SELECT STUDENTLESSON FROM LIBRARYCLASSES WHERE CLASSNO != $sclassno  AND (LESSON LIKE '%$ssearch%' OR OBJECTIVE LIKE '%$ssearch%' ) ORDER BY STUDENTLESSON";

}
  #print( $sqlcommand);
}
if( $stable eq "TEACHERANNOUNCEVIEW" )
{

 $sqlcommand = "SELECT COMMENTS FROM TEACHERANNOUNCEVIEW WHERE CLASSNO = $sclassno ORDER BY COMMENTS";


}
if( $stable eq "OBSERVATIONVIEW" )
{

 $sqlcommand = "SELECT COMMENTS FROM OBSERVATIONVIEW WHERE CLASSNO = $sclassno ORDER BY COMMENTS";


}

if( $stable eq "SCHOOLANNOUNCE" )
{

 $sqlcommand = "SELECT COMMENTS FROM SCHOOLANNOUNCEMENTS WHERE SCHOOLNO = (SELECT SCHOOLNO FROM STUDENT WHERE STUDENTNO = '$sstudentno') ORDER BY COMMENTS";


}

if( $stable eq "SCHOOLLIST" )
{

 $sqlcommand = "SELECT SCHOOLNAME FROM SCHOOLLIST WHERE SCHOOLNO = (SELECT SCHOOLNO FROM STUDENT WHERE STUDENTNO = '$steacherno') ORDER BY SCHOOLNO";


}

if( $stable eq "LESSONPLANVIEWLINK" )
{

 $sqlcommand = "SELECT COMMENTS FROM LESSONPLANVIEWLINK WHERE LESSONNOLINK = $slessonno ORDER BY LESSONPLANDATE DESC";


}
if( $stable eq "LESSONPLANVIEW" )
{

 $sqlcommand = "SELECT COMMENTS FROM LESSONPLANVIEW WHERE CLASSNO = $sclassno ORDER BY LESSONPLANDATE DESC";


}

if( $stable eq "LESSONPLANVIEWSTANDARD" )
{

 $sqlcommand = "SELECT COMMENTS FROM LESSONPLANVIEWSTANDARD WHERE STANDARD = '$sstandard' ORDER BY LESSONPLANDATE DESC";


}
if( $stable eq "LESSONPLANS" )
{

 $sqlcommand = "SELECT * FROM LESSONPLANS WHERE LESSONNOLINK = '$slessonno' ORDER BY CLOSURE";


}

#GETMULTOBJECT   LOADMULTOBJECT
 #print("$sqlcommand");

$connection->Sql("$sqlcommand");
       
my($returnvalue) = "";
$svalue = "";
while ($connection->FetchRow())
{

       ($svalue) = $connection->Data("$sfield");

         if( index($svalue,"<tr") > -1 && index($svalue,"bgcolor") < 0)
         {

         if( $globalcounter eq 1 )
         {
         #tr bgcolor="#CCCCCC"
         #print("Replacing $temphash with ");
         $svalue =~ s|<tr|<tr bgcolor="#CCCCCC"|;
         $globalcounter = 0;
         }
         else
         {
          $globalcounter = 1;
         }


       }


       $returnvalue = "$returnvalue"."$svalue";
   
}
return("$returnvalue");

}




sub getdataobject()
{



 my($param1) = @_;

    my($sdata) = "";
    my($stable) = "";
    my($sfield) = "";
    my($sinput) = "";


    my($skey) = "";

    
      $sinput = $param1;



    my($inbeg) = 0;
    $inbeg = index($sinput,"=");

    $sdata = substr($sinput,$inbeg+1,200);
    


    $stable = substr($sinput,0,index($sinput,"."));

     #print("Table $stable  input $sinput");
    if(substr($stable,0,10) eq "LOADDATAOB")
    {
     
     $stable = substr($stable,index($stable,":")+1,50);
    }
    
   
    
    $sfield = substr($sinput,index($sinput,".")+1,index($sinput,"-") - 1 - index($sinput,".") );


   
    $skey = substr($sinput,index($sinput,"-")+1,index($sinput,"=") - 1 - index($sinput,"-",));
   #print("Teacher: $steacherno - $sstudentno * $sbackupno");
   
   if( $skey eq "STUDENTNO" )
   {
      $sdata = $sstudentno;
      if( $steacher eq "YES" )
      {
         if( $steacherno eq "YES" )
         {
           $sdata = $steacherno;
         }
         else
         {
           $steacherno = $sstudentno;
         }
      }
   }

     if( $skey eq "TEACHERNO" )
   {
      $sdata = $sstudentno;
      if( $steacher eq "YES" && $steacherno ne "")
      {
          if( $steacherno ne "" )
         {
           $sdata = $steacherno;
         }
         else
         {
           $steacherno = $sstudentno;
         }
      }
   }
    
if( $skey eq "LESSONNO")
{
 
 #LOADDATAOBJECT:CONCEPT.*-LESSONNO=1037.0 AND ORDERNO=3.0+1
    $sdata = $slessonno;
    
    if( substr($sinput,index($sinput,":")+1,8) eq "CONCEPT.")
    {
     
     $sdata = substr($sinput,index($sinput,"=")+1,50);
     
    }
    if( substr($sinput,index($sinput,":")+1,8) eq "QUESTION")
    {
     
     $sdata = substr($sinput,index($sinput,"=")+1,50);
     
    }
    if( substr($sinput,index($sinput,":")+1,12) eq "QUESTIONVIEW")
    {

     $sdata = substr($sinput,index($sinput,"=")+1,50);

    }
    if( substr($sinput,index($sinput,":")+1,6) eq "ANSWER")
    {
     
     $sdata = substr($sinput,index($sinput,"=")+1,50);
     
    }
    
    
    
    #print($sinput);
    #$sdata = substr($sinput,index($sinput,"AND")-1,50)
}


if( $skey eq "STANDARD")
{


     
     $sdata = $sstandard;
     
   
 
}

if( $skey eq "CLASSNO")
{
 
    $sdata = $sclassno;
 
}
if( $skey eq "CONCEPTKEY" && $sconceptkey ne "" )
{

    $sdata = $sconceptkey;

}
if( $skey eq "CONCEPTNO")
{

    $sdata = $sconceptno;

}


if( $skey eq "BLOGID")
{
 
    $sdata = $sblogid;
 
}

my($sqlcommand) = "No SQL";

     if( index($sdata,"ORDERNO") > 0 )
     {
      
       $sqlcommand = "SELECT * FROM $stable WHERE $skey = $sdata";
      
     }
     else
     {

      $sqlcommand = "SELECT * FROM $stable WHERE $skey = '$sdata'";
   
     }
          #hereconcept
   
    if( $stable eq "CONCEPT" )
     {

       if( $steacher eq "YES" )
       {
       $sqlcommand = "SELECT * FROM CONCEPT WHERE LESSONNO = $slessonno AND CONCEPTNO = $sconceptno";
       }
       else
       {
        $sqlcommand = "SELECT * FROM CONCEPT WHERE LESSONNO = $slessonno AND ORDERNO = $sorderno + 1";

       }
     }
   
    if( $stable eq "QUESTION")
     {

       $sqlcommand = "SELECT * FROM $stable where LESSONNO = $slessonno AND QUESTIONNO = $squestionno";

     }
   
   if( $stable eq "ANSWER")
     {

       $sqlcommand = "SELECT * FROM $stable where LESSONNO = $slessonno AND QUESTIONNO = $squestionno";

     }
      if( $stable eq "DISCIPLINE")
     {

       $sqlcommand = "SELECT * FROM $stable where disciplineno = $sdisciplineno";

     }
   
    if( $stable eq "STUDENTSEATS")
     {

       $sqlcommand = "$sqlcommand AND CLASSNO = $sclassno";

     }
     if( $stable eq "PARENTBLOG")
     {

       $sqlcommand = "SELECT * FROM $stable where BLOGID = $sblogid";

     }
     if( $stable eq "BLOG")
     {

       $sqlcommand = "SELECT * FROM $stable where BLOGID = $sblogid";

     }
       if( $stable eq "CONCEPTADD")
     {

       
       $sqlcommand = "SELECT * FROM $stable where LESSONNO = $slessonno AND QUESTIONNO = $squestionno";

     }

      if( $stable eq "SCHOOL")
     {


       $sqlcommand = "SELECT * FROM SCHOOL where SCHOOLNO = $schoolno";

     }
     if( $stable eq "LESSONPLANS" )
{

if( $slessonno ne "" )
{

 $sqlcommand = "SELECT * FROM LESSONPLANS WHERE LESSONNOLINK = '$slessonno' ORDER BY CLOSURE";
}
else
{
  $sqlcommand = "SELECT * FROM LESSONPLANS WHERE BLOGID = '$sblogid'";
}


}

   
   #fixit
   #SHOWSQL    #LOADDATAOBJECT
#print("$sqlcommand");
    
    
    
    
    $connection->Sql("$sqlcommand");
    $connection->FetchRow();
 
    #my(@datarow) = $connection->Data;
      
    my(%hash) = $connection->DataHash;
     
    my($returnvalue) = "  ~";
    my($temphash) = "";
    $questiontype = "HIDDEN";
    #key translations
    foreach $key (sort(keys %hash)) 
    {
     
       $temphash = $hash{$key};
       #print("$key : $temphash");
       if( $sorderno eq 0 && $key eq "TEXT" )
       {
         #tr bgcolor="#CCCCCC"
         #print("Replacing $temphash with ");
         $temphash =~ s|\'|\\'|g;
         #print("New Value: $temphash<br>");

       }
       

       if( ($stable eq "ANSWER") && (substr($key,0,7) eq "CORRECT")  )
        {
          #HERE IT IS

          if( $temphash eq "1" )
          {
             $temphash = "CHECKED";
             $questiontype = "CHECKED";
             #print("Table:$stable  Key:$key Temphash:$temphash");
          }
          else
          {
             $temphash = "";
          }
        }
       
        if( ($stable eq "QUESTION") && ($key eq "QUESTTYPE") && ($temphash eq "TEXT") )
        {
         
          $questiontype = $temphash;
          
        
        
        } 
        if( ($stable eq "QUESTION") && ($key eq "QUESTTYPE") && ($temphash eq "") )
        { 
     
            $temphash = "HIDDEN";
        }
	      $returnvalue = "$returnvalue"."$key-$temphash~"; 
        

    }
    if( $stable eq "HOMEWORKCOMMENT" )
    {
     #print("[ $returnvalue ]");
    }   
   #print($returnvalue);
    $returnvalue =~ s/\s+/ /g;
     return("$returnvalue");

}





sub putstoreanswer()
{

       my($sqlcommand) = "SELECT MAX(TRIES) TRIED FROM STUDQUES WHERE STUDENTNO = $sstudentno  AND LESSONNO = $slessonno AND QUESTIONNO = $squestionno";
     
       #print("$sqlcommand");
       $connection->Sql("$sqlcommand"); 
       
       my($returnvalue) = "";
      $connection->FetchRow();
   
       my($tries) = $connection->Data("TRIED"); 
      
       
      my($sqlcommand) = "SELECT ATTEMPTS FROM STUDLESS WHERE STUDENTNO = $sstudentno  AND LESSONNO = $slessonno";
     
       #print("$sqlcommand");
       $connection->Sql("$sqlcommand"); 
       
       my($returnvalue) = "";
      $connection->FetchRow();
   
       my($attempts) = $connection->Data("ATTEMPTS"); 


        if( substr($attempts,0,1) eq "0" )
        {
               $attempts = "1";
         }

   
  
     my($sqlcommand) = "INSERT INTO STUDQUES (STUDENTNO,LESSONNO,ATTEMPT,ORDERNO,QUESTIONNO,CORRECT,ANSWERTEXT,TRIES ) VALUES ($sstudentno,$slessonno, $attempts,$sorderno,$squestionno,$sanswer,'$sactualanswer',$tries + 1)";


      #print("$sqlcommand");
       $connection->Sql("$sqlcommand"); 
       

      #PUT CLASSGPA IN QUESTION TABLE
      my($sqlcommand) = "SELECT COUNT(*) AS TOTALQUES FROM STUDQUES WHERE QUESTIONNO = $squestionno";

      $connection->Sql("$sqlcommand");

      my($returnvalue) = "";
      $connection->FetchRow();

      my($totalanswers) = $connection->Data("TOTALQUES");

      my($sqlcommand) = "SELECT COUNT(*) AS TOTALQUESCORRECT FROM STUDQUES WHERE QUESTIONNO = $squestionno AND CORRECT = 1" ;

      $connection->Sql("$sqlcommand");

      my($returnvalue) = "";
      $connection->FetchRow();

      my($totalanswerscorrect) = $connection->Data("TOTALQUESCORRECT");



       my($sqlcommand) = "UPDATE CONCEPT SET CLASSGPA = 100/$totalanswers * $totalanswerscorrect WHERE QUESTIONNO = $squestionno";


      #print("$sqlcommand");
       $connection->Sql("$sqlcommand");

       #This will assign assessement questions with linklessons to the student
       if( $sanswer eq "0" )
       {
         my($sqlcommand2) = "SELECT LESSONLINK, CLASSNO FROM QUESTION WHERE QUESTIONNO = '$squestionno' AND LESSONLINK IS NOT NULL AND LESSONLINK <> '0' ";
         #print("$sqlcommand");
         $connection2->Sql("$sqlcommand2");
         #my(@datarow) = $connection->Data;


         my($tempstud) = "";

         my($sqlcommand3) = "";
         if ($connection2->FetchRow())
         {
	          $slessonno = $connection2->Data("LESSONLINK");
            $sclassno = $connection2->Data("CLASSNO");
            $sqlcommand3 = "INSERT INTO STUDLESS (STUDENTNO,LESSONNO,CLASSNO,ACTIVE,DATETIME) VALUES ($sstudentno,$slessonno,$sclassno,'1',GetDate())";
            #print("$sqlcommand2");
            $connection3->Sql("$sqlcommand3");
          }

        }
        
        return("$returnvalue");


}


sub putfinalanswer()
{

      #PUT CLASSGPA IN QUESTION TABLE
      my($sqlcommand) = "SELECT COUNT(*) AS TOTALQUES FROM STUDQUES WHERE QUESTIONNO = $squestionno";

      $connection->Sql("$sqlcommand");

      my($returnvalue) = "";
      $connection->FetchRow();

      my($totalanswers) = $connection->Data("TOTALQUES");

      my($sqlcommand) = "SELECT COUNT(*) AS TOTALQUESCORRECT FROM STUDQUES WHERE QUESTIONNO = $squestionno AND CORRECT = 1" ;

      $connection->Sql("$sqlcommand");

      my($returnvalue) = "";
      $connection->FetchRow();

      my($totalanswerscorrect) = $connection->Data("TOTALQUESCORRECT");



       my($sqlcommand) = "UPDATE CONCEPT SET CLASSGPA = 100/$totalanswers * $totalanswerscorrect WHERE QUESTIONNO = $squestionno";


      #print("$sqlcommand");
       $connection->Sql("$sqlcommand");



  my($sqlcommand) = "SELECT NOOFTIMES, REWARDDOLLARS FROM LESSON WHERE LESSONNO = $slessonno";

       #print("$sqlcommand<br>");
       $connection->Sql("$sqlcommand"); 
       
       my($returnvalue) = "";
       $connection->FetchRow();
   
       my($nooftimes) = $connection->Data("NOOFTIMES"); 
       my($rewarddollars) = $connection->Data("REWARDDOLLARS");

       $sqlcommand = "SELECT ATTEMPTS FROM STUDLESS WHERE STUDENTNO = $sstudentno AND LESSONNO = $slessonno";
       #print("$sqlcommand");
       #print("$sqlcommand");
       $connection->Sql("$sqlcommand");
       
       my($returnvalue) = "";
       $connection->FetchRow();
   
       my($attempts) = $connection->Data("ATTEMPTS"); 
      
         
        if( substr($attempts,0,1) eq "0" )
        {
               $attempts = "1";
        }

   
  
  my($sqlcommand) = "INSERT INTO STUDQUES (STUDENTNO,LESSONNO,ATTEMPT,ORDERNO,QUESTIONNO,CORRECT,ANSWERTEXT ) VALUES ($sstudentno,$slessonno, $attempts,$sorderno,$squestionno,$sanswer,'$sactualanswer' )";
#print("$sqlcommand");

      #print("$sqlcommand");
       $connection->Sql("$sqlcommand"); 
             
       

  my($sqlcommand) = "SELECT COUNT(*) AS TOTALQUES FROM STUDQUES WHERE STUDENTNO = $sstudentno AND LESSONNO = $slessonno AND ATTEMPT = $attempts";
     #print("$sqlcommand");
      #print("$sqlcommand");
       $connection->Sql("$sqlcommand"); 
       
       my($returnvalue) = "";
      $connection->FetchRow();
   
       my($totalquestions) = $connection->Data("TOTALQUES"); 

        		

my($sqlcommand) = "SELECT COUNT(*) AS TOTCORRECT FROM STUDQUES WHERE STUDENTNO = $sstudentno AND LESSONNO = $slessonno AND ATTEMPT = $attempts AND CORRECT = 1";
#print("$sqlcommand");     
       #print("$sqlcommand");
       $connection->Sql("$sqlcommand"); 
       
       my($returnvalue) = "";
      $connection->FetchRow();
   
       my($right) = $connection->Data("TOTCORRECT"); 
      my($active) = "1";
      my %dttime = ();


my($ipercent) = (100 / $totalquestions) * $right;


my($grade) = "F";

if( $ipercent < 0 )
{
    $grade = "NA";
}

if( $ipercent < 0 )
{
    $grade = "NA";
}

if( $ipercent > 97 )
{
    $grade = "A+";
}

if( $ipercent > 93 && ($ipercent < 98 ))
{
    $grade = "A";
}

if( ($ipercent > 89 ) && ($ipercent < 94 ))
{
    $grade = "A-";
}

if( ($ipercent > 87 ) && ($ipercent < 90 ))
{
    $grade = "B+";
}
             
if( ($ipercent > 83 ) && ($ipercent < 88 ))
{
    $grade = "B";
}

if( ($ipercent > 79 ) && ($ipercent < 84 ))
{
    $grade = "B-";
}

if( ($ipercent > 77 ) && ($ipercent < 80 ))
{
    $grade = "C+";
}
             
if( ($ipercent > 73 ) && ($ipercent < 78 ))
{
    $grade = "C";
}

if( ($ipercent > 69 ) && ($ipercent < 74 ))
{
    $grade = "C-";
}
if( ($ipercent > 67 ) && ($ipercent < 70 ))
{
    $grade = "D+";
}
             
if( ($ipercent > 63 ) && ($ipercent < 68 ))
{
    $grade = "D";
}

if( ($ipercent > 59 ) && ($ipercent < 64 ))
{
    $grade = "D-";
}


#print("$ipercent"); 
my($convert) = $ipercent;

if( index($ipercent,'.') > 0 )
{
    $convert = substr($ipercent,0,index($ipercent,'.')+3);
}

my($idollars) = "0";

if( $ipercent > 89 )
{
   $idollars = $rewarddollars;
}


my($tm) = localtime;
  my($sdatetime) = sprintf("%02d-%02d-%04d",($tm->mon)+1, $tm->mday, $tm->year+1900);




      my($sqlcommand) = "UPDATE STUDLESS SET DOLLARPOINTS = '$idollars',  GRADE = '$grade', ACTIVE = $active , [RIGHT] = $right , TOTALQUESTIONS = $totalquestions , [PERCENT] = $convert, ATTEMPTS = $attempts + 1, DATETIME = '$sdatetime' WHERE STUDENTNO = $sstudentno AND LESSONNO = $slessonno";
#print("$sqlcommand");
$connection->Sql("$sqlcommand"); 
 

$sqlcommand = "SELECT AVG([PERCENT]) AS PGRADE FROM STUDLESS WHERE  ATTEMPTS > 0 AND [PERCENT] > -1 AND STUDENTNO = $sstudentno  AND CLASSNO = $sclassno";
$connection->Sql("$sqlcommand"); 
#print("$sqlcommand");
my($returnvalue) = "";
$connection->FetchRow();
   
my($pgrade) = $connection->Data("PGRADE"); 


my($lgrade) = "F";

if( $pgrade < 0 )
{
    $lgrade = "NA";
}


if( $pgrade > 97 )
{
    $lgrade = "A+";
}

if( $pgrade > 93 && ($pgrade < 98 ))
{
    $lgrade = "A";
}

if( ($pgrade > 89 ) && ($pgrade < 94 ))
{
    $lgrade = "A-";
}

if( ($pgrade > 87 ) && ($pgrade < 90 ))
{
    $lgrade = "B+";
}
             
if( ($pgrade > 83 ) && ($pgrade < 88 ))
{
    $lgrade = "B";
}

if( ($pgrade > 79 ) && ($pgrade < 84 ))
{
    $lgrade = "B-";
}

if( ($pgrade > 77 ) && ($pgrade < 80 ))
{
    $lgrade = "C+";
}
             
if( ($pgrade > 73 ) && ($pgrade < 78 ))
{
    $lgrade = "C";
}

if( ($pgrade > 69 ) && ($pgrade < 74 ))
{
    $lgrade = "C-";
}
if( ($pgrade > 67 ) && ($pgrade < 70 ))
{
    $lgrade = "D+";
}
             
if( ($pgrade > 63 ) && ($pgrade < 68 ))
{
    $lgrade = "D";
}

if( ($pgrade > 59 ) && ($pgrade < 64 ))
{
    $lgrade = "D-";
}




my($convert) = substr($pgrade,0,index($pgrade,'.')+3);



 #checkthis
my($sqlcommand) = "UPDATE STUDCLAS SET DOLLARPOINTS = DOLLARPOINTS + $idollars,[PERCENT] = $convert, LETTERGRADE = '$lgrade' WHERE STUDENTNO = '$sstudentno' AND CLASSNO = '$sclassno'";

#print("-6 $sqlcommand");

$connection->Sql("$sqlcommand"); 
             
  $sqlcommand3 = "SELECT EMAIL, STUDENT FROM STUDENT WHERE STUDENTNO = $sstudentno";

       $connection2->Sql("$sqlcommand3");
       $connection2->FetchRow();
       my($semail) = $connection2->Data("EMAIL");
       

       
       
       my($semailname) = $connection2->Data("STUDENT")." Completed a lesson\n \n" ;







       my($sqlcommand) = "SELECT TEACHERNO, PARENT1,ADDRESS1,ADDRESS2,CITY,STATE,ZIP,STUDENTNO,LETTERGRADE, STUDENT, CLASS , PERIOD, [PERCENT] FROM CLASSLISTING WHERE CLASSNO = '$sclassno' AND STUDENTNO = '$sstudentno'";
       #fixit
       #print("$sqlcommand");
       $connection->Sql("$sqlcommand");
       my($pr_studentno) = "";
       my($pr_student) = "";
       my($pr_class) = "";
       my($pr_period) = "";
       my($pr_percent) = "";
       my($pr_parent1) = "";
       my($pr_address1) = "";
       my($pr_teacherno) = "";
       my($pr_address2) = "";
       my($pr_city) = "";
       my($pr_state) = "";
       my($pr_zip) = "";
       my($steacheremail) = "";
       

       while($connection->FetchRow() )
       {
          #print("found record...");
          $pr_teacherno = $connection->Data("TEACHERNO");

         $sqlcommand2 = "SELECT EMAIL, STUDENT FROM STUDENT WHERE STUDENTNO = $pr_teacherno";

       $connection2->Sql("$sqlcommand2");
       $connection2->FetchRow();
       $steacheremail = $connection2->Data("EMAIL");



          $pr_studentno = $connection->Data("STUDENTNO");
          $pr_student = $connection->Data("STUDENT");
          $pr_classgrade = $connection->Data("LETTERGRADE");
           $pr_class = $connection->Data("CLASS");
          $pr_period = $connection->Data("PERIOD");
          $pr_percent = $connection->Data("PERCENT");
          $pr_parent1 = $connection->Data("PARENT1");
          $pr_address1 = $connection->Data("ADDRESS1");
          $pr_address2 = $connection->Data("ADDRESS2");
          $pr_city = $connection->Data("CITY");
          $pr_state = $connection->Data("STATE");
          $pr_zip = $connection->Data("ZIP");


          $semailname = "Class Progress Report for $pr_student \n";
          $semailname = $semailname."  Class: $pr_class \n \n";


          if( $pr_parent1 ne "" )
          {
            $semailname = $semailname."$pr_parent1 \n";
          }
          else
          {
             $semailname = $semailname."Parents of  $pr_student \n";

          }


          $semailname = $semailname."$pr_address1 \n";

          if( $pr_address2 ne "" )
          {
             $semailname = $semailname."$pr_address2 \n";
          }


          if( $pr_city ne "" )
          {
            $semailname = $semailname."$pr_city, $pr_state  $pr_zip \n \n \n";
          }
           else
          {
             $semailname = $semailname."\n \n \n";
          }

          $semailname = $semailname."Student Number: $pr_studentno  Student Name:  $pr_student \n";
          $semailname = $semailname."Period: $pr_period \n Class: $pr_class ($sclassno)  -  Current Grade: $pr_classgrade ($pr_percent %)\n";


       

         my($sqlcommand2) = "SELECT * FROM PROGRESSREPORT WHERE CLASSNO = '$sclassno' AND STUDENTNO = $sstudentno AND LESSONNO = $slessonno";
          #fixit
          #print("$sqlcommand");
          $connection2->Sql("$sqlcommand2");

          my($pr_lesson) = "";
          my($pr_lessonno) = "";
          my($pr_lettergrade) = "";
          my($pr_percent) = "";
          my($pr_attempts) = "";
          my($pr_datetime) = "";
          my($pr_chapterno) = "";
          my($pr_objective) = "";



           $semailname = $semailname."---------------------------------------------------------------------------\n";
           $semailname = $semailname."Assignments and Homework \n \n";
          while($connection2->FetchRow() )
          {
             $pr_lesson  = $connection2->Data("LESSON");
             $pr_lessonno  = $connection2->Data("LESSONNO");
             $pr_lettergrade = $connection2->Data("GRADE");
             $pr_percent  = $connection2->Data("LESSONPERCENT");
             $pr_attempts = $connection2->Data("ATTEMPTS");
             $pr_datetime = $connection2->Data("DATETIME");
             $pr_chapterno = $connection2->Data("CHAPTERNO");
             $pr_objective = $connection2->Data("OBJECTIVE");

             $pr_datetime = substr($pr_datetime,0,10);

             $semailname = $semailname."$pr_lettergrade ($pr_percent %) Lesson: $pr_lesson ($pr_lessonno) \n";
             $semailname = $semailname."    Objective: $pr_objective \n    Attempt: $pr_attempts \n \n";
             #print( " &nbsp;&nbsp; ----- Chapter: $pr_chapterno  Date Completed: $pr_datetime  Attempts: $pr_attempts <br>");



          }



         my($sqlcommand2) = "SELECT DISTINCT B.QUESTION, C.CHOICE1,C.CHOICE2,C.CHOICE3,C.CHOICE4 FROM STUDQUES A, QUESTION B, ANSWER C WHERE A.QUESTIONNO = B.QUESTIONNO AND B.QUESTIONNO = C.QUESTIONNO AND A.LESSONNO = $slessonno AND A.STUDENTNO = $sstudentno AND A.ATTEMPT = $pr_attempts - 1 and A.CORRECT = 0 ORDER BY B.QUESTION";
          #fixit
          #print("$sqlcommand2");
          $connection2->Sql("$sqlcommand2");

          my($pr_question) = "";
          my($choice1) = "";
          my($choice2) = "";
          my($choice3) = "";
          my($choice4) = "";



           $semailname = $semailname."---------------------------------------------------------------------------\n";
           $semailname = $semailname."Missed Questions \n \n";
          while($connection2->FetchRow() )
          {
             $pr_question  = $connection2->Data("QUESTION");
             $choice1  = $connection2->Data("CHOICE1");
             $choice2  = $connection2->Data("CHOICE2");
             $choice3  = $connection2->Data("CHOICE3");
             $choice4  = $connection2->Data("CHOICE4");

                $semailname = $semailname."WRONG - $pr_question \n \n";

                $semailname = $semailname."Choices: $choice1 , $choice2 , $choice3 , $choice4 \n \n";


             #print( " &nbsp;&nbsp; ----- Chapter: $pr_chapterno  Date Completed: $pr_datetime  Attempts: $pr_attempts <br>");



          }


       #my($smessage) = "( To => \'$semail\', From => \'rick@innovakids.com\',  Subject    => \'Test Email From Innovakids\', Message => \'This is a very short message for $semailname\'");

      if( $semail ne "" )
      {
       #print("Sending Email: $semail");
       
      $semail = "$semail ; $steacheremail";
       
      %mail = ( To      => $semail,
            From    => 'rick@innovakids.com',
            Subject    => 'Your child just completed a lesson!',
            Message => $semailname
           );
        sendmail(%mail) or die $Mail::Sendmail::error;
        #print "OK. Log says:\n", $Mail::Sendmail::log;

       }
       else
       {
       
        #print("Email Not Sent to Parents...");
       }
      }

my($sqlcommand) = "UPDATE LESSON SET CLASSGPA = (SELECT AVG([PERCENT]) AS Expr1 FROM STUDLESS WHERE     (LESSONNO = '$slessonno') AND ([PERCENT] IS NOT NULL) AND (ATTEMPTS <> 0) ) where LESSONNO = $slessonno";
#print("$sqlcommand");

      #print("$sqlcommand");
       $connection->Sql("$sqlcommand");
       
my($sqlcommand) = "UPDATE CLASS SET PERCENTAGE = (SELECT AVG(CLASSGPA) AS Expr1 FROM LESSON WHERE (CLASSNO = '$sclassno') AND (CLASSGPA IS NOT NULL) AND (CLASSGPA <> 0))WHERE (CLASSNO = '$sclassno') ";

 $connection->Sql("$sqlcommand");


return("");




}
