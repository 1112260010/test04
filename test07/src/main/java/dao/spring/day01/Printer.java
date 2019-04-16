package dao.spring.day01;

public class Printer {

    private Ink ink;
    private Paper paper;

    public void print(){
        System.out.println("用"+ink.getColor()+"颜色"+paper.getSize()+"打印机打印");
    }

    public Ink getInk() {
        return ink;
    }

    public void setInk(Ink ink) {
        this.ink = ink;
    }

    public Paper getPaper() {
        return paper;
    }

    public void setPaper(Paper paper) {
        this.paper = paper;
    }
}
