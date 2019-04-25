// Servlet Annotated Class.java模板(带注解的Servlet)

package cn.spring.day17sm.servlet;

import cn.spring.day17sm.entity.Book;
import cn.spring.day17sm.service.BookService;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.annotation.WebServlet;

/**
 * @Description TODO
 * @ClassName BookServlet
 * @Author wtc
 * @Date 2019/4/19 11:51
 * @Version V1.0
 */
@WebServlet(name = "BookServlet", urlPatterns = "/BookServlet")
public class BookServlet extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, java.io.IOException {
        request.setCharacterEncoding("UTF-8");  // 处理post请求乱码问题
        doGet(request, response);
    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, java.io.IOException {
        response.setContentType("text/html;charset=UTF-8"); // 处理响应乱码问题:字节流需getBytes("UTF-8")
        // str = new String(str.getBytes("ISO-8859-1"), "UTF-8");   // 处理get请求乱码问题
        /*ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext-day17.xml");*/
        ApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(this.getServletContext());
        BookService bookService = ctx.getBean("bookService", BookService.class);
        Book book = new Book();
        book.setBookname(request.getParameter("bookname"));
        book.setBookprice(Integer.parseInt(request.getParameter("bookprice")));
        bookService.addBook(book);
        request.getRequestDispatcher("/index.jsp").forward(request,response);
        // response.getWriter().write("你好 servlet!");

    }
}