package com.fygo.admin.boot;

import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

import com.fygo.admin.javaConfig.AdmintWebRootConfig;
import com.fygo.admin.javaConfig.WebMvcConfig;

public class AdminWebDispatcherServletInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {

	@Override
	protected Class<?>[] getRootConfigClasses() {

		return new Class[] { AdmintWebRootConfig.class };
	}

	@Override
	protected Class<?>[] getServletConfigClasses() {
		return new Class[] { WebMvcConfig.class };
	}

	@Override
	protected String[] getServletMappings() {

		/* return new String[] {"*.htm"}; */ 
		 return new String[] {"/"}; 
	}

}
