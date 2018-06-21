<%-- 
    Document   : index
    Created on : 06-Jun-2018, 16:45:08
    Author     : Manthan's
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>  
<!DOCTYPE html>
<html>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
      <!-- <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/signup.css" rel="stylesheet" type="text/css" media="all" />
       <script type="text/javascript" src="js/rep.js"></script> -->

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <title>MoviePedia</title>
        
        <style>
        body{
           background-color: darkgray; 
        }
        .nav-tabs li a {
            color: #777;
        }
        
        .navbar {
        margin-bottom: 0;
        background-color: #2d2d30;
        border: 0;
        font-size: 20px !important;
        letter-spacing: 2px;
        opacity:0.75;
        height: 65px;
    }

    /* Add a gray color to all navbar links */
    .navbar li a, .navbar .navbar-brand { 
        color: #d5d5d5 !important;
        font-size: 20px;
        height: 65px;
        align-content: center;
        margin-top: auto;
        margin-bottom: 10px;

    }

    /* On hover, the links will turn white */
    .navbar-nav li a:hover {
        color: #fff !important;
    }

    /* The active link */
    .navbar-nav li.active a {
        color: #fff !important;
        background-color:gray !important;
    }

    /* Remove border color from the collapsible button */
    .navbar-default .navbar-toggle {
        border-color: transparent;
    }

    /* Dropdown */
    .open .dropdown-toggle {
        color: #fff ;
        background-color: #555 !important;
    }

    /* Dropdown links */
    .dropdown-menu li a {
        color: #000 !important;
    }

    /* On hover, the dropdown links will turn red */
    .dropdown-menu li a:hover {
        background-color: red !important;
    }
    .myhover:hover{
        box-shadow: 10px 10px 10px rgba(0,0,0, .5);
    }
    
    /*image flip*/
    #f1_container {
  position: relative;
  margin: 10px auto;
  width: 450px;
  height: 281px;
  z-index: 1;
}
#f1_container {
  perspective: 1000;
}
#f1_card {
  width: 45%;
  height: 100%;
  transform-style: preserve-3d;
  transition: all 0.7s linear;
}
#f1_container:hover #f1_card {
  transform: rotateY(180deg);
}
.face {
  position: absolute;
  width: 100%;
  height: 100%;
  backface-visibility: hidden;
}
.face.back {
  display: block;
  transform: rotateY(180deg);
  box-sizing: border-box;
  padding: 10px;
  color: white;
  text-align: center;
  background-color: #aaa;
}
/*image flip*/
        </style>
    </head>
    <body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="50">
        
        <nav class="navbar navbar-default navbar-fixed-top">
            <div class="container-fluid">
              <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                  <span class="icon-bar"></span>
                  <span class="icon-bar"></span>
                  <span class="icon-bar"></span>
                  <span class="icon-bar"></span>                        
                </button>
                <a class="navbar-brand" href="#">Logo</a>
              </div>
              <div class="collapse navbar-collapse" id="myNavbar">
                <ul class="nav navbar-nav navbar-right">
                  <li><a href="#myPage">SignIn</a></li>
                  <li><a href="#band" onclick="os()">SignUp</a></li>
                  <li><a href="#tour">AboutUs</a></li>
                  <li><a href="#contact">ContactUs</a></li>
                </ul>
              </div>
            </div>
          </nav>

        <sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"  
        url="jdbc:mysql://localhost:3306/moviepedia?zeroDateTimeBehavior=convertToNull"  
        user="root"  password=""/>
        
        <sql:query dataSource="${db}" var="rs">  
          select img from top3;
        </sql:query> 
    <br><br><br><br><br>
        <div class="container">
        <div id="myCarousel" class="carousel slide" data-ride="carousel">
        <!-- Indicators -->
        <ol class="carousel-indicators">
          <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
          <li data-target="#myCarousel" data-slide-to="1"></li>
          <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>
        
        <!-- Wrapper for slides -->
        <div class="carousel-inner">
            
            
            <c:forEach var="table" items="${rs.rows}" varStatus="loop">  
                <c:choose>
                <c:when test="${loop.count eq 1}">
                    <div class="item active">
                        <img src="<c:url value="${table.img}"/>" style="width:100%;">
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="item">
                    <img src="<c:url value="${table.img}"/>" style="width:100%;">
                    </div>
                </c:otherwise>
                
            
                </c:choose>
            </c:forEach>
        
        </div>

        <!-- Left and right controls -->
        <a class="left carousel-control" href="#myCarousel" data-slide="prev">
          <span class="glyphicon glyphicon-chevron-left"></span>
          <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#myCarousel" data-slide="next">
          <span class="glyphicon glyphicon-chevron-right"></span>
          <span class="sr-only">Next</span>
        </a>
      </div>
    </div> 
    </div>      

    <!-- MoviePedia trending 25 -->
    <button type="button" class="btn btn-primary">cvxcg   </button>
     <br><b>MoviePedia trending 10<br><br></b>
    
    <sql:query dataSource="${db}" var="rs">  
        select mname,image,round(avg(rating),0) as rate from movie natural join ratings_review 
        group by mid 
        order by avg(rating) desc
        limit 10;
    </sql:query>
        
  
      <!--  <b> #${loop.count} <b> is <b> ${table.mname} </b> rating is ${table.rate} -->
        <!-- <div class="container" style="height:200px;width:300px;">
            <div class="panel-body">
                <img src="<c:url value="${table.image}"/>" style="width:10%;">
            </div>
        </div>
            
        <div class="progress" style="width:15%;">
            <div class="progress-bar progress-bar-warning progress-bar-striped active" role="progressbar"
            aria-valuenow="150" aria-valuemin="0" aria-valuemax="100" style="width:${table.rate}%">
                ${table.rate}%
            </div>
        </div> -->
        <button data-toggle="collapse" data-target="#demo" type="button" class="btn btn-outline-secondary" style="align-content:center; margin-left:auto;margin-right:auto;display:block;">
            MoviePedia Top 16
                <span class="glyphicon glyphicon-chevron-down">
                </span>
        </button>    
                     
              
               

        <div id="demo" class="collapse">
 
            <div class="container" style="width:75%;background-color:red; animation:normal;">
            
                <br><br>
                <c:forEach var="table" items="${rs.rows}" varStatus="loop">
                    
                    <c:if test="${loop.count%4 == 0}">
                        <div class="row">
                    </c:if>
                    
                            <div class="col-sm-3">
                                <div id="f1_container">
