package com.tech.blog.dao;

import com.tech.blog.entities.Category;
import com.tech.blog.entities.Post;
import java.sql.*;
import java.util.ArrayList;

public class PostDao {

    Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }

    public ArrayList<Category> getAllCategories() {
        ArrayList<Category> list = new ArrayList<>();
        try{
            String query = "select * from categories";
            Statement stmt = this.con.createStatement();
            ResultSet set = stmt.executeQuery(query);
            while(set.next()){
                int cid = set.getInt("cid");
                String name = set.getString("name");
                String description = set.getString("description");
                
                Category category = new Category(cid,name,description);
                list.add(category);
                
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }
        return list;
    }
    
    public boolean savePost(Post post){
        boolean f = false;
        try{
            String query = "insert into posts (pTitle,pContent,pCode,pPic,catId,userId) values (?,?,?,?,?,?)";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, post.getPtitle());
            pstmt.setString(2, post.getPcontent());
            pstmt.setString(3, post.getpCode());
            pstmt.setString(4, post.getpPic());
            pstmt.setInt(5, post.getCatId());
            pstmt.setInt(6, post.getUserId());
            pstmt.executeUpdate();
            f =true;
            
        }catch(Exception e){
            e.printStackTrace();
        }
        return f;
    }
}
