package connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ConnectLight {
	//连接数据库
	public static Connection getConnection(){
		Connection conn=null;
		//连接数据库的路径，用户名，密码
		String url="jdbc:mysql://localhost:3306/light?useUnicode=true&characterEncoding=utf-8";
		String user="root";
		String password="";
		try {
			//加载驱动
			Class.forName("com.mysql.jdbc.Driver");
			//创建连接
			conn=DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			System.out.println("加载驱动失败");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("数据库连接失败");
			e.printStackTrace();
		}
		return conn;
	}
	//关闭数据库连接
	public static void close(Connection conn,PreparedStatement ps,ResultSet rs){
			try {
				if(rs!=null){
					rs.close();
				}
				if(ps!=null){
					ps.close();
				}
				if(conn!=null){
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
	}
}
