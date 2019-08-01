package factory;

import dao.ProductDao;
import impl.ProductDaoImpl;

public class ProductDaoFactory {
	public static ProductDao getInstance() {
		return new ProductDaoImpl();
	}
}
