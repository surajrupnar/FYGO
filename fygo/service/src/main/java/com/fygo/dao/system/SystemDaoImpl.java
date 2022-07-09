package com.fygo.dao.system;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import com.fygo.bo.system.CityBo;
import com.fygo.bo.system.CountryBo;
import com.fygo.bo.system.StateBo;
import com.fygo.logging.FygoLogger;

public class SystemDaoImpl implements SystemDao{


	private final String SQL_GET_COUNTRY_BY_COUNTRY_NAME="select country_id, country_nm, status, created_dt, created_by, last_modified_dt, last_modified_by from country order by country_nm asc" ;
	private final String SQL_GET_STATE_BY_COUNTRY_ID_ORDER_BY_STATE_NAME="select state_id, state_nm, country_id, status, created_dt, created_by, last_modified_dt, last_modified_by from state where country_id=? order by state_nm asc";
	private final String SQL_GET_CITIES_BY_STATE_ID_ORDER_BY_CITY_NAME="select city_id, city_nm, state_id, status, created_by, create_dt, last_modified_by, last_modified_dt from city where state_id=? order by city_nm asc";

	
	private static final FygoLogger fLogger=FygoLogger.getLogger(SystemDao.class);

	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	
	
	@Override
	public List<CountryBo> getCountries() {
		List<CountryBo> countryBos=null;
			
		countryBos=jdbcTemplate.query(SQL_GET_COUNTRY_BY_COUNTRY_NAME, (rs,rowNo)->{
			CountryBo countryBo=null;
			
			countryBo=new CountryBo();
			countryBo.setCountryId(rs.getInt(1));
			countryBo.setCountryName(rs.getString(2));
			countryBo.setStatus(rs.getString(3));
			countryBo.setCreatedDate(rs.getDate(4));
			countryBo.setCreatedBy(rs.getString(5));
			countryBo.setLastModifiedDate(rs.getDate(6));
			countryBo.setLastModifiedBy(rs.getString(7));
			
			return countryBo;
		});
	
		if(countryBos!=null && countryBos.size()>0) {
			fLogger.debug("fetch {} countries from country table", countryBos.size());
		}
		else {
			fLogger.warn("No country found in country table");
		}
		
		return countryBos;
	}

	@Override
	public List<StateBo> getStates(int countryId) {
		List<StateBo> stateBos=null;
		
		stateBos=jdbcTemplate.query(SQL_GET_STATE_BY_COUNTRY_ID_ORDER_BY_STATE_NAME,(rs,rowNo) -> {
			StateBo stateBo=null;
			
			stateBo= new StateBo();
			stateBo.setStateId(rs.getInt(1));
			stateBo.setStateName(rs.getString(2));
			stateBo.setCountryId(rs.getInt(3));
			stateBo.setStatus(rs.getString(4));
			stateBo.setCreatedDate(rs.getDate(5));
			stateBo.setCreatedBy(rs.getString(6));
			stateBo.setLastModifiedDate(rs.getDate(7));
			stateBo.setLastModifiedBy(rs.getString(8));

			return stateBo;
		}, countryId);
		
		if(stateBos!=null && stateBos.size()>0) {
			fLogger.debug("fetch{} country from country table", stateBos.size());
		}
		else {
			fLogger.warn("No countries fount in the country table");
		}
		return stateBos;
	}

	@Override
	public List<CityBo> getCity(int stateId) {
		List<CityBo> cityBos=null;
		
		cityBos=jdbcTemplate.query(SQL_GET_CITIES_BY_STATE_ID_ORDER_BY_CITY_NAME, (rs,rowNo) ->{
			CityBo cityBo = null;
			
			cityBo= new CityBo();
			cityBo.setCityId(rs.getInt(1));
			cityBo.setCityName(rs.getString(2));
			cityBo.setStateId(rs.getInt(3));
			cityBo.setStatus(rs.getString(4));
			cityBo.setCreatedBy(rs.getString(5));
			cityBo.setCreatedDate(rs.getDate(6));
			cityBo.setLastModifiedBy(rs.getString(7));
			cityBo.setLastModifiedDate(rs.getDate(8));
		
			//set to null
			return cityBo;	
		}, stateId);
		
		if(cityBos!=null && cityBos.size()>0) {
			fLogger.debug("fetch{} countries from country table", cityBos.size());
		}
		else {
			fLogger.warn("No Country found in country table");
		}
		return cityBos;
	}
	
	
}
