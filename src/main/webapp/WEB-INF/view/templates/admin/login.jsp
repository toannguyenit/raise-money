<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!doctype html>
<html>
<head>
<title>Login - SB Admin</title>
<%
String PATH = "ASM1/src/main/webapp";
%>
<jsp:include page='${PATH}/WEB-INF/view/templates/admin/layout/meta.jsp' />
<jsp:include page='${PATH}/WEB-INF/view/templates/admin/layout/css.jsp' />
<jsp:include page='${PATH}/WEB-INF/view/templates/admin/layout/js.jsp' />

</head>
<body class="bg-primary">
	<div class="sb-nav-fixed">
		<%@ include file="../../templates/admin/layout/sidebar.jsp"%>
		<%@ include file="../../templates/admin/home.jsp"%>
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
							<!-- Modal Add-->
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
											<form method="post" enctype="multipart/form-data">
												<div class="row">
													<div class="col-6">
														<label for="addname" class="col-form-label">Name:</label>
														<input type="text" class="form-control" id="addname"
															name="fullName" required>
													</div>
													<div class="col-6">
														<label for="addcost" class="col-form-label">Email:</label>
														<input type="email" class="form-control" id="addcost"
															name="email" required>
													</div>
												</div>
												<div class="row">
													<div class="col-6">
														<label for="addname" class="col-form-label">Số
															điện thoại:</label> <input type="number" class="form-control"
															id="addname" name="phoneNumber" required>
													</div>
													<div class="col-6">
														<label for="addcost" class="col-form-label">Địa
															chỉ:</label> <input type="text" class="form-control" id="addcost"
															name="address" required>
													</div>
												</div>
												<div class="row">
													<div class="col-6">
														<label for="addname" class="col-form-label">Tài
															khoản:</label> <input type="text" class="form-control"
															id="addname" name="userName" required>
													</div>
													<div class="col-6">
														<label for="addcost" class="col-form-label">Mật
															khẩu:</label> <input type="password" class="form-control"
															id="addcost" name="password" required>
													</div>
													<div class="col-6">
														<label for="ct_id" class="col-form-label">Vai trò:</label>
														<select class="form-control" id="ct_id" name="idRole"
															required>
															<option value="" selected>Chọn loại vai trò</option>
														</select>
													</div>
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-secondary"
														data-bs-dismiss="modal">Đóng</button>
													<button type="submit" class="btn btn-primary">Thêm
													</button>
												</div>
											</form>
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
										<!--                <th>Địa chỉ</th>-->
										<th>Tài khoản</th>
										<th>Vai trò</th>
										<th>Trạng thái</th>
										<th>Hành động</th>
									</tr>
								</thead>
								<tfoot>
									<tr>

									</tr>
								</tfoot>
								<tbody>
									<input type="hidden" th:value="${list.size()}" id="dodai" />
									<th:block th:each="user : ${list}">
										<tr>
											<td>Minh Khương</td>
											<td>khuongtran1410@gmail.com</td>
											<td>0337792891</td>
											<!--                  <td th:text="${user.address}"></td>-->
											<td>KhuongTM</td>
											<td>Admin</td>
											<td style="color: #1c7430; font-weight: bold">Hoạt động</td>
											<td style="color: red; font-weight: bold">Đã khóa</td>
											<td style="width: 270px">
												<button type="button" style="width: 80px"
													class="btn btn-success" data-bs-toggle="modal"
													th:data-bs-target="'#idModelMail'+${user.id}">Gửi
												</button>
												<button type="button" style="width: 80px"
													class="btn btn-primary" data-bs-toggle="modal"
													th:data-bs-target="'#exampleModal'+${user.id}">
													Sửa</button>
												<button type="button" style="width: 80px"
													class="btn btn-warning" data-bs-toggle="modal"
													th:data-bs-target="'#idModelDetail'+${user.id}">
													Chi tiết</button>
												<button type="button" style="width: 80px"
													class="btn btn-danger mt-1" data-bs-toggle="modal"
													th:data-bs-target="'#idModelDel'+${user.id}">Xóa</button>
												<form th:if="${user.status == 1}"
													th:action="@{/ql-user/lock}" method="post"
													style="margin-left: 85px; margin-top: -38px">
													<input type="hidden" class="form-control" id="id"
														name="idUser" th:value="${user.id}">
													<button type="submit" style="width: 80px"
														class="btn btn-danger">Khóa</button>
												</form>

												<form th:if="${user.status == 0}"
													th:action="@{/ql-user/un-lock}" method="post">
													<input type="hidden" class="form-control" id="id"
														name="idUser" th:value="${user.id}">
													<button type="submit" style="width: 80px"
														class="btn btn-success">Mở</button>
												</form>
												<div class="modal fade" th:id="'idModelDel' + ${user.id}"
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
																Người dùng : <span th:text="${user.fullName}"></span>
																<form th:action="@{/ql-user/delete}" method="post">
																	<input type="hidden" class="form-control" id="id"
																		name="idUser" th:value="${user.id}">
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
												<div class="modal fade" th:id="'idModelMail' + ${user.id}"
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
												<div class="modal fade" th:id="'idModelDetail' + ${user.id}"
													tabindex="-1" aria-labelledby="exampleModalLabel"
													aria-hidden="true">
													<div class="modal-dialog modal-lg">
														<div class="modal-content">
															<div class="modal-header">
																<h5 class="modal-title" id="exampleModalLabel">
																	Chi tiết : <span th:text="${user.fullName}"></span>
																</h5>
																<button type="button" class="btn-close"
																	data-bs-dismiss="modal" aria-label="Close"></button>
															</div>
															<div class="modal-body">
																<div class="row">
																	<div class="col-6">
																		<h5>Họ tên :</h5>
																		<p th:text="${user.fullName}"></p>
																		<h5>Email:</h5>
																		<p th:text="${user.email}"></p>
																		<h5>Số điện thoại:</h5>
																		<p th:text="${user.phoneNumber}"></p>
																		<h5>Tài khoản:</h5>
																		<p th:text="${user.userName}"></p>
																	</div>
																	<div class="col-6">
																		<h5>Địa chỉ :</h5>
																		<p th:text="${user.address}"></p>
																		<h5>Vai trò:</h5>
																		<p th:text="${user.role.roleName}"></p>
																		<h5>Lần đăng nhập gần nhất:</h5>
																		<p th:text="${user.createdAt}"></p>
																		<h5>Note:</h5>
																		<p th:text="${user.note}"></p>
																	</div>

																</div>
															</div>
														</div>
													</div>
												</div>
											</td>
										</tr>
										<!-- Modal Update-->
										<div class="modal fade" th:id="'exampleModal'+${user.id}"
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
														<form enctype="multipart/form-data"
															th:action="@{/ql-user/update}" method="post">
															<input type="hidden" name="id">
															<div class="row">
																<div class="col-6">
																	<label for="addname" class="col-form-label">Họ
																		và tên:</label> <input type="text" class="form-control"
																		id="addname" name="fullName" required>
																</div>
																<div class="col-6">
																	<label for="addcost" class="col-form-label">Email:</label>
																	<input readonly type="email" class="form-control"
																		id="addcost" name="email" required>
																</div>
															</div>
															<div class="row">
																<div class="col-6">
																	<label for="addname" class="col-form-label">Số
																		điện thoại:</label> <input type="number" class="form-control"
																		id="addname" name="phoneNumber" required>
																</div>
																<div class="col-6">
																	<label for="addcost" class="col-form-label">Địa
																		chỉ:</label> <input type="text" class="form-control"
																		id="addcost" name="address" required>
																</div>
															</div>
															<div class="row">
																<div class="col-6">
																	<label for="addname" class="col-form-label">Tài
																		khoản:</label> <input readonly type="text"
																		class="form-control" id="addname" name="userName"
																		required> <input readonly type="hidden"
																		class="form-control" id="addname" name="idUser"
																		required> <input readonly type="hidden"
																		class="form-control" id="addname" name="password"
																		required> <input readonly type="hidden"
																		class="form-control" id="addname" name="status"
																		required>
																</div>
																<div class="col-6">
																	<label for="ct_id" class="col-form-label">Vai
																		trò:</label> <select class="form-control" id="ct_id"
																		name="idRole" required>
																		<option th:value="${user.role.id}"
																			th:text="${user.role.roleName}" selected>Chọn
																			loại vai trò</option>
																		<th:block th:each="role : ${roleList}">
																			<option th:value="${role.id}"><span
																					th:text="${role.roleName}"></span></option>
																		</th:block>
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

									</th:block>
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