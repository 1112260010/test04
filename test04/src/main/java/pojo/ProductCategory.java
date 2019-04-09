package pojo;

import java.io.Serializable;
import java.util.List;

/**
    * easybuy_product_category 实体类
    * @author liangzz
    * @date2019-03-06 09:24 
    */ 

public class ProductCategory implements Serializable {
	 /**主键**/
	private Integer id;
	 /**名称**/
	private String name;
	 /**父级目录id**/
	private Integer parentId;
	 /**级别(1:一级 2：二级 3：三级)**/
	private Integer type;
	/**图标**/
	private String iconClass;
	//下级商品目录集合
	private List<ProductCategory> list;
	//商品集合
	private List<Product> plist;

	public void setId(Integer id){
		this.id=id;
	}

	public Integer getId(){
		return id;
	}

	public void setName(String name){
		this.name=name;
	}

	public String getName(){
		return name;
	}

	public void setParentId(Integer parentId){
		this.parentId=parentId;
	}

	public Integer getParentId(){
		return parentId;
	}

	public void setType(Integer type){
		this.type=type;
	}

	public Integer getType(){
		return type;
	}

	public void setIconClass(String iconClass){
		this.iconClass=iconClass;
	}

	public String getIconClass(){
		return iconClass;
	}

	public List<ProductCategory> getList() {
		return list;
	}

	public void setList(List<ProductCategory> list) {
		this.list = list;
	}

	public List<Product> getPlist() {
		return plist;
	}

	public void setPlist(List<Product> plist) {
		this.plist = plist;
	}
}

