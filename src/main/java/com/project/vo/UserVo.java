package com.project.vo;

public class UserVo {
	
    private int userNo;
    private String userId;
    private String pw;
    private String name;
    private String userType;
    private String gender;
    private int weight;
    private int height;
    private int adminNo;
    private String adminName;
    private String field;
    
    public UserVo() {}

    public UserVo(int userNo, String userId, String pw, String name, String userType, String gender, int weight,
			int height, int adminNo, String adminName, String field) {
		this.userNo = userNo;
		this.userId = userId;
		this.pw = pw;
		this.name = name;
		this.userType = userType;
		this.gender = gender;
		this.weight = weight;
		this.height = height;
		this.adminNo = adminNo;
		this.adminName = adminName;
		this.field = field;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getWeight() {
		return weight;
	}

	public void setWeight(int weight) {
		this.weight = weight;
	}

	public int getHeight() {
		return height;
	}

	public void setHeight(int height) {
		this.height = height;
	}

	public int getAdminNo() {
		return adminNo;
	}

	public void setAdminNo(int adminNo) {
		this.adminNo = adminNo;
	}

	public String getAdminName() {
		return adminName;
	}

	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}

	public String getField() {
		return field;
	}

	public void setField(String field) {
		this.field = field;
	}

	@Override
	public String toString() {
		return "UserVo [userNo=" + userNo + ", userId=" + userId + ", pw=" + pw + ", name=" + name + ", userType="
				+ userType + ", gender=" + gender + ", weight=" + weight + ", height=" + height + ", adminNo=" + adminNo
				+ ", adminName=" + adminName + ", field=" + field + "]";
	}

	

}
