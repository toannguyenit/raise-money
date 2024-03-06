<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!-- NAVBAR -->
		<header class="site-navbar mt-3">
			<div class="container-fluid">
				<div class="row align-items-center">
					<div class="site-logo col-6">
						<a href="/asm1ver2/">Website Quyên Góp</a>
					</div>

					<%-- <nav class="mx-auto site-navigation">
						<ul class="site-menu js-clone-nav d-none d-xl-block ml-0 pl-0">
							<li th:if="${session.user}" class="d-lg-none"><a
								href="post-job.html"><span class="mr-2"
									th:text="${session.user.fullName}"></span> </a></li>
							<li class="d-lg-none" th:if="${session.user}"><a
								href="/user/logout">Đăng xuất</a></li>
							<li class="d-lg-none" th:unless="${session.user}"><a
								href="/user/login">Đăng nhập</a></li>
						</ul>
					</nav> --%>

					<div
						class="right-cta-menu text-right d-flex aligin-items-center col-6">
						<div class="ml-auto">
							 <a href="/asm1ver2/" th:if="${session.user}"
								class="btn btn-primary border-width-2 d-none d-lg-inline-block">User</a> <a href="/asm1ver2/admin/" th:unless="${session.user}"
								class="btn btn-primary border-width-2 d-none d-lg-inline-block"><span
								class="mr-2 icon-lock_outline"></span>Admin</a>
						</div>
						<a href="#"
							class="site-menu-toggle js-menu-toggle d-inline-block d-xl-none mt-lg-2 ml-3"><span
							class="icon-menu h3 m-0 p-0 mt-2"></span></a>
					</div>

				</div>
			</div>
		</header>
