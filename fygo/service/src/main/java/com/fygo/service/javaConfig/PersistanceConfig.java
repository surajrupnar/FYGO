package com.fygo.service.javaConfig;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowire;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.lookup.JndiDataSourceLookup;
import org.springframework.transaction.config.JtaTransactionManagerFactoryBean;

@Configuration
@PropertySource("classpath:META-INF/global-service.properties")
public class PersistanceConfig {
	@Autowired
	protected Environment env;
	@Bean
	public DataSource dataSource() {
		DataSource dataSource=null;
	   JndiDataSourceLookup jndiDataSourceLookup=null;
	   jndiDataSourceLookup=new JndiDataSourceLookup();
	   dataSource=jndiDataSourceLookup.getDataSource(env.getProperty("datasourceName"));
	   System.out.println("dataSource initialized");
	   return dataSource;
	}
	@Bean
	public JtaTransactionManagerFactoryBean transactionManager() {
		JtaTransactionManagerFactoryBean jtaTransactionManagerFactoryBean=null;
		jtaTransactionManagerFactoryBean=new JtaTransactionManagerFactoryBean();
		  System.out.println("platform transaction");
		 return jtaTransactionManagerFactoryBean;
	}
	@Bean(autowire=Autowire.BY_TYPE)
	public JdbcTemplate jdbcTemplate() {
		return new JdbcTemplate();
	}

}
