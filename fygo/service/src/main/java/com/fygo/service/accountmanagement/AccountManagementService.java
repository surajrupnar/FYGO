package com.fygo.service.accountmanagement;

import java.util.List;

import com.fygo.bo.accountmanagement.SystemUserBo;
import com.fygo.dto.accountmanagement.AddressDto;
import com.fygo.dto.accountmanagement.CustomerServiceRepresentativeDto;
import com.fygo.dto.accountmanagement.SystemUserDto;

public interface AccountManagementService {
		int registerCustomerServiceRepresentative(SystemUserDto systemUserDto,CustomerServiceRepresentativeDto customerServiceRepresentativeDto, List<AddressDto> addressDto);
		boolean CustomerServiceRepresentativeExist(String emailAddress);
	}
	

