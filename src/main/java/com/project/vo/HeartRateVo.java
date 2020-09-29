package com.project.vo;

public class HeartRateVo {
	
	private int resultNo;
	private int userNo;
	private String measureDate;
    private int heartStable;
    private int heart20;
    private int heart25;
    private int heart30;
    private int heart35;
    private int heart40;
    private int heart45;
    private int heart50;
    private int heart5min;
    
    public HeartRateVo() {}

	public HeartRateVo(int resultNo, int userNo, String measureDate, int heartStable, int heart20, int heart25,
			int heart30, int heart35, int heart40, int heart45, int heart50, int heart5min) {
		this.resultNo = resultNo;
		this.userNo = userNo;
		this.measureDate = measureDate;
		this.heartStable = heartStable;
		this.heart20 = heart20;
		this.heart25 = heart25;
		this.heart30 = heart30;
		this.heart35 = heart35;
		this.heart40 = heart40;
		this.heart45 = heart45;
		this.heart50 = heart50;
		this.heart5min = heart5min;
	}

	public int getResultNo() {
		return resultNo;
	}

	public void setResultNo(int resultNo) {
		this.resultNo = resultNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getMeasureDate() {
		return measureDate;
	}

	public void setMeasureDate(String measureDate) {
		this.measureDate = measureDate;
	}

	public int getHeartStable() {
		return heartStable;
	}

	public void setHeartStable(int heartStable) {
		this.heartStable = heartStable;
	}

	public int getHeart20() {
		return heart20;
	}

	public void setHeart20(int heart20) {
		this.heart20 = heart20;
	}

	public int getHeart25() {
		return heart25;
	}

	public void setHeart25(int heart25) {
		this.heart25 = heart25;
	}

	public int getHeart30() {
		return heart30;
	}

	public void setHeart30(int heart30) {
		this.heart30 = heart30;
	}

	public int getHeart35() {
		return heart35;
	}

	public void setHeart35(int heart35) {
		this.heart35 = heart35;
	}

	public int getHeart40() {
		return heart40;
	}

	public void setHeart40(int heart40) {
		this.heart40 = heart40;
	}

	public int getHeart45() {
		return heart45;
	}

	public void setHeart45(int heart45) {
		this.heart45 = heart45;
	}

	public int getHeart50() {
		return heart50;
	}

	public void setHeart50(int heart50) {
		this.heart50 = heart50;
	}

	public int getHeart5min() {
		return heart5min;
	}

	public void setHeart5min(int heart5min) {
		this.heart5min = heart5min;
	}

	@Override
	public String toString() {
		return "HeartRateVo [resultNo=" + resultNo + ", userNo=" + userNo + ", measureDate=" + measureDate
				+ ", heartStable=" + heartStable + ", heart20=" + heart20 + ", heart25=" + heart25 + ", heart30="
				+ heart30 + ", heart35=" + heart35 + ", heart40=" + heart40 + ", heart45=" + heart45 + ", heart50="
				+ heart50 + ", heart5min=" + heart5min + "]";
	}

    
    
}
