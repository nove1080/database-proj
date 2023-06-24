package dto;

public class ReservationDTO {
	private String num;
	private String fid;
	private String fname;
	private String mid;
	private String mname;
	private java.sql.Date reservationDate;
	private String startTime;
	private String endTime;
	
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getFid() {
		return fid;
	}
	public void setFid(String fid) {
		this.fid = fid;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public java.sql.Date getReservationDate() {
		return reservationDate;
	}
	public void setReservationDate(java.sql.Date reservationDate) {
		this.reservationDate = reservationDate;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	
}
