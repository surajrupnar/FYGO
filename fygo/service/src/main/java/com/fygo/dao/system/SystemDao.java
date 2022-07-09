package com.fygo.dao.system;

import java.util.List;

import com.fygo.bo.system.CityBo;
import com.fygo.bo.system.CountryBo;
import com.fygo.bo.system.StateBo;

public interface SystemDao {

	List<CountryBo> getCountries();
	List<StateBo> getStates(int countryId);
	List<CityBo> getCity(int StateId);	
}
