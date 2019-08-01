package dao;

public interface AdminDao {
	int login(String adminID, String pwd);

	int updatePwd(String name, String pwd, String newpwd);
}
