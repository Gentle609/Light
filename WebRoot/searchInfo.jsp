<%-- <%@page import="sun.net.www.content.text.plain"%> --%>
<%@page import="entity.Product"%>
<%@page import="java.util.List"%>
<%@page import="dao.ProductDao"%>
<%@page import="factory.ProductDaoFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	ProductDao pdi = ProductDaoFactory.getInstance();
	List<Product> pList = pdi.list();
	List<Product> productList = (List<Product>)session.getAttribute("productList");
	if(productList!=null){
		pList=productList;
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>搜索商品</title>
<style type="text/css">
#searchIn {
	margin: 0;
	padding: 0;
	text-align: center;
	font-size: 18px;
}

#searchIn .text {
	margin: 0px auto;
}

#searchIn .search {
	height: 40px;
	vertical-align: middle;
	border: 1px solid #ABABAB;
	border-right: none;
	/*设圆角：左上角、右上角、右下角、左下角  */
	border-radius: 10px 0px 0px 10px;
	text-align: center;
	font-size: 18px;
}

/* #searchIn a {
	color: #ABABAB;
} */
#searchIn .imgs:hover {
	
}

#searchIn .imgs {
	width: 40px;
	height: 40px;
	background: white;
	border-radius: 0px 10px 10px 0px;
	margin-left: 0px;
	border: 1px solid #ABABAB;
	border-left: none;
	margin-bottom: 0px;
	vertical-align: middle;
	margin-bottom: 0px
}
</style>
<script type="text/javascript">
	function myhref() {
		var topage = document.getElementById("topage").value;

		if (!isNaN(topage) && topage.length > 0) {

			window.location.href = "search.jsp?page=" + topage;
		} else {
			//alert(topage+"zheli");
			window.location.href = "search.jsp?page=1";
		}
	}
</script>
</head>
<body>
	<div id="searchIn">
		<!-- input标签和img标签中间不加空格即可连接到一起，超链接传递参数并提交到servlet，调用js的outPut方法-->
		<div class="text">
			<input type="text" name="search" class="search"
				placeholder="请输入关键字搜索"><a href="javascript:"
				onClick="outPut();"><img src="images/search.png" class="imgs"
				id="imgs" onmouseover='src="images/search1.png"'
				onmouseout='src="images/search.png"'></a>
		</div>
		<%
		int all=0;//总记录数
		int pageCount=4;//没有显示的记录数
		int pageTotal=0;//总页数
		int curPage=1;//当前页
		if(pList!=null){
			all=pList.size();
			pageTotal=(all%pageCount)==0?all/pageCount:(all/pageCount+1);
			String strCurPage=request.getParameter("page");
			if(strCurPage!=null){
				curPage=Integer.parseInt(strCurPage);
			}
			int start=(curPage-1)*pageCount;
			int end=curPage*pageCount>all?all:curPage*pageCount;
				for (int i = start; i < end; i++) {
					Product p = pList.get(i);
		%>
		<ul class="lie">
			<li><a href="product_detail.jsp?id=<%=p.getpId() %>"><img src="<%=p.getPicture()%>"
					width=192px height=192px style="text-align: center" /></a></li>
			<li class="name"><a href="product_detail.jsp?id=<%=p.getpId() %>"><%=p.getpName()%></a></li>
			<li class="Ad"><%=p.getAd()%></li>
			<li class="price">￥<%=(int) p.getPrice()%></li>
		</ul>
		<%
			}
			}
		%>
	</div>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td height="29"><table width="100%" border="0" cellspacing="0"
					cellpadding="0">
					<tr>
						<td><table width="100%" border="0" cellspacing="0"
								cellpadding="0">
								<tr>
									<td width="50%" height="29" nowrap="nowrap" align="right"><span
										class="STYLE1">共<%=all%>条纪录，当前第<%=curPage%>/<%=pageTotal%>页，每页<%=pageCount%>条纪录
									</span></td>
									<td width="50%" valign="top" class="STYLE1"><div
											align="left">
											<table width="352" height="20" border="0" cellpadding="0"
												cellspacing="0">
												<tr>
													<td width="62" height="22" valign="middle"><div
															align="right">
															<a href="search.jsp?page=1"><img
																src="images/tab/first.gif" width="37" height="15" /></a>
														</div></td>
													<td width="50" height="22" valign="middle"><div
															align="right">
															<a
																href="search.jsp?page=<%=curPage - 1 > 0 ? curPage - 1 : 1%>"><img
																src="images/tab/back.gif" width="43" height="15" /></a>
														</div></td>
													<td width="54" height="22" valign="middle"><div
															align="right">
															<a
																href="search.jsp?page=<%=curPage + 1 < pageTotal ? curPage + 1 : pageTotal%>"><img
																src="images/tab/next.gif" width="43" height="15" /></a>
														</div></td>
													<td width="49" height="22" valign="middle"><div
															align="right">
															<a href="search.jsp?page=<%=pageTotal%>"><img
																src="images/tab/last.gif" width="37" height="15" /></a>
														</div></td>
													<td width="59" height="22" valign="middle"><div
															align="right">转到第</div></td>
													<td width="25" height="22" valign="middle"><span
														class="STYLE7"> <input name="topage" id="topage"
															type="text" class="STYLE1"
															style="height: 10px; width: 25px;" size="5" />
													</span></td>
													<td width="23" height="22" valign="middle">页</td>
													<td width="30" height="22" valign="middle"><img
														src="images/tab/go.gif" width="37" height="15"
														onClick="myhref()" /></td>
												</tr>
											</table></div></td>
								</tr>
							</table></td>
					</tr>
				</table></td>
		</tr>
	</table>
	<script type="text/javascript">
		function outPut() {
			var obj1 = document.getElementsByName("search")[0].value;
			document.location.href = "FindProductServlet?search=" + obj1;
		}
	</script>
</body>
</html>