package Dao;

import cn.BuyCarMemcached;
import net.spy.memcached.MemcachedClient;
import pojo.Product;
import service.ProductCategoryService;
import service.impl.ProductCategoryServiceImpl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;

public class BuyCarMemcachedImpl extends BaseMemcached implements BuyCarMemcached {
    ProductCategoryService productCategoryService = new ProductCategoryServiceImpl();


    /**
     * 添加该id的商品进购物车
     * @param loginName
     * @param id
     * @return
     */
    @Override
    public Map addProduct(String loginName, Integer id,Integer num) {
        MemcachedClient mcc = this.getConnect();
        Product product = productCategoryService.selectById(id);
        Map<String,List<Product>> ma = (Map)mcc.get(loginName);
        if(ma == null || ma.size()==0){           //memcached不存在该用户或该用户的长度为0
            Map<String,List<Product>> map = new HashMap<>();
            List<Product> list = new ArrayList<>();
            for(int i=0;i<num;i++){
                list.add(product);
            }
            map.put(id.toString(),list);
            mcc.set(loginName,0,map);
            ma = (Map)mcc.get(loginName);
        }else{                                //memcached存在该用户
            int i = 0;
            for(String in:ma.keySet()){
                i++;
                if(in.equals(id.toString())){        //map中有同id商品
                    List<Product> plist = ma.get(id.toString());
                    for(int j=0;j<num;j++){
                        plist.add(product);
                    }
                    ma.put(id.toString(),plist);
                    break;
                }else{                             //map中没有该id商品
                    if(i==ma.size()){
                        List<Product> li = new ArrayList<>();
                        for(int j=0;j<num;j++){
                            li.add(product);
                        }
                        ma.put(id.toString(),li);
                    }
                }
            }
            mcc.set(loginName,0,ma);
            ma = (Map)mcc.get(loginName);
        }
        mcc.shutdown();
        return ma;
    }

    /**
     * 获取该用户在购物车的所有商品
     * @param loginName
     * @return
     */
    @Override
    public Map<String,List<Product>> getProduct(String loginName) {
        MemcachedClient mcc = this.getConnect();
        Map<String,List<Product>> map = null;
        map = (Map)mcc.get(loginName);
        mcc.shutdown();
        return map;
    }

    /**
     * 减少一个同id商品
     * @param loginName
     * @param id
     * @return
     */
    @Override
    public Map<String,List<Product>> reduce(String loginName, Integer id) {
        MemcachedClient mcc = this.getConnect();
        Map<String,List<Product>> map = (Map)mcc.get(loginName);
        List<Product> list = map.get(id.toString());
        list.remove(0);
        map.put(id.toString(),list);
        mcc.set(loginName,0,map);
        map = (Map)mcc.get(loginName);
        mcc.shutdown();
        return map;
    }

    /**
     * 删除该商品id的所有商品
     * @param loginName
     * @param id
     * @return
     */
    @Override
    public Map<String, List<Product>> delete(String loginName, Integer id) {
        MemcachedClient mcc = this.getConnect();
        Map<String,List<Product>> map = (Map)mcc.get(loginName);
        map.remove(id.toString());
        mcc.set(loginName,0,map);
        map = (Map)mcc.get(loginName);
        mcc.shutdown();
        return map;
    }

    /**
     * 清空购物车
     * @param loginName
     * @return
     */
    @Override
    public String deleteAll(String loginName) {
        String str = "failed";
        MemcachedClient mcc = this.getConnect();
        Future fo = mcc.delete(loginName);
        try {
            Boolean flag = (Boolean)fo.get();
            if(flag){
                str = "success";
            }
        } catch (InterruptedException e) {
            e.printStackTrace();
        } catch (ExecutionException e) {
            e.printStackTrace();
        }finally{
            mcc.shutdown();
        }
        return str;
    }

    /**
     * 收藏商品
     * @param userId
     * @param productId
     * @return
     */
    @Override
    public List<Product> doCollect(String userId, Integer productId) {
        MemcachedClient mcc = this.getConnect();
        Product product = productCategoryService.selectById(productId);
        List<Product> list = (List)mcc.get(userId);
        if(list == null || list.size()==0){
            list = new ArrayList<>();
            list.add(product);
            mcc.set(userId,0,list);
            list = (List)mcc.get(userId);
        }else{
            list.add(product);
            mcc.set(userId,0,list);
            list = (List) mcc.get(userId);
        }
        mcc.shutdown();
        return list;
    }

    @Override
    public List<Product> getCollect(String userId) {
        MemcachedClient mcc = this.getConnect();
        List<Product> list = (List)mcc.get(userId);
        mcc.shutdown();
        return list;
    }

    @Override
    public List<Product> deleteCollect(String userId, Integer productId) {
        MemcachedClient mcc = this.getConnect();
        List<Product> list = (List)mcc.get(userId);
        for(Product pro:list){
            if(productId.equals(pro.getId())){
                list.remove(pro);
                break;
            }
        }
        mcc.set(userId,0,list);
        list = (List)mcc.get(userId);
        mcc.shutdown();
        return list;
    }


}
