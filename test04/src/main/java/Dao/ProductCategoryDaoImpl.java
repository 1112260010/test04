package Dao;

import cn.ProductCategoryDao;
import pojo.*;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.List;

public class ProductCategoryDaoImpl extends BaseDao implements ProductCategoryDao {

    List list = null;
    ProductCategory productCategory = null;
    public static String sql ;

    public ProductCategoryDaoImpl(Connection con){
        super(con);
    }


    @Override
    public ResultSet selectByParentId(Integer parentId) {
        ResultSet rs = null;
        String sql = "select id,name from easybuy_product_category where parentId = "+parentId;
        rs = this.executeQuery(sql);
        return rs;
    }

    @Override
    public ResultSet selectByLevel3Id(Integer categoryLevel3Id,Integer isDelete) {
        ResultSet rs = null;
        String sql = "select id,name,price,fileName,stock,isDelete from easybuy_product where categoryLevel3Id = "+categoryLevel3Id+" and isDelete = "+isDelete;
        rs = this.executeQuery(sql);
        return rs;
    }

    @Override
    public ResultSet selectById1(Integer id) {
        ResultSet rs = null;
        String sql = "select id,name,description,price,stock,categoryLevel1Id,categoryLevel2Id,categoryLevel3Id,fileName,isDelete from easybuy_product" +
                " where id = "+id;
        rs = this.executeQuery(sql);
        return rs;
    }

    @Override
    public ResultSet selectById2(Integer id) {
        ResultSet rs = null;
        String sql = "select id,name,parentId,type,iconClass from easybuy_product_category where id = "+id;
        rs = this.executeQuery(sql);
        return rs;
    }

    //根据商品菜单级别id查询商品
    @Override
    public PageParams selectByLevelId(Integer isDelete,Integer categoryId,Integer level,PageParams pageParams) {
        PageParams pp = null;
        if(level == 1){
            sql = "select id,name,description,price,stock,categoryLevel1Id,categoryLevel2Id,categoryLevel3Id,fileName,isDelete from easybuy_product where categoryLevel1Id = "+categoryId+" and isDelete = "+isDelete;
        }else if(level == 2){
            sql = "select id,name,description,price,stock,categoryLevel1Id,categoryLevel2Id,categoryLevel3Id,fileName,isDelete from easybuy_product where categoryLevel2Id = "+categoryId+" and isDelete = "+isDelete;
        }else if(level == 3){
            sql = "select id,name,description,price,stock,categoryLevel1Id,categoryLevel2Id,categoryLevel3Id,fileName,isDelete from easybuy_product where categoryLevel3Id = "+categoryId+" and isDelete = "+isDelete;
        }
            pp = this.getProductPages(pageParams);
        return pp;
    }

    //根据名字模糊查询商品
    @Override
    public PageParams selectByName(String name,PageParams pageParams,Integer isDelete) {
        PageParams pp = null;
        sql = "select id,name,description,price,stock,categoryLevel1Id,categoryLevel2Id,categoryLevel3Id,fileName,isDelete from easybuy_product where name like '%"+name+"%' and isDelete = "+isDelete;
            pp = this.getProductPages(pageParams);
        return pp;
    }

    //商品分页方法
    @Override
    public PageParams getProductPages(PageParams pageParams) {
        Product product = new Product();
        PageParams pp = this.page(sql,pageParams,product);
        return pp;
    }

    /**
     * 生成订单后减去相应的商品库存
     * @return
     */
    @Override
    public Boolean reduceStock(Integer num,Integer productId) {
        String sql = "update easybuy_product set stock = ? where id = ? ";
        int rows = this.executeUpdate(sql,num,productId);
        if(rows > 0){
            return true;
        }
        return false;
    }

    //后台商品

    @Override
    //查找商品目录
    public PageParams selectByType(Integer type,PageParams pageParams) {
        PageParams pp = null;
        sql = "select id,name,parentId,type,iconClass from easybuy_product_category where type = "+type;
        pp = this.getProductCategoryPages(pageParams);
        return pp;
    }

