// Servlet Annotated Class.java模板(带注解的Servlet)

package servlet;

import com.alibaba.fastjson.JSON;
import pojo.Order;
import pojo.PageParams;
import service.OrderService;
import service.impl.OrderServiceImpl;

import javax.servlet.annotation.WebServlet;
import java.io.PrintWriter;

/**
 * @Description TODO
 * @ClassName OrderBackServlet
 * @Author wtc
 * @Date 2019/3/26 10:02
 * @Version V1.0
 */
@WebServlet(name = "OrderBackServlet", urlPatterns = "/OrderBackServlet")
public class OrderBackServlet extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, java.io.IOException {
        request.setCharacterEncoding("UTF-8");  // 处理post请求乱码问题
        doGet(request, response);
    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, java.io.IOException {
        response.setContentType("text/html;charset=UTF-8"); // 处理响应乱码问题:字节流需getBytes("UTF-8")
        // str = new String(str.getBytes("ISO-8859-1"), "UTF-8");   // 处理get请求乱码问题
        // response.getWriter().write("你好 servlet!");
        String opr = request.getParameter("opr");
        PrintWriter out = response.getWriter();
        OrderService orderService = new OrderServiceImpl();
        Order order = null;
        PageParams pageParams = null;
        if("getAllOrder".equals(opr)){               //获取所有订单
            pageParams = new PageParams();
            String pageSize = request.getParameter("pageSize");
            String pageIndex = request.getParameter("pageIndex");
            pageParams.setPageSize(Integer.parseInt(pageSize));
            pageParams.setPageIndex(Integer.parseInt(pageIndex));
            PageParams pp = orderService.getAllOrder(pageParams);
            String data = JSON.toJSONStringWithDateFormat(pp,"yyyy-MM-dd");
            out.print(data);
        }else if("getOrderByLikeName".equals(opr)){           //根据登录名获取订单
            pageParams = new PageParams();
            String pageSize = request.getParameter("pageSize");
            String pageIndex = request.getParameter("pageIndex");
            pageParams.setPageSize(Integer.parseInt(pageSize));
            pageParams.setPageIndex(Integer.parseInt(pageIndex));
            String likeName = request.getParameter("likeName");
            PageParams pp = orderService.getOrderByLikeName(pageParams,likeName);
            String data = JSON.toJSONStringWithDateFormat(pp,"yyyy-MM-dd");
            out.print(data);
        }else if("deleteOrder".equals(opr)){            //根据id删除订单
            String id = request.getParameter("id");
            Boolean flag = orderService.deleteOrderById(Integer.parseInt(id));
            if(flag){
                out.print("<script type=\"text/javascript\">");
                out.print("alert(\"删除订单成功\");");
                out.print("open( \"/backed/dingdanliebiao.jsp\",\"_self\");");
                out.print("</script>");
            }
        }
        out.flush();
        out.close();
    }
}