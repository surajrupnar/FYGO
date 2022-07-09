package com.fygo.service.javaConfig;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;

@Configuration
@Import({PersistanceConfig.class})
@ComponentScan(basePackages="com.fygo.service.*")
public class ServiceRootConfig {
	
}
