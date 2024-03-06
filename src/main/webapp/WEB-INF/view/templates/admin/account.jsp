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
	</div>
	<div id="layoutSidenav">
		<%@ include file="../../templates/admin/layout/nav.jsp"%>

		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<h1 class="mt-4">Danh sách người dùng</h1>
					<div class="card mb-4">
						<div class="card-header">
							<button type="button" class="btn btn-success"
								data-bs-toggle="modal" data-bs-target="#exampleModalAdd">
								Thêm mới</button>
							<!-- Modal Add User-->
							<div class="modal fade" id="exampleModalAdd" tabindex="-1"
								aria-labelledby="exampleModalLabel" aria-hidden="true">
								<div class="modal-dialog modal-lg">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalLabelll">Thêm
												mới</h5>
											<button type="button" class="btn-close"
												data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body">
											<form:form action="account/saveUser" modelAttribute="user">
												<div class="row">
													<div class="col-6">
														<label for="addname" class="col-form-label">Name:</label>
														<form:input type="text" path="full_name"
															class="form-control" id="addname" required="required"/>
													</div>
													<div class="col-6">
														<label for="addcost" class="col-form-label">Email:</label>
														<form:input type="email" class="form-control" id="addcost"
															path="email"  required="required"/>
													</div>
												</div>
												<div class="row">
													<div class="col-6">
														<label for="addname" class="col-form-label">Số
															điện thoại:</label>
														<form:input type="number" class="form-control"
															id="addname" path="phone_number"  required="required"/>
													</div>
													<div class="col-6">
														<label for="addcost" class="col-form-label">Địa
															chỉ:</label>
														<form:input type="text" id="addcost" path="address"
															class="form-control" required="required" />
													</div>
												</div>
												<div class="row">
													<div class="col-6">
														<label for="addname" class="col-form-label">Tài
															khoản:</label>
														<form:input type="text" class="form-control" id="addname"
															path="username" required="required" />
													</div>
													<div class="col-6">
														<label for="addcost" class="col-form-label">Mật
															khẩu:</label>
														<form:input type="password" class="form-control"
															id="addcost" path="password" required="required" />
													</div>
													<div class="col-6">
														<label for="ct_id" class="col-form-label">Vai trò:</label>
														<form:select class="form-control" id="ct_id"
															path="role_id" required="required">
															<form:option value="0" label="Chọn loại vai trò" />
															<c:forEach var="role" items="${roles }">
																<form:option value="${role.id }"
																	label="${role.role_name }" />
															</c:forEach>
														</form:select>
													</div>
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-secondary"
														data-bs-dismiss="modal">Đóng</button>
													<button type="submit" class="btn btn-primary">Thêm
													</button>
												</div>
											</form:form>
										</div>
									</div>
								</div>
							</div>
							<!-- Modal Add-->
						</div>
						<div class="card-body">
							<table id="datatablesSimple">
								<thead>
									<tr style="background-color: gray !important;">
										<th>Họ tên</th>
										<th>Email</th>
										<th>Số điện thoại</th>
										<th>Tài khoản</th>
										<th>Vai trò</th>
										<th>Trạng thái</th>
										<th>Hành động</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="user" items="${users }">
										<c:url var="updateLink" value="/admin/showFormForUpdate">
											<c:param name="customerId" value="${user.id}"></c:param>
										</c:url>
										<c:url var="deleteLink" value="/admin/account/deleteUser">
											<c:param name="userId" value="${user.id}"></c:param>
										</c:url>
										<tr>
											<td>${user.full_name }</td>
											<td>${user.email }</td>
											<td>${user.phone_number }</td>
											<td>${user.username }</td>
											<td><c:forEach var="role" items="${roles}">
												${user.role_id == role.id ? role.role_name : ''}
											</c:forEach></td> ${user.status == 1 ? '<td style="color: #1c7430; font-weight: bold">Hoạt động</td>' : '<td style="color: red; font-weight: bold">Đã khóa</td>'}
											<td style="width: 270px">
												<button type="button" style="width: 80px"
													class="btn btn-success" data-bs-toggle="modal"
													data-bs-target="#idModelMail${user.id}">Gửi</button>
												<button type="button" style="width: 80px"
													class="btn btn-primary" data-bs-toggle="modal"
													data-bs-target="#exampleModal${user.id}">Sửa</button>
												<button type="button" style="width: 80px"
													class="btn btn-warning" data-bs-toggle="modal"
													data-bs-target="#idModelDetail${user.id}">Chi tiết</button>
												<button type="button" style="width: 80px"
													class="btn btn-danger mt-1" data-bs-toggle="modal"
													data-bs-target="#idModelDel${user.id}">Xóa</button>
												<form
													action="${user.status == 1 ? 'ql-user/lock': 'ql-user/un-lock' }"
													method="post" style="margin-left: 85px; margin-top: -38px">
													<input type="hidden" class="form-control" id="id"
														name="userId" value="${user.id}">
													<button type="submit" style="width: 80px"
														class="btn ${user.status == 1 ? 'btn-danger': 'btn-success' } ">${user.status == 1 ? 'Khóa': 'Mở' }</button>
												</form>

												<div class="modal fade" id="idModelDel${user.id}"
													tabindex="-1" aria-labelledby="exampleModalLabel"
													aria-hidden="true">
													<div class="modal-dialog">
														<div class="modal-content">
															<div class="modal-header">
																<h5 class="modal-title" id="exampleModalLabel">Bạn
																	chắc chắn muốn xóa ?</h5>
																<button type="button" class="btn-close"
																	data-bs-dismiss="modal" aria-label="Close"></button>
															</div>
															<div class="modal-body">
																Người dùng : <span>${user.full_name}</span>
																<form action="account/deleteUser" method="post">
																	<input type="hidden" class="form-control" id="id"
																		name="idUser" value="${user.id}">
																	<div class="modal-footer" style="margin-top: 20px">
																		<button type="button" class="btn btn-secondary"
																			data-bs-dismiss="modal">Close</button>
																		<button type="submit" class="btn btn-danger">Xóa</button>
																	</div>
																</form>
															</div>

														</div>
													</div>
												</div>
												
												<!-- Modal Send message User-->
												<div class="modal fade" id="idModelMail${user.id}"
													tabindex="-1" aria-labelledby="exampleModalLabel"
													aria-hidden="true">
													<div class="modal-dialog">
														<div class="modal-content">
															<div class="modal-header">
																<h5 class="modal-title" id="exampleModalLabel">
																	Gửi đến: <span th:text="${user.email}"></span>
																</h5>
																<button type="button" class="btn-close"
																	data-bs-dismiss="modal" aria-label="Close"></button>
															</div>
															<div class="modal-body">
																<form th:action="@{/ql-user/send-mail}" method="post">
																	<input type="hidden" class="form-control" id="id"
																		name="idUser" th:value="${user.id}"> <label
																		for="addname" class="col-form-label">Nội dung:</label>
																	<textarea rows="10" class="form-control" id="addname"
																		name="note"></textarea>
																	<div class="modal-footer" style="margin-top: 20px">
																		<button type="button" class="btn btn-secondary"
																			data-bs-dismiss="modal">Đóng</button>
																		<button type="submit" class="btn btn-success">Gửi</button>

																	</div>
																</form>

															</div>

														</div>
													</div>
												</div>
												<!-- Modal Detail User-->
												<div class="modal fade" id="idModelDetail${user.id}"
													tabindex="-1" aria-labelledby="exampleModalLabel"
													aria-hidden="true">
													<div class="modal-dialog modal-lg">
														<div class="modal-content">
															<div class="modal-header">
																<h5 class="modal-title" id="exampleModalLabel">
																	Chi tiết : ${user.full_name}</span>
																</h5>
																<button type="button" class="btn-close"
																	data-bs-dismiss="modal" aria-label="Close"></button>
															</div>
															<div class="modal-body">
																<div class="row">
																	<div class="col-6">
																		<h5>Họ tên :</h5>
																		<p>${user.full_name}</p>
																		<h5>Email:</h5>
																		<p>${user.email}</p>
																		<h5>Số điện thoại:</h5>
																		<p>${user.phone_number}</p>
																		<h5>Tài khoản:</h5>
																		<p th:text="">${user.username}</p>
																	</div>
																	<div class="col-6">
																		<h5>Địa chỉ :</h5>
																		<p>${user.address}</p>
																		<h5>Vai trò:</h5>
																		<p>
																			<c:forEach var="role" items="${roles}">
																				${user.role_id == role.id ? role.role_name : ''}
																			</c:forEach>
																		</p>
																		<h5>Lần đăng nhập gần nhất:</h5>
																		<p>${user.created}</p>
																		<h5>Note:</h5>
																		<p>${user.note}</p>
																	</div>

																</div>
															</div>
														</div>
													</div>
												</div>
											</td>
										</tr>

										<!-- Modal Update-->
										<div class="modal fade" id="exampleModal${user.id}"
											tabindex="-1" aria-labelledby="exampleModalLabel"
											aria-hidden="true">
											<div class="modal-dialog modal-lg ">
												<div class="modal-content">
													<div class="modal-header">
														<h5 class="modal-title" id="exampleModalLabell">Cập
															nhật</h5>
														<button type="button" class="btn-close"
															data-bs-dismiss="modal" aria-label="Close"></button>
													</div>
													<div class="modal-body">
														<form action="account/updateUser" method="post">
															<input type="hidden" id="userId" name="userId"
																value="${user.id}">
															<div class="row">
																<div class="col-6">
																	<label for="addname" class="col-form-label">Họ
																		và tên: </label> <input type="text"
																		class="form-control" id="addname" name="full_name"
																		value="${ user.full_name}" />
																</div>
																<div class="col-6">
																	<label for="addcost" class="col-form-label">Email:</label>
																	<input readonly="readonly" type="email"
																		class="form-control" id="addcost" name="email"
																		value="${user.email }" />
																</div>
															</div>
															<div class="row">
																<div class="col-6">
																	<label for="addname" class="col-form-label">Số
																		điện thoại:</label> <input type="number" class="form-control"
																		id="addname" name="phone_number"
																		value="${user.phone_number }" required="required" />
																</div>
																<div class="col-6">
																	<label for="addcost" class="col-form-label">Địa
																		chỉ:</label> <input type="text" class="form-control"
																		id="addcost" name="address" value="${user.address }"
																		required="required" />
																</div>
															</div>
															<div class="row">
																<div class="col-6">
																	<label for="addname" class="col-form-label">Tài
																		khoản:</label> <input readonly="readonly" type="text"
																		class="form-control" id="addname" name="username"
																		value="${user.username }" required="required" /> <input
																		readonly="readonly" type="hidden" class="form-control"
																		id="addname" name="id" value="${user.id }"
																		required="required" /> <input readonly="readonly"
																		type="hidden" class="form-control" id="addname"
																		name="password" value="${user.password }"
																		required="required" /> <input readonly="readonly"
																		type="hidden" class="form-control" id="addname"
																		name="status" value="${user.status }"
																		required="required" />
																</div>
																<div class="col-6">
																	<label for="ct_id" class="col-form-label">Vai
																		trò:</label> <select class="form-control" id="ct_id"
																		name="role_id" required="required">
																		<option value="0">Chọn vai trò</option>
																		<c:forEach var="role" items="${roles }" >
																			<option value="${role.id }" ${role.id == user.role_id ? 'selected' : '' }>${role.role_name }</option>
																		</c:forEach>
																	</select>
																</div>
															</div>
															<div class="modal-footer">
																<button type="button" class="btn btn-secondary"
																	data-bs-dismiss="modal">Đóng</button>
																<button type="submit" class="btn btn-primary">Lưu
																</button>
															</div>
														</form>
													</div>

												</div>
											</div>
										</div>
										<!-- Modal Update-->
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>

			</main>

			<script>
      ClassicEditor.create(document.querySelector('#editor')).then(eidt => {
        console.log("da" + eidt);
      })
              .catch(error => {
                console.error(error);
              });

    </script>
			<script>

      var dodai = document.getElementById("dodai").value;
      var a = parseInt(dodai);
      for(var i = 1;i<=a+10;i++){
        var name = "#editor"  + i
        ClassicEditor.create(document.querySelector(name)).then(eidt => {
          console.log("da" + eidt);
        })
                .catch(error => {
                  console.error(error);
                });
      }


    </script>
			<footer th:replace="admin/fragments :: footer"
				class="py-4 bg-light mt-auto"> </footer>
		</div>
	</div>
	<%@ include file="../../templates/admin/layout/js_body.jsp"%>
</body>
</html>