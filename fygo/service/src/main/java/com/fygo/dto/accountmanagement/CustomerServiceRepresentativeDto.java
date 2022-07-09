package com.fygo.dto.accountmanagement;

import java.io.Serializable;
import java.util.Date;

public class CustomerServiceRepresentativeDto implements Serializable {

	private static final long serialVersionUID = 1L;
	protected int CustomerServiceRepresentativeId;
	protected String firstName;
	protected String LastName;
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
	public int getCustomerServiceRepresentativeId() {
		return CustomerServiceRepresentativeId;
	}
	public void setCustomerServiceRepresentativeId(int customerServiceRepresentativeId) {
		CustomerServiceRepresentativeId = customerServiceRepresentativeId;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return LastName;
	}
	public void setLastName(String lastName) {
		LastName = lastName;
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
	
	
	
	
}
