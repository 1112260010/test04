// Servlet Annotated Class.java模板(带注解的Servlet)

package servlet;

import com.alibaba.fastjson.JSON;
import cn.BuyCarMemcached;
import Dao.BuyCarMemcachedImpl;
import pojo.Order;
import pojo.Product;
import service.OrderService;
import service.ProductCategoryService;
import service.impl.OrderServiceImpl;
import service.impl.ProductCategoryServiceImpl;
import util.DatabaseUtil;

import javax.servlet.annotation.WebServlet;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/**
 * @Description TODO
 * @ClassName OrderServlet
 * @Author wtc
 * @Date 2019/3/19 12:04
 * @Version V1.0
 */
@WebServlet(name = "OrderServlet", urlPatterns = "/OrderServlet")
public class OrderServlet extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, java.io.IOException {
        request.setCharacterEncoding("UTF-8");  // 处理post请求乱码问题
        doGet(request, response);
    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, java.io.IOException {
        response.setContentType("text/html;charset=UTF-8"); // 处理响应乱码问题:字节流需getBytes("UTF-8")
        // str = new String(str.getBytes("ISO-8859-1"), "UTF-8");   // 处理get请求乱码问题
        PrintWriter out = response.getWriter();
        OrderService orderService = new OrderServiceImpl();
        BuyCarMemcached buyCarMemcached = new BuyCarMemcachedImpl();
        ProductCategoryService productCategoryService = new ProductCategoryServiceImpl();
        String opr = request.getParameter("opr");
        Order order = null;
        if("addOrder".equals(opr)){
            order = new Order();
            String userId = request.getParameter("id");
            String loginName = request.getParameter("loginName");
            String userAddress = request.getParameter("address");
            String cost = request.getParameter("cost");
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Date createTime = null;
            try {
                createTime = simpleDateFormat.parse(simpleDateFormat.format(new Date()));
            } catch (ParseException e) {
                e.printStackTrace();
            }
            String serialNumber = DatabaseUtil.genId("9");
            order.setUserId(Integer.parseInt(userId));
            order.setLoginName(loginName);
            order.setUserAddress(userAddress);
            order.setCreateTime(createTime);
            order.setCost(Float.parseFloat(cost));
            order.setSerialNumber(serialNumber);
            Boolean flag = orderService.addOrder(order);
            if(flag){           //添加订单成功
                Boolean bool = orderService.addOrderDetail(order);
                Boolean a = false;
                if(bool){    //添加订单列表成功
                    Map<String,List<Product>> map = buyCarMemcached.getProduct(order.getLoginName());    //获取该订单所有商品
                    Integer productId = null;                                      //商品id
                    Iterator<Map.Entry<String, List<Product>>> it = map.entrySet().iterator();
                    List<Product> list = null;
                    Integer quantity = null;          //商品数量
                    Integer stock = null;            //商品库存
                    Product product = null;         //商品对象
                    Integer num = null;
                    while(it.hasNext()) {
                        Map.Entry<String, List<Product>> entry = it.next();
                        productId = Integer.parseInt(entry.getKey());
                        product = productCategoryService.selectById(productId);
                        stock = product.getStock();        //库存
                        list = entry.getValue();
                        quantity = list.size();
                        num = stock - quantity;
                        a = productCategoryService.reduceStock(num,productId);
                        if(!a){
                            break;
                        }
                    }
                    if(a){           //减少商品库存成功
                        request.setAttribute("order",order);
                        request.getRequestDispatcher("/BuyCar_Three.jsp").forward(request,response);
                    }
                }else{      //添加订单列表失败
                    Boolean bo = orderService.deleteOrder(Integer.parseInt(userId));
                    if(bo){       //删除订单成功
                        out.print("<script type='text/javascript'>");
                        out.print("alert('有商品库存不足，生成订单失败');");
                        out.print("open('/index.jsp','_self');");
                        out.print("</script>");
                    }
                }
            }
        }else if("selectOrderByUserId".equals(opr)){
            String userId = request.getParameter("userId");
            List<Order> list = orderService.selectOrderByUserId(Integer.parseInt(userId));
            String data = JSON.toJSONStringWithDateFormat(list,"yyyy-MM-dd");
            out.print(data);
        }
        out.flush();
        out.close();
    }
}