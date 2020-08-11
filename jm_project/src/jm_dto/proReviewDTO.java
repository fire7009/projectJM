package jm_dto;
/*    
이름               널?       유형            
---------------- -------- ------------- 
POST_NO          NOT NULL VARCHAR2(8)   
PROD_CD          NOT NULL VARCHAR2(8)   
CONTENT          NOT NULL VARCHAR2(300) 
PROD_GRD         NOT NULL NUMBER(1)     
FRST_RGSR_USRNO  NOT NULL VARCHAR2(8)   
FRST_RGST_DTTM   NOT NULL DATE          
LAST_PROCR_USRNO NOT NULL VARCHAR2(8)   
LAST_PROC_DTTM   NOT NULL DATE  
 */
public class proReviewDTO {
	private String post_no;
	private String prod_no;
	private String content;
	private int prod_grd;
	private String frst_rgsr_usrno;
	private String frst_rgst_dttm;
	private String last_procr_usrno;
	private String last_proc_dttm;
	
	public proReviewDTO() {
		// TODO Auto-generated constructor stub
	}

	public String getPost_no() {
		return post_no;
	}

	public void setPost_no(String post_no) {
		this.post_no = post_no;
	}

	public String getProd_no() {
		return prod_no;
	}

	public void setProd_no(String prod_no) {
		this.prod_no = prod_no;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getProd_grd() {
		return prod_grd;
	}

	public void setProd_grd(int prod_grd) {
		this.prod_grd = prod_grd;
	}

	public String getFrst_rgsr_usrno() {
		return frst_rgsr_usrno;
	}

	public void setFrst_rgsr_usrno(String frst_rgsr_usrno) {
		this.frst_rgsr_usrno = frst_rgsr_usrno;
	}

	public String getFrst_rgst_dttm() {
		return frst_rgst_dttm;
	}

	public void setFrst_rgst_dttm(String frst_rgst_dttm) {
		this.frst_rgst_dttm = frst_rgst_dttm;
	}

	public String getLast_procr_usrno() {
		return last_procr_usrno;
	}

	public void setLast_procr_usrno(String last_procr_usrno) {
		this.last_procr_usrno = last_procr_usrno;
	}

	public String getLast_proc_dttm() {
		return last_proc_dttm;
	}

	public void setLast_proc_dttm(String last_proc_dttm) {
		this.last_proc_dttm = last_proc_dttm;
	}
	
}
