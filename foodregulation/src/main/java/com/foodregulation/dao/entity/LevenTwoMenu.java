package com.foodregulation.dao.entity;

import java.io.Serializable;
import java.util.List;


public class LevenTwoMenu implements Serializable {

    /**
     * 
     */
    private static final long serialVersionUID = -5639032241388682207L;

    private String id;

    private String name;

    private String url;

    private List<levenThreeMenu> levenThreeMenu;


    public String getId() {
        return id;
    }


    public void setId(String id) {
        this.id = id;
    }


    public String getName() {
        return name;
    }


    public void setName(String name) {
        this.name = name;
    }


    public String getUrl() {
        return url;
    }


    public void setUrl(String url) {
        this.url = url;
    }



    public List<levenThreeMenu> getLevenThreeMenu() {
        return levenThreeMenu;
    }



    public void setLevenThreeMenu(List<levenThreeMenu> levenThreeMenu) {
        this.levenThreeMenu = levenThreeMenu;
    }




}
