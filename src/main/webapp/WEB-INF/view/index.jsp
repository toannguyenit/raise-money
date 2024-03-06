<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!doctype html>
<html>
<head>
<title>Donation website &mdash; Website Donation</title>
<%
String PATH = "ASM1/src/main/webapp";
 String path_root  = "/asm1ver2"; 
%>
<jsp:include page='${PATH}/WEB-INF/view/templates/user/layout/meta.jsp' />
<jsp:include page='${PATH}/WEB-INF/view/templates/user/layout/css.jsp' />
<jsp:include page='${PATH}/WEB-INF/view/templates/user/layout/js.jsp' />
</head>
<body id="top">
	<%@ include file="../../WEB-INF/view/templates/overlayer.jsp"%>
	<%@ include file="../../WEB-INF/view/templates/index.jsp"%>
</body>
</html>