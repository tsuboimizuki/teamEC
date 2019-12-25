package com.internousdev.django.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.django.dao.MCategoryDAO;
import com.internousdev.django.dto.MCategoryDTO;
import com.internousdev.django.util.CommonUtility;
import com.opensymphony.xwork2.ActionSupport;

public class HomeAction extends ActionSupport implements SessionAware {

	private Map<String, Object> session;

	public String execute() {

		if (!session.containsKey("loginFlg")) {
			session.put("loginFlg", 0);
		}

		String kariLoginFlg = String.valueOf(session.get("loginFlg"));
		int loginFlg = "null".equals(kariLoginFlg) ? 0 : Integer.parseInt(kariLoginFlg);
		if (!session.containsKey("kariUserId") && loginFlg == 0) {
			CommonUtility commonUtility = new CommonUtility();
			session.put("kariUserId", commonUtility.getRamdomValue());
		}

		if (!session.containsKey("mCategoryDTOList")) {
			List<MCategoryDTO> mCategoryDTOList = new ArrayList<MCategoryDTO>();
			MCategoryDAO mCategoryDAO = new MCategoryDAO();
			mCategoryDTOList = mCategoryDAO.getMCategoryInfo();

			session.put("mCategoryDTOList", mCategoryDTOList);
		}
		return SUCCESS;
	}

	public Map<String, Object> getsession() {
		return session;
	}
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
}