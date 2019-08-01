package dao;

import java.util.List;

import entity.User;

public interface UserDao {
	//验证用户名和密码
	int login(String userName,String pwd);
	//得到用户全部信息
	User getUserByUserName(String name);
	//查找用户是否存在
	boolean getUserByName(String username);
	//重置密码
	boolean resetPwd(String tel, String string);
	//用户注册
	boolean add(User user);
	//修改用户信息
	boolean update(User user);
	//修改密码信息
	boolean modiPwd(String userName, String oldpwd, String newpwd);
	//查询所有用户信息
	List<User> list();
	//查找用户
	List<User> find(String name);
	//删除用户
	boolean delete(int userId);
}