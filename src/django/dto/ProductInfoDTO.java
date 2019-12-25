package com.internousdev.django.dto;

import java.util.Date;

public class ProductInfoDTO {

	// フィールド
	private int id;// ID
	private int productId;// 商品ID
	private String productName;// 商品名
	private String productNameKana;// 商品名のふりがな
	private String productDescription;// 商品詳細情報
	private String productImageFileName;// 商品画像名
	private String productImageFilePath;// 商品画像パス
	private int productPrice;// 値段
	private int productCategoryId;// カテゴリーID
	private String productReleaseCompany;
	private Date productReleaseDate;// 発売年月日

	// getterとsetter
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductNameKana() {
		return productNameKana;
	}

	public void setProductNameKana(String productNameKana) {
		this.productNameKana = productNameKana;
	}

	public String getProductImageFileName() {
		return productImageFileName;
	}

	public void setProductImageFileName(String productImageFileName) {
		this.productImageFileName = productImageFileName;
	}

	public String getProductImageFilePath() {
		return productImageFilePath;
	}

	public void setProductImageFilePath(String productImageFilePath) {
		this.productImageFilePath = productImageFilePath;
	}

	public int getProductCategoryId() {
		return productCategoryId;
	}

	public void setProductCategoryId(int productCategoryId) {
		this.productCategoryId = productCategoryId;
	}

	public int getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}

	public String getProductReleaseCompany() {
		return productReleaseCompany;
	}

	public void setProductReleaseCompany(String productReleaseCompany) {
		this.productReleaseCompany = productReleaseCompany;
	}

	public String getProductDescription() {
		return productDescription;
	}

	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}

	public Date getProductReleaseDate() {
		return productReleaseDate;
	}

	public void setProductReleaseDate(Date productReleaseDate) {
		this.productReleaseDate = productReleaseDate;
	}
}