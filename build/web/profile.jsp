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
            
            .active{
                background-color: #C2CAD0!important;
            }          
        </style>

    </head>
    <body>
        <!-- Navbar  -->
        <nav class="navbar navbar-expand-lg navbar-dark primary-background">
            <a class="navbar-brand" href="index.jsp"><span class="fa fa-pencil-square-o fa-fw "></span>BlogVolution</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">

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

        <!--        main body of page-->

        <main>
            <div class="container">
                <div class="row mt-4">
                    <!--  first col-->
                    <div class="col-md-4">
                        <!-- categories-->
                        <div class="list-group">
                            <a href="#" onclick="getPosts(0, this)" class=" c-link list-group-item active">
                                All Blogs
                            </a>
                            <%                                PostDao dao = new PostDao(ConnectionProvider.getConnection());
                                ArrayList<Category> list1 = dao.getAllCategories();
                                for (Category c1 : list1) {
                            %>
                            <a href="#" onclick="getPosts(<%= c1.getCid()%>, this)" class="c-link list-group-item ">
                                <%= c1.getName()%>
                            </a>
                            <% }%>

                        </div>
                    </div>
                    <!-- second col-->
                    <div class="col-md-8"> 
                        <!-- posts -->
                        <div class="container text-center" id="loader">
                            <i class="fa fa-refresh fa-4x fa-spin"></i>
                            <h3 class="mt-2">Loading..</h3>
                        </div>

                        <div class="container-fluid" id="post-container">

                        </div>
                    </div>
                </div>
            </div>
        </main>

        <!--        end of main body-->


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

                        <form action="AddPostServlet" method="post" id="add-post-form">
                            <div class="form-group">
                                <select class="form-control" name="cid">
                                    <option selected disabled>Select categories</option>
                                    <%
                                        PostDao postd = new PostDao(ConnectionProvider.getConnection());
                                        ArrayList<Category> list = postd.getAllCategories();
                                        for (Category c : list) {
                                    %>
                                    <option value="<%= c.getCid()%>"><%= c.getName()%></option>

                                    <% }%>
                                </select>
                            </div>
                            <div class="form-group">
                                <input name="pTitle" type="text" placeholder="Enter blog Title" class="form-control" />
                            </div>
                            <div class="form-group">
                                <textarea name="pContent" placeholder="Enter blog Content" class="form-control" style="height: 200px;"></textarea>
                            </div>
                            <div class="form-group">
                                <textarea name="pCode" placeholder="Enter Code(if any)" class="form-control" style="height: 200px;"></textarea>
                            </div>
                            <div class="form-group">
                                <input name="pic" type="file" />
                            </div>
                            <div class="container text-center">
                                <button type="submit" class="btn primary-background">Post</button>
                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </div>
        <!--end of blog modal-->

        <!-- javascript-->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
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

        <!--        now add post js-->
        <script>
            $(document).ready(function (e) {
                $('#add-post-form').on('submit', function (event) {
                    //code when post form gets submitted
                    event.preventDefault();

                    let form = new FormData(this);

                    //now requesting to server
                    $.ajax({
                        url: "AddPostServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            if (data.trim() == 'done') {
                                swal("Good job!", "saved successfully", "success");
                            } else {
                                swal("Error", "Something went wrong!", "error");
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            swal("Error", "Something went wrong!", "error");
                        },
                        processData: false,
                        contentType: false
                    })
                })
            })

        </script>

        <!-- loading post js -->
        <script>
            function getPosts(catId, temp) {
                $("#loader").show();
                $("#post-container").hide();
                $(".c-link").removeClass('active');
                $.ajax({
                    url: "load_posts.jsp",
                    data: {cid: catId},
                    success: function (data, textStatus, jqXHR) {
                        console.log(data);
                        $("#loader").hide();
                        $("#post-container").show();
                        $("#post-container").html(data);
                        $(temp).addClass('active');
                    }
                })
            }

            $(document).ready(function (e) {
                let allPostRef = $('.c-link')[0]
                getPosts(0, allPostRef)
            })

        </script>
    </body>
</html>
