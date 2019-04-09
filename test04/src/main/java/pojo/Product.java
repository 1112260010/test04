package pojo;

import java.io.Serializable;
import java.util.List;

/**
    * easybuy_product 实体类
    * @author liangzz
    * @date2019-03-06 09:20 
    */ 

public class Product implements Serializable{


	private static final long serialVersionUID = -2429406856980416465L;
	/**主键**/
	private Integer id;
	 /**名称**/
	private String name;
	 /**描述**/
	private String description;
	 /**价格**/
	private Float price;
	 /**库存**/
	private Integer stock;
	 /**分类1**/
	private Integer categoryLevel1Id;
	 /**分类2**/
	private Integer categoryLevel2Id;
	 /**分类3**/
	private Integer categoryLevel3Id;
	 /**文件名称**/
	private String fileName;
	 /**是否删除(1：删除 0：未删除)**/
	private Integer isDelete;
	//商品列表类集合
	private List<ProductCategory> list;

	public Integer getPoint() {
		return point;
	}

	public static long getSerialVersionUID() {
		return serialVersionUID;
	}

	public void setPoint(Integer point) {
		this.point = point;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public Integer getSize() {
		return size;
	}

	public void setSize(Integer size) {
		this.size = size;
	}

	private Integer point;       //积分
	private String color;        //颜色
	private Integer size;        //容量大小

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

	public void setDescription(String description){
		this.description=description;
	}

	public String getDescription(){
		return description;
	}

	public void setPrice(Float price){
		this.price=price;
	}

	public Float getPrice(){
		return price;
	}

	public void setStock(Integer stock){
		this.stock=stock;
	}

	public Integer getStock(){
		return stock;
	}

	public void setCategoryLevel1Id(Integer categoryLevel1Id){
		this.categoryLevel1Id=categoryLevel1Id;
	}

	public Integer getCategoryLevel1Id(){
		return categoryLevel1Id;
	}

	public void setCategoryLevel2Id(Integer categoryLevel2Id){
		this.categoryLevel2Id=categoryLevel2Id;
	}

	public Integer getCategoryLevel2Id(){
		return categoryLevel2Id;
	}

	public void setCategoryLevel3Id(Integer categoryLevel3Id){
		this.categoryLevel3Id=categoryLevel3Id;
	}

	public Integer getCategoryLevel3Id(){
		return categoryLevel3Id;
	}

	public void setFileName(String fileName){
		this.fileName=fileName;
	}

	public String getFileName(){
		return fileName;
	}

	public void setIsDelete(Integer isDelete){
		this.isDelete=isDelete;
	}

	public Integer getIsDelete(){
		return isDelete;
	}

	public List<ProductCategory> getList() {
		return list;
	}

	public void setList(List<ProductCategory> list) {
		this.list = list;
	}
}

