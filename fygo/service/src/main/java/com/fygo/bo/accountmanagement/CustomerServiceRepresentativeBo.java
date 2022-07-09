package com.fygo.bo.accountmanagement;

import java.io.Serializable;
import java.util.Date;
public class CustomerServiceRepresentativeBo implements Serializable{
	
	private static final long serialVersionUID = 1L;
	protected int customerServiceRepresentativeId;
	protected String firstName;
	protected String lastName;
	protected Date dateOfBirth;
	protected String gender;
	protected String alternateContactNo;
	protected String alternateEmailAddress;
	protected int primaryAddressId;
	protected int secondaryAddressId;
	protected String emergencyContactPersonName;
	protected String emergencyContactPersonNo;
	protected int experience;
	protected String qualification;
	protected String status;
	protected Date createdDate;
	protected String createdBy;
	protected Date lastModifiedDate;
	protected String lastModifiedBy;
	public int getCustomerServiceRepresentativeId() {
		return customerServiceRepresentativeId;
	}
	public void setCustomerServiceRepresentativeId(int customerServiceRepresentativeId) {
		this.customerServiceRepresentativeId = customerServiceRepresentativeId;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public Date getDateOfBirth() {
		return dateOfBirth;
	}
	public void setDateOfBirth(Date dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getAlternateContactNo() {
		return alternateContactNo;
	}
	public void setAlternateContactNo(String alternateContactNo) {
		this.alternateContactNo = alternateContactNo;
	}
	public String getAlternateEmailAddress() {
		return alternateEmailAddress;
	}
	public void setAlternateEmailAddress(String alternateEmailAddress) {
		this.alternateEmailAddress = alternateEmailAddress;
	}
	public int getPrimaryAddressId() {
		return primaryAddressId;
	}
	public void setPrimaryAddressId(int primaryAddressId) {
		this.primaryAddressId = primaryAddressId;
	}
	public int getSecondaryAddressId() {
		return secondaryAddressId;
	}
	public void setSecondaryAddressId(int secondaryAddressId) {
		this.secondaryAddressId = secondaryAddressId;
	}
	public String getEmergencyContactPersonName() {
		return emergencyContactPersonName;
	}
	public void setEmergencyContactPersonName(String emergencyContactPersonName) {
		this.emergencyContactPersonName = emergencyContactPersonName;
	}
	public String getEmergencyContactPersonNo() {
		return emergencyContactPersonNo;
	}
	public void setEmergencyContactPersonNo(String emergencyContactPersonNo) {
		this.emergencyContactPersonNo = emergencyContactPersonNo;
	}
	public int getExperience() {
		return experience;
	}
	public void setExperience(int experience) {
		this.experience = experience;
	}
	public String getQualification() {
		return qualification;
	}
	public void setQualification(String qualification) {
		this.qualification = qualification;
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
