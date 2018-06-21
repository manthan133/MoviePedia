<%-- 
    Document   : profile
    Created on : 15-Jun-2018, 10:38:17
    Author     : Manthan's
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>  

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

        
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.1.3/Chart.bundle.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">

  <link rel='stylesheet prefetch' href='https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.6.0/slick.min.css'>

<link href="css/slideshow.css" rel="stylesheet" type="text/css" media="all" />        <title>My Profile</title>
    </head>
    <body style="background-color:#f2dede">
        <sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"  
        url="jdbc:mysql://localhost:3306/moviepedia?zeroDateTimeBehavior=convertToNull"  
        user="root"  password=""/>  
        
        <sql:query dataSource="${db}" var="rs">  
            select * from user where username=?;
            <sql:param value="manthan@gmail.com" />  
        </sql:query>
        <div class="container" style="background-color:#f2dede; width: 100%; height: 100%">       
            <div class="row" >
                <div class="col-4" style="background-color:#008cba;position: fixed; height: 660px ; box-shadow: 5px 10px 18px #0c3846f2;margin-left: 10px;margin-top: 10px;margin-right: 20px ;border: px;border-color: blue;  ">
                         <c:forEach var="user" items="${rs.rows}" varStatus="loop" >
                            <img src="<c:url value="${user.profile_pic}"/>" class="img img-circle" height="200" width="200"/>
                            Welcome, <b>${user.uname}</b>
                        
                            <div class="card">
                            <img class="card-img-top" src="<c:url value="${user.profile_pic}"/>" alt="Card image cap">
                            <div class="card-block little-profile text-center">
                                <!--<div class="pro-img"><img src="/background/profile-pic.jpg" alt="user"></div>-->
                                <h3 class="m-b-0">Angela Dominic</h3>
                                <p>Web Designer &amp; Developer</p>
                                <a href="javascript:void(0)" class="m-t-10 waves-effect waves-dark btn btn-primary btn-md btn-rounded">Follow</a>
                                <div class="row text-center m-t-20" >
                                    <div class="col-lg-4 col-md-4 m-t-20">
                                        <h3 class="m-b-0 font-light">1099</h3><small>Articles</small></div>
                                    <div class="col-lg-4 col-md-4 m-t-20">
                                        <h3 class="m-b-0 font-light">23,469</h3><small>Followers</small></div>
                                    <div class="col-lg-4 col-md-4 m-t-20">
                                        <h3 class="m-b-0 font-light">6035</h3><small>Following</small></div>
                                </div>
                            </div>
                        </div>
                            </c:forEach>
                        
                    
                </div>
                
<!--                    query for genre -->
                    <sql:query dataSource="${db}" var="rsgenre">  
                    select gname,count(gname) as score,gcolor from movie natural join genre natural join movie_genre natural join ratings_review natural join user where uid=? group by gname; 
                    <sql:param value="3" />  
                    </sql:query>
                    <sql:query dataSource="${db}" var="rssum">  
                    select count(gname) as total from movie natural join genre natural join movie_genre natural join ratings_review natural join user where uid=? ;
                    <sql:param value="3" />  
                    </sql:query>
                    
                    <div class="col-3" >

                    <div class="container" style=" background-color: #f5acacb0; margin-left: 357px; margin-top: 10px; margin-right: 20px ; border: 2px; ">
                          <div id="canvas-holder" style="width:75%">
                            <canvas id="chart-area" />
                          </div>         
                    </div>
                                         </div>
        
            </div>
        </div>
         
            
            
            
    <script>
        
var ctx = document.getElementById("chart-area").getContext("2d");
var mychart = new Chart(ctx,   {
  type: 'doughnut',
  data: {
    datasets: [{
      data: [
          
        <c:forEach var="score" items="${rssum.rows}" varStatus="loop" ><c:forEach var="genre" items="${rsgenre.rows}" varStatus="loop" >${ (genre.score / score.total)*100 },</c:forEach></c:forEach>
      ],
      backgroundColor: [
        <c:forEach var="genre" items="${rsgenre.rows}" varStatus="loop" >"${genre.gcolor}",</c:forEach>
      ],
      label: 'Expenditures'
    }],
    labels: [
     <c:forEach var="genre" items="${rsgenre.rows}" varStatus="loop" >"${genre.gname}",</c:forEach>
    ]
  },
  options: {
    responsive: true,
    legend: {
      position: 'bottom'
    },
    title: {
      display: true,
      text: 'your genre chart(in %)'
    },
    animation: {
      animateScale: true,
      animateRotate: true
    }
    
  }
}
);


    </script>
    
       <!--Movies you may like-->
            <sql:query dataSource="${db}" var="rspic">  
                select distinct mid,mname,image from movie natural join movie_genre where gid in   
                (select gid from movie_genre  natural join ratings_review where uid=? group by gid order by count(gid) desc)
                and  mid not in (select distinct mid from movie_genre natural join ratings_review where uid=? );
                <sql:param value="3" />
                <sql:param value="3" />
            </sql:query>
            
        <div class="section section-project">
  <div class="project-carousel">
    <div class="project-strip">
    <c:forEach var="table" items="${rspic.rows}" varStatus="loop">
        <div class="project"><img src="<c:url value="${table.image}"/>" alt=""/></div>
    </c:forEach>
    </div>
    <div class="project-screen">
      <div class="project-detail">
    <c:forEach var="table" items="${rspic.rows}" varStatus="loop">
        <div class="project"><img src="<c:url value="${table.image}"/>" alt=""/></div>
    </c:forEach>    </div>
      <div class="screen-frame"></div>
    </div>
  </div>
</div>
  <script src='https://code.jquery.com/jquery-2.2.4.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.6.0/slick.min.js'></script>

    <script src="js/slideshow.js"></script>
         
    </body>
</html>
