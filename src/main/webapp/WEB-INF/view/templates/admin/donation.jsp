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
					<h1 class="mt-4">Danh sách đợt quyên góp</h1>
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
											<form action="donation/saveDonation" method="post">
												<div class="row">
													<div class="col-6">
														<label for="addname" class="col-form-label">Mã đợt
															quyên góp:</label> <input type="text" class="form-control"
															id="addname" name="code" required>
													</div>
													<div class="col-6">
														<label for="addcost" class="col-form-label">Tên
															đợt quyên góp:</label> <input type="text" class="form-control"
															id="addcost" name="name" required>
													</div>
												</div>
												<div class="row">
													<div class="col-6">
														<label for="addname" class="col-form-label">Ngày
															bắt đầu:</label> <input type="date" class="form-control"
															id="addname" name="start_date" required>
													</div>
													<div class="col-6">
														<label for="addcost" class="col-form-label">Ngày
															kết thúc:</label> <input type="date" class="form-control"
															id="addcost" name="end_date" required>
													</div>
												</div>
												<div class="row">
													<div class="col-6">
														<label for="addname" class="col-form-label">Tổ
															chức:</label> <input type="text" class="form-control"
															id="addname" name="organization_name" required>
													</div>
													<div class="col-6">
														<label for="addcost" class="col-form-label">Số
															điện thoại:</label> <input type="number" class="form-control"
															id="addcost" name="phone_number" required>
													</div>
													<div class="col-12">
														<label for="ct_id" class="col-form-label">Nội
															dung:</label>
														<textarea name="description" class="form-control"
															cols="50" rows="5" required>Fill content</textarea>
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
										<th>Mã</th>
										<th>Tên</th>
										<th>Ngày bắt đầu</th>
										<th>Ngày kết thúc</th>
										<th>Tổ chức</th>
										<th>Số điện thoại</th>
										<th>Tổng tiền</th>
										<th>Trạng thái</th>
										<th style="width: 220px">Hành động</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="donation" items="${donations }">
										<tr>
											<td>${donation.code }</td>
											<td>${donation.name }</td>
											<td>${donation.start_date }</td>
											<td>${donation.end_date }</td>
											<td>${donation.organization_name }</td>
											<td>${donation.phone_number }</td>
											<td>${donation.money > 0 ?  donation.money : '0 '}vnd</td>
											<td>
											  <c:choose>
											    <c:when test="${donation.status == 0}">
											      Mới tạo
											    </c:when>
											    <c:when test="${donation.status == 1}">
											      Đang quyên góp
											    </c:when>
											    <c:when test="${donation.status == 2}">
											      Kết thúc quyên góp
											    </c:when>
											    <c:otherwise>
											      Đóng đợt quyên góp
											    </c:otherwise>
											  </c:choose>
											</td>
											<td style="">
												<button type="button" style="width: 105px"
													class="btn btn-primary" data-bs-toggle="modal"
													data-bs-target="#exampleModal${donation.id}">Cập
													nhật</button> <a style="width: 105px" class="btn btn-warning"
												href="detail/${donation.id}"> Chi tiết </a>
												<button type="button" style="width: 105px"
													class="btn btn-danger mt-1" data-bs-toggle="modal"
													data-bs-target="#idModelDel${donation.id}">Xóa</button>
													<c:choose>
													    <c:when test="${donation.status == 0}">
													      	<form action="donation/openDonation" method="post"
															style="margin-left: 110px; margin-top: -38px">
															<input type="hidden" class="form-control" id="id"
																name="donationId" value="${donation.id}">
															<button type="submit" style="width: 105px"
																class="btn btn-success">Quyên góp</button>
															</form>
													    </c:when>
													    <c:when test="${donation.status == 1}">
													      	<form action="donation/finishDonation" method="post"
															style="margin-top: 5px">
															<input type="hidden" class="form-control" id="id"
																name="donationId" value="${donation.id}">
															<button type="submit" style="width: 105px"
																class="btn btn-success">Kết thúc</button>
															</form>
													    </c:when>
													    <c:when test="${donation.status == 2}">
													      <form action="donation/closeDonation" method="post"
															style="margin-top: 5px">
															<input type="hidden" class="form-control" id="id"
																name="donationId" value="${donation.id}">
															<button type="submit" style="width: 105px"
																class="btn btn-success">Đóng</button>
															</form>
													    </c:when>
													    <c:otherwise>
													      
													    </c:otherwise>
											  		</c:choose>
											  		
												 <!-- Modal Delete-->
												<div class="modal fade" id="idModelDel${donation.id}"
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
																Đợt quyên góp : <span>${donation.name}</span>
																<form action="donation/deleteDonation" method="post">
																	<input type="hidden" class="form-control" id="id"
																		name="donationId" value="${donation.id}">
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
											</td>
										</tr>

										<!-- Modal Update-->
										<div class="modal fade" id="exampleModal${donation.id}"
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
														<form action="donation/updateDonation" method="post">
															<input type="hidden" name="donationId"
																value="${donation.id}">
															<div class="row">
																<div class="col-6">
																	<label for="addname" class="col-form-label">Mã
																		đợt quyên góp:</label> <input type="text" class="form-control"
																		id="addname" name="code" value="${donation.code}">
																</div>
																<div class="col-6">
																	<label for="addcost" class="col-form-label">Tên
																		đợt quyên góp:</label> <input type="text" class="form-control"
																		id="addcost" name="name" value="${donation.name}">
																</div>
															</div>
															<div class="row">
																<div class="col-6">
																	<label for="addname" class="col-form-label">Ngày
																		bắt đầu:</label> <input type="date" class="form-control"
																		id="addname" name="start_date"
																		value="${donation.start_date}">
																</div>
																<div class="col-6">
																	<label for="addcost" class="col-form-label">Ngày
																		kết thúc:</label> <input type="date" class="form-control"
																		id="addcost" name="end_date"
																		value="${donation.end_date}">
																</div>
															</div>
															<div class="row">
																<div class="col-6">
																	<label for="addname" class="col-form-label">Tổ
																		chức:</label> <input type="text" class="form-control"
																		id="addname" name="organization_name"
																		value="${donation.organization_name}">
																</div>
																<div class="col-6">
																	<label for="addcost" class="col-form-label">Số
																		điện thoại:</label> <input type="number" class="form-control"
																		id="addcost" name="phone_number"
																		value="${donation.phone_number}">
																</div>
																<div class="col-12">
																	<label for="ct_id" class="col-form-label">Nội
																		dung:</label>
																	<textarea name="description" class="form-control"
																		cols="50" rows="5">${donation.description}</textarea>
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