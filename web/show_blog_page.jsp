<%@page import="java.text.DateFormat"%>
<%@page import="com.tech.blog.dao.UserDao"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page errorPage="error_page.jsp" %>

<%
    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("login.jsp");
    }
%>
<%
    int postId = Integer.parseInt(request.getParameter("post_id"));
    PostDao dao = new PostDao(ConnectionProvider.getConnection());
    Post p = dao.getPostByPostId(postId);


%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= p.getPtitle()%></title>
        <!--css -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .primary-background{
                background: #E7717D !important;
            }

            .secondary-background{
                background: #7E685A !important;
            }


            .banner-background{
                clip-path: polygon(100% 0, 100% 86%, 0 100%, 0 0);
            }

            .post-title{
                font-weight: 100;
                font-size: 30px;
            }
            .post-title{
                font-weight: 100;
                font-size: 25px;
            }

            .post-date{
                font-style: italic;
                font-weight: bold;
            }

            .post-user-info{
                font-size: 20px;
            }
            .row-user{
                border: 1px solid #e2e2e2;
                padding-top: 15px;
            }
        </style>
    </head>
    <body>
        <div class=""container">

            <div class="row my-4">

                <div class="col-md-6 offset-md-3">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="post-title"><%= p.getPtitle()%></h4>
                        </div>
                        <div class="card-body">
                            <img class="card-img-top mt-2 md-2" src="blog_pics/<%= p.getpPic()%>" alt="Card image cap">
                            <div class="row my-3 row-user">
                                <div class="col-md-9">
                                    <p class="post-user-info">  
                                        <%
                                            UserDao userdao = new UserDao(ConnectionProvider.getConnection());
                                        %>
                                        <a href="#!">
                                            <%=userdao.getUserByUserId(p.getUserId()).getName()%>
                                        </a> has posted</p>
                                </div>
                                <div class="col-md-3">
                                    <p class="post-date">
                                        <%= DateFormat.getDateTimeInstance().format(p.getpDate())%>
                                    </p>

                                </div>
                            </div>
                            <p class="post-content"><%= p.getPcontent()%></p>
                            <br>
                            <br>
                            <div class="post-code">
                                <pre><%= p.getpCode()%></pre>
                            </div>
                        </div>
                        <div class="card-footer text-center">
                            <a href="profile.jsp" class="btn btn-outline-light secondary-background">Back to profile</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
