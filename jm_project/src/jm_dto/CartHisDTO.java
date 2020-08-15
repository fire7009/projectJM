package jm_dto;

public class CartHisDTO {
	private String hisSeqno;
	private String prodCd;
	private int prodQty;
	private String ordYn;
	private String delYn;
	private String frstRgsrUsrno;
	private String frstRgstDttm;
	private String lastProcrUsrno;
	private String lastProcDttm;
	
	public CartHisDTO() {
		
	}

	
	public String getHisSeqno() {
		return hisSeqno;
	}

	public void setHisSeqno(String hisSeqno) {
		this.hisSeqno = hisSeqno;
	}

	public String getProdCd() {
		return prodCd;
	}

	public void setProdCd(String prodCd) {
		this.prodCd = prodCd;
	}

	public int getProdQty() {
		return prodQty;
	}

	public void setProdQty(int prodQty) {
		this.prodQty = prodQty;
	}

	public String getOrdYn() {
		return ordYn;
	}

	public void setOrdYn(String ordYn) {
		this.ordYn = ordYn;
	}

	public String getDelYn() {
		return delYn;
	}

	public void setDelYn(String delYn) {
		this.delYn = delYn;
	}

	public String getFrstRgsrUsrno() {
		return frstRgsrUsrno;
	}

	public void setFrstRgsrUsrno(String firstRgsrUsrno) {
		this.frstRgsrUsrno = frstRgsrUsrno;
	}

	public String getFrstRgstDttm() {
		return frstRgstDttm;
	}

	public void setFrstRgstDttm(String firstRgstDttm) {
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
