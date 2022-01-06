<%-- 
    Document   : index
    Created on : 03-Jan-2022, 3:38:42 pm
    Author     : Amrita Arora
--%>

<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!--css -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="./css/mystyle.css">
       
    </head>
    <body>

        <!--navbar -->
        <%@include file="normal_navbar.jsp" %>

        <!-- banner -->
        <%@include file="normal_banner.jsp" %>

        <!-- cards -->
        <div class="container">
            <div class="row mb-2">
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">JAVA</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn secondary-background text-white">Read More</a>
                        </div>
                    </div>
                </div>
                 <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">JAVA</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn secondary-background text-white">Read More</a>
                        </div>
                    </div>
                </div>
                 <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">JAVA</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn secondary-background text-white">Read More</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
         <div class="container">
            <div class="row mb-2">
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">JAVA</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn secondary-background text-white">Read More</a>
                        </div>
                    </div>
                </div>
                 <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">JAVA</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn secondary-background text-white">Read More</a>
                        </div>
                    </div>
                </div>
                 <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">JAVA</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn secondary-background text-white">Read More</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- javascript-->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>


    </body>
</html>
