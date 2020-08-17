package jm_dto;

public class OrderInfoDTO {
	private String ordNo;
	private int ordSumQty;
	private int ordSumAmt;
	private String rcvrNm;
	private String dlvrPostCd;
	private String dlvrBasAddr;
	private String dlvrDetlAddr;
	private String ordCnclYn;
	private String frstRgsrUsno;
	private String frstRgstDttm;
	private String lastProcrUsrno;
	private String lastProcDttm;
	
	public OrderInfoDTO() {
		// TODO Auto-generated constructor stub
	}

	public String getOrdNo() {
		return ordNo;
	}

	public void setOrdNo(String ordNo) {
		this.ordNo = ordNo;
	}

	public int getOrdSumQty() {
		return ordSumQty;
	}

	public void setOrdSumQty(int ordSumQty) {
		this.ordSumQty = ordSumQty;
	}

	public int getOrdSumAmt() {
		return ordSumAmt;
	}

	public void setOrdSumAmt(int ordSumAmt) {
		this.ordSumAmt = ordSumAmt;
	}

	public String getRcvrNm() {
		return rcvrNm;
	}

	public void setRcvrNm(String rcvrNm) {
		this.rcvrNm = rcvrNm;
	}

	public String getDlvrPostCd() {
		return dlvrPostCd;
	}

	public void setDlvrPostCd(String dlvrPostCd) {
		this.dlvrPostCd = dlvrPostCd;
	}

	public String getDlvrBasAddr() {
		return dlvrBasAddr;
	}

	public void setDlvrBasAddr(String dlvrBasAddr) {
		this.dlvrBasAddr = dlvrBasAddr;
	}

	public String getDlvrDetlAddr() {
		return dlvrDetlAddr;
	}

	public void setDlvrDetlAddr(String dlvrDetlAddr) {
		this.dlvrDetlAddr = dlvrDetlAddr;
	}

	public String getOrdCnclYn() {
		return ordCnclYn;
	}

	public void setOrdCnclYn(String ordCnclYn) {
		this.ordCnclYn = ordCnclYn;
	}

	public String getFrstRgsrUsno() {
		return frstRgsrUsno;
	}

	public void setFrstRgsrUsno(String frstRgsrUsno) {
		this.frstRgsrUsno = frstRgsrUsno;
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
