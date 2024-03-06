<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>



<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark"></nav>
	<!-- Navbar Brand-->
	<a class="navbar-brand ps-3" href="/asm1ver2/admin/">QUẢN TRỊ</a>
	<!-- Sidebar Toggle-->
	<button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0"
		id="sidebarToggle" href="#!">
		<i class="fas fa-bars"></i>
	</button>
	<!-- Navbar Search-->
	<form
		class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
	</form>
	<!-- Navbar-->
	<ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
		<li class="nav-item dropdown"><a class="nav-link dropdown-toggle"
			href="/asm1ver2/" role="button"><i class="fas fa-user fa-fw"></i><span>
					Logout</span></a>
			<ul class="dropdown-menu dropdown-menu-end"
				aria-labelledby="navbarDropdown1">
				<li><a class="dropdown-item" href="#">Settings</a></li>
				<li><a class="dropdown-item" href="#">Activity Log</a></li>
				<li>
					<hr class="dropdown-divider" />
				</li>
				<li><a class="dropdown-item" href="/logout">Logout</a></li>
			</ul></li>
	</ul>
</nav>
