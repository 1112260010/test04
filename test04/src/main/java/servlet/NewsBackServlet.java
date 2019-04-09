// Servlet Annotated Class.java模板(带注解的Servlet)

package servlet;

import com.alibaba.fastjson.JSON;
import pojo.News;
import pojo.PageParams;
import service.NewsService;
import service.impl.NewsServiceImpl;

import javax.servlet.annotation.WebServlet;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @Description TODO
 * @ClassName NewsBackServlet
 * @Author wtc
 * @Date 2019/3/26 11:42
 * @Version V1.0
 */
@WebServlet(name = "NewsBackServlet", urlPatterns = "/NewsBackServlet")
public class NewsBackServlet extends javax.servlet.http.HttpServlet {
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
        NewsService newsService = new NewsServiceImpl();
        PageParams pageParams = null;
        News news = null;
        if("getAllNews".equals(opr)){
            pageParams = new PageParams();
            String pageSize = request.getParameter("pageSize");
            String pageIndex = request.getParameter("pageIndex");
            pageParams.setPageSize(Integer.parseInt(pageSize));
            pageParams.setPageIndex(Integer.parseInt(pageIndex));
            PageParams pp = newsService.getAllNews(pageParams);
            String data = JSON.toJSONStringWithDateFormat(pp,"yyyy-MM-dd");
            out.print(data);
        }else if("selectNewsByName".equals(opr)){
            pageParams = new PageParams();
            String pageSize = request.getParameter("pageSize");
            String pageIndex = request.getParameter("pageIndex");
            pageParams.setPageSize(Integer.parseInt(pageSize));
            pageParams.setPageIndex(Integer.parseInt(pageIndex));
            String likeName = request.getParameter("likeName");
            PageParams pp = newsService.selectNewsByName(pageParams,likeName);
            String data = JSON.toJSONStringWithDateFormat(pp,"yyyy-MM-dd");
            out.print(data);
        }else if("selectNewsById".equals(opr)){
            String id = request.getParameter("id");
            news = newsService.selectById(Integer.parseInt(id));
            request.setAttribute("news",news);
            request.getRequestDispatcher("/backed/wenzhangxiugai.jsp").forward(request,response);
        }else if("updateNews".equals(opr)){
            news = new News();
            String id = request.getParameter("id");
            String title = request.getParameter("title");
            String content = request.getParameter("content");
            news.setId(Integer.parseInt(id));
            news.setTitle(title);
            news.setContent(content);
            Boolean flag = newsService.updateNews(news);
            if(flag){
                out.print("<script type=\"text/javascript\">");
                out.print("alert(\"修改新闻成功\");");
                out.print("open( \"/backed/wenzhangliebiao.jsp\",\"_self\");");
                out.print("</script>");
            }
        }else if("addNews".equals(opr)){
            news = new News();
            String title = request.getParameter("title");
            String content = request.getParameter("content");
            Date date = new Date();
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
            String createTime = simpleDateFormat.format(date);
            news.setTitle(title);
            news.setContent(content);
            news.setCreateTime(createTime);
            Boolean flag = newsService.addNews(news);
            if(flag){
                out.print("<script type=\"text/javascript\">");
                out.print("alert(\"添加新闻成功\");");
                out.print("open( \"/backed/wenzhangliebiao.jsp\",\"_self\");");
                out.print("</script>");
            }
        }else if("deleteNews".equals(opr)){
            String id = request.getParameter("id");
            Boolean flag = newsService.deleteNews(Integer.parseInt(id));
            if(flag){
                out.print("<script type=\"text/javascript\">");
                out.print("alert(\"删除新闻成功\");");
                out.print("open( \"/backed/wenzhangliebiao.jsp\",\"_self\");");
                out.print("</script>");
            }
        }
        out.flush();
        out.close();
    }
}