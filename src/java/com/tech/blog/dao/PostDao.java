package com.tech.blog.dao;

import com.tech.blog.entities.Category;
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
}
