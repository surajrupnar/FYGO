package com.fygo.dto.system;

import java.io.Serializable;

public class CountryDto implements Serializable{
	private static final long serialVersionUID = 1L;
	protected int countryId;
	protected String countryName;
	
	
	public int getCountryId() {
		return countryId;
	}
	
	public void setCountryId(int countryId) {
		this.countryId = countryId;
	}
	
	public String getCountryName() {
		return countryName;
	}
	
	public void setCountryName(String countryName) {
		this.countryName = countryName;
	}
	
	
}
