package com.fygo.dto.system;

import java.io.Serializable;

public class StateBDto implements Serializable{

	private static final long serialVersionUID = 1L;
	protected int stateId;
	protected String stateName;
	
	public int getStateId() {
		return stateId;
	}
	
	public void setStateId(int stateId) {
		this.stateId = stateId;
	}
	
	public String getStateName() {
		return stateName;
	}
	
	public void setStateName(String stateName) {
		this.stateName = stateName;
	}
	
	
	
}
