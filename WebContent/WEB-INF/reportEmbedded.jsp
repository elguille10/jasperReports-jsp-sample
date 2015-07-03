
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@ page import="
	java.io.OutputStream ,
	org.utilities.reports.JReport
"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>JasperReports JSP Sample</title>
</head>
<body>
	<%
		OutputStream outStream = response.getOutputStream();
		response.setContentType( "application/pdf" );

		//simpleReport.embeddedPDF( outStream ); // execute a embedded PDF viewer in a JSP 

		out.clear();
		out = pageContext.pushBody();
		outStream.close();
	%>
</body>
</html>