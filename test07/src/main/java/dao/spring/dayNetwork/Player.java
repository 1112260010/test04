package dao.spring.dayNetwork;

public class Player {

    private Equip armet;     //头盔
    private Equip loricae;    //铠甲
    private Equip boot;        //靴子
    private Equip ring;        //指环



    public Equip getArmet() {
        return armet;
    }

    public void setArmet(Equip armet) {
        this.armet = armet;
    }

    public Equip getLoricae() {
        return loricae;
    }

    public void setLoricae(Equip loricae) {
        this.loricae = loricae;
    }

    public Equip getBoot() {
        return boot;
    }

    public void setBoot(Equip boot) {
        this.boot = boot;
    }

    public Equip getRing() {
        return ring;
    }

    public void setRing(Equip ring) {
        this.ring = ring;
    }

    public void pint(Equip equip){
        System.out.println(equip.getName());
    }
}
