package com.fygo.mapper.accountmanagement;

import com.fygo.bo.accountmanagement.AddressBo;
import com.fygo.bo.accountmanagement.CustomerServiceRepresentativeBo;
import com.fygo.bo.accountmanagement.SystemUserBo;
import com.fygo.dto.accountmanagement.AddressDto;
import com.fygo.dto.accountmanagement.CustomerServiceRepresentativeDto;
import com.fygo.dto.accountmanagement.SystemUserDto;

public class AccountManagementMapper {
	
	public static SystemUserBo mapSystemUserDtoTOSystemUserBo(SystemUserDto systemUserDto) {
		SystemUserBo systemUserBo=null;
		
		systemUserBo = new SystemUserBo();
		systemUserBo.setSystemUserId(systemUserDto.getSystemUserId());
		systemUserBo.setEmailAddress(systemUserDto.getEmailAddress());
		systemUserBo.setMobileNo(systemUserDto.getMobileNo());
		return systemUserBo;	
	}
	
	public static AddressBo mapAddressDtoToAddressBo(AddressDto addressDto) {
		AddressBo addressBo = new AddressBo();
		addressBo.setAddressId(addressDto.getAddressId());
		addressBo.setAddressLine1(addressDto.getAddressLine1());
		addressBo.setAddressLine2(addressDto.getAddressLine2());
		addressBo.setCity(addressDto.getCity());
		addressBo.setState(addressDto.getState());
		addressBo.setZip(addressDto.getZip());
		addressBo.setCountry(addressDto.getCountry());
	
		return addressBo;
	}	
	
public static CustomerServiceRepresentativeBo mapCustomerServiceRepresentativeDtoToCustomerServiceRepresentativeBo(CustomerServiceRepresentativeDto customerServiceRepresentativeDto){
	CustomerServiceRepresentativeBo customerServiceRepresentativeBo = null;	
	customerServiceRepresentativeBo = new CustomerServiceRepresentativeBo();	
	customerServiceRepresentativeBo.setCustomerServiceRepresentativeId(customerServiceRepresentativeDto.getCustomerServiceRepresentativeId());
	customerServiceRepresentativeBo.setFirstName(customerServiceRepresentativeDto.getFirstName());
	customerServiceRepresentativeBo.setLastName(customerServiceRepresentativeDto.getLastName());
	customerServiceRepresentativeBo.setDateOfBirth(customerServiceRepresentativeDto.getDateOfBirth());
	customerServiceRepresentativeBo.setGender(customerServiceRepresentativeDto.getGender());
	customerServiceRepresentativeBo.setAlternateContactNo(customerServiceRepresentativeDto.getAlternateContactNo());
	customerServiceRepresentativeBo.setAlternateEmailAddress(customerServiceRepresentativeDto.getAlternateEmailAddress());
	customerServiceRepresentativeBo.setPrimaryAddressId(customerServiceRepresentativeDto.getPrimaryAddressId());
	customerServiceRepresentativeBo.setSecondaryAddressId(customerServiceRepresentativeDto.getCustomerServiceRepresentativeId());
	customerServiceRepresentativeBo.setEmergencyContactPersonName(customerServiceRepresentativeDto.getEmergencyContactPersonName());
	customerServiceRepresentativeBo.setEmergencyContactPersonNo(customerServiceRepresentativeDto.getEmergencyContactPersonNo());
	customerServiceRepresentativeBo.setExperience(customerServiceRepresentativeDto.getExperience());
	customerServiceRepresentativeBo.setQualification(customerServiceRepresentativeDto.getQualification());

	return customerServiceRepresentativeBo;
}
}
