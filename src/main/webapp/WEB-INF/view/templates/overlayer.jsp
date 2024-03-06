<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<div id="overlayer"></div>
<div class="loader">
	<div class="spinner-border text-primary" role="status">
		<span class="sr-only">Loading...</span>
	</div>
</div>
<div th:if="${msg}" class="toast" data-delay="1000"
	style="position: fixed; top: 100PX; left: 40PX; z-index: 2000; width: 300px">
</div>