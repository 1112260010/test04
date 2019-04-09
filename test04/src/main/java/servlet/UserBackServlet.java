// Servlet Annotated Class.java模板(带注解的Servlet)

package servlet;

import com.alibaba.fastjson.JSON;
import pojo.PageParams;
import pojo.User;
import service.UserService;
import service.impl.UserServiceImpl;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.List;

/**
 * @Description TODO
 * @ClassName UserBackServlet
 * @Author wtc
 * @Date 2019/3/22 11:21
 * @Version V1.0
 */
@WebServlet(name = "UserBackServlet", urlPatterns = "/UserBackServlet")
public class UserBackServlet extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, java.io.IOException {
        request.setCharacterEncoding("UTF-8");  // 处理post请求乱码问题
        doGet(request, response);
    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, java.io.IOException {
        response.setContentType("text/html;charset=UTF-8"); // 处理响应乱码问题:字节流需getBytes("UTF-8")
        // str = new String(str.getBytes("ISO-8859-1"), "UTF-8");   // 处理get请求乱码问题
        // response.getWriter().write("你好 servlet!");
        String opr = request.getParameter("opr");
        UserService userService = new UserServiceImpl();
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        User user = null;
        Integer type = 1;
        PageParams pageParams = null;
        if("register".equals(opr)){
            user = new User();
            String loginName = request.getParameter("loginName");
            String userName = request.getParameter("userName");
            String password = request.getParameter("password1");
            String sex = request.getParameter("sex");
            String identityCode = request.getParameter("identityCode");
            String email = request.getParameter("email");
            String mobile = request.getParameter("mobile");
            user.setLoginName(loginName);
            user.setUserName(userName);
            user.setPassword(password);
            if(sex == null){
                sex = "1";
            }
            user.setSex(Integer.parseInt(sex));
            user.setIdentityCode(identityCode);
            user.setEmail(email);
            user.setMobile(mobile);
            user.setType(type);
                if(userService.register(user)){
                    out.print("<script type=\"text/javascript\">");
                    out.print("alert(\"用户注册成功，请登录\");");
                    out.print("open( \"/backed/logins.jsp\",\"_self\");");
                    out.print("</script>");
                }else{
                    out.print("<script type=\"text/javascript\">");
                    out.print("alert(\"用户注册失败，请重新注册\");");
                    out.print("open( '/backed/tianjiaguanliyuan.jsp','_self');");
                    out.print("</script>");
                }

        }else if("selectByLoginName".equals(opr)) {
            String name = request.getParameter("loginName");
            Boolean flag = userService.selectByName(name);
            String data = "";
            if(flag){
                data = "error";
                out.print(data);
            }
        }else if("doLogin".equals(opr)){
            String name = request.getParameter("loginName");
            String pwd = request.getParameter("password");
            user = new User();
            user.setLoginName(name);
            user.setPassword(pwd);
            //获取后台传来的对象
            User eu = userService.doLogin(user);
            if(eu == null){
                out.print("<script type=\"text/javascript\">");
                out.print("alert(\"管理员登录名或密码错误，请重新登录\");");
                out.print("open(\""
                        + "/backed/logins.jsp\",\"_self\");");
                out.print("</script>");
            }else{
                Integer ty = eu.getType();
                if(ty != 1){
                    out.print("<script type=\"text/javascript\">");
                    out.print("alert(\"该用户不是管理员\");");
                    out.print("open(\""
                            + "/backed/logins.jsp\",\"_self\");");
                    out.print("</script>");
                }else{
                    session.setAttribute("user",eu);
                    response.sendRedirect("/backed/index.jsp");
                }
            }
        }else if("loginOut".equals(opr)){
            session.removeAttribute("user");
            if(session.getAttribute("user") == null){
                out.print("<script type=\"text/javascript\">");
                out.print("alert(\"注销成功\");");
                out.print("open(\""
                        + "/backed/logins.jsp\",\"_self\");");
                out.print("</script>");
            }
        }else if("selectAdmin".equals(opr)){
            pageParams = new PageParams();
            String pageSize = request.getParameter("pageSize");
            String pageIndex = request.getParameter("pageIndex");
            pageParams.setPageIndex(Integer.parseInt(pageIndex));
            pageParams.setPageSize(Integer.parseInt(pageSize));
            PageParams pp = userService.selectAdmin(type,pageParams);
            String data = JSON.toJSONString(pp);
            out.print(data);
        }else if("selectAdminById".equals(opr)){
            String id = request.getParameter("userId");
            user = userService.selectAdminById(Integer.parseInt(id));
            request.setAttribute("user",user);
            request.getRequestDispatcher("/backed/guanliyuanliebiaoxiugai.jsp").forward(request,response);
        }else if("deleteAdmin".equals(opr)){
            String id = request.getParameter("userId");
            Boolean flag = userService.deleteAdmin(Integer.parseInt(id));
            if(flag){
                out.print("<script type=\"text/javascript\">");
                out.print("alert(\"删除管理员成功\");");
                out.print("open(\""
                        + "/backed/guanliyuanliebiao.jsp\",\"_self\");");
                out.print("</script>");
            }
        }else if("updateAdmin".equals(opr)){
            String userName = request.getParameter("userName");
            String id = request.getParameter("userId");
            if(userName == null || userName.equals("")){
                out.print("<script type=\"text/javascript\">");
                out.print("alert(\"没有修改用户名\");");
                out.print("open(\""
                        + "/backed/guanliyuanliebiao.jsp\",\"_self\");");
                out.print("</script>");
            }else{
                Boolean flag = userService.updateAdmin(Integer.parseInt(id),userName);
                if(flag){
                    out.print("<script type=\"text/javascript\">");
                    out.print("alert(\"修改用户名成功\");");
                    out.print("open(\""
                            + "/backed/guanliyuanliebiao.jsp\",\"_self\");");
                    out.print("</script>");
                }
            }
        }else if("selectAdminByName".equals(opr)){
            pageParams = new PageParams();
            String likeName = request.getParameter("likeName");
            String pageSize = request.getParameter("pageSize");
            String pageIndex = request.getParameter("pageIndex");
            pageParams.setPageSize(Integer.parseInt(pageSize));
            pageParams.setPageIndex(Integer.parseInt(pageIndex));
            PageParams pp = userService.selectAdminByName(type,likeName,pageParams);
            String data = JSON.toJSONString(pp);
            out.print(data);
        }else if("selectHuiYuan".equals(opr)){
            type = 0;
            pageParams = new PageParams();
            String pageSize = request.getParameter("pageSize");
            String pageIndex = request.getParameter("pageIndex");
            pageParams.setPageIndex(Integer.parseInt(pageIndex));
            pageParams.setPageSize(Integer.parseInt(pageSize));
            PageParams pp = userService.selectAdmin(type,pageParams);
            String data = JSON.toJSONString(pp);
            out.print(data);
        }else if("selectHuiYuanByName".equals(opr)){
            type = 0;
            pageParams = new PageParams();
            String likeName = request.getParameter("likeName");
            String pageSize = request.getParameter("pageSize");
            String pageIndex = request.getParameter("pageIndex");
            pageParams.setPageIndex(Integer.parseInt(pageIndex));
            pageParams.setPageSize(Integer.parseInt(pageSize));
            PageParams pp = userService.selectAdminByName(type,likeName,pageParams);
            String data = JSON.toJSONString(pp);
            out.print(data);
        }
        out.flush();
        out.close();
    }
}