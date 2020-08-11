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
public class NoticeInfoDTO {
	private String postNo;
	private String title;
	private String content;
	private int viewCnt;
	private String noticeYn;
	private String frstRgsrUsrno;
	private String frstRgstDttm;
	private String lastProcrUsrno;
	private String lastProcDttm;
	
	public NoticeInfoDTO() {
		// TODO Auto-generated constructor stub
	}

	public String getPostNo() {
		return postNo;
	}

	public void setPostNo(String postNo) {
		this.postNo = postNo;
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

	public int getViewCnt() {
		return viewCnt;
	}

	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}

	public String getNoticeYn() {
		return noticeYn;
	}

	public void setNoticeYn(String noticeYn) {
		this.noticeYn = noticeYn;
	}

	public String getFrstRgsrUsrno() {
		return frstRgsrUsrno;
	}

	public void setFrstRgsrUsrno(String frstRgsrUsrno) {
		this.frstRgsrUsrno = frstRgsrUsrno;
	}

	public String getFrstRgstDttm() {
		return frstRgstDttm;
	}

	public void setFrstRgstDttm(String frstRgstDttm) {
		this.frstRgstDttm = frstRgstDttm;
	}

	public String getLastProcrUsrno() {
		return lastProcrUsrno;
	}

	public void setLastProcrUsrno(String lastProcrUsrno) {
		this.lastProcrUsrno = lastProcrUsrno;
	}

	public String getLastProcDttm() {
		return lastProcDttm;
	}

	public void setLastProcDttm(String lastProcDttm) {
		this.lastProcDttm = lastProcDttm;
	}

}
