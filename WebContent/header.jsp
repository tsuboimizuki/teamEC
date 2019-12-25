<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s"  uri="/struts-tags" %>
<header>
	<ul>
		<li>
			<div class="rogo">Django</div>
		</li>
		<li>
			<s:form action="SearchItemAction">
				<s:if test='#session.mCategoryDTOList!=null && #session.mCategoryDTOList.size()>0'>
					<s:select name="categoryId" list="#session.mCategoryDTOList" listValue="categoryName" listKey="categoryId" class="cs-div" id="categoryId"/>
				</s:if>
				<s:textfield name="keywords" class="txt-keywords" placeholder="検索ワード" />
				<s:submit value="商品検索" class="submit_btn" />
			</s:form>
		</li>
	<!-- ログイン状態 -->
	<s:if test="#session.loginFlg==1">
		<li>
			<s:form action="LogoutAction">
				<s:submit value="ログアウト" class="submit_btn"/>
			</s:form>
		</li>
		<li>
			<s:form action="CartAction">
				<s:submit value="カート" class="submit_btn"/>
			</s:form>
		</li>
		<li>
			<s:form action="MyPageAction">
				<s:submit value="マイページ" class="submit_btn"/>
			</s:form>
		</li>
	</s:if>
	<!-- ログアウト状態 -->
	<s:elseif test="#session.loginFlg==0">
		<li>
			<s:form action="GoLoginAction">
				<s:submit value="ログイン" class="submit_btn"/>
			</s:form>
		</li>
		<li>
			<s:form action="CartAction">
				<s:submit value="カート" class="submit_btn"/>
			</s:form>
		</li>
	</s:elseif>
	</ul>
</header>
