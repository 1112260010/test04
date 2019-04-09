package pojo;

   /**
    * easybuy_news 实体类
    * @author liangzz
    * @date2019-03-06 09:21 
    */ 

public class News {
	 /**主键**/
	private Integer id;
	 /**标题**/
	private String title;
	 /**内容**/
	private String content;
	 /**创建时间**/
	private String createTime;

	public void setId(Integer id){
		this.id=id;
	}

	public Integer getId(){
		return id;
	}

	public void setTitle(String title){
		this.title=title;
	}

	public String getTitle(){
		return title;
	}

	public void setContent(String content){
		this.content=content;
	}

	public String getContent(){
		return content;
	}

	public void setCreateTime(String createTime){
		this.createTime=createTime;
	}

	public String getCreateTime(){
		return createTime;
	}
}

