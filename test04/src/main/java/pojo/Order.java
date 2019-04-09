package pojo;
import java.util.Date;
import java.util.List;

/**
    * easybuy_order 实体类
    * @author liangzz
    * @date2019-03-06 09:22 
    */ 

public class Order {
	 /**主键**/
	private Integer id;
	 /**用户主键**/
	private Integer userId;
	 /****/
	private String loginName;
	 /**用户地址**/
	private String userAddress;
	 /**创建时间**/
	private Date createTime;
	 /**总消费**/
	private Float cost;
	 /**订单号**/
	private String serialNumber;
	//用户
	private List<User> list;

	public List<User> getList() {
		return list;
	}

	public void setList(List<User> list) {
		this.list = list;
	}

	public void setId(Integer id){
		this.id=id;
	}

	public Integer getId(){
		return id;
	}

	public void setUserId(Integer userId){
		this.userId=userId;
	}

	public Integer getUserId(){
		return userId;
	}

	public void setLoginName(String loginName){
		this.loginName=loginName;
	}

	public String getLoginName(){
		return loginName;
	}

	public void setUserAddress(String userAddress){
		this.userAddress=userAddress;
	}

	public String getUserAddress(){
		return userAddress;
	}

	public void setCreateTime(Date createTime){
		this.createTime=createTime;
	}

	public Date getCreateTime(){
		return createTime;
	}

	public void setCost(Float cost){
		this.cost=cost;
	}

	public Float getCost(){
		return cost;
	}

	public void setSerialNumber(String serialNumber){
		this.serialNumber=serialNumber;
	}

	public String getSerialNumber(){
		return serialNumber;
	}
}

