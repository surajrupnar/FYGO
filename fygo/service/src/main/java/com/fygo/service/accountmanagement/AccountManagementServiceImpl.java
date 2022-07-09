package com.fygo.service.accountmanagement;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.fygo.bo.accountmanagement.AddressBo;
import com.fygo.bo.accountmanagement.CustomerServiceRepresentativeBo;
import com.fygo.bo.accountmanagement.SystemUserBo;
import com.fygo.bo.accountmanagement.UserRoleBo;
import com.fygo.dao.accountmanagement.AccountManagementDao;
import com.fygo.dto.accountmanagement.AddressDto;
import com.fygo.dto.accountmanagement.CustomerServiceRepresentativeDto;
import com.fygo.dto.accountmanagement.SystemUserDto;
import com.fygo.util.FygoConstant;
import static com.fygo.mapper.accountmanagement.AccountManagementMapper.*;

public class AccountManagementServiceImpl implements AccountManagementService{
	
	@Autowired
	private AccountManagementDao accountManagementDao;

	@Transactional(readOnly=false)
	@Override
	public int registerCustomerServiceRepresentative(SystemUserDto systemUserDto,
			CustomerServiceRepresentativeDto customerServiceRepresentativeDto, List<AddressDto> addressDtos) {

		int systemUserId=0;
		int primaryAddressId=0;
		int secondaryAddressId=0;
		
		
		AddressBo addressBo=null;
		SystemUserBo systemUserBo = null;
		UserRoleBo userRoleBo = null;
		CustomerServiceRepresentativeBo customerServiceRepresentativeBo = null;
		
		systemUserBo=mapSystemUserDtoTOSystemUserBo(systemUserDto);
		systemUserBo.setLastLoggedInDate(new Date());
		systemUserBo.setCreatedBy(FygoConstant.SYSTEM_USER);
		systemUserBo.setCreatedDate(new Date());
		systemUserBo.setLastModifiedBy(FygoConstant.SYSTEM_USER);
		systemUserBo.setLastModifiedDate(new Date());
		userRoleBo=accountManagementDao.getUserRole(FygoConstant.CSR_USER_ROLE_NAME);
		systemUserBo.setUserRoleId(userRoleBo.getUserRoleId());
		systemUserId = accountManagementDao.saveSystemUser(systemUserBo);
		
		
		addressBo=mapAddressDtoToAddressBo(addressDtos.get(0));
		addressBo.setCreatedBy(FygoConstant.SYSTEM_USER);
		addressBo.setCreatedDate(new Date());
		addressBo.setLastModifiedBy(FygoConstant.SYSTEM_USER);
		addressBo.setLastModifiedDate(new Date());
		
		primaryAddressId = accountManagementDao.saveAddress(addressBo);
		
		addressBo=mapAddressDtoToAddressBo(addressDtos.get(1));
		addressBo.setCreatedBy(FygoConstant.SYSTEM_USER);
		addressBo.setCreatedDate(new Date());
		addressBo.setLastModifiedBy(FygoConstant.SYSTEM_USER);
		addressBo.setLastModifiedDate(new Date());
		
		secondaryAddressId = accountManagementDao.saveAddress(addressBo);
		
		customerServiceRepresentativeBo=mapCustomerServiceRepresentativeDtoToCustomerServiceRepresentativeBo(customerServiceRepresentativeDto);
		customerServiceRepresentativeBo.setCreatedBy(FygoConstant.SYSTEM_USER);
		customerServiceRepresentativeBo.setCreatedDate(new Date());
		customerServiceRepresentativeBo.setLastModifiedBy(FygoConstant.SYSTEM_USER);
		customerServiceRepresentativeBo.setLastModifiedDate(new Date());
		customerServiceRepresentativeBo.setCustomerServiceRepresentativeId(systemUserId);
		customerServiceRepresentativeBo.setPrimaryAddressId(primaryAddressId);
		customerServiceRepresentativeBo.setSecondaryAddressId(secondaryAddressId);
		customerServiceRepresentativeBo.setStatus(FygoConstant.STATUS_CSR);
		
		systemUserId=accountManagementDao.saveCustomerServiceRepresentative(customerServiceRepresentativeBo);
		
		return systemUserId;
	}
	
	@Transactional(readOnly=true)
	@Override
	public boolean CustomerServiceRepresentativeExist(String emailAddress) {

		return accountManagementDao.isCsrExistWithEmailAddress(emailAddress);
	}
	
	

}
