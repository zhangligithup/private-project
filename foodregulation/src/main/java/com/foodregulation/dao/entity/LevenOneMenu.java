package com.foodregulation.dao.entity;

import java.io.Serializable;
import java.util.List;


public class LevenOneMenu implements Serializable {

    /**
     * 
     */
    private static final long serialVersionUID = 8444505249890667973L;

    private String id;

    private String name;

    private String style;

    private List<LevenTwoMenu> levenTwoMenu;


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


    public List<LevenTwoMenu> getLevenTwoMenu() {
        return levenTwoMenu;
    }


    public void setLevenTwoMenu(List<LevenTwoMenu> levenTwoMenu) {
        this.levenTwoMenu = levenTwoMenu;
    }



    public String getStyle() {
        return style;
    }



    public void setStyle(String style) {
        this.style = style;
    }


}
