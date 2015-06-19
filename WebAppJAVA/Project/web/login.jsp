<%-- 
    Document   : login
    Created on : 15-Jun-2015, 11:02:25 AM
    Author     : c0652674
--%>

<%@page import="Project.DB_Users"%>
<%@page import="Project.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Log In</title>
        <link rel="stylesheet" href="resources/css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="resources/css/styles.css"  type="text/css">
        <script src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
        <script src="resources/jquery-ui/jquery.ui.js"></script>
        <script src="resources/js/additional-methods.min.js"></script>
        <script src="resources/js/jquery.validate.min.js"></script>
    </head>
    <body>
       
        <header>
        
            <div class="navbar navbar-default">
		<div class="navbar-header">
                    <ul class="nav nav-pills nav-justified">
			<li><a href="#home" data-toggle="tab">Home</a></li>
                        <li><a href="../Project/myprofile.jsp" data-toggle="tab">My Profile</a></li>
                        <li><a href="../Project/signup.jsp" data-toggle="tab">Sign Up</a></li>
                        <li class="active"><a href="" data-toggle="tab">Log In</a></li>
                        <li><a href="chatbox.jsp" data-toggle="tab">Chat Box</a></li>
			<li><a href="#contact" data-toggle="tab">Contact Us</a></li>
                        <li><a href="../Project/LoginServlet" data-toggle="tab">Log Out</a></li>
		    </ul>
                </div>
            </div>
           </header> 
        
         <div class="container">
        <%  //Sign Up Functionalities
            //Variables
            String firstName=request.getParameter("firstName");
            String lastName=request.getParameter("lastName");
            String userName=request.getParameter("userName");
            String emailId=request.getParameter("email");
            //int mobileNumber=Integer.parseInt(request.getParameter("contact"));
            String gender=request.getParameter("gender");
            String address=request.getParameter("address");
            String city=request.getParameter("city");
            String password=request.getParameter("password");
            //Checking for duplicates
            DB_Users db1=new DB_Users();
            int userNameRowCount=db1.checkingDuplicateUserName(userName);
            int emailIdRowCount=db1.checkingDuplicateEmailId(emailId);
            //int mobileNumberCount=db1.checkingDuplicateMobileNumber(mobileNumber);
            if(userNameRowCount!=0){
                //Checking for UserName Duplicates
                out.println("User Name "+userName+" already Used by someone else. Please try with someother");
                request.getRequestDispatcher("signup.jsp").forward(request, response);
            }else if(emailIdRowCount!=0){
                //Checking for Email Id Duplicates
                out.println("Email Id "+emailId+"  Used by someone else. Please try with someother");
                request.getRequestDispatcher("signup.jsp").forward(request, response);
            }/*else if(mobileNumberCount!=0){
                //Checking for Mobile Number Duplicates
                out.println("Email Id "+emailId+"  Used by someone else. Please try with someother");
            }*/else{            
                //Inserting Sign Up Form
                Users u=new Users(firstName,lastName,userName,emailId,10,gender,address,city,password);
                DB_Users db=new DB_Users();
                db.insertUsers(u);
                out.println("<p class='well'><b>Welcome Please Log In"+"</b></p>");
            }
        %>
        
        <form name="login" action="LoginServlet" method="POST">
            
            <div class="form-group">
            <div class="row">
                <div class="col-lg-2 col-sm-offset-1">
                    <label for="username">User Name:</label>
                    <label for="username" style="color:red">*</label>
                </div> 
                <div class="col-lg-4">
                    <input type="text" class="form-control" name="username"/>
                </div>    
            </div> 
            </div>
            <div class="form-group">
            <div class="row">
                <div class="col-lg-2 col-sm-offset-1">
                    <label for="password">Password:</label>
                    <label for="password" style="color:red">*</label>
                </div> 
                <div class="col-lg-4">
                    <input type="password" class="form-control" name="password"/>
                </div>    
            </div>
            </div>
            <div class="row form-group">
                <div class="col-lg-4 col-lg-offset-3">
                    <input type="submit" value="Submit" class="btn btn-default col-lg-6"/>
                </div>
            </div>
            
            <div class="error">
                <div class="well" style="color:red">${loginFailedMessage}</div>
            </div>
            
            
        </form>
        </div>
    </body>
</html>