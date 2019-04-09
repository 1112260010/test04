package filter;

import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;


@WebFilter(filterName = "CharacterEncodingFilter",urlPatterns = "/*",initParams = {@WebInitParam(name="encode",value="utf-8")})
public class CharacterEncodingFilter implements javax.servlet.Filter {
    private String encode = null;

    public void destroy() {
        encode = null;
    }

    public void doFilter(javax.servlet.ServletRequest req, javax.servlet.ServletResponse resp, javax.servlet.FilterChain chain) throws javax.servlet.ServletException, java.io.IOException {
        if(null == req.getCharacterEncoding()){
            req.setCharacterEncoding(encode);
        }
        chain.doFilter(req, resp);
    }

    public void init(javax.servlet.FilterConfig config) throws javax.servlet.ServletException {
        String encode = config.getInitParameter("encode");
        if(this.encode == null){
            this.encode = encode;
        }
    }

}
