package com.tech.blog.entities;

import java.sql.*;

public class Post {

    private int pid;
    private String ptitle;
    private String pcontent;
    private String pCode;
    private String pPic;
    private Timestamp pDate;
    private int catId;

    public Post() {
    }

    public Post(int pid, String ptitle, String pcontent, String pCode, String pPic, Timestamp pDate, int catId) {
        this.pid = pid;
        this.ptitle = ptitle;
        this.pcontent = pcontent;
        this.pCode = pCode;
        this.pPic = pPic;
        this.pDate = pDate;
        this.catId = catId;
    }

    public Post(String ptitle, String pcontent, String pCode, String pPic, Timestamp pDate, int catId) {
        this.ptitle = ptitle;
        this.pcontent = pcontent;
        this.pCode = pCode;
        this.pPic = pPic;
        this.pDate = pDate;
        this.catId = catId;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getPtitle() {
        return ptitle;
    }

    public void setPtitle(String ptitle) {
        this.ptitle = ptitle;
    }

    public String getPcontent() {
        return pcontent;
    }

    public void setPcontent(String pcontent) {
        this.pcontent = pcontent;
    }

    public String getpCode() {
        return pCode;
    }

    public void setpCode(String pCode) {
        this.pCode = pCode;
    }

    public String getpPic() {
        return pPic;
    }

    public void setpPic(String pPic) {
        this.pPic = pPic;
    }

    public Timestamp getpDate() {
        return pDate;
    }

    public void setpDate(Timestamp pDate) {
        this.pDate = pDate;
    }

    public int getCatId() {
        return catId;
    }

    public void setCatId(int catId) {
        this.catId = catId;
    }
    

}
