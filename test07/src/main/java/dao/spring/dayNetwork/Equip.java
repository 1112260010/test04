package dao.spring.dayNetwork;

/**
 * 装备类
 */
public class Equip {
    private String name;       //名称
    private String type;       //类型（头盔、铠甲）
    private Integer speedPlus;   //速度增效
    private Integer attackPlus;  //攻击增效
    private Integer defencePlus;  //防御增效

    @Override
    public String toString() {
        return "Equip{" +
                "name='" + name + '\'' +
                ", type='" + type + '\'' +
                ", speedPlus=" + speedPlus +
                ", attackPlus=" + attackPlus +
                ", defencePlus=" + defencePlus +
                '}';
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Integer getSpeedPlus() {
        return speedPlus;
    }

    public void setSpeedPlus(Integer speedPlus) {
        this.speedPlus = speedPlus;
    }

    public Integer getAttackPlus() {
        return attackPlus;
    }

    public void setAttackPlus(Integer attackPlus) {
        this.attackPlus = attackPlus;
    }

    public Integer getDefencePlus() {
        return defencePlus;
    }

    public void setDefencePlus(Integer defencePlus) {
        this.defencePlus = defencePlus;
    }
}
