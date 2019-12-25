package com.internousdev.django.action;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.django.dao.ProductInfoDAO;
import com.internousdev.django.dto.ProductInfoDTO;
import com.opensymphony.xwork2.ActionSupport;

public class ProductDetailsAction extends ActionSupport implements SessionAware {

	private String productId;//商品ID
	private List<Integer> productCountList;//購入個数リスト
	private List<ProductInfoDTO> relatedProductList;//関連商品リスト
	private ProductInfoDTO productInfoDTO;
	private String setErrorMessage;//エラーメッセージ
	ProductInfoDAO productInfoDAO = new ProductInfoDAO();
	private Map<String, Object> session;

	public String execute()throws SQLException {

		//System.out.println("productID:" + productId);
		ProductInfoDAO productInfoDAO = new ProductInfoDAO();
		productInfoDTO = productInfoDAO.getProductInfo(productId);
		//System.out.println("dto.productID:" + productInfoDTO.getProductId());

		if (productInfoDTO.getProductId() == 0) {
				productInfoDTO = null;
		} else {
			//購入個数のリストを作成
			productCountList = new ArrayList<Integer>();
			for (int i = 1; i <= 5; i++) {
				productCountList.add(i);
			}
			//関連商品の探索
			relatedProductList = productInfoDAO.getRelatedProductList(productInfoDTO.getProductCategoryId(), productInfoDTO.getProductId(), 0, 3);

			//画像のファイルパス取得確認用
			/*for (ProductInfoDTO productInfoDTO : relatedProductList){
				System.out.println("dto.productImageFilePath"+productInfoDTO.getProductImageFilePath());
			}*/
		}
		return SUCCESS;
	}

	public String getSetErrorMessage() {
		return setErrorMessage;
	}

	public void setSetErrorMessage(String setErrorMessage) {
		this.setErrorMessage = setErrorMessage;
	}

	public Map<String,Object> getSession() {
	    return session;
	}

	public void setSession(Map<String,Object> session) {
	    this.session = session;
	}

	public List<ProductInfoDTO> getRelatedProductList() {
		return relatedProductList;
	}

	public void setRelatedProductList(List<ProductInfoDTO> relatedProductList) {
		this.relatedProductList = relatedProductList;
	}
	
	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public List<Integer> getProductCountList() {
		return productCountList;
	}

	public void setProductCountList(List<Integer> productCountList) {
		this.productCountList = productCountList;
	}

	public ProductInfoDTO getProductInfoDTO() {
		return productInfoDTO;
	}

	public void setProductInfoDTO(ProductInfoDTO productInfoDTO) {
		this.productInfoDTO = productInfoDTO;
	}
}