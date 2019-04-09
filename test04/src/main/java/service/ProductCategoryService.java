package service;

import pojo.Order;
import pojo.PageParams;
import pojo.Product;
import pojo.ProductCategory;

import java.util.List;

public interface ProductCategoryService {


    public List<ProductCategory> selectByParentId(Integer parentId,Integer isDelete);

    public Product selectById(Integer id);

    public PageParams selectByLevelId(Integer isDelete,Integer categoryId, Integer level,PageParams pageParams);

    public PageParams selectByName(String name,PageParams pageParams,Integer isDelete);

    public Boolean reduceStock(Integer num,Integer productId);

    //后台商品

    public PageParams selectByType(Integer type,PageParams pageParams);        //获取所有1级菜单

    public PageParams selectProductCategoryByName(String likeName,Integer type,PageParams pageParams);

    public Boolean addProductCategory(ProductCategory productCategory);

    public ProductCategory selectProductCategoryById(Integer id);

    public Boolean updateProductCategory(String name,Integer id);

    public Boolean deleteProductCategory(Integer id);

    public PageParams getAllProduct(PageParams pageParams,Integer isDelete);

    public PageParams selectProductByName(String likeName,PageParams pageParams,Integer isDelete);

    public boolean updateProduct(Product product);

    public Boolean addProduct(Product product);

    public Boolean deleteProduct(Integer id, Integer isDelete);
}
