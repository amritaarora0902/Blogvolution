package com.tech.blog.servlets;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@MultipartConfig
public class RegisterServlet extends HttpServlet {

    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
          
            //fetch all form data
            String check = request.getParameter("check");
            if(check == null){
                out.println("Check the terms & condition");
            }else{
                String name = request.getParameter("user_name");
                String email = request.getParameter("user_email");
                String password = request.getParameter("user_password");
                String gender = request.getParameter("gender");
                String about = request.getParameter("about");
                //create user object and store data to that object
                User user = new User(name,email,password,gender,about);
                //create UserDao object to insert data
                UserDao dao = new UserDao(ConnectionProvider.getConnection());
                if(dao.saveUser(user)){
                    //save..
                    out.println("done");
                }else{
                    out.println("error");
                }
            }
        }
    }

    

}
