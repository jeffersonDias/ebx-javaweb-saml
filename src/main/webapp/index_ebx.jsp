<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="org.springframework.web.context.WebApplicationContext"%>
<%@page import="org.springframework.web.servlet.support.RequestContextUtils"%>
<%@page import="com.on.ps.security.saml.MappingEbxSamlCredentials"%>
<%@page import="org.springframework.beans.factory.annotation.Autowired"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="org.springframework.security.saml.SAMLCredential"%>
<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page import="org.springframework.security.core.Authentication"%>
<%@page import="org.opensaml.saml2.core.Attribute"%>
<%@page import="org.springframework.security.saml.util.SAMLUtil"%>
<%@page import="org.opensaml.xml.util.XMLHelper"%>

<%
	final WebApplicationContext webApplicationContext = WebApplicationContextUtils.getRequiredWebApplicationContext(request.getServletContext());
	final MappingEbxSamlCredentials mapping = (MappingEbxSamlCredentials) webApplicationContext.getBean("myMappingEbxSamlCredentials");
	
	final Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	final SAMLCredential credential = (SAMLCredential) authentication.getCredentials();
	pageContext.setAttribute("authentication", authentication);
	pageContext.setAttribute("credential", credential);
	pageContext.setAttribute("assertion", XMLHelper.nodeToString(SAMLUtil.marshallMessage(credential.getAuthenticationAssertion())));

	if(session.getServletContext().getAttribute("data")==null){
		session.getServletContext().setAttribute("data", new HashMap<String, Object>());
	}

	System.out.println("SESSIONID="+session.getId());

	final Map<String, Object> data = (Map<String, Object>)session.getServletContext().getAttribute("data");
	if(authentication!=null && authentication.getPrincipal()!=null){
		final Map<String, Object> values = new HashMap<String, Object>();

		values.put("UserID", credential.getAttributeAsString(mapping.getUserID()));
		values.put("EmailAddress", credential.getAttributeAsString(mapping.getEmailAddress()));
		values.put("FirstName", credential.getAttributeAsString(mapping.getFirstName()));
		values.put("LastName", credential.getAttributeAsString(mapping.getLastName()));

		data.put(session.getId(), values);
	}else{
		data.put(session.getId(), null);
	}

	response.sendRedirect("/ebx");
%>
