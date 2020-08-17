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
public class ProdReviewDTO {
	private String postNo;
	private String prodCd;
	private String content;
	private int prodGrd;
	private String frstRgsrUsrno;
	private String frstRgstDttm;
	private String lastProcrUsrno;
	private String lastProcDttm;
	
	public ProdReviewDTO() {
		// TODO Auto-generated constructor stub
	}

	public String getPostNo() {
		return postNo;
	}

	public void setPostNo(String postNo) {
		this.postNo = postNo;
	}

	public String getProdCd() {
		return prodCd;
	}

	public void setProdCd(String prodCd) {
		this.prodCd = prodCd;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getProdGrd() {
		return prodGrd;
	}

	public void setProdGrd(int prodGrd) {
		this.prodGrd = prodGrd;
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
