package com.fygo.dto.system;

import java.io.Serializable;
public class CityDto implements Serializable{

	private static final long serialVersionUID = 1L;
	protected int cityId;
	protected String cityName;
	public int getCityId() {
		return cityId;
	}
	public void setCityId(int cityId) {
		this.cityId = cityId;
	}
	public String getCityName() {
		return cityName;
	}
	public void setCityName(String cityName) {
		this.cityName = cityName;
	}
	
	
	
}
