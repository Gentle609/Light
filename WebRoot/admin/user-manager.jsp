<%@page import="entity.User"%>
<%@page import="java.util.List"%>
<%@page import="factory.UserDaoFactory"%>
<%@page import="dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="assets/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" href="css/style.css" />
<link href="assets/css/codemirror.css" rel="stylesheet" />
<link rel="stylesheet" href="assets/css/ace.min.css" />
<link rel="stylesheet" href="assets/css/font-awesome.min.css" />
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/typeahead-bs2.min.js"></script>
<!-- page specific plugin scripts -->
<script src="assets/js/jquery.dataTables.min.js"></script>
<script src="assets/js/jquery.dataTables.bootstrap.js"></script>
<script type="text/javascript" src="js/H-ui.js"></script>
<script type="text/javascript" src="js/H-ui.admin.js"></script>
<script src="assets/layer/layer.js" type="text/javascript"></script>
<script src="assets/laydate/laydate.js" type="text/javascript"></script>
<title>用户管理</title>
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
	<div class="page-content clearfix">
		<div id="Member_Ratings">
			<div class="d_Confirm_Order_style">
				<div class="search_style">
					<div class="table_menu_list" style="margin-top: 20px">
						<table class="table table-striped table-bordered table-hover"
							id="sample-table">
							<thead>
								<tr>
									<th width="100">用户名</th>
									<th width="100">真实姓名</th>
									<th width="80">性别</th>
									<th width="100">手机</th>
									<th width="120">地址</th>
									<th width="100">邮箱</th>
									<th width="80">操作</th>
								</tr>
							</thead>
							<tbody>
								<%
									List<User> list = (List<User>) session.getAttribute("userList");
									if (list == null) {
										UserDao udi = UserDaoFactory.getInstance();
										list = udi.list();
									}
									int all = 0;
									int curPage = 1;
									int pageTotal = 0;
									int pageCount = 3;
									if (list != null) {
										all = list.size();
										pageTotal = (all % pageCount) == 0 ? all / pageCount : (all / pageCount + 1);
										String strCurPage = request.getParameter("page");
										if (strCurPage != null) {
											curPage = Integer.parseInt(strCurPage);
										}
										int start = (curPage - 1) * pageCount;
										int end = curPage * pageCount > all ? all : curPage * pageCount;
										for (int i = start; i < end; i++) {
											User user = list.get(i);
								%>
								<tr>
									<td><%=user.getUsername()%></td>
									<td><%=user.getRealName()%></td>
									<td><%=user.getSex()%></td>
									<td><%=user.getTelephone()%></td>
									<td><%=user.getAddress()%></td>
									<td><%=user.getEmail()%></td>
									<td class="td-manage"><a title="删除"
								href="../DelUserServlet?id=<%=user.getId()%>"
								onclick="if(confirm('确实要删除此条记录吗？')) return true;else return false;"
								class="btn btn-xs btn-warning"><i
									class="icon-trash  bigger-120"></i></a></td>
								</tr>
								<%
									}
								%>
								<tr>
									<td colspan="7">
										<div style="float: left;">
											第<%=curPage%>页，共<%=pageTotal%>页
										</div>
										<div class="page">
											<a href="user-manager.jsp?page=1">首页</a> <a
												href="user-manager.jsp?page=<%=curPage - 1 > 0 ? curPage - 1 : 1%>">上一页</a>
											<a
												href="user-manager.jsp?page=<%=curPage + 1 < pageTotal ? curPage + 1 : pageTotal%>">下一页</a>
											<a href="user-manager.jsp?page=<%=pageTotal%>">尾页</a>
										</div>
									</td>
								</tr>
								<%
									}
								%>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>