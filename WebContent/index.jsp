
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

	<!-- JavaScript Libraries -->
	<script type="text/javascript" src="js/jquery-2.1.4.js"></script>
</head>
<body>

	<!-- HTML Structure -->

	<p>How to handle reports in JSP</p>

	<button type="button" onclick="openViewer()">Execute Desktop Viewer</button>
	<button type="button" onclick="openEmbedded()">Open Embedded Report</button>

	<!-- ******************************************** -->

	<!-- JSP Code -->

	<!-- Global Variables -->
	<%!
		private DataSource				ds = new DataSource();
		private ConnectionDataSource	cds	= new ConnectionDataSource();
		private JReport					simpleReport = new JReport( "sales", "sales", "C://devEnviroment//reports//sales.jasper" );
	%>

	<!-- Start the flow of the program -->
	<%
		/***
		* 		Code for handle the Ajax events and the load of the page, flag represent the states of the events in the buttons
		***/
		if( request.getParameter( "flag" ) != null )
		{
			fillReport();

			if( request.getParameter( "flag" ).equals( "1" ) ) {		// event in the button open desktop viewer
				executeDesktopViewer();
			}
			else if( request.getParameter( "flag" ).equals( "2" ) ) {					// event in the button open open embedded
				pageContext.setAttribute( "report", simpleReport, PageContext.SESSION_SCOPE );
			}
		}
		 else {
			createDataSource();		// If the state is the load of the page, jus create the datasource
		}
	%>

	<!-- Method for create a DataSource -->
	<%!
		private void createDataSource()
		{
			ds = new DataSource(	0, "localhost", "sales" );
			cds = new ConnectionDataSource( "root", "123", ds );
		}
	%>

	<!-- Method for fill a report -->
	<%!
		private void fillReport()
		{
			cds.connect();
			simpleReport.generateReportFromPath( cds.getConnection() );
			cds.disconnect();
		}
	%>

	<!-- Method for execute a desktop viewer with the report embedded -->
	<%!
		private void executeDesktopViewer() {
			simpleReport.showViewer();
		}
	%>

	<!-- ************************************** -->

	<!-- JavaScript code -->

	<!-- Javascript Functions for handle the events with Ajax objects  -->

	<script type="text/javascript">
		function openViewer() {
			$.ajax({
				url: "index.jsp?flag=1" ,
				type: "POST"
			});
		}

		function openEmbedded() {
			$.ajax({
				url: "index.jsp?flag=2" ,
				type: "POST" ,
				success: function( result ) {
					window.open( "reportEmbedded.jsp?type=individual" );
					//window.open( "reportEmbedded.jsp", "_blank" );
				}
			});
		}
	</script>
</body>
</html>