package pojo;
import java.util.Date;

   /**
    * easybuy_user_address 实体类
    * @author liangzz
    * @date2019-03-06 09:24 
    */ 

public class UserAddress {
	 /**主键id**/
	private Integer id;
	 /**用户主键**/
	private Integer userId;
	 /**地址**/
	private String address;
	 /**创建时间**/
	private Date createTime;
	 /**是否是默认地址（1:是 0否）**/
	private Integer isDefault;
	 /**备注**/
	private String remark;
	//收货人
	private String userName;
	//配送区域
	private String area;
	//电子邮箱
	private String eamil;
	//手机号码
	private String mobile;
	//电话
	private String call;
	//标志建筑
	private String build;

	   public String getUserName() {
		   return userName;
	   }

	   public void setUserName(String userName) {
		   this.userName = userName;
	   }

	   public String getArea() {
		   return area;
	   }

	   public void setArea(String area) {
		   this.area = area;
	   }

	   public String getEamil() {
		   return eamil;
	   }

	   public void setEamil(String eamil) {
		   this.eamil = eamil;
	   }

	   public String getMobile() {
		   return mobile;
	   }

	   public void setMobile(String mobile) {
		   this.mobile = mobile;
	   }

	   public String getCall() {
		   return call;
	   }

	   public void setCall(String call) {
		   this.call = call;
	   }

	   public String getBuild() {
		   return build;
	   }

	   public void setBuild(String build) {
		   this.build = build;
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

	public void setAddress(String address){
		this.address=address;
	}

	public String getAddress(){
		return address;
	}

	public void setCreateTime(Date createTime){
		this.createTime=createTime;
	}

	public Date getCreateTime(){
		return createTime;
	}

	public void setIsDefault(Integer isDefault){
		this.isDefault=isDefault;
	}

	public Integer getIsDefault(){
		return isDefault;
	}

	public void setRemark(String remark){
		this.remark=remark;
	}

	public String getRemark(){
		return remark;
	}
}

