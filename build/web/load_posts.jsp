<%@page import="com.tech.blog.entities.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>

<div class="row">
    <%
        PostDao dao = new PostDao(ConnectionProvider.getConnection());
        int cid = Integer.parseInt(request.getParameter("cid"));
        List<Post> list=null;
        if(cid == 0){
          list = dao.getAllPosts();
        }else{
            list = dao.getPostByCatId(cid);
        }
        if(list.size() == 0){
        out.println("<h5 class='display-4 text-center'>No Post in this category.. </h5>");
        }
        for (Post p : list) {
    %>
    <div class="col-md-6 mt-2">
        
        <div class="card">
            <img class="card-img-top" src="blog_pics/<%=p.getpPic() %>" alt="Card image cap">
            <div class="card-body">
                <b> <%= p.getPtitle() %> </b>
                <p> <%= p.getPcontent() %> </p>
            </div>
            
            <div class="card-footer secondary-background text-center">
                <a href="show_blog_page.jsp?post_id=<%= p.getPid() %>" class="btn btn-outline-light btn-sm">Read More.. </a> 
            </div>
        </div>
    </div>
    

    <% }%>

</div>