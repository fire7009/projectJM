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
	private String ctgr_cd;
	private String ctgr_nm;
	private char uz_yn;
	private char del_yn;
	private String frst_rgsr_usrno;
	private String frst_rgst_dttm;
	private String last_procr_usrno;
	private String last_proc_dttm;
	
	public prodCtgrInfoDTO() {
		// TODO Auto-generated constructor stub
	}

	public String getCtgr_cd() {
		return ctgr_cd;
	}

	public void setCtgr_cd(String ctgr_cd) {
		this.ctgr_cd = ctgr_cd;
	}

	public String getCtgr_nm() {
		return ctgr_nm;
	}

	public void setCtgr_nm(String ctgr_nm) {
		this.ctgr_nm = ctgr_nm;
	}

	public char getUz_yn() {
		return uz_yn;
	}

	public void setUz_yn(char uz_yn) {
		this.uz_yn = uz_yn;
	}

	public char getDel_yn() {
		return del_yn;
	}

	public void setDel_yn(char del_yn) {
		this.del_yn = del_yn;
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
