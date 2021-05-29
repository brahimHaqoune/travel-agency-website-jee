package com.beans;

import java.util.ArrayList;


public class Travel {
	private int id;
	private String destination;
	private String type;
	private String date;
	private String duree;
	private String prix;
	private String theme;
	private String heberg;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getDestination() {
		return destination;
	}
	public void setDestination(String destination) {
		this.destination = destination;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getDuree() {
		return duree;
	}
	public void setDuree(String duree) {
		this.duree = duree;
	}
	public String getPrix() {
		return prix;
	}
	public void setPrix(String prix) {
		this.prix = prix;
	}
	public String getTheme() {
		return theme;
	}
	public void setTheme(String theme) {
		this.theme = theme;
	}
	public String getHeberg() {
		return heberg;
	}
	public void setHeberg(String heberg) {
		this.heberg = heberg;
	}
	
	
	public boolean check(ArrayList<String> cartlist, String id2) {
		for(String id : cartlist) {
			if(id.equals(id2))
				return true;
		}
		return false;
	}
	public ArrayList<String> remove(ArrayList<String> cartlist, String id) {
		for(String cid : cartlist) {
			if(cid.equals(id)) {
				cartlist.remove(cid);
				break;
			}
				
		}
		
		return cartlist;
	}
			
}
