
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@ page import="
	java.io.OutputStream ,
	org.utilities.dataaccesslayer.DataSource ,
	org.utilities.dataaccesslayer.ConnectionDataSource ,
	org.utilities.reports.JReport
"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>JasperReports Sample</title>
</head>
<body>
	<%
		DataSource ds = new DataSource(	0, "localhost", "sales" );
		ConnectionDataSource cds = new ConnectionDataSource( "root", "123", ds );
		cds.connect();

		OutputStream outStream = response.getOutputStream();
		response.setContentType( "application/pdf" );

		JReport simpleReport = new JReport( "sales", "sales", "C://devEnviroment//reports//sales.jasper" );
		simpleReport.generateReportFromPath( cds.getConnection() );
		simpleReport.embeddedPDF( outStream ); // execute a embedded PDF viewer in a JSP 

		//simpleReport.showViewer(); -- open a viewer in a desktop
		
		out.clear();
		out = pageContext.pushBody();
		outStream.close();
		cds.disconnect();
	%>
</body>
</html>