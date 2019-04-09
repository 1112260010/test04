package filter;

import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;

@WebFilter(filterName = "UserFilter",urlPatterns = "/backed/index.jsp")
public class UserFilter implements javax.servlet.Filter {
    public void destroy() {
    }

    public void doFilter(javax.servlet.ServletRequest req, javax.servlet.ServletResponse resp, javax.servlet.FilterChain chain) throws javax.servlet.ServletException, java.io.IOException {

        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse)resp;
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        PrintWriter out = response.getWriter();
        if(session != null && session.getAttribute("user") != null){
            chain.doFilter(req, resp);
        }else{
            out.print("<script type=\"text/javascript\">");
            out.print("alert(\"管理员请先登录\");");
            out.print("open(\""
                    + "/backed/logins.jsp\",\"_self\");");
            out.print("</script>");
        }
    }

    public void init(javax.servlet.FilterConfig config) throws javax.servlet.ServletException {

    }

}
