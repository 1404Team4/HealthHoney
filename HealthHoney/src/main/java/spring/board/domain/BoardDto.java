package spring.board.domain;

public class BoardDto {

    private int no;
    private String title;
    private String content;
    private String writer;
    private String wdate;
    private int rcount;
    private int step;
    private int depth;
    private int ref;
   
    // 테이블에 없는 것들
    private String page;
    private int firstRow;
    private int lastRow;
   
    public int getNo() {
        return no;
    }
    public void setNo(int no) {
        this.no = no;
    }
    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }
    public String getContent() {
        return content;
    }
    public void setContent(String content) {
        this.content = content;
    }
    public String getWriter() {
        return writer;
    }
    public void setWriter(String writer) {
        this.writer = writer;
    }
    public String getWdate() {
        return wdate;
    }
    public void setWdate(String wdate) {
        this.wdate = wdate;
    }
    public int getRcount() {
        return rcount;
    }
    public void setRcount(int rcount) {
        this.rcount = rcount;
    }
    public int getStep() {
        return step;
    }
    public void setStep(int step) {
        this.step = step;
    }
    public int getDepth() {
        return depth;
    }
    public void setDepth(int depth) {
        this.depth = depth;
    }
    public int getRef() {
        return ref;
    }
    public void setRef(int ref) {
        this.ref = ref;
    }
    public String getPage() {
        return page;
    }
    public void setPage(String page) {
        this.page = page;
    }
    public int getFirstRow() {
        return firstRow;
    }
    public void setFirstRow(int firstRow) {
        this.firstRow = firstRow;
    }
    public int getLastRow() {
        return lastRow;
    }
    public void setLastRow(int lastRow) {
        this.lastRow = lastRow;
    }
   
}