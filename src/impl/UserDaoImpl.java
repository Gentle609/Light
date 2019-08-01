package impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import connection.ConnectLight;
import dao.UserDao;
import entity.User;

public class UserDaoImpl implements UserDao {
	private Connection conn=null;
	private PreparedStatement ps=null;
	private ResultSet rs=null;
	private String sql="";
	private int row=0;

	//查找登录名和密码，验证登录账号
	public int login(String userName, String pwd) {
		int flag=0;
		//创建连接
		conn=ConnectLight.getConnection();
		sql="select password from user where username=?";
		try {
			//获取预编译对象
			ps=conn.prepareStatement(sql);
			ps.setString(1, userName);
			rs=ps.executeQuery();
			if(rs.next()){
				if(pwd.equals(rs.getString("password"))){
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
	//根据姓名查找用户的全部信息
	public User getUserByUserName(String name) {
		User user=new User();
		conn=ConnectLight.getConnection();
		sql="select * from user where username=?";
		try {
			ps=conn.prepareStatement(sql);
			ps.setString(1, name);
			rs=ps.executeQuery();
			if(rs.next()){
				user.setId(rs.getInt("id"));
				user.setUsername(rs.getString("username"));
				user.setPassword(rs.getString("password"));
				user.setRealName(rs.getString("realName"));
				user.setSex(rs.getString("sex"));
				user.setTelephone(rs.getString("telephone"));
				user.setAddress(rs.getString("address"));
				user.setEmail(rs.getString("email"));
			}
			ConnectLight.close(conn, ps, rs);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return user;
	}

	//查找用户是否存在
	public boolean getUserByName(String username) {
		boolean flag=false;
		conn=ConnectLight.getConnection();
		sql="select * from user where username=?";
		try {
			ps=conn.prepareStatement(sql);
			ps.setString(1, username);
			rs=ps.executeQuery();
			if(rs.next()){
				flag=true;
			}
			ConnectLight.close(conn, ps, rs);
			return flag;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	//重置密码
	public boolean resetPwd(String username, String pwd) {
		conn=ConnectLight.getConnection();
		sql="update user set password=? where username=?";
		try {
			ps=conn.prepareStatement(sql);
			ps.setString(1, pwd);
			ps.setString(2, username);
			row=ps.executeUpdate();
			ConnectLight.close(conn, ps, rs);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return row>0?true:false;
	}
	//添加注册用户信息
	public boolean add(User user) {
		conn=ConnectLight.getConnection();
		sql="insert into user(username,password,realName,sex,telephone,address,email) values(?,?,?,?,?,?,?)";
		try {
			ps=conn.prepareStatement(sql);
			ps.setString(1, user.getUsername());
			ps.setString(2, user.getPassword());
			ps.setString(3, user.getRealName());
			ps.setString(4, user.getSex());
			ps.setString(5, user.getTelephone());
			ps.setString(6, user.getAddress());
			ps.setString(7, user.getEmail());
			row=ps.executeUpdate();
			ConnectLight.close(conn, ps, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return row>0?true:false;
	}
	//修改用户信息
	public boolean update(User user) {
		conn=ConnectLight.getConnection();
		sql="update user set realName=?,sex=?,telephone=?,address=?,email=? where username=?";
		try {
			ps=conn.prepareStatement(sql);
			ps.setString(1, user.getRealName());
			ps.setString(2, user.getSex());
			ps.setString(3, user.getTelephone());
			ps.setString(4, user.getAddress());
			ps.setString(5, user.getEmail());
			ps.setString(6, user.getUsername());
			row=ps.executeUpdate();
			ConnectLight.close(conn, ps, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return row>0?true:false;
	}
	//修改用户登录密码
	public boolean modiPwd(String userName, String oldpwd, String newpwd) {
		conn=ConnectLight.getConnection();
		sql="update user set password=? where username=? and password=?";
		try {
			ps=conn.prepareStatement(sql);
			ps.setString(1, newpwd);
			ps.setString(2, userName);
			ps.setString(3, oldpwd);
			row=ps.executeUpdate();
			ConnectLight.close(conn, ps, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return row>0?true:false;
	}
	public List<User> list() {
		List<User> list=new ArrayList<User>();
		  conn=ConnectLight.getConnection();
		  sql="select * from user";
		  try {
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()) {
				 User user=new User();
				user.setUsername(rs.getString("userName"));
				user.setId(rs.getInt("id"));
				user.setPassword(rs.getString("password"));
				user.setRealName(rs.getString("realName"));
				user.setSex(rs.getString("sex"));
				user.setTelephone(rs.getString("telephone"));
				user.setAddress(rs.getString("address"));
				user.setEmail(rs.getString("email"));
				list.add(user);
			}
			ConnectLight.close(conn, ps, rs);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	      return list;
	}
	public List<User> find(String name) {
		 List<User> list = new ArrayList<User>();
			conn = ConnectLight.getConnection();
			sql = "select * from user where username like '%" + name + "%'";
			try {
				ps = conn.prepareStatement(sql);
				rs=ps.executeQuery();
				while (rs.next()) {
					User p = new User();
					p.setId(rs.getInt("id"));
					p.setUsername(rs.getString("username"));
					p.setRealName(rs.getString("realName"));
					p.setSex(rs.getString("sex"));
					p.setAddress(rs.getString("address"));
					p.setEmail(rs.getString("email"));
					p.setTelephone(rs.getString("telephone"));
					list.add(p);
				}
				ConnectLight.close(conn, ps, rs);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return list;
	}
	public boolean delete(int userId) {
		conn = ConnectLight.getConnection();
		String sql1="delete from order_info where id=?";
		try {
			PreparedStatement psmt=conn.prepareStatement(sql1);
			psmt.setInt(1, userId);
			int row2 = psmt.executeUpdate();
			if(row2>0){
				sql = "delete from user where id=?";
				try {
					ps = conn.prepareStatement(sql);
					ps.setInt(1, userId);
					row = ps.executeUpdate();
					ConnectLight.close(conn, ps, rs);
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			ConnectLight.close(conn, psmt, rs);
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		return row > 0 ? true : false;
	}
}