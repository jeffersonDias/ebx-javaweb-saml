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

    values.put("UserID", credential.getAttributeAsString("UserID"));
		values.put("EmailAddress", credential.getAttributeAsString("EmailAddress"));
		values.put("FirstName", credential.getAttributeAsString("FirstName"));
		values.put("LastName", credential.getAttributeAsString("LastName"));

		data.put(session.getId(), values);
	}else{
		data.put(session.getId(), null);
	}

	response.sendRedirect("/ebx");
%>
