<%@page import="com.on.ps.security.saml.MappingEbxSamlCredentials"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="org.springframework.web.context.WebApplicationContext"%>
<%
	final WebApplicationContext webApplicationContext = WebApplicationContextUtils.getRequiredWebApplicationContext(request.getServletContext());
	final MappingEbxSamlCredentials mapping = (MappingEbxSamlCredentials) webApplicationContext.getBean("myMappingEbxSamlCredentials");
	System.out.println("MappingEbxSamlCredentials.mapping="+mapping);
	if(mapping!=null){
		System.out.println("MappingEbxSamlCredentials.mapping.userID="+mapping.getUserID());
	} else {
		System.out.println("MappingEbxSamlCredentials.mapping.userID mapping is null");
	}

%>

hello