package com.project.vo;

public class LactateVo {
	
	private int resultNo;
	private int userNo;
	private String measureDate;
    private float lacStable;
    private float lac20;
    private float lac25;
    private float lac30;
    private float lac35;
    private float lac40;
    private float lac45;
    private float lac50;
    private float lac5min;
    
    public LactateVo() {}

	public LactateVo(int resultNo, int userNo, String measureDate, float lacStable, float lac20, float lac25,
			float lac30, float lac35, float lac40, float lac45, float lac50, float lac5min) {
		this.resultNo = resultNo;
		this.userNo = userNo;
		this.measureDate = measureDate;
		this.lacStable = lacStable;
		this.lac20 = lac20;
		this.lac25 = lac25;
		this.lac30 = lac30;
		this.lac35 = lac35;
		this.lac40 = lac40;
		this.lac45 = lac45;
		this.lac50 = lac50;
		this.lac5min = lac5min;
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

	public float getLacStable() {
		return lacStable;
	}

	public void setLacStable(float lacStable) {
		this.lacStable = lacStable;
	}

	public float getLac20() {
		return lac20;
	}

	public void setLac20(float lac20) {
		this.lac20 = lac20;
	}

	public float getLac25() {
		return lac25;
	}

	public void setLac25(float lac25) {
		this.lac25 = lac25;
	}

	public float getLac30() {
		return lac30;
	}

	public void setLac30(float lac30) {
		this.lac30 = lac30;
	}

	public float getLac35() {
		return lac35;
	}

	public void setLac35(float lac35) {
		this.lac35 = lac35;
	}

	public float getLac40() {
		return lac40;
	}

	public void setLac40(float lac40) {
		this.lac40 = lac40;
	}

	public float getLac45() {
		return lac45;
	}

	public void setLac45(float lac45) {
		this.lac45 = lac45;
	}

	public float getLac50() {
		return lac50;
	}

	public void setLac50(float lac50) {
		this.lac50 = lac50;
	}

	public float getLac5min() {
		return lac5min;
	}

	public void setLac5min(float lac5min) {
		this.lac5min = lac5min;
	}

	@Override
	public String toString() {
		return "LactateVo [resultNo=" + resultNo + ", userNo=" + userNo + ", measureDate=" + measureDate
				+ ", lacStable=" + lacStable + ", lac20=" + lac20 + ", lac25=" + lac25 + ", lac30=" + lac30 + ", lac35="
				+ lac35 + ", lac40=" + lac40 + ", lac45=" + lac45 + ", lac50=" + lac50 + ", lac5min=" + lac5min + "]";
	}


}
