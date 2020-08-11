package jm_dto;
/*
 이름               널?       유형           
---------------- -------- ------------ 
CODE_ID          NOT NULL VARCHAR2(4)  
GRP_CDID         NOT NULL VARCHAR2(4)  
CODE_NM          NOT NULL VARCHAR2(30) 
GRP_CDNM         NOT NULL VARCHAR2(36) 
UZ_YN            NOT NULL CHAR(1)      
FRST_RGSR_USRNO  NOT NULL VARCHAR2(8)  
FRST_RGST_DTTM   NOT NULL DATE         
LAST_PROCR_USRNO NOT NULL VARCHAR2(8)  
LAST_PROC_DTTM   NOT NULL DATE  
 */
public class commonCodeDTO {
	private String code_id;
	private String grp_cdid;
	private String code_nm;
	private String grp_cdnm;
	private char uz_yn;
	private String frst_rgsr_usrno;
	private String frst_rgst_dttm;
	private String last_procr_usrno;
	private String last_proc_dttm;
	
	public commonCodeDTO() {
		// TODO Auto-generated constructor stub
	}

	public String getCode_id() {
		return code_id;
	}

	public void setCode_id(String code_id) {
		this.code_id = code_id;
	}

	public String getGrp_cdid() {
		return grp_cdid;
	}

	public void setGrp_cdid(String grp_cdid) {
		this.grp_cdid = grp_cdid;
	}

	public String getCode_nm() {
		return code_nm;
	}

	public void setCode_nm(String code_nm) {
		this.code_nm = code_nm;
	}

	public String getGrp_cdnm() {
		return grp_cdnm;
	}

	public void setGrp_cdnm(String grp_cdnm) {
		this.grp_cdnm = grp_cdnm;
	}

	public char getUz_yn() {
		return uz_yn;
	}

	public void setUz_yn(char uz_yn) {
		this.uz_yn = uz_yn;
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
