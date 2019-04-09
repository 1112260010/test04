package cn;

import pojo.PageParams;
import pojo.Product;
import pojo.ProductCategory;

import java.sql.ResultSet;

public interface ProductCategoryDao {


    public ResultSet selectByParentId(Integer parentId);

    public ResultSet selectByLevel3Id(Integer categoryLevel3Id,Integer isDelete);

    public ResultSet selectById1(Integer id);

    public ResultSet selectById2(Integer id);

    public PageParams selectByLevelId(Integer isDelete,Integer categoryId,Integer level,PageParams pageParams);

    public PageParams selectByName(String name,PageParams pageParams,Integer isDelete);

    public PageParams getProductPages(PageParams pageParams);

    public Boolean reduceStock(Integer num,Integer productId);

    /*public List<ProductCategory> getProduct_category2(Integer parentId);*/
    //后台商品
    public PageParams getProductCategoryPages(PageParams pageParams);

    public PageParams selectByType(Integer type,PageParams pageParams);

    public PageParams selectProductCategoryByName(String likeName,Integer type,PageParams pageParams);

    public Boolean addProductCategory(ProductCategory productCategory);

    public Boolean updateProductCategory(String name,Integer id);

    public Boolean deleteProductCategory(Integer id);

    public PageParams getAllProduct(PageParams pageParams,Integer isDelete);

    public PageParams selectProductByName(String likeName,PageParams pageParams,Integer isDelete);

    public Boolean updateProduct(Product product);

    public Boolean addProduct(Product product);

    public Boolean deleteProduct(Integer id,Integer isDelete);
}
