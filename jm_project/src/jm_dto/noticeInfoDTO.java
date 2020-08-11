package jm_dto;
/*
 이름               널?       유형            
---------------- -------- ------------- 
POST_NO          NOT NULL VARCHAR2(8)   
TITLE            NOT NULL VARCHAR2(120) 
CONTENT          NOT NULL VARCHAR2(300) 
VIEW_CNT         NOT NULL NUMBER        
NOTICE_YN        NOT NULL CHAR(1)       
FRST_RGSR_USRNO  NOT NULL VARCHAR2(8)   
FRST_RGST_DTTM   NOT NULL DATE          
LAST_PROCR_USRNO NOT NULL VARCHAR2(8)   
LAST_PROC_DTTM   NOT NULL DATE 
 */
public class noticeInfoDTO {
	private String post_no;
	private String title;
	private String content;
	private int view_cnt;
	private char notice_yn;
	private String frst_rgsr_usrno;
	private String frst_rgst_dttm;
	private String last_procr_usrno;
	private String last_proc_dttm;
	
	public noticeInfoDTO() {
		// TODO Auto-generated constructor stub
	}

	public String getPost_no() {
		return post_no;
	}

	public void setPost_no(String post_no) {
		this.post_no = post_no;
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

	public int getView_cnt() {
		return view_cnt;
	}

	public void setView_cnt(int view_cnt) {
		this.view_cnt = view_cnt;
	}

	public char getNotice_yn() {
		return notice_yn;
	}

	public void setNotice_yn(char notice_yn) {
		this.notice_yn = notice_yn;
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
