package jm_dto;

import oracle.sql.DATE;

/*
 이름               널?       유형           
---------------- -------- ------------ 
CTGR_CD          NOT NULL VARCHAR2(8)  
CTGR_NM          NOT NULL VARCHAR2(30) 
UZ_YN            NOT NULL CHAR(1)      
DEL_YN           NOT NULL CHAR(1)      
FRST_RGSR_USRNO  NOT NULL VARCHAR2(8)  
FRST_RGST_DTTM   NOT NULL DATE         
LAST_PROCR_USRNO NOT NULL VARCHAR2(8)  
LAST_PROC_DTTM   NOT NULL DATE   
 */
public class prodCtgrInfoDTO {
	private String ctgrCd;
	private String ctgrNm;
	private char uzYn;
	private char delYn;
	private String frstRgsrUsrno;
	private String frstRgstDttm;
	private String lastProcrUsrno;
	private String lastProcDttm;
	
	public prodCtgrInfoDTO() {
		// TODO Auto-generated constructor stub
	}

	public String getCtgrCd() {
		return ctgrCd;
	}

	public void setCtgrCd(String ctgrCd) {
		this.ctgrCd = ctgrCd;
	}

	public String getCtgrNm() {
		return ctgrNm;
	}

	public void setCtgrNm(String ctgrNm) {
		this.ctgrNm = ctgrNm;
	}

	public char getUzYn() {
		return uzYn;
	}

	public void setUzYn(char uzYn) {
		this.uzYn = uzYn;
	}

	public char getDelYn() {
		return delYn;
	}

	public void setDelYn(char delYn) {
		this.delYn = delYn;
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
