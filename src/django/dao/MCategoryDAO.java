package com.internousdev.django.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.internousdev.django.dto.MCategoryDTO;
import com.internousdev.django.util.DBConnector;;
public class MCategoryDAO {

	public List <MCategoryDTO> getMCategoryInfo() {

		DBConnector db = new DBConnector();
		Connection con = db.getConnection();
		List<MCategoryDTO> mCategoryDTOList = new ArrayList<MCategoryDTO>();

		String sql = "SELECT * FROM m_category";

		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				MCategoryDTO mCategoryDTO = new MCategoryDTO();
				mCategoryDTO.setId(rs.getInt("id"));
				mCategoryDTO.setCategoryId(rs.getInt("category_id"));
				mCategoryDTO.setCategoryName(rs.getString("category_name"));
				mCategoryDTOList.add(mCategoryDTO);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
		return mCategoryDTOList;
	}
}
