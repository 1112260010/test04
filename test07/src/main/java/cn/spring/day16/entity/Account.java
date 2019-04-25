package cn.spring.day16.entity;
//账户
public class Account {
    private Integer aid;
    private String aname;
    private Double abalance;

    public Integer getAid() {
        return aid;
    }

    public void setAid(Integer aid) {
        this.aid = aid;
    }

    public String getAname() {
        return aname;
    }

    public void setAname(String aname) {
        this.aname = aname;
    }

    public Double getAbalance() {
        return abalance;
    }

    public void setAbalance(Double abalance) {
        this.abalance = abalance;
    }
}
