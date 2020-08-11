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
public class CommonCodeDTO {
	private String codeId;
	private String grpCdid;
	private String codeNm;
	private String grpCdnm;
	private String uzYn;
	private String frstRgsrUsrno;
	private String frstRgstDttm;
	private String lastProcrUsrno;
	private String lastProcDttm;
	
	public CommonCodeDTO() {
		// TODO Auto-generated constructor stub
	}

	public String getCodeId() {
		return codeId;
	}

	public void setCodeId(String codeId) {
		this.codeId = codeId;
	}

	public String getGrpCdid() {
		return grpCdid;
	}

	public void setGrpCdid(String grpCdid) {
		this.grpCdid = grpCdid;
	}

	public String getCodeNm() {
		return codeNm;
	}

	public void setCodeNm(String codeNm) {
		this.codeNm = codeNm;
	}

	public String getGrpCdnm() {
		return grpCdnm;
	}

	public void setGrpCdnm(String grpCdnm) {
		this.grpCdnm = grpCdnm;
	}

	public String getUzYn() {
		return uzYn;
	}

	public void setUzYn(String uzYn) {
		this.uzYn = uzYn;
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
