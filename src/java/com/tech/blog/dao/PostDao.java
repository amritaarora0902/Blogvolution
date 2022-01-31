package com.tech.blog.dao;

import com.tech.blog.entities.Category;
import com.tech.blog.entities.Post;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PostDao {

    Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }

    public ArrayList<Category> getAllCategories() {
        ArrayList<Category> list = new ArrayList<>();
        try {
            String query = "select * from categories";
            Statement stmt = this.con.createStatement();
            ResultSet set = stmt.executeQuery(query);
            while (set.next()) {
                int cid = set.getInt("cid");
                String name = set.getString("name");
                String description = set.getString("description");

                Category category = new Category(cid, name, description);
                list.add(category);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean savePost(Post post) {
        boolean f = false;
        try {
            String query = "insert into posts (pTitle,pContent,pCode,pPic,catId,userId) values (?,?,?,?,?,?)";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, post.getPtitle());
            pstmt.setString(2, post.getPcontent());
            pstmt.setString(3, post.getpCode());
            pstmt.setString(4, post.getpPic());
            pstmt.setInt(5, post.getCatId());
            pstmt.setInt(6, post.getUserId());
            pstmt.executeUpdate();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    //get all posts
    public List<Post> getAllPosts() {
        List<Post> list = new ArrayList<>();
        try {
            String query = "select * from posts order by pid desc";
            PreparedStatement pstmt = con.prepareStatement(query);
            ResultSet set = pstmt.executeQuery();

            while (set.next()) {
                int pid = set.getInt("pid");
                String pTitle = set.getString("pTitle");
                String pContent = set.getString("pContent");
                String pCode = set.getString("pCode");
                String pPic = set.getString("pPic");
                Timestamp pDate = set.getTimestamp("pDate");
                int catId = set.getInt("catId");
                int userId = set.getInt("userId");
                Post p = new Post(pid, pTitle, pContent, pCode, pPic, pDate, catId, userId);

                list.add(p);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    //get post by category
    public List<Post> getPostByCatId(int catId) {
        List<Post> list = new ArrayList<>();
        //fetch post by cat id
        try {
            String query = "select * from posts where catId=?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, catId);
            ResultSet set = pstmt.executeQuery();

            while (set.next()) {
                int pid = set.getInt("pid");
                String pTitle = set.getString("pTitle");
                String pContent = set.getString("pContent");
                String pCode = set.getString("pCode");
                String pPic = set.getString("pPic");
                Timestamp pDate = set.getTimestamp("pDate");
                int userId = set.getInt("userId");
                Post p = new Post(pid, pTitle, pContent, pCode, pPic, pDate, catId, userId);

                list.add(p);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
    
    //fetch post by postid
     public Post getPostByPostId(int postId) {
         Post p =null;
        try {
            String query = "select * from posts where pid=?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, postId);
            ResultSet set = pstmt.executeQuery();

            while (set.next()) {
                String pTitle = set.getString("pTitle");
                String pContent = set.getString("pContent");
                String pCode = set.getString("pCode");
                String pPic = set.getString("pPic");
                Timestamp pDate = set.getTimestamp("pDate");
                 int catId=set.getInt("catId");
                int userId = set.getInt("userId");
               
                p = new Post(postId, pTitle, pContent, pCode, pPic, pDate, catId, userId);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return p;
    }
}
