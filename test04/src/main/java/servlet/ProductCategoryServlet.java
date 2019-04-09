// Servlet Annotated Class.java模板(带注解的Servlet)

package servlet;

import com.alibaba.fastjson.JSON;
import cn.BuyCarMemcached;
import Dao.BuyCarMemcachedImpl;
import pojo.PageParams;
import pojo.Product;
import pojo.ProductCategory;
import service.ProductCategoryService;
import service.impl.ProductCategoryServiceImpl;

import javax.servlet.annotation.WebServlet;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

/**
 * @Description TODO
 * @ClassName ProductCategoryServlet
 * @Author wtc
 * @Date 2019/3/6 10:52
 * @Version V1.0
 */
@WebServlet(name = "ProductCategoryServlet", urlPatterns = "/ProductCategoryServlet")
public class ProductCategoryServlet extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, java.io.IOException {
        request.setCharacterEncoding("UTF-8");  // 处理post请求乱码问题
        doGet(request, response);
    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, java.io.IOException {
        response.setContentType("text/html;charset=UTF-8"); // 处理响应乱码问题:字节流需getBytes("UTF-8")
        // str = new String(str.getBytes("ISO-8859-1"), "UTF-8");   // 处理get请求乱码问题
        String opr = request.getParameter("opr");
        if(opr==null){
            opr = "pclist";
        }
        ProductCategoryService productCategoryService = new ProductCategoryServiceImpl();
        BuyCarMemcached buyCarMemcached = new BuyCarMemcachedImpl();
        PrintWriter out = response.getWriter();
        PageParams pageParams = null;

        if(opr.equals("pclist")){
            Integer isDelete = 0;
            String parentId = request.getParameter("parentId");
            if(parentId == null || parentId == ""){
                parentId = "0";
            }
            List<ProductCategory> list = productCategoryService.selectByParentId(Integer.parseInt(parentId),isDelete);
            request.getSession(true).setAttribute("list",list);
            response.sendRedirect("/index.jsp");
        }else if("product".equals(opr)){
            String id = request.getParameter("id");
            if(id == null || id == ""){
                response.sendRedirect("/error.jsp");
            }
            Product product = productCategoryService.selectById(Integer.parseInt(id));
            request.setAttribute("product",product);
            request.getRequestDispatcher("/Product.jsp").forward(request,response);
        }else if("productList".equals(opr)){
            pageParams = new PageParams();
            String categoryId = request.getParameter("categoryId");
            String level = request.getParameter("level");
            String pageIndex = request.getParameter("pageIndex");
            Integer pageSize = 6;
            pageParams.setPageSize(pageSize);
            Integer isDelete = 0;
            if(categoryId == null || level == null ){
                response.sendRedirect("/error.jsp");
            }
            pageParams.setPageIndex(Integer.parseInt(pageIndex.trim()));
            PageParams pp = productCategoryService.selectByLevelId(isDelete,Integer.parseInt(categoryId),Integer.parseInt(level),pageParams);
            String plist = JSON.toJSONString(pp);
            out.print(plist);
        }else if("selectByName".equals(opr)){
            pageParams = new PageParams();
            Integer isDelete = 0;
            String name = request.getParameter("name");
            String pageIndex = request.getParameter("pageIndex");
            Integer pageSize = 6;
            pageParams.setPageSize(pageSize);
            pageParams.setPageIndex(Integer.parseInt(pageIndex));
            PageParams pp = productCategoryService.selectByName(name,pageParams,isDelete);
            String plist = JSON.toJSONString(pp);
            out.print(plist);
        }else if("addProduct".equals(opr)){
            String id = request.getParameter("id");
            String loginName = request.getParameter("loginName");
            String num = request.getParameter("num");
            Map<String,List<Product>> map = null;
            if(id == null){
                response.sendRedirect("/error.jsp");
            }
            if(loginName == null || loginName == "" ){
                out.print("<script type='text/javascript'>");
                out.print("alert('用户没登陆，请先登录');");
                out.print("open('/Login.jsp','_self');");
                out.print("</script>");
            }else{
                if(num == null){
                    num = "1";
                }
                map = buyCarMemcached.addProduct(loginName,Integer.parseInt(id),Integer.parseInt(num));
                String plist = JSON.toJSONString(map);
                out.print(plist);
            }

        }else if("getProduct".equals(opr)){
            String loginName = request.getParameter("loginName");
            String num = request.getParameter("num");
            if(num == null){
                Map<String,List<Product>> map = buyCarMemcached.getProduct(loginName);
                String plist = JSON.toJSONString(map);
                out.print(plist);
            }else{
                if(Integer.parseInt(num) == 0){
                    out.print("<script type='text/javascript'>");
                    out.print("alert('购物车中没有商品，请先添加商品');");
                    out.print("open('/index.jsp','_self');");
                    out.print("</script>");
                }else{
                    Map<String,List<Product>> map = buyCarMemcached.getProduct(loginName);
                    request.setAttribute("map",map);
                    request.getRequestDispatcher("/BuyCar.jsp").forward(request,response);
                }
            }
        }else if("reduce".equals(opr)){
            String loginName = request.getParameter("loginName");
            String id = request.getParameter("id");
            Map<String,List<Product>> map = buyCarMemcached.reduce(loginName,Integer.parseInt(id));
            String pmap = JSON.toJSONString(map);
            out.print(pmap);
        }else if("delete".equals(opr)){
            String loginName = request.getParameter("loginName");
            String id = request.getParameter("id");
            Map<String,List<Product>> map = buyCarMemcached.delete(loginName,Integer.parseInt(id));
            String pmap = JSON.toJSONString(map);
            out.print(pmap);
        }else if("deleteAll".equals(opr)){
            String loginName = request.getParameter("loginName");
            String str = buyCarMemcached.deleteAll(loginName);
            out.print(str);
        }else if("doCollect".equals(opr)){
            String userId = request.getParameter("userId");
            String productId = request.getParameter("productId");
            List<Product> list = buyCarMemcached.doCollect(userId,Integer.parseInt(productId));
            if(list != null && list.size() > 0){
                out.print("<script type='text/javascript'>");
                out.print("alert('收藏成功');");
                out.print("open('/index.jsp','_self');");
                out.print("</script>");
            }
        }else if("getCollect".equals(opr)){
            String userId = request.getParameter("userId");
            List<Product> list = buyCarMemcached.getCollect(userId);
            String products = JSON.toJSONString(list);
            out.print(products);
        }else if("deleteCollect".equals(opr)){
            String userId = request.getParameter("userId");
            String productId = request.getParameter("productId");
            List<Product> list = buyCarMemcached.deleteCollect(userId,Integer.parseInt(productId));
            String products = JSON.toJSONString(list);
            out.print(products);
        }
        out.flush();
        out.close();
    }
}