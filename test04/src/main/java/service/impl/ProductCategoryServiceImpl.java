package service.impl;

import cn.ProductCategoryDao;
import Dao.ProductCategoryDaoImpl;
import pojo.*;
import service.ProductCategoryService;
import util.DatabaseUtil;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductCategoryServiceImpl implements ProductCategoryService {
    ProductCategoryDao productCategoryDao = null;


    @Override
    public List<ProductCategory> selectByParentId(Integer parentId,Integer isDelete) {
        Connection con = null;
        List list1 = new ArrayList();
        try{
            con = DatabaseUtil.getConnection();
            productCategoryDao = new ProductCategoryDaoImpl(con);
            ResultSet rs1 = productCategoryDao.selectByParentId(parentId);
            try {
                while(rs1.next()){
                    List list2 = new ArrayList();
                    Integer id1 = rs1.getInt("id");
                    String name1 = rs1.getString("name");
                    ResultSet rs2 = productCategoryDao.selectByParentId(id1);
                    while (rs2.next()) {
                        List list3 = new ArrayList();
                        Integer id2 = rs2.getInt("id");
                        String name2 = rs2.getString("name");
                        ResultSet rs3 = productCategoryDao.selectByParentId(id2);
                        while (rs3.next()) {
                            List list4 = new ArrayList();
                            Integer id3 = rs3.getInt("id");
                            String name3 = rs3.getString("name");
                            ResultSet rs4 = productCategoryDao.selectByLevel3Id(id3, isDelete);
                            while (rs4.next()) {
                                Integer id4 = rs4.getInt("id");
                                String name4 = rs4.getString("name");
                                Float price = rs4.getFloat("price");
                                String fileName = rs4.getString("fileName");
                                Integer stock = rs4.getInt("stock");
                                Product product = new Product();
                                product.setId(id4);
                                product.setName(name4);
                                product.setPrice(price);
                                product.setFileName(fileName);
                                product.setStock(stock);
                                list4.add(product);
                            }
                            ProductCategory productCategory3 = new ProductCategory();
                            productCategory3.setId(id3);
                            productCategory3.setName(name3);
                            productCategory3.setPlist(list4);
//                        System.out.println(name3);
                            list3.add(productCategory3);
                        }
                        ProductCategory productCategory2 = new ProductCategory();
                        productCategory2.setId(id2);
                        productCategory2.setName(name2);
                        productCategory2.setList(list3);
                        list2.add(productCategory2);
                    }

                    ProductCategory productCategory1 = new ProductCategory();
                    productCategory1.setId(id1);
                    productCategory1.setName(name1);
                    productCategory1.setList(list2);
                    list1.add(productCategory1);
                }
                return list1;
            } catch (SQLException e) {
                e.printStackTrace();
                return null;
            }
        }finally{
            DatabaseUtil.destroy(con,null,null);
        }
    }

    @Override
    public Product selectById(Integer id) {
        Connection con = null;
        Product product = null;
        try {
            con = DatabaseUtil.getConnection();
            productCategoryDao = new ProductCategoryDaoImpl(con);

            ResultSet rs4 = productCategoryDao.selectById1(id);
            try {
                while (rs4.next()) {
                    List<ProductCategory> list = new ArrayList<>();
                    Integer id4 = rs4.getInt("id");
                    String name4 = rs4.getString("name");
                    String description = rs4.getString("description");
                    Float price = rs4.getFloat("price");
                    Integer stock = rs4.getInt("stock");
                    Integer categoryLevel1Id = rs4.getInt("categoryLevel1Id");
                    ResultSet rs1 = productCategoryDao.selectById2(categoryLevel1Id);

                    while (rs1.next()) {
                        ProductCategory productCategory1 = new ProductCategory();
                        productCategory1.setId(rs1.getInt("id"));
                        productCategory1.setName(rs1.getString("name"));
                        productCategory1.setParentId(rs1.getInt("parentId"));
                        productCategory1.setType(rs1.getInt("type"));
                        productCategory1.setIconClass(rs1.getString("iconClass"));
                        list.add(productCategory1);
                    }

                    Integer categoryLevel2Id = rs4.getInt("categoryLevel2Id");
                    ResultSet rs2 = productCategoryDao.selectById2(categoryLevel2Id);

                    while (rs2.next()) {
                        ProductCategory productCategory2 = new ProductCategory();
                        productCategory2.setId(rs2.getInt("id"));
                        productCategory2.setName(rs2.getString("name"));
                        productCategory2.setParentId(rs2.getInt("parentId"));
                        productCategory2.setType(rs2.getInt("type"));
                        productCategory2.setIconClass(rs2.getString("iconClass"));
                        list.add(productCategory2);
                    }

                    Integer categoryLevel3Id = rs4.getInt("categoryLevel3Id");
                    ResultSet rs3 = productCategoryDao.selectById2(categoryLevel3Id);

                    while (rs3.next()) {
                        ProductCategory productCategory3 = new ProductCategory();
                        productCategory3.setId(rs3.getInt("id"));
                        productCategory3.setName(rs3.getString("name"));
                        productCategory3.setParentId(rs3.getInt("parentId"));
                        productCategory3.setType(rs3.getInt("type"));
                        productCategory3.setIconClass(rs3.getString("iconClass"));
                        list.add(productCategory3);
                    }

                    String fileName = rs4.getString("fileName");
                    Integer isDelete = rs4.getInt("isDelete");
                    product = new Product();
                    product.setId(id4);
                    product.setName(name4);
                    product.setDescription(description);
                    product.setPrice(price);
                    product.setStock(stock);
                    product.setCategoryLevel1Id(categoryLevel1Id);
                    product.setCategoryLevel2Id(categoryLevel2Id);
                    product.setCategoryLevel3Id(categoryLevel3Id);
                    product.setFileName(fileName);
                    product.setIsDelete(isDelete);
                    product.setList(list);
                }
                return product;
            } catch (SQLException e) {
                e.printStackTrace();
                return null;
            }
        }finally{
            DatabaseUtil.destroy(con,null,null);
        }
    }

    @Override
    public PageParams selectByLevelId(Integer isDelete,Integer categoryId, Integer level,PageParams pageParams) {
        Connection con = null;
        try {
            con = DatabaseUtil.getConnection();
            productCategoryDao = new ProductCategoryDaoImpl(con);
            return productCategoryDao.selectByLevelId(isDelete, categoryId, level, pageParams);
        }finally{
            DatabaseUtil.destroy(con,null,null);
        }
    }

    @Override
    public PageParams selectByName(String name,PageParams pageParams,Integer isDelete) {
        Connection con = null;
        try {
            con = DatabaseUtil.getConnection();
            productCategoryDao = new ProductCategoryDaoImpl(con);
            return productCategoryDao.selectByName(name,pageParams,isDelete);
        }finally{
            DatabaseUtil.destroy(con,null,null);
        }
    }

    @Override
    public Boolean reduceStock(Integer num,Integer productId) {
        Connection con = null;
        try {
            con = DatabaseUtil.getConnection();
            productCategoryDao = new ProductCategoryDaoImpl(con);
            return productCategoryDao.reduceStock(num,productId);
        }finally{
            DatabaseUtil.destroy(con,null,null);
        }
    }

    //后台

    @Override
    public PageParams selectByType(Integer type,PageParams pageParams) {
        Connection con = null;
        try {
            con = DatabaseUtil.getConnection();
            productCategoryDao = new ProductCategoryDaoImpl(con);
            return productCategoryDao.selectByType(type,pageParams);
        }finally{
            DatabaseUtil.destroy(con,null,null);
        }

    }

    @Override
    public PageParams selectProductCategoryByName(String likeName, Integer type, PageParams pageParams) {
        Connection con = null;
        try {
            con = DatabaseUtil.getConnection();
            productCategoryDao = new ProductCategoryDaoImpl(con);
            return productCategoryDao.selectProductCategoryByName(likeName,type,pageParams);
        }finally{
            DatabaseUtil.destroy(con,null,null);
        }

    }

    @Override
    public Boolean addProductCategory(ProductCategory productCategory) {
        Connection con = null;
        try {
            con = DatabaseUtil.getConnection();
            productCategoryDao = new ProductCategoryDaoImpl(con);
            return productCategoryDao.addProductCategory(productCategory);
        }finally{
            DatabaseUtil.destroy(con,null,null);
        }

    }

    @Override
    public ProductCategory selectProductCategoryById(Integer id) {
        Connection con = null;
        try {
            con = DatabaseUtil.getConnection();
            productCategoryDao = new ProductCategoryDaoImpl(con);
            ResultSet rs = productCategoryDao.selectById2(id);
            ProductCategory productCategory2 = null;
            try {
                while(rs.next()){
                    productCategory2 = new ProductCategory();
                    productCategory2.setId(rs.getInt("id"));
                    productCategory2.setName(rs.getString("name"));
                    productCategory2.setParentId(rs.getInt("parentId"));
                    productCategory2.setType(rs.getInt("type"));
                    productCategory2.setIconClass(rs.getString("iconClass"));
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            return productCategory2;
        }finally{
            DatabaseUtil.destroy(con,null,null);
        }

    }

    @Override
    public Boolean updateProductCategory(String name, Integer id) {
        Connection con = null;
        try {
            con = DatabaseUtil.getConnection();
            productCategoryDao = new ProductCategoryDaoImpl(con);
            return productCategoryDao.updateProductCategory(name,id);
        }finally{
            DatabaseUtil.destroy(con,null,null);
        }

    }

    @Override
    public Boolean deleteProductCategory(Integer id) {
        Connection con = null;
        try {
            con = DatabaseUtil.getConnection();
            productCategoryDao = new ProductCategoryDaoImpl(con);
            return productCategoryDao.deleteProductCategory(id);
        }finally{
            DatabaseUtil.destroy(con,null,null);
        }

    }

    @Override
    public PageParams getAllProduct(PageParams pageParams,Integer isDelete) {
        Connection con = null;
        try {
            con = DatabaseUtil.getConnection();
            productCategoryDao = new ProductCategoryDaoImpl(con);
            return productCategoryDao.getAllProduct(pageParams,isDelete);
        }finally{
            DatabaseUtil.destroy(con,null,null);
        }

    }

    @Override
    public PageParams selectProductByName(String likeName, PageParams pageParams,Integer isDelete) {
        Connection con = null;
        try {
            con = DatabaseUtil.getConnection();
            productCategoryDao = new ProductCategoryDaoImpl(con);
            return productCategoryDao.selectProductByName(likeName,pageParams,isDelete);
        }finally{
            DatabaseUtil.destroy(con,null,null);
        }

    }

    @Override
    public boolean updateProduct(Product product) {
        Connection con = null;
        try {
            con = DatabaseUtil.getConnection();
            productCategoryDao = new ProductCategoryDaoImpl(con);
            return productCategoryDao.updateProduct(product);
        }finally{
            DatabaseUtil.destroy(con,null,null);
        }

    }

    @Override
    public Boolean addProduct(Product product) {
        Connection con = null;
        try {
            con = DatabaseUtil.getConnection();
            productCategoryDao = new ProductCategoryDaoImpl(con);
            return productCategoryDao.addProduct(product);
        }finally{
            DatabaseUtil.destroy(con,null,null);
        }

    }

    @Override
    public Boolean deleteProduct(Integer id, Integer isDelete) {
        Connection con = null;
        try {
            con = DatabaseUtil.getConnection();
            productCategoryDao = new ProductCategoryDaoImpl(con);
            return productCategoryDao.deleteProduct(id,isDelete);
        }finally{
            DatabaseUtil.destroy(con,null,null);
        }

    }

}
