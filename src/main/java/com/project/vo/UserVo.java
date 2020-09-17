package com.project.vo;

public class UserVo {
	
    private int userNo;
    private String id;
    private String pw;
    private String name;
    private String type;
    private String gender;
    private int weight;
    private int height;
    private String adminName;
    
    public UserVo() {}

    public UserVo(int userNo, String id, String pw, String name, String type, String gender, int weight, int height,
			String adminName) {
		this.userNo = userNo;
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.type = type;
		this.gender = gender;
		this.weight = weight;
		this.height = height;
		this.adminName = adminName;
	}


	public String getAdminName() {
		return adminName;
	}

	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
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

	@Override
	public String toString() {
		return "UserVo [userNo=" + userNo + ", id=" + id + ", pw=" + pw + ", name=" + name + ", type=" + type
				+ ", gender=" + gender + ", weight=" + weight + ", height=" + height + ", adminName=" + adminName + "]";
	}

}