    //根据名字模糊查询菜单
    @Override
    public PageParams selectProductCategoryByName(String likeName, Integer type, PageParams pageParams) {
        PageParams pp = null;
        sql = "select id,name,parentId,type,iconClass from easybuy_product_category where name like '%"+likeName+"%' and type = "+type;
        pp = this.getProductCategoryPages(pageParams);
        return pp;
    }

    //添加菜单
    @Override
    public Boolean addProductCategory(ProductCategory productCategory) {
        Boolean flag = false;
        String sql = "insert into easybuy_product_category (name,parentId,type) values (?,?,?) ";
        int rows = this.executeUpdate(sql,productCategory.getName(),productCategory.getParentId(),productCategory.getType());
        if(rows > 0){
            flag = true;
        }
        return flag;
    }

    //修改菜单名称
    @Override
    public Boolean updateProductCategory(String name,Integer id) {
        Boolean flag = false;
        String sql = "update easybuy_product_category set name = ? where id = ? ";
        int rows = this.executeUpdate(sql,name,id);
        if(rows > 0){
            flag = true;
        }
        return flag;
    }

    //删除商品菜单
    @Override
    public Boolean deleteProductCategory(Integer id) {
        Boolean flag = false;
        String sql = "delete from easybuy_product_category where id = ? ";
        int rows = this.executeUpdate(sql,id);
        if(rows > 0){
            flag = true;
        }
        return flag;
    }

    //查询所有商品
    @Override
    public PageParams getAllProduct(PageParams pageParams,Integer isDelete) {
        PageParams pp = null;
        sql = "select id,name,description,price,stock,categoryLevel1Id,categoryLevel2Id,categoryLevel3Id,fileName,isDelete from easybuy_product where isDelete = "+isDelete;
        pp = this.getProductPages(pageParams);
        return pp;
    }

    @Override
    public PageParams selectProductByName(String likeName, PageParams pageParams,Integer isDelete) {
        PageParams pp = null;
        sql = "select id,name,description,price,stock,categoryLevel1Id,categoryLevel2Id,categoryLevel3Id,fileName,isDelete from easybuy_product where name like '%"+likeName+"%' and isDelete = "+isDelete;
        pp = this.getProductPages(pageParams);
        return pp;
    }

    @Override
    public Boolean updateProduct(Product product) {
        Boolean flag = false;
        String sql = "update easybuy_product set name = ? , price = ? , stock = ? , description = ? where id = ?  and isDelete = ? ";
        int rows = this.executeUpdate(sql,product.getName(),product.getPrice(),product.getStock(),product.getDescription(),product.getId(),product.getIsDelete());
        if(rows > 0){
            flag = true;
        }
        return flag;
    }


    @Override
    public Boolean addProduct(Product product) {
        Boolean flag = false;
        String sql = "insert into easybuy_product (name,description,price,stock,categoryLevel1Id,categoryLevel2Id,categoryLevel3Id,fileName,isDelete) " +
                " values (?,?,?,?,?,?,?,?,?)";
        int rows = this.executeUpdate(sql,product.getName(),product.getDescription(),product.getPrice(),product.getStock(),product.getCategoryLevel1Id()
                                        ,product.getCategoryLevel2Id(),product.getCategoryLevel3Id(),product.getFileName(),product.getIsDelete());
        if(rows > 0){
            flag = true;
        }
        return flag;
    }

    @Override
    public Boolean deleteProduct(Integer id, Integer isDelete) {
        Boolean flag = false;
        String sql = "update easybuy_product set isDelete = ? where id = ? ";
        int rows = this.executeUpdate(sql,isDelete,id);
        if(rows > 0){
            flag = true;
        }
        return flag;
    }

    //商品菜单分页方法
    @Override
    public PageParams getProductCategoryPages(PageParams pageParams) {
        ProductCategory productCategory = new ProductCategory();
        PageParams pp = this.page(sql,pageParams,productCategory);
        return pp;
    }
}
