package pojo;

   /**
    * easybuy_order_detail 实体类
    * @author liangzz
    * @date2019-03-06 09:23 
    */ 

public class OrderDetail {
	 /**主键**/
	private Integer id;
	 /**订单主键**/
	private Integer orderId;
	 /**商品主键**/
	private Integer productId;
	 /**数量**/
	private Integer quantity;
	 /**消费**/
	private Float cost;

	public void setId(Integer id){
		this.id=id;
	}

	public Integer getId(){
		return id;
	}

	public void setOrderId(Integer orderId){
		this.orderId=orderId;
	}

	public Integer getOrderId(){
		return orderId;
	}

	public void setProductId(Integer productId){
		this.productId=productId;
	}

	public Integer getProductId(){
		return productId;
	}

	public void setQuantity(Integer quantity){
		this.quantity=quantity;
	}

	public Integer getQuantity(){
		return quantity;
	}

	public void setCost(Float cost){
		this.cost=cost;
	}

	public Float getCost(){
		return cost;
	}
}

