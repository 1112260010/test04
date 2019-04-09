// Servlet Annotated Class.java模板(带注解的Servlet)

package servlet;

import com.alibaba.fastjson.JSON;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import pojo.PageParams;
import pojo.Product;
import pojo.ProductCategory;
import service.ProductCategoryService;
import service.impl.ProductCategoryServiceImpl;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

/**
 * @Description TODO
 * @ClassName ProductBackServlet
 * @Author wtc
 * @Date 2019/3/24 11:11
 * @Version V1.0
 */
@WebServlet(name = "ProductBackServlet", urlPatterns = "/ProductBackServlet")
public class ProductBackServlet extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, java.io.IOException {
        request.setCharacterEncoding("UTF-8");  // 处理post请求乱码问题
        doGet(request, response);
    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, java.io.IOException {
        response.setContentType("text/html;charset=UTF-8"); // 处理响应乱码问题:字节流需getBytes("UTF-8")
        // str = new String(str.getBytes("ISO-8859-1"), "UTF-8");   // 处理get请求乱码问题
        // response.getWriter().write("你好 servlet!");
        ProductCategoryService productCategoryService = new ProductCategoryServiceImpl();
        HttpSession session = request.getSession();
        String opr = request.getParameter("opr");
        PrintWriter out = response.getWriter();
        PageParams pageParams = null;
        ProductCategory productCategory = null;
        if("getAllProductCategory".equals(opr)){
            pageParams = new PageParams();
            String pageSize = request.getParameter("pageSize");
            String pageIndex = request.getParameter("pageIndex");
            String type = request.getParameter("type");
            pageParams.setPageSize(Integer.parseInt(pageSize));
            pageParams.setPageIndex(Integer.parseInt(pageIndex));
            PageParams pp = productCategoryService.selectByType(Integer.parseInt(type),pageParams);
            String data = JSON.toJSONString(pp);
            out.print(data);
        }else if("selectProductCategoryByName".equals(opr)){
            pageParams = new PageParams();
            String pageSize = request.getParameter("pageSize");
            String pageIndex = request.getParameter("pageIndex");
            String type = request.getParameter("type");
            String likeName = request.getParameter("likeName");
            pageParams.setPageIndex(Integer.parseInt(pageIndex));
            pageParams.setPageSize(Integer.parseInt(pageSize));
            PageParams pp = productCategoryService.selectProductCategoryByName(likeName,Integer.parseInt(type),pageParams);
            String data = JSON.toJSONString(pp);
            out.print(data);
        }else if("addProductCategory".equals(opr)){            //添加商品菜单
            productCategory = new ProductCategory();
            String type = request.getParameter("type");
            String parentId = request.getParameter("parentId");
            String name = request.getParameter("name");
            productCategory.setParentId(Integer.parseInt(parentId));
            productCategory.setType(Integer.parseInt(type));
            productCategory.setName(name);
            Boolean flag = productCategoryService.addProductCategory(productCategory);
            if(flag){
                out.print("<script type=\"text/javascript\">");
                if(type.equals("1")){
                    out.print("alert(\"添加一级菜单成功\");");
                    out.print("open( \"/backed/yijifenlei.jsp\",\"_self\");");
                }else if(type.equals("2")){
                    out.print("alert(\"添加二级菜单成功\");");
                    out.print("open( \"/backed/erjifenlei.jsp\",\"_self\");");
                }else if(type.equals("3")){
                    out.print("alert(\"添加三级菜单成功\");");
                    out.print("open( \"/backed/sanjifenlei.jsp\",\"_self\");");
                }
                out.print("</script>");
            }
        }else if("selectProductCategoryById".equals(opr)){        //根据id查询商品菜单
            String choose = request.getParameter("choose");
            String id = request.getParameter("id");
            String type = request.getParameter("type");
            productCategory = productCategoryService.selectProductCategoryById(Integer.parseInt(id));
            request.setAttribute("pro",productCategory);
            if("add".equals(choose)){
                if(type.equals("1")){
                    request.getRequestDispatcher("/backed/tianjiaerjifenlei.jsp").forward(request,response);
                }else if(type.equals("2")){
                    request.getRequestDispatcher("/backed/tianjiasanjifenl.jsp").forward(request,response);
                }
            }else if("update".equals(choose)){
                if(type.equals("1")){
                    request.getRequestDispatcher("/backed/xiugaiyijifenlei.jsp").forward(request,response);
                }else if(type.equals("2")){
                    request.getRequestDispatcher("/backed/xiugaierjifenlei.jsp").forward(request,response);
                }else if(type.equals("3")){
                    request.getRequestDispatcher("/backed/xiugaisanjifenlei.jsp").forward(request,response);
                }

            }
        }else if("updateProductCategory".equals(opr)){
            String name = request.getParameter("name");
            String id = request.getParameter("id");
            String type = request.getParameter("type");
            Boolean flag = productCategoryService.updateProductCategory(name,Integer.parseInt(id));
            if(flag){
                out.print("<script type=\"text/javascript\">");
                if(type.equals("1")){
                    out.print("alert(\"修改一级菜单成功\");");
                    out.print("open( \"/backed/yijifenlei.jsp\",\"_self\");");
                }else if(type.equals("2")){
                    out.print("alert(\"修改二级菜单成功\");");
                    out.print("open( \"/backed/erjifenlei.jsp\",\"_self\");");
                }else if(type.equals("3")){
                    out.print("alert(\"修改三级菜单成功\");");
                    out.print("open( \"/backed/sanjifenlei.jsp\",\"_self\");");
                }
                out.print("</script>");
            }
        }else if("deleteProductCategory".equals(opr)){
            String id = request.getParameter("id");
            String type = request.getParameter("type");
            Boolean flag = productCategoryService.deleteProductCategory(Integer.parseInt(id));
            if(flag){
                out.print("<script type=\"text/javascript\">");
                if(type.equals("1")){
                    out.print("alert(\"删除一级菜单成功\");");
                    out.print("open( \"/backed/yijifenlei.jsp\",\"_self\");");
                }else if(type.equals("2")){
                    out.print("alert(\"删除二级菜单成功\");");
                    out.print("open( \"/backed/erjifenlei.jsp\",\"_self\");");
                }else if(type.equals("3")){
                    out.print("alert(\"删除三级菜单成功\");");
                    out.print("open( \"/backed/sanjifenlei.jsp\",\"_self\");");
                }
                out.print("</script>");
            }
        }else if("getAllProduct".equals(opr)){
            Integer isDelete = 0;
            pageParams = new PageParams();
            String pageSize = request.getParameter("pageSize");
            String pageIndex = request.getParameter("pageIndex");
            pageParams.setPageSize(Integer.parseInt(pageSize));
            pageParams.setPageIndex(Integer.parseInt(pageIndex));
            PageParams pp = productCategoryService.getAllProduct(pageParams,isDelete);
            String data = JSON.toJSONString(pp);
            out.print(data);
        }else if("selectProductByName".equals(opr)){
            Integer isDelete = 0;
            pageParams = new PageParams();
            String pageSize = request.getParameter("pageSize");
            String pageIndex = request.getParameter("pageIndex");
            String likeName = request.getParameter("likeName");
            pageParams.setPageIndex(Integer.parseInt(pageIndex));
            pageParams.setPageSize(Integer.parseInt(pageSize));
            PageParams pp = productCategoryService.selectProductByName(likeName,pageParams,isDelete);
            String data = JSON.toJSONString(pp);
            out.print(data);
        }else if("selectProductById".equals(opr)){
            String id = request.getParameter("id");
            Product product = productCategoryService.selectById(Integer.parseInt(id));
            request.setAttribute("product",product);
            request.getRequestDispatcher("/backed/xiugaichanpin.jsp").forward(request,response);
        }else if("updateProduct".equals(opr)){
            Product product = new Product();
            Integer isDelete = 0;
            String id = request.getParameter("id");
            String name = request.getParameter("name");
            String price = request.getParameter("price");
            String stock = request.getParameter("stock");
            String description = request.getParameter("description");
            product.setId(Integer.parseInt(id));
            product.setName(name);
            product.setPrice(Float.parseFloat(price));
            product.setStock(Integer.parseInt(stock));
            product.setDescription(description);
            product.setIsDelete(isDelete);
            Boolean flag = productCategoryService.updateProduct(product);
            if(flag){
                out.print("<script type=\"text/javascript\">");
                out.print("alert(\"修改商品成功\");");
                out.print("open( \"/backed/chanpinzhuanqu.jsp\",\"_self\");");
                out.print("</script>");
            }
        }else if("addProduct".equals(opr)){
            Product product = new Product();
            Integer isDelete = 0;
            product.setIsDelete(isDelete);
            //判断请求类型是否是文件上传类型
            boolean bool = ServletFileUpload.isMultipartContent(request);

                /*String uploadFilePath = "E:\\ziliao\\IntelliJ IDEA 2017.2.7\\test\\test02\\src\\main\\webapp\\jsp\\";*/
            String uploadFilePath = request.getSession().getServletContext().getRealPath("/files/");
            File saveDir = new File(uploadFilePath);
            if (!saveDir.exists()) {
                saveDir.mkdir();
            }

            if(bool) {
                FileItemFactory factory = new DiskFileItemFactory(); // 实例化一个硬盘文件工厂,用来配置上传组件ServletFileUpload
                ServletFileUpload upload = new ServletFileUpload(factory);//实例化上传组件
                try {
                    //解析form表单中所有文件
                    List<FileItem> items = upload.parseRequest(request);
                    Iterator<FileItem> iter = items.iterator();
                    while (iter.hasNext()) {         //依次处理每个文件
                        FileItem item = (FileItem) iter.next();
                        if (!item.isFormField()) {     //文件表单字段
                            String fileName = item.getName();// 获得文件名(全路径)
                            if (fileName != null && !fileName.equals("")) {
                                File fullFile = new File(fileName);
                                File saveFile = new File(uploadFilePath, fullFile.getName());//将文件保存到指定的路径
                                item.write(saveFile);
                                System.out.println(uploadFilePath);
                                String uploadFileName = fullFile.getName();
                                product.setFileName(uploadFileName);
                                System.out.println("上传成功");
                            }
                        } else {            //普通表单字段
                            String fieldName = item.getFieldName();// 获得表单字段德name属性值
                            if (fieldName.equals("name")) {
                                product.setName(item.getString("utf-8"));
                            } else if (fieldName.equals("price")) {
                                product.setPrice(Float.parseFloat(item.getString()));
                            } else if (fieldName.equals("stock")) {
                                product.setStock(Integer.parseInt(item.getString()));
                            } else if (fieldName.equals("categoryLevel1Id")) {
                                product.setCategoryLevel1Id(Integer.parseInt(item.getString()));
                            } else if (fieldName.equals("categoryLevel2Id")) {
                                product.setCategoryLevel2Id(Integer.parseInt(item.getString()));
                            } else if (fieldName.equals("categoryLevel3Id")) {
                                product.setCategoryLevel3Id(Integer.parseInt(item.getString()));
                            }else if (fieldName.equals("description")) {
                                product.setDescription(item.getString("utf-8"));
                            }
                        }
                    }
                } catch (FileUploadException e) {
                    e.printStackTrace();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
            System.out.println(product.getDescription());
            Boolean flag = productCategoryService.addProduct(product);
            if(flag){
                out.print("<script type=\"text/javascript\">");
                out.print("alert(\"添加商品成功\");");
                out.print("open( \"/backed/chanpinzhuanqu.jsp\",\"_self\");");
                out.print("</script>");
            }
        }else if("selectProductCategory".equals(opr)){
            Integer isDelete = 0;
            String type = request.getParameter("type");
            String id = request.getParameter("id");
            if(id == null || id.equals("")){
                id = "0";
            }
            List<ProductCategory> list = productCategoryService.selectByParentId(Integer.parseInt(id),isDelete);
            String data = JSON.toJSONString(list);
            out.print(data);
        }else if("deleteProduct".equals(opr)){
            String id = request.getParameter("id");
            String isDelete = request.getParameter("isDelete");
            Boolean flag = productCategoryService.deleteProduct(Integer.parseInt(id),Integer.parseInt(isDelete));
            if(flag){
                out.print("<script type=\"text/javascript\">");
                out.print("alert(\"删除商品成功\");");
                out.print("open( \"/backed/chanpinzhuanqu.jsp\",\"_self\");");
                out.print("</script>");
            }
        }
        out.flush();
        out.close();

    }
}