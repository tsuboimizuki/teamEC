package com.internousdev.django.dto;

public class MCategoryDTO {

	//フィールド
	private int id;
	private int categoryId;
	private String categoryName;

	//getterとsetter
	public int  getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public int getCategoryId() {
		return categoryId;
	}
	
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	
	public String getCategoryName() {
		return categoryName;
	}
	
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
}
