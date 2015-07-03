
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@ page import="
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
		/*
		DataSource ds = new DataSource(	0, "localhost", "sales" );
		ConnectionDataSource cds = new ConnectionDataSource( "root", "123", ds );
		cds.connect();

		JReport simpleReport = new JReport( "sales", "sales", "C://devEnviroment//reports//sales.jasper" );
		simpleReport.generateReportFromPath( cds.getConnection() );

		simpleReport.showViewer(); // open a viewer in a desktop

		cds.disconnect();*/
	%>
</body>
</html>