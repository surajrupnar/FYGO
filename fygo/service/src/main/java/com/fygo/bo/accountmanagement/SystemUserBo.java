package com.fygo.bo.accountmanagement;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Date;

public class SystemUserBo implements Serializable{

	private static final long serialVersionUID = 1L;
	protected int systemUserId;
	protected String dispalyName;
	protected String emailAddress;
	protected String mobileNo;
	protected String password;
	protected int userRoleId;
	protected String emailAddressVerificationCode;
	protected String mobileNoOtpCode;
	protected Timestamp mobileNoOtpCodeGeneratedDate;
	protected int isEmailAddressVerified;
	protected int isMobileNoVerified;
	protected Date emailAddressVerifiedDate;
	protected Date mobileNoVerifiedDate;
	protected Date lastLoggedInDate;
	protected String status;
	protected Date createdDate;
	protected String createdBy;
	protected Date lastModifiedDate;
	protected String lastModifiedBy;
	public int getSystemUserId() {
		return systemUserId;
	}
	public void setSystemUserId(int systemUserId) {
		this.systemUserId = systemUserId;
	}
	public String getDispalyName() {
		return dispalyName;
	}
	public void setDispalyName(String dispalyName) {
		this.dispalyName = dispalyName;
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
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getUserRoleId() {
		return userRoleId;
	}
	public void setUserRoleId(int userRoleId) {
		this.userRoleId = userRoleId;
	}
	public String getEmailAddressVerificationCode() {
		return emailAddressVerificationCode;
	}
	public void setEmailAddressVerificationCode(String emailAddressVerificationCode) {
		this.emailAddressVerificationCode = emailAddressVerificationCode;
	}
	public String getMobileNoOtpCode() {
		return mobileNoOtpCode;
	}
	public void setMobileNoOtpCode(String mobileNoOtpCode) {
		this.mobileNoOtpCode = mobileNoOtpCode;
	}
	public Timestamp getMobileNoOtpCodeGeneratedDate() {
		return mobileNoOtpCodeGeneratedDate;
	}
	public void setMobileNoOtpCodeGeneratedDate(Timestamp mobileNoOtpCodeGeneratedDate) {
		this.mobileNoOtpCodeGeneratedDate = mobileNoOtpCodeGeneratedDate;
	}
	public int getIsEmailAddressVerified() {
		return isEmailAddressVerified;
	}
	public void setIsEmailAddressVerified(int isEmailAddressVerified) {
		this.isEmailAddressVerified = isEmailAddressVerified;
	}
	public int getIsMobileNoVerified() {
		return isMobileNoVerified;
	}
	public void setIsMobileNoVerified(int isMobileNoVerified) {
		this.isMobileNoVerified = isMobileNoVerified;
	}
	public Date getEmailAddressVerifiedDate() {
		return emailAddressVerifiedDate;
	}
	public void setEmailAddressVerifiedDate(Date emailAddressVerifiedDate) {
		this.emailAddressVerifiedDate = emailAddressVerifiedDate;
	}
	public Date getMobileNoVerifiedDate() {
		return mobileNoVerifiedDate;
	}
	public void setMobileNoVerifiedDate(Date mobileNoVerifiedDate) {
		this.mobileNoVerifiedDate = mobileNoVerifiedDate;
	}
	public Date getLastLoggedInDate() {
		return lastLoggedInDate;
	}
	public void setLastLoggedInDate(Date lastLoggedInDate) {
		this.lastLoggedInDate = lastLoggedInDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Date getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}
	public String getCreatedBy() {
		return createdBy;
	}
	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}
	public Date getLastModifiedDate() {
		return lastModifiedDate;
	}
	public void setLastModifiedDate(Date lastModifiedDate) {
		this.lastModifiedDate = lastModifiedDate;
	}
	public String getLastModifiedBy() {
		return lastModifiedBy;
	}
	public void setLastModifiedBy(String lastModifiedBy) {
		this.lastModifiedBy = lastModifiedBy;
	}
	

}