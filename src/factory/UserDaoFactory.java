package factory;

import dao.UserDao;
import impl.UserDaoImpl;

public class UserDaoFactory {
	public static UserDao getInstance(){
		return new UserDaoImpl();
	}
}
