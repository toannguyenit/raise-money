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
					<h1 class="mt-4">Chi tiết đợt quyên góp</h1>
					<div class="card mb-4">

						<div class="card-body">
							<!--Detail-->
							<div class="row">
								<div class="col-6">
									<label for="addname" class="col-form-label">Mã đợt
										quyên góp:</label> <input type="text" class="form-control"
										id="addname" name="code" value="${donation.code }"
										readonly="readonly">
								</div>
								<div class="col-6">
									<label for="addcost" class="col-form-label">Tên đợt
										quyên góp:</label> <input type="text" class="form-control"
										id="addcost" name="name" value="${donation.name }"
										readonly="readonly">
								</div>
							</div>
							<div class="row">
								<div class="col-6">
									<label for="addname" class="col-form-label">Ngày bắt
										đầu:</label> <input type="date" class="form-control" id="addname"
										name="start" value="${donation.start_date }"
										readonly="readonly">
								</div>
								<div class="col-6">
									<label for="addcost" class="col-form-label">Ngày kết
										thúc:</label> <input type="date" class="form-control" id="addcost"
										name="end" value="${donation.end_date }" readonly="readonly">
								</div>
							</div>
							<div class="row">
								<div class="col-6">
									<label for="addname" class="col-form-label">Tổng tiền
										quyên góp:</label> <input type="text" class="form-control"
										id="addname" name="start"
										value="${donation.money > 0 ? donation.money : 0 } VND"
										readonly="readonly">
								</div>
								<div class="col-6">
									<label for="addcost" class="col-form-label">Trạng thái:</label>
									<c:choose>
										<c:when test="${donation.status == 0}">
											<input type="text" class="form-control" id="addcost"
												name="end" value="Mới tạo" readonly="readonly">
										</c:when>
										<c:when test="${donation.status == 1}">
											<input type="text" class="form-control" id="addcost"
												name="end" value="Đang quyên góp" readonly="readonly">
										</c:when>
										<c:when test="${donation.status == 2}">
											<input type="text" class="form-control" id="addcost"
												name="end" value="Kết thúc quyên góp" readonly="readonly">
										</c:when>
										<c:otherwise>
											<input type="text" class="form-control" id="addcost"
												name="end" value="Đóng quyên góp" readonly="readonly">
										</c:otherwise>
									</c:choose>

								</div>
							</div>
							<div class="row">
								<div class="col-6">
									<label for="addname" class="col-form-label">Tổ chức:</label> <input
										type="text" class="form-control" id="addname" name="tochuc"
										value="${donation.organization_name }" readonly="readonly">
								</div>
								<div class="col-6">
									<label for="addcost" class="col-form-label">Số điện
										thoại:</label> <input type="number" class="form-control" id="addcost"
										name="sdt" value="${donation.phone_number }"
										readonly="readonly">
								</div>
								<div class="col-12">
									<label for="ct_id" class="col-form-label">Nội dung:</label>
									<textarea name="noidung" class="form-control" cols="50"
										readonly="readonly">${donation.description }</textarea>
								</div>
							</div>
							<!--Detail-->
							<h3 class="mt-4">Danh sách những người quyên góp</h3>
							<table id="datatablesSimple">
								<thead>
									<tr style="background-color: gray !important;">
										<th>Họ Tên</th>
										<th>Tiền quyên góp</th>
										<th>Ngày quyên góp</th>
										<th>Nội dung</th>
										<th>Trạng thái</th>
										<th>Hành động</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="userDonation" items="${userDonations }">
										<tr>
											<td>${userDonation.name }</td>
											<td>${userDonation.money }</td>
											<td>${userDonation.created }</td>
											<td>${userDonation.text }</td>
											<td><c:choose>
													<c:when test="${userDonation.status ==  0 }">Chưa xác nhận</c:when>
													<c:when test="${userDonation.status ==  1 }">Đã xác nhận</c:when>
													<c:otherwise>Đã hủy xác nhận</c:otherwise>
												</c:choose></td>
											<td style="display: flex;"><c:choose>
													<c:when test="${userDonation.status ==  0 }">
														<form action="accept-user-donation" method="post"
															style="margin-left: 30px;">
															<input type="hidden" class="form-control" id="id"
																name="donationId" value="${donation.id}"> <input
																type="hidden" class="form-control" id="id"
																name="userDonationId" value="${userDonation.id}">
															<button type="submit" style="width: 105px"
																class="btn btn-success">Xác nhận</button>
														</form>
														<form action="unaccept-user-donation" method="post"
															style="margin-left: 30px;">
															<input type="hidden" class="form-control" id="id"
																name="donationId" value="${donation.id}"> <input
																type="hidden" class="form-control" id="id"
																name="userDonationId" value="${userDonation.id}">
															<button type="submit" style="width: 150px"
																class="btn btn-danger">Hủy xác nhận</button>
														</form>
													</c:when>
													<c:when test="${userDonation.status ==  1 }">

													</c:when>

													<c:otherwise>Đã hủy xác nhận</c:otherwise>
												</c:choose></td>


										</tr>
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
			<footer class="py-4 bg-light mt-auto">
				<div class="container-fluid px-4"></div>
			</footer>
		</div>


	</div>
	<%@ include file="../../templates/admin/layout/js_body.jsp"%>
</body>
</html>