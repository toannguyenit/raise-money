<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!-- HOME -->
<section class="section-hero overlay inner-page bg-image bg-header"
	id="home-section">
	<div class="container">
		<div class="row">
			<div class="col-md-7">
				<h1 class="text-white font-weight-bold">Danh sách các đợt quyên
					góp</h1>
			</div>
		</div>
	</div>
</section>
<section class="site-section">
	<div class="container">
		<div class="row mb-5 justify-content-center">
			<div class="col-md-7 text-center">
				<h2 class="section-title mb-2">Các đợt quyên góp</h2>
			</div>
		</div>
		<ul class="job-listings mb-5">
			<c:forEach var="donation" items="${donations }">
				<li style="margin-bottom: 20px"
					class="job-listing d-block d-sm-flex pb-3 pb-sm-0 align-items-center ">
					<div
						class="job-listing-about d-sm-flex custom-width w-100 justify-content-between mx-4">
						<div class="job-listing-position custom-width mb-3 mb-sm-0"
							style="padding: 10px; width: 250px">
							<a href="/asm1ver2/user/donation/detail/${donation.id}"
								class="donation-name"> ${donation.name} </a> <br>
							<strong> <c:choose>
									<c:when test="${donation.status == 0}">Mới tạo</c:when>
									<c:when test="${donation.status == 1}">Đang quyên góp</c:when>
									<c:when test="${donation.status == 2}">Kết thúc quyên góp</c:when>
									<c:otherwise>Đóng quyên góp</c:otherwise>
								</c:choose>
							</strong>
						</div>
						<div class="job-listing-location mb-3 mb-sm-0 custom-width w-10"
							style="padding: 10px;">
							Ngày bắt đầu<br> <strong>${donation.start_date}</strong><br>
						</div>
						<div class="job-listing-location mb-3 mb-sm-0 custom-width w-10"
							style="padding: 10px;">
							Ngày kết thúc<br> <strong>${donation.end_date}</strong><br>
						</div>
						<div class="job-listing-location mb-3 mb-sm-0 custom-width w-25"
							style="padding: 10px;">
							<span class="icon-room"></span><span>${donation.organization_name}</span><br>
							<strong>${donation.phone_number}</strong><br>
						</div>
						<div class="job-listing-meta custom-width w-20">
							<c:choose>
								<c:when test="${donation.status == 1}">
									<button style="margin-top: 20px" class="btn btn-primary py-2"
										type="button" data-toggle="modal"
										data-target="#quyengopModal${donation.id}">Quyên góp</button>
								</c:when>
								<c:when test="${donation.status == 2}">Kết thúc quyên góp</c:when>
								<c:otherwise>
									<p
										style="margin-top: 20px; background-color: white !important;"
										class="btn py-2">
										<span style="color: white">Quyên góp</span>
									</p>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</li>

				<!-- Modal Quyen gop -->
				<div class="modal fade" tabindex="-1" role="dialog"
					aria-labelledby="exampleModalLabel" aria-hidden="true"
					id="quyengopModal${donation.id}">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">
									Quyên góp: <span>${donation.name} (${donation.code})</span>
								</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<form method="post"
								action="user/donation/detail/add-user-donation/">
								<input type="hidden" class="form-control" id="id"
									name="donationId" value="${donation.id}">
								<div class="modal-body">
									<div class="row">
										<div class="col-12">
											<label for="addname" class="col-form-label">Họ tên:</label> <input
												type="text" class="form-control" id="addname" name="name"
												placeholder="" required> <label for="addname"
												class="col-form-label">Số tiền quyên góp:</label> <input
												type="number" class="form-control" placeholder=""
												id="addname" name="money" required> <input
												type="hidden" class="form-control" placeholder=""
												id="addname" name="idUser"> <input type="hidden"
												class="form-control" placeholder="" id="addname"
												name="idDonation" required> <label for="addname"
												class="col-form-label">Lời nhắn:</label>
											<textarea rows="5" class="form-control" name="text" required>
                                                </textarea>
										</div>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-dismiss="modal">Đóng</button>
										<button type="submit" data-toggle="modal"
											data-target="#exampleModal" class="btn btn-primary">Quyên
											góp</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</c:forEach>
		</ul>
		<div class="row pagination-wrap">
			<div class="col-md-6 text-center text-md-left mb-4 mb-md-0">
			Trang ${page > 1 ? page : 1} </div>
			<div class="col-md-6 text-center text-md-right">
				<div class="custom-pagination ml-auto">
					<a href="${page > 1 ? (page-1): 1 }" class="prev">Prev</a>
					<div class="d-inline-block"></div>
					<a href="${page > 0 ? (page+1): 2 }" class="next">Next</a>
				</div>
			</div>
		</div>
		<script>
			function detail(id) {
				window.location = '/donation/detail/' + id;
			}
		</script>
	</div>
</section>