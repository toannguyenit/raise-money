<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<div id="layoutSidenav">
	<%@ include file="../../templates/admin/layout/nav.jsp"%>

	<div id="layoutSidenav_content">
		<main>
			<h1>Home admin</h1>
		</main>

	</div>
</div>
<script>
      $("#exampleModalView1").on("hidden.bs.modal", function (e) {
        $("#exampleModalView1 iframe").attr(
          "src",
          $("#exampleModalView1 iframe").attr("src")
        );
      });
    </script>
<script>
      $(document).ready(function () {
        $("#autoWidth,#autoWidth2").lightSlider({
          autoWidth: true,
          loop: true,
          onSliderLoad: function () {
            $("#autoWidth,#autoWidth2").removeClass("cS-hidden");
          },
        });
      });
    </script>
<script>
      ClassicEditor.create(document.querySelector("#editor"))
        .then((eidt) => {
          console.log("da" + eidt);
        })
        .catch((error) => {
          console.error(error);
        });
    </script>
<script>
      ClassicEditor.create(document.querySelector("#editor1"))
        .then((eidt) => {
          console.log("da" + eidt);
        })
        .catch((error) => {
          console.error(error);
        });
    </script>
