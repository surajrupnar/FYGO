package com.fygo.dao.accountmanagement;

import com.fygo.bo.accountmanagement.AddressBo;
import com.fygo.bo.accountmanagement.CustomerServiceRepresentativeBo;
import com.fygo.bo.accountmanagement.SystemUserBo;
import com.fygo.bo.accountmanagement.UserRoleBo;

public interface AccountManagementDao {

	int saveSystemUser(SystemUserBo systemUserBo);
	int saveCustomerServiceRepresentative(CustomerServiceRepresentativeBo customerServiceRepresentativeBo);
	int saveAddress(AddressBo addressBo);
	UserRoleBo getUserRole(String userRole);
	boolean isCsrExistWithEmailAddress(String emailAddress);

}
