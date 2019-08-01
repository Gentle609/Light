<%@page import="entity.Product"%>
<%@page import="java.util.List"%>
<%@page import="factory.ProductDaoFactory"%>
<%@page import="dao.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	ProductDao pdi = ProductDaoFactory.getInstance();
	List<Product> list = pdi.list();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="renderer" content="webkit|ie-comp|ie-stand" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link href="assets/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" href="css/style.css" />
<link rel="stylesheet" href="assets/css/ace.min.css" />
<link rel="stylesheet" href="assets/css/font-awesome.min.css" />
<link rel="stylesheet" href="Widget/zTree/css/zTreeStyle/zTreeStyle.css"
	type="text/css" />
<link href="Widget/icheck/icheck.css" rel="stylesheet" type="text/css" />
<!--[if IE 7]>
		  <link rel="stylesheet" href="assets/css/font-awesome-ie7.min.css" />
		<![endif]-->
<!--[if lte IE 8]>
		  <link rel="stylesheet" href="assets/css/ace-ie.min.css" />
		<![endif]-->
<script src="js/jquery-1.9.1.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/typeahead-bs2.min.js"></script>
<!-- page specific plugin scripts -->
<script src="assets/js/jquery.dataTables.min.js"></script>
<script src="assets/js/jquery.dataTables.bootstrap.js"></script>
<script type="text/javascript" src="js/H-ui.js"></script>
<script type="text/javascript" src="js/H-ui.admin.js"></script>
<script src="assets/layer/layer.js" type="text/javascript"></script>
<script src="assets/laydate/laydate.js" type="text/javascript"></script>
<script type="text/javascript"
	src="Widget/zTree/js/jquery.ztree.all-3.5.min.js"></script>
<script src="js/lrtk.js" type="text/javascript"></script>
<title>商品列表</title>
<style type="text/css">
.page {
	float: right;
}

.page a {
	color: blue;
	background: pink;
	border: 1px solid pink;
	padding: 5px;
}

.page a:hover {
	text-decoration: none;
	background: blue;
}
</style>
</head>
<body>
	<div class=" page-content clearfix">
		<div id="products_style">
			<form action="">
				<table class="table table-striped table-bordered table-hover"
					id="sample-table">
					<thead>
						<tr>
							<th width="80px">商品编号</th>
							<th width="250px">商品名称</th>
							<th width="100px">商品类型</th>
							<th width="100px">商品价格</th>
							<th width="180px">库存</th>
							<th width="200px">操作</th>
						</tr>
					</thead>
					<tbody>
						<%
							int all = 0;//总记录数
							int pageCount = 3;//没有显示的记录数
							int pageTotal = 0;//总页数
							int curPage = 1;//当前页
							if (list != null) {
								all = list.size();
								pageTotal = (all % pageCount) == 0 ? all / pageCount : (all
										/ pageCount + 1);
								String strCurPage = request.getParameter("page");
								if (strCurPage != null) {
									curPage = Integer.parseInt(strCurPage);
								}
								int start = (curPage - 1) * pageCount;
								int end = curPage * pageCount > all ? all : curPage * pageCount;
								for (int i = start; i < end; i++) {
									Product p = list.get(i);
						%>
						<tr>
							<td width="80px"><%=p.getpCode()%></td>
							<td width="250px"><%=p.getpName()%></td>
							<td width="100px"><%=p.getType()%></td>
							<td width="100px"><%=p.getPrice()%></td>
							<td width="180px"><%=p.getNumber()%></td>
							<td class="td-manage"><a title="编辑"
								href="product-update.jsp?id=<%=p.getpId()%>" class="btn btn-xs btn-info"><i
									class="icon-edit bigger-120"></i></a> <a title="删除"
								href="../DelProductServlet?id=<%=p.getpId()%>"
								onclick="if(confirm('确实要删除此条记录吗？')) return true;else return false;"
								class="btn btn-xs btn-warning"><i
									class="icon-trash  bigger-120"></i></a></td>
						</tr>
						<%
							}
						%>
						<tr>
							<td colspan="6">
								<div style="float: left;">
									第<%=curPage%>页，共<%=pageTotal%>页
								</div>
								<div class="page">
									<a href="product-list.jsp?page=1">首页</a> <a
										href="product-list.jsp?page=<%=curPage - 1 > 0 ? curPage - 1 : 1%>">上一页</a>
									<a
										href="product-list.jsp?page=<%=curPage + 1 < pageTotal ? curPage + 1 : pageTotal%>">下一页</a>
									<a href="product-list.jsp?page=<%=pageTotal%>">尾页</a>
								</div>
							</td>
						</tr>
						<%
							}
						%>
					</tbody>
				</table>
			</form>
		</div>
	</div>
</body>
</html>