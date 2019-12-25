<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s"  uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset=UTF-8>
	<link rel="stylesheet" href="./css/style.css">
	<title>productDetails</title>
</head>
<body>
	<jsp:include page="header.jsp"/>
	<div id="main">
		<h1>商品詳細画面</h1>
		<s:if test="productInfoDTO!=null">
			<s:form action="AddCartAction">
			<div class="column-container">
				<div class="left">
					<img src='<s:property value="productInfoDTO.productImageFilePath"/>/<s:property value="productInfoDTO.productImageFileName"/>'width="50px" height="50px" class="item-image-box-320"/><br>
				</div>
				<div class="right">
					<table class="vertical-list-table-mini">
						<tr>
							<th scope="row"><s:label value="商品名"/></th>
							<td><s:property value="productInfoDTO.productName"/></td>
						</tr>
						<tr>
							<th scope="row"><s:label value="商品名ふりがな"/></th>
							<td><s:property value="productInfoDTO.productNameKana"/></td>
						</tr>
						<tr>
							<th scope="row"><s:label value="値段"/></th>
							<td><s:property value="productInfoDTO.productPrice"/>円</td>
						</tr>
						<tr>
							<th scope="row"><s:label value="購入個数"/></th>
							<td><s:select name="productCount" list="%{productCountList}"/>個</td>
						</tr>
						<tr>
							<th scope="row"><s:label value="発売会社名"/></th>
							<td><s:property value="productInfoDTO.productReleaseCompany"/></td>
						</tr>
						<tr>
							<th scope="row"><s:label value="発売年月日"/></th>
							<td><s:property value="productInfoDTO.productReleaseDate"/></td>
						</tr>
						<tr>
							<th scope="row"><s:label value="商品詳細情報"/></th>
							<td><s:property value="productInfoDTO.productDescription"/></td>
						</tr>
					</table>
					<s:hidden name="productId" value="%{productInfoDTO.productId}"/>
					<div class="submit_btn_box">
						<s:submit class="submit_btn" value="カートに追加"/>
					</div>
				</div>
			</div>
			</s:form>

		<s:if test="relatedProductList!=null && relatedProductList.size()>0">
			<div class="product-details-recommend-box">
				<h2>【関連商品】</h2>
				<s:iterator value="relatedProductList">
				<div class="recommend-box">
					<a href='<s:url action="ProductDetailsAction">
						<s:param name="productId" value="%{productId}"/>
						</s:url>'><img src='<s:property value="productImageFilePath"/>/<s:property value="productImageFileName"/>' class="item-image-box-100"/><br>
						<s:property value="productName"/><br>
					</a>
				</div>
				</s:iterator>
			</div>
		</s:if>
	</s:if>

	<s:else>
		<div class="messageResult">
		商品の詳細情報がありません。
		</div>
	</s:else>
	</div>
</body>
</html>