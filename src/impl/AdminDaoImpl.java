package impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import connection.ConnectLight;
import dao.AdminDao;

public class AdminDaoImpl implements AdminDao {
	private Connection conn=null;
	private PreparedStatement ps=null;
	private ResultSet rs=null;
	private String sql="";
	private int row=0;
	//管理员登录
	public int login(String adminID, String pwd) {
		int flag=0;
		//创建连接
		conn=ConnectLight.getConnection();
		sql="select pwd from admin where name=?";
		try {
			//获取预编译对象
			ps=conn.prepareStatement(sql);
			ps.setString(1, adminID);
			rs=ps.executeQuery();
			if(rs.next()){
				if(pwd.equals(rs.getString("pwd"))){
					//正常登录
					flag=3;
				}else{
					//密码错误
					flag=2;
				}
			}else {
				//用户名不存在
				flag=1;
			}
			ConnectLight.close(conn, ps, rs);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}
	public int updatePwd(String name, String pwd, String newpwd) {
		int flag=0;
		//创建连接
		conn=ConnectLight.getConnection();
		sql="select pwd from admin where name=?";
		try {
			ps=conn.prepareStatement(sql);
			ps.setString(1, name);
			ResultSet rs=ps.executeQuery();
			if(rs.next()){
				if(rs.getString("pwd").equals(pwd)){
					String sql1="update admin set pwd=? where name=?";
					PreparedStatement psmt=conn.prepareStatement(sql1);
					psmt.setString(1, newpwd);
					psmt.setString(2, name);
					row = psmt.executeUpdate();
					flag=row>0?1:2;
				}else{
					flag=3;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

}
