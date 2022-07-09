package com.fygo.dao.accountmanagement;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import com.fygo.bo.accountmanagement.AddressBo;
import com.fygo.bo.accountmanagement.CustomerServiceRepresentativeBo;
import com.fygo.bo.accountmanagement.SystemUserBo;
import com.fygo.bo.accountmanagement.UserRoleBo;

import static com.fygo.util.DateConverterHelper.*;
import java.sql.PreparedStatement;
import com.fygo.logging.FygoLogger;


@Repository
public class AccountManagementDaoImpl implements AccountManagementDao{
	
	private final String SQL_SAVE_SYSTEM_USER = "insert into system_user(display_nm, email_address, mobile_nbr, password, user_role_id, email_address_verification_code, mobile_nbr_otp_code, mobile_nbr_otp_code_generated_dt, is_email_address_verified, is_mobile_nbr_verified, email_address_verified_dt, mobile_nbr_verified_dt, last_logged_in_dt, status, created_dt, created_by, last_modified_dt, last_modified_by) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
	private final String SQL_SAVE_CSR = "insert into customer_service_representative(first_nm, last_nm, date_of_birth, gender, alternate_contact_no, alternate_email_address, primary_address_id, secondary_address_id, emergency_contact_person_name, emergency_contact_person_no, experience, qualification, status, created_dt, created_by, last_modified_dt, last_modified_by) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
	private final String SQL_SAVE_ADDRESS = "insert into address(address_line1, address_line2, city, state, zip, country, created_dt, created_by, last_modified_dt, last_modified_by) values(?,?,?,?,?,?,?,?,?,?)";
	private final String SQL_GET_USER_ROLE_BY_USER_ROLE_NAME = "select user_role_id, user_role_nm, description, created_by, create_dt, last_modified_by, last_modified_dt from user_role where user_role_nm=?";
	private final String SQL_GET_COUNT_OF_SYSTEM_USER_BY_EMAIL_ADDRESS = "select count(1) from system_user where email_address=?";

	
	private static final FygoLogger logger = FygoLogger.getLogger(AccountManagementDaoImpl.class);
	
	@Autowired
	private JdbcTemplate JdbcTemplate;
	
	@Override
	public int saveSystemUser(SystemUserBo systemUserBo) {
		int systemUserId = 0;
		int record = 0;
		KeyHolder kh = null;
		kh = new GeneratedKeyHolder();
		
		record = JdbcTemplate.update((con) -> {
			PreparedStatement pstmt=null;
			
			pstmt = con.prepareStatement(SQL_SAVE_SYSTEM_USER, new String[] { "system_user_id" });
			pstmt.setString(1, systemUserBo.getDispalyName());
			pstmt.setString(2, systemUserBo.getEmailAddress());
			pstmt.setString(3, systemUserBo.getMobileNo());
			pstmt.setString(4, systemUserBo.getPassword());
			pstmt.setInt(5, systemUserBo.getUserRoleId());
			pstmt.setString(6, systemUserBo.getEmailAddressVerificationCode());
			pstmt.setString(7, systemUserBo.getMobileNoOtpCode());
			pstmt.setDate(8, mapUtilDateToSqlDate(systemUserBo.getMobileNoOtpCodeGeneratedDate()));
			pstmt.setInt(9, systemUserBo.getIsEmailAddressVerified());
			pstmt.setInt(10, systemUserBo.getIsMobileNoVerified());
			pstmt.setDate(11, mapUtilDateToSqlDate(systemUserBo.getEmailAddressVerifiedDate()));
			pstmt.setDate(12, mapUtilDateToSqlDate(systemUserBo.getMobileNoVerifiedDate()));
			pstmt.setDate(13, mapUtilDateToSqlDate(systemUserBo.getLastLoggedInDate()));
			pstmt.setString(14, systemUserBo.getStatus());
			pstmt.setDate(15, mapUtilDateToSqlDate(systemUserBo.getCreatedDate()));
			pstmt.setString(16, systemUserBo.getCreatedBy());
			pstmt.setDate(17, mapUtilDateToSqlDate(systemUserBo.getLastModifiedDate()));
			pstmt.setString(18, systemUserBo.getLastModifiedBy());

			return pstmt;
		}, kh);
		
		if (record == 1) {
			systemUserId = kh.getKey().intValue();
			logger.debug("system user has been saved with generated id {}", systemUserId);
		}

		return systemUserId;
	}


