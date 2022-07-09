package com.fygo.dto.accountmanagement;

import java.io.Serializable;

public class SystemUserDto implements Serializable{

	private static final long serialVersionUID = 1L;
	protected int systemUserId;
	protected String emailAddress;
	protected String mobileNo;
	

	public int getSystemUserId() {
		return systemUserId;
	}
	public void setSystemUserId(int systemUserId) {
		this.systemUserId = systemUserId;
	}
	public String getEmailAddress() {
		return emailAddress;
	}
	public void setEmailAddress(String emailAddress) {
		this.emailAddress = emailAddress;
	}
	public String getMobileNo() {
		return mobileNo;
	}
	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}
	
	
	
}
