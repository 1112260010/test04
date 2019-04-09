// Servlet Annotated Class.java模板(带注解的Servlet)

package servlet;

import com.alibaba.fastjson.JSON;
import pojo.User;
import pojo.UserAddress;
import service.UserService;
import service.impl.UserServiceImpl;
import util.Constants;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.List;

/**
 * @Description TODO
 * @ClassName UserServlet
 * @Author wtc
 * @Date 2019/3/4 16:50
 * @Version V1.0
 */
@WebServlet(name = "UserServlet", urlPatterns = "/UserServlet")
public class UserServlet extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, java.io.IOException {
        request.setCharacterEncoding("UTF-8");  // 处理post请求乱码问题
        doGet(request, response);
    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, java.io.IOException {
        response.setContentType("text/html;charset=UTF-8"); // 处理响应乱码问题:字节流需getBytes("UTF-8")
        // str = new String(str.getBytes("ISO-8859-1"), "UTF-8");   // 处理get请求乱码问题

        //获取前台传来的操作

        String opr = request.getParameter("opr");
        User user = null;
        UserService userService = new UserServiceImpl();
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        Integer type = 0;
        if("login".equals(opr)){
            String name = request.getParameter("loginName");
            String pwd = request.getParameter("password");

            user = new User();
            user.setLoginName(name);
            user.setPassword(pwd);
            //获取后台传来的对象
            User eu = userService.doLogin(user);
            if(eu == null){
                out.print("<script type=\"text/javascript\">");
                out.print("alert(\"用户名密码错误，请重新登录\");");
                out.print("open(\""
                        + "/Login.jsp\",\"_self\");");
                out.print("</script>");
            }else{
                Integer ty = eu.getType();
                if(ty == 0){
                    session.setAttribute("eu",eu);
              /*  request.getSession().setMaxInactiveInterval(30);*/
                    response.sendRedirect("/index.jsp");
                }else{
                    out.print("<script type=\"text/javascript\">");
                    out.print("alert(\"这是管理员账号，不能登录购物页面，请重新登陆\");");
                    out.print("open(\""
                            + "/Login.jsp\",\"_self\");");
                    out.print("</script>");
                }
            }
        }else if("loginOut".equals(opr)){
            User u = (User)session.getAttribute("eu");
            session.removeAttribute("eu");
            String str = "";
            if(session.getAttribute("eu") == null){
                str = "success";
            }else{
                str = "error";
            }
            out.print(str);
            /*if(request.getSession().getAttribute("easybuyUser") == null) {
                request.getRequestDispatcher("/index.jsp").forward(request,response);
            }*/
        }else if("register".equals(opr)){
            user = new User();
            String loginName = request.getParameter("loginName");
            String userName = request.getParameter("userName");
            String password = request.getParameter("password");
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
                    out.print("open( \"/Login.jsp\",\"_self\");");
                    out.print("</script>");
                }else{
                    out.print("<script type=\"text/javascript\">");
                    out.print("alert(\"用户注册失败，请重新注册\");");
                    out.print("open( '/Regist.jsp','_self');");
                    out.print("</script>");
                }
        }else if("selectByLoginName".equals(opr)){
            String name = request.getParameter("loginName");
            Boolean flag = userService.selectByName(name);
            String data = "";
            if(flag){
                data = "error";
                out.print(data);
            }
        }else if("selectByUserId".equals(opr)){
            String userId = request.getParameter("userId");
            List<UserAddress> list = userService.selectByUserId(Integer.parseInt(userId));
            session.setAttribute("addressList",list);
            request.getRequestDispatcher("/BuyCar_Two.jsp").forward(request,response);
        }else if("addAddress".equals(opr)){
            UserAddress userAddress = new UserAddress();
            Integer isDefault = null;
            List<UserAddress> list = (List<UserAddress>) session.getAttribute("addressList");
            if(list.size() == 0){
                isDefault = 1;
            }else{
                isDefault = 0;
            }
            String userId = request.getParameter("userId");
            String address = request.getParameter("address");
            String remark = request.getParameter("remark");
            userAddress.setUserId(Integer.parseInt(userId));
            userAddress.setAddress(address);
            userAddress.setIsDefault(isDefault);
            userAddress.setRemark(remark);
            Boolean flag = userService.addAddress(userAddress);
            List<UserAddress> list1 = null;
            if(flag){
                list1 = userService.selectByUserId(Integer.parseInt(userId));
                session.setAttribute("addressList",list1);
                if(list1.size() > 1){
                    response.sendRedirect("/Member_Address.jsp");
                }else{
                    response.sendRedirect("/BuyCar_Two.jsp");
                }
            }else{
                out.print("<script type=\"text/javascript\">");
                out.print("alert(\"添加地址失败，请重新添加\");");
                out.print("open( '/Member_Address.jsp','_self');");
                out.print("</script>");
            }
        }else if("selectById".equals(opr)){
            String id = request.getParameter("id");
            UserAddress userAddress = userService.selectById(Integer.parseInt(id));
            String data = JSON.toJSONString(userAddress);
            out.print(data);
        }else if("updateAddress".equals(opr)){
            UserAddress userAddress = new UserAddress();
            String id = request.getParameter("id");
            String address = request.getParameter("address");
            String remark = request.getParameter("remark");
            String userId = request.getParameter("userId");
            userAddress.setId(Integer.parseInt(id));
            userAddress.setAddress(address);
            userAddress.setRemark(remark);
            Boolean flag = userService.updateAddress(userAddress);
            if(flag){
                List<UserAddress> list = userService.selectByUserId(Integer.parseInt(userId));
                session.setAttribute("addressList",list);
                response.sendRedirect("/Member_Address.jsp");
            }
        }else if("deleteById".equals(opr)){
            String id = request.getParameter("id");
            String userId = request.getParameter("userId");
            Boolean flag = userService.deleteById(Integer.parseInt(id));
            if(flag){
                List<UserAddress> list = userService.selectByUserId(Integer.parseInt(userId));
                session.setAttribute("addressList",list);
                response.sendRedirect("/Member_Address.jsp");
            }
        }else if("updateIsDefault".equals(opr)){
            String id = request.getParameter("id");
            String userId = request.getParameter("userId");
            String isDefault = request.getParameter("isDefault");
            Boolean flag = userService.updateIsDefault(Integer.parseInt(id),Integer.parseInt(userId));
            if(flag){
                List<UserAddress> list = userService.selectByUserId(Integer.parseInt(userId));
                session.setAttribute("addressList",list);
                response.sendRedirect("/Member_Address.jsp");
            }
        }
        out.flush();
        out.close();

    }
}