<div id="f1_card" class="shadow">
  <div class="front face">
    <img src="<c:url value="${table.image}"/>"  class="img-thumbnail img-responsive"/>
  </div>
  <div class="back face center">
      <p><strong>${table.mname}</strong></p>
                                            <p>${table.rate}%</p>
                                            <p><strong>${table.mname}</strong></p>
                                            <p>${table.rate}%</p>
                                            <p><strong>${table.mname}</strong></p>
                                            <p>${table.rate}%</p>
                                            <p><strong>${table.mname}</strong></p>
                                            <p>${table.rate}%</p>
                                            <p><strong>${table.mname}</strong></p>
                                            <p>${table.rate}%</p>
                                            <p><strong>${table.mname}</strong></p>
                                            <p>${table.rate}%</p>
                                            <p><strong>${table.mname}</strong></p>
                                            <p>${table.rate}%</p>
  </div>
</div>
</div>
<!--                                    <div class="thumbnail myhover" >
                                        <img src="<c:url value="${table.image}"/>"  height="350" width="200" class="img-thumbnail img-responsive ">
                                            <p><strong>${table.mname}</strong></p>
                                            <p>${table.rate}%</p>
                                          </div>-->

                      <!-- <img src="<c:url value="${table.image}"/>" height="350" width="200" class="img-responsive" style="opacity: 0.85; color: black;"> -->
                    </div>
                   
                    
                    <c:if test="${loop.count%4 == 0}">
                    </div>
                    </c:if>
                </c:forEach>
            </div>
        </div>
                
        <div id="signup" class="modal">
		  <form class="modal-content" method="post">

              <div class="ti">Sign Up</div><br>
              <label for="name"><b>Name</b></label>
			 <input type="text" class="box" name="name" required>
			 <label for="email"><b>Email</b></label>
			 <input type="email" class="box" name="email" oninput="checkemail(this)" required>
			 <label for="pass"><b>Password</b></label>
			 <input class="box" type="password" name="password" id="password" required>
			 <label for="repass"><b>Repeat Password</b></label>
			 <input class="box" type="password"  name="repassword" id="repassword" oninput="checkpassword(this)" required >
             <script language='javascript' type='text/javascript'>
            function checkpassword(input)
            {
                if (input.value != document.getElementById('password').value)
                {
                    input.setCustomValidity('Password must match!');
                }
                else
                {
                    input.setCustomValidity('');
                }
            }
            function checkemail(input)
            {
                if(input.validity.typeMismatch)
                {
                    input.setCustomValidity('Something is wrong with Email id!');
                }
                else
                {
                    input.setCustomValidity('');
                }
            }
            </script>
            <label for="address"><b>Address</b></label><br>
            <textarea rows="5" class="box"  name="address" required></textarea>
            <button type="button" onclick="cs()" class="but">Cancel</button>
            <button type="submit" class="but">Sign Up</button>
                      </div>
		  </form>
		</div>

    </body>
</html>
