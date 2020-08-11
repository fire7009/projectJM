package jm_dto;

public class CartHisDTO {
	private String his_seqno;
	private String prod_cd;
	private int prod_qty;
	private String ord_yn;
	private String del_yn;
	private String first_rgsr_usrno;
	private String first_rgsr_dttm;
	private String last_procr_usrno;
	private String last_proc_dttm;
	
	public CartHisDTO() {
		// TODO Auto-generated constructor stub
	}

	public String getHis_seqno() {
		return his_seqno;
	}

	public void setHis_seqno(String his_seqno) {
		this.his_seqno = his_seqno;
	}

	public String getProd_cd() {
		return prod_cd;
	}

	public void setProd_cd(String prod_cd) {
		this.prod_cd = prod_cd;
	}

	public int getProd_qty() {
		return prod_qty;
	}

	public void setProd_qty(int prod_qty) {
		this.prod_qty = prod_qty;
	}

	public String getOrd_yn() {
		return ord_yn;
	}

	public void setOrd_yn(String ord_yn) {
		this.ord_yn = ord_yn;
	}

	public String getDel_yn() {
		return del_yn;
	}

	public void setDel_yn(String del_yn) {
		this.del_yn = del_yn;
	}

	public String getFirst_rgsr_usrno() {
		return first_rgsr_usrno;
	}

	public void setFirst_rgsr_usrno(String first_rgsr_usrno) {
		this.first_rgsr_usrno = first_rgsr_usrno;
	}

	public String getFirst_rgsr_dttm() {
		return first_rgsr_dttm;
	}

	public void setFirst_rgsr_dttm(String first_rgsr_dttm) {
		this.first_rgsr_dttm = first_rgsr_dttm;
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
