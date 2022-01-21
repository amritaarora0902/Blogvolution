<%@page import="com.tech.blog.entities.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.Message"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page errorPage="error_page.jsp" %>
<%
    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("login.jsp");
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile Page</title>
        <!--css -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="./css/mystyle.css">

    </head>
    <body>
        <!-- Navbar  -->
        <nav class="navbar navbar-expand-lg navbar-dark primary-background">
            <a class="navbar-brand" href="index.jsp"><span class="fa fa-asterisk fa-fw "></span>TechBlog</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="#"><span class="fa fa-pencil-square-o fa-fw"></span>Blogvolution<span class="sr-only">(current)</span></a>
                    </li>

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="fa fa-plus fa-fw "></span>Categories
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#">Programming Language</a>
                            <a class="dropdown-item" href="#">Project Implementation</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Data Structure</a>
                        </div>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="#"><span class="fa fa-address-book fa-fw "></span>Contact</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#" data-toggle="modal" data-target="#add-post-modal"><span class="fa fa-pencil-square"></span>New Blog</a>
                    </li>

                </ul>

                <ul class="navbar-nav mr-right">
                    <li class="nav-item">
                        <a class="nav-link" href="#!" data-toggle="modal" data-target="#profile-modal"><span class="fa fa-user-circle fa-fw "></span><%= user.getName()%></a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="LogoutServlet"><span class="fa fa-user-plus fa-fw "></span>Logout</a>
                    </li>
                </ul>
            </div>
        </nav>
        <%
            Message m = (Message) session.getAttribute("message");
            if (m != null) {
        %>
        <div class="alert <%= m.getCssClass()%>" role="alert">
            <%= m.getContent()%>
        </div>
        <%
                session.removeAttribute("message");
            }

        %>

        <!-- Profile modal -->

        <!-- Modal -->
        <div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header secondary-background text-white text-white">
                        <h5 class="modal-title" id="exampleModalLabel">BlogVolution</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="container text-center">
                            <img src="pics/<%= user.getProfile()%>" class="img-fluid" style="border-radius: 50%; max-width: 150px;" />
                            <br>
                            <h5 class="modal-title mt-3" id="exampleModalLabel"><%= user.getName()%></h5>

                            <!-- details -->
                            <div id="profile-details">
                                <table class="table">

                                    <tbody>
                                        <tr>
                                            <th scope="row">ID:</th>
                                            <td><%= user.getId()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Email: </th>
                                            <td><%= user.getEmail()%> </td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Gender:</th>
                                            <td><%= user.getGender()%></td>

                                        </tr>

                                        <tr>
                                            <th scope="row">About:</th>
                                            <td><%= user.getAbout()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Registered on:</th>
                                            <td><%= user.getDateTime().toString()%></td>

                                        </tr>
                                    </tbody>
                                </table>
                            </div>

                            <!-- profile-edit -->
                            <div id="profile-edit" style="display: none;">
                                <h6 class="mt-2">Please edit carefully!</h6>
                                <form action="EditServlet" method="post" enctype="multipart/form-data">
                                    <table class="table">
                                        <tr>
                                            <td>Id: </td>
                                            <td><%= user.getId()%></td>
                                        </tr>
                                        <tr>
                                            <td>Email: </td>
                                            <td>
                                                <input type="email" class="form-control" name="user_email" value="<%= user.getEmail()%>"> 
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Name: </td>
                                            <td>
                                                <input type="text" class="form-control" name="user_name" value="<%= user.getName()%>"> 
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Password: </td>
                                            <td>
                                                <input type="password" class="form-control" name="user_password" value="<%= user.getPassword()%>"> 
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Gender: </td>
                                            <td>
                                                <%= user.getGender().toUpperCase()%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>About: </td>
                                            <td>
                                                <textarea rows="3" class="form-control" name="user_about"><%= user.getAbout()%></textarea>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>New Profile: </td>
                                            <td>
                                                <input type="file" name="image" class="form-control">
                                            </td>
                                        </tr>
                                    </table>

                                    <div class="container">
                                        <button type="submit" class="btn btn-outline-primary">Save</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" id="edit-profile-button" class="btn btn-primary">Edit</button>
                    </div>
                </div>
            </div>
        </div>
        <!--  end of profile modal-->

        <!-- blog modal -->

        <div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Provide Blog Details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">

                        <form action="AddPostServlet" method="post">
                            <div class="form-group">
                                <select class="form-control">
                                    <option selected disabled>Select categories</option>
                                    <%
                                    PostDao postd = new PostDao(ConnectionProvider.getConnection());
                                    ArrayList<Category> list = postd.getAllCategories();
                                    for(Category c:list){
                                    %>
                                    <option><%= c.getName() %></option>
                                    
                                    <% } %>
                                </select>
                            </div>
                            <div class="form-group">
                                <input type="text" placeholder="Enter blog Title" class="form-control" />
                            </div>
                            <div class="form-group">
                                <textarea placeholder="Enter blog Content" class="form-control" style="height: 200px;"></textarea>
                            </div>
                            <div class="form-group">
                                <textarea placeholder="Enter Code(if any)" class="form-control" style="height: 200px;"></textarea>
                            </div>
                            <div class="form-group">
                                <input type="file" />
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary">Save changes</button>
                    </div>
                </div>
            </div>
        </div>
        <!--end of blog modal-->

        <!-- javascript-->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script>
            $(document).ready(function () {
                let editStatus = false;
                $('#edit-profile-button').click(function () {
                    if (editStatus == false) {
                        $('#profile-details').hide();
                        $('#profile-edit').show();
                        editStatus = true;
                        $(this).text("Back");
                    } else {
                        $('#profile-details').show();
                        $('#profile-edit').hide();
                        editStatus = false;
                        $(this).text("Edit");
                    }
                })
            })
        </script>
    </body>
</html>
