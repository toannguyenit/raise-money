<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!doctype html>
<html>
<head>
<title>Quản trị</title>
<%
String PATH = "ASM1/src/main/webapp";
%>
<jsp:include page='${PATH}/WEB-INF/view/templates/admin/layout/meta.jsp' />
<jsp:include page='${PATH}/WEB-INF/view/templates/admin/layout/css.jsp' />
<jsp:include page='${PATH}/WEB-INF/view/templates/admin/layout/js.jsp' />

</head>
<body>
	<div class="sb-nav-fixed">
		<%@ include file="../../templates/admin/layout/sidebar.jsp"%>
		<%@ include file="../../templates/admin/home.jsp"%>
	</div>
	<%@ include file="../../templates/admin/layout/js_body.jsp"%>
</body>
</html>