	@Override
	public int saveCustomerServiceRepresentative(CustomerServiceRepresentativeBo customerServiceRepresentativeBo) {
		int csrId=0;
		int record=0;
		KeyHolder kh=null;
			
		kh=new GeneratedKeyHolder();
		record=JdbcTemplate.update((con) -> {
			PreparedStatement pstmt=null;
			
			pstmt=con.prepareStatement(SQL_SAVE_CSR, new String[] {"customer_service_representative_id"});
			pstmt.setString(1, customerServiceRepresentativeBo.getFirstName());
			pstmt.setString(2, customerServiceRepresentativeBo.getLastName());
			pstmt.setDate(3, mapUtilDateToSqlDate(customerServiceRepresentativeBo.getDateOfBirth()));
			pstmt.setString(4, customerServiceRepresentativeBo.getGender());
			pstmt.setString(5, customerServiceRepresentativeBo.getAlternateContactNo());
			pstmt.setString(6, customerServiceRepresentativeBo.getAlternateEmailAddress());
			pstmt.setInt(7, customerServiceRepresentativeBo.getPrimaryAddressId());
			pstmt.setInt(8, customerServiceRepresentativeBo.getSecondaryAddressId());
			pstmt.setString(9, customerServiceRepresentativeBo.getEmergencyContactPersonName());
			pstmt.setString(10, customerServiceRepresentativeBo.getEmergencyContactPersonNo());
			pstmt.setInt(11, customerServiceRepresentativeBo.getExperience());
			pstmt.setString(12, customerServiceRepresentativeBo.getQualification());
			pstmt.setString(13, customerServiceRepresentativeBo.getStatus());
			pstmt.setDate(14, mapUtilDateToSqlDate(customerServiceRepresentativeBo.getCreatedDate()));
			pstmt.setString(15, customerServiceRepresentativeBo.getCreatedBy());
			pstmt.setDate(16, mapUtilDateToSqlDate(customerServiceRepresentativeBo.getLastModifiedDate()));
			pstmt.setString(17, customerServiceRepresentativeBo.getLastModifiedBy());
		
			return pstmt;
			
		}, kh);
		
		if(record==1) {
			csrId=kh.getKey().intValue();
			logger.debug("customer Service Representative has been saved with generated id{}", csrId);			
		}
		return csrId;
	}	
		
	

	@Override
	public int saveAddress(AddressBo addressBo) {
		int addressId=0;
		int record=0;
		KeyHolder kh=null;
		
		
		kh= new GeneratedKeyHolder();
		record=JdbcTemplate.update((con) ->{
			PreparedStatement pstmt=null;
			
			pstmt=con.prepareStatement(SQL_SAVE_ADDRESS, new String[] {"address_id"});
			pstmt.setString(1,addressBo.getAddressLine1());
			pstmt.setString(2, addressBo.getAddressLine2());
			pstmt.setString(3, addressBo.getCity());	
			pstmt.setString(4, addressBo.getState());
			pstmt.setInt(5, addressBo.getZip());
			pstmt.setString(6, addressBo.getCountry());
			pstmt.setDate(7, mapUtilDateToSqlDate(addressBo.getCreatedDate()));
			pstmt.setString(8,  addressBo.getCreatedBy());
			pstmt.setDate(9, mapUtilDateToSqlDate(addressBo.getLastModifiedDate()));
			pstmt.setString(10, addressBo.getLastModifiedBy());
		
			return pstmt;
		}, kh);
		
		if(record==1) {
			addressId=kh.getKey().intValue();
			logger.debug("Address has been saved with generated id {}", addressId);
		}	
		return addressId;
	}

	@Override
	public UserRoleBo getUserRole(String userRoleName) {
		return JdbcTemplate.queryForObject(SQL_GET_USER_ROLE_BY_USER_ROLE_NAME, (rs, rowNo) -> {
			UserRoleBo userRoleBo = null;
			
			userRoleBo = new UserRoleBo();
			userRoleBo.setUserRoleId(rs.getInt(1));
			userRoleBo.setUserRoleName(rs.getString(2));
			userRoleBo.setDescription(rs.getString(3));
			userRoleBo.setCreatedBy(rs.getString(3));
			userRoleBo.setCreatedDate(rs.getDate(5));
			userRoleBo.setLastModifiedBy(rs.getString(6));
			userRoleBo.setLastModifiedDate(rs.getDate(7));
			
			return userRoleBo;	
		}, userRoleName);
		
	}

	@Override
	public boolean isCsrExistWithEmailAddress( String emailAddress) {
		boolean isExist=false;
		int count=0;
		
		count=JdbcTemplate.queryForObject(SQL_GET_COUNT_OF_SYSTEM_USER_BY_EMAIL_ADDRESS, Integer.class,emailAddress);
		isExist=count==1?true:false;
		logger.debug("CSR exist with the email address{} is: {}", emailAddress,count);
	
		return isExist;
	
	}


}
