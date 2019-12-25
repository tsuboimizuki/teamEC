package com.internousdev.django.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.django.dao.CartInfoDAO;
import com.internousdev.django.dto.CartInfoDTO;
import com.opensymphony.xwork2.ActionSupport;

public class AddCartAction extends ActionSupport implements SessionAware {

	private Map<String, Object>session;
	private String userId;//ユーザーID
	private int productId;//商品ID
	private int productCount;//商品個数
	private String checkProduct;
	private int totalPrice;
	List<CartInfoDTO> cartInfoDTOList = new ArrayList<CartInfoDTO>();

	public String execute() {

		//searchActionから取得
		if (!session.containsKey("kariUserId") && !session.containsKey("userId")) {
			return "sessionTimeout";
		}

		String result = ERROR;

		if (String.valueOf(session.get("loginFlg")).equals("1")) {
			userId = session.get("userId").toString();
		} else if (session.containsKey("kariUserId")) {
			userId = session.get("kariUserId").toString();
		}

		CartInfoDAO cartInfoDAO = new CartInfoDAO();
		int count = 0;

		if (cartInfoDAO.checkProduct(userId, productId)) {
			count = cartInfoDAO.updateProduct(userId, productId, productCount);
		} else {
			count = cartInfoDAO.addProduct(userId, productId, productCount);
		}

		if (count > 0) {
			cartInfoDTOList = cartInfoDAO.getCartList(userId);
			totalPrice = cartInfoDAO.getTotalPrice(userId);
			return SUCCESS;
		}
		return result;
	}

	public String getUserId() {
	    return userId;
	}

	public void setUserId(String userId) {
	    this.userId = userId;
	}

	public int getProductId() {
	    return productId;
	}

	public void setProductId(int productId) {
	    this.productId = productId;
	}

	public int getProductCount() {
	    return productCount;
	}

	public void setProductCount(int productCount) {
	    this.productCount = productCount;
	}

	public String getCheckProduct() {
		return checkProduct;
	}

	public void setCheckProduct(String checkProduct) {
		this.checkProduct = checkProduct;
	}

	public List<CartInfoDTO> getCartInfoDTOList() {
	    return cartInfoDTOList;
	}

	public void setCartInfoDTOList(List<CartInfoDTO> cartInfoDTOList) {
	    this.cartInfoDTOList = cartInfoDTOList;
	}

	public Map<String, Object> getSession(){
		return this.session;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
}