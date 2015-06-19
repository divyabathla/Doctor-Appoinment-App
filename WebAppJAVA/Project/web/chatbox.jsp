<%-- 
    Document   : chatbox
    Created on : 18-Jun-2015, 2:05:45 PM
    Author     : c0652674
--%>

<%@page import="Project.DB_Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Chat Box</title>
        <link rel="stylesheet" href="resources/css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="resources/css/styles.css"  type="text/css">
        <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
        <script src="http://code.jquery.com/jquery-1.10.2.js"></script>
        <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
        <script src="resources/js/jquery.validate.min.js"></script>
        <script src="./resources/js/myScript.js"></script>
    </head>
    <body>
       
        <header>
        
            <div class="navbar navbar-default">
		<div class="navbar-header">
                    <ul class="nav nav-pills nav-justified">
			<li><a href="#home" data-toggle="tab">Home</a></li>
                        <li><a href="../Project/myprofile.jsp" data-toggle="tab">My Profile</a></li>
                        <li><a href="../Project/signup.jsp" data-toggle="tab">Sign Up</a></li>
                        <li><a href="" data-toggle="tab">Log In</a></li>
                        <li class="active"><a href="chatbox.jsp" data-toggle="tab">Chat Box</a></li>
			<li><a href="#contact" data-toggle="tab">Contact Us</a></li>
                        <li><a href="../Project/LoginServlet" data-toggle="tab">Log Out</a></li>
		    </ul>
                </div>
            </div>
           </header> 
        <div class="container">
            
            <div class="well">
                <%try{
                    String userName=session.getAttribute("username").toString();
                    out.println("<p><b>WELCOME "+userName+"</b></p>");
                }catch(Exception e){
                    response.sendRedirect("login.jsp");
                }
                %>
            </div>
            
            <%DB_Users d=new DB_Users();%>
            <script type="text/javascript">
                var myJSON = "<% System.out.println(d.getAllUserName()); %>";
                $(function() {

                    $( "#receiver" ).autocomplete({
                      source: myJSON;
                    });
                });
            </script>
            
            <form action="" method="POST">
                
                <div class="row form-group">
                    <div class="col-xs-1 ">
                        <label for="receiver">To :</label>
                    </div>
                    <div class="col-lg-3">
                        <input type="text" name="receiver" id="receiver" class="form-control"/>
                    </div>    
                </div>    
                <div class="row form-group">
                    <div class="col-xs-1 col-sm-1">
                        <label for="message"></label>
                    </div>
                    <div class="col-lg-3">
                        <input type="text" name="message" class="form-control" id="message" placeholder="Enter your message here"/>
                    </div>    
                </div>   
                <div class="row form-group">
                    <div class="col-lg-2 col-sm-1">
                        <label for="message"></label>
                    </div>
                    <div class="col-lg-3">
                        <input type="submit" value="Send" class="btn btn-md-3 btn-success"/>
                    </div>    
                </div>   
                
                
                
            </form>
        </div>
        
    </body>
</html>
