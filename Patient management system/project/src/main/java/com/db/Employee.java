package com.db;

public class Employee {
	private int id;
	private String name;
	private String  mailid;
	private long mobile;
	private String status ;
	private int ward;
	private String doj;
	public Employee(int id, String name, String mailid, long mobile, String status, int ward, String doj) {
		super();
		this.id = id;
		this.name = name;
		this.mailid = mailid;
		this.mobile = mobile;
		this.status = status;
		this.ward = ward;
		this.doj = doj;
	}
	public Employee() {
		super();
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMailid() {
		return mailid;
	}
	public void setMailid(String mailid) {
		this.mailid = mailid;
	}
	public long getMobile() {
		return mobile;
	}
	public void setMobile(long mobile) {
		this.mobile = mobile;
	}
	public String getstatus() {
		return status;
	}
	public void setstatus(String status) {
		this.status = status;
	}
	public int getward() {
		return ward;
	}
	public void setward(int ward) {
		this.ward =ward;
	}
	public String getDoj() {
		return doj;
	}
	public void setDoj(String doj) {
		this.doj = doj;
	}
	
	
}
