package pojo;

import util.Constants;

import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;
import java.util.List;

/**
    * easybuy_user 实体类
    * @author liangzz
    * @date2019-03-04 04:46 
    */ 

public class User implements HttpSessionBindingListener{
	 /**主键**/
	private Integer id;
	 /**登录名**/
	private String loginName;
	 /**用户名**/
	private String userName;
	 /**密码**/
	private String password;
	 /**性别(1:男 0：女)**/
	private Integer sex;
	 /**身份证号**/
	private String identityCode;
	 /**邮箱**/
	private String email;
	 /**手机**/
	private String mobile;
	 /**类型（1：后台 0:前台）**/
	private Integer type;

	public void setId(Integer id){
		this.id=id;
	}

	public Integer getId(){
		return id;
	}

	public void setLoginName(String loginName){
		this.loginName=loginName;
	}

	public String getLoginName(){
		return loginName;
	}

	public void setUserName(String userName){
		this.userName=userName;
	}

	public String getUserName(){
		return userName;
	}

	public void setPassword(String password){
		this.password=password;
	}

	public String getPassword(){
		return password;
	}

	public void setSex(Integer sex){
		this.sex=sex;
	}

	public Integer getSex(){
		return sex;
	}

	public void setIdentityCode(String identityCode){
		this.identityCode=identityCode;
	}

	public String getIdentityCode(){
		return identityCode;
	}

	public void setEmail(String email){
		this.email=email;
	}

	public String getEmail(){
		return email;
	}

	public void setMobile(String mobile){
		this.mobile=mobile;
	}

	public String getMobile(){
		return mobile;
	}

	public void setType(Integer type){
		this.type=type;
	}

	public Integer getType(){
		return type;
	}

	public void valueBound(HttpSessionBindingEvent event){
		Constants.count++;
	}

	public void valueUnbound(HttpSessionBindingEvent event){
		Constants.count--;
	}
}

