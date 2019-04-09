// Servlet Annotated Class.java模板(带注解的Servlet)

package servlet;

import com.alibaba.fastjson.JSON;
import pojo.News;
import service.NewsService;
import service.impl.NewsServiceImpl;

import javax.servlet.annotation.WebServlet;
import java.io.PrintWriter;
import java.util.List;

/**
 * @Description TODO
 * @ClassName NewsServlet
 * @Author wtc
 * @Date 2019/3/11 16:23
 * @Version V1.0
 */
@WebServlet(name = "NewsServlet", urlPatterns = "/NewsServlet")
public class NewsServlet extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, java.io.IOException {
        request.setCharacterEncoding("UTF-8");  // 处理post请求乱码问题
        doGet(request, response);
    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, java.io.IOException {
        response.setContentType("text/html;charset=UTF-8"); // 处理响应乱码问题:字节流需getBytes("UTF-8")
        // str = new String(str.getBytes("ISO-8859-1"), "UTF-8");   // 处理get请求乱码问题
        Integer size = 5;
        PrintWriter out = response.getWriter();
        NewsService newsService = new NewsServiceImpl();
        List<News> list = newsService.selectNews(size);        //选择前5个新闻
        String title = JSON.toJSONString(list);
        out.print(title);
        out.flush();
        out.close();
    }
}