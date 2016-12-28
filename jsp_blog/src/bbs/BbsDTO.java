package bbs;

public class BbsDTO {
	   
	  private int bbsno; /** 번호 */	  
	  private String wname; /** 글쓴이 */ 	 
	  private String title;  /** 제목 */ 	
	  private String content;   /** 내용 */  
	  private String passwd;  /** 패스워드 */ 	  
	  private int viewcnt;  /** 조회수 */ 	
	  private String wdate;   /** 등록일 */ 	
	  private int grpno;    /** 그룹 번호 */ 	
	  private int indent;   /** 답변 차수 */ 	  
	  private int ansnum;   /** 답변 순서 */
	  private String filename;  /** 업로드파일 이름 */
	  private int filesize;  /** 업로드파일 크기 */
	 //
	  public int getBbsno() {
		return bbsno;
	}	  
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public int getFilesize() {
		return filesize;
	}
	public void setFilesize(int filesize) {
		this.filesize = filesize;
	}
	public void setBbsno(int bbsno) {
		this.bbsno = bbsno;
	}
	public String getWname() {
		return wname;
	}
	public void setWname(String wname) {
		this.wname = wname;
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
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public int getViewcnt() {
		return viewcnt;
	}
	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}
	public String getWdate() {
		return wdate;
	}
	public void setWdate(String wdate) {
		this.wdate = wdate;
	}
	public int getGrpno() {
		return grpno;
	}
	public void setGrpno(int grpno) {
		this.grpno = grpno;
	}
	public int getIndent() {
		return indent;
	}
	public void setIndent(int indent) {
		this.indent = indent;
	}
	public int getAnsnum() {
		return ansnum;
	}
	public void setAnsnum(int ansnum) {
		this.ansnum = ansnum;
	}
}
