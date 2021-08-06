
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<title>Login</title>
<style>
.con {
	height: 100vh;
	display: flex;
	align-items: center;
	justify-content: center
}
</style>
</head>
<body>

	<div class="container con">
		<div
			class="d-grid col-md-7 mx-auto border border-2 border-muted rounded p-3">
			<c:if test="${not empty login_error}">
				<div class="alert alert-danger m-3" role="alert">${login_error}</div>
			</c:if>
			<form action="/" method="POST">

				<div class="row mt-2 form-group">
					<div class="col-sm-3">
						<label for="Name" class="col-form-label">User ID: </label>
					</div>
					<div class="col-sm-8 offset-sm-1 col-12">
						<input type="text" name="username" class="form-control" required />
					</div>
				</div>
				<div class="row mt-3 mb-2 form-group">
					<div class="col-sm-3">
						<label for="Name" class="col-form-label">Password: </label>
					</div>
					<div class="col-sm-8 offset-sm-1 col-12">
						<input type="password" name="password" class="form-control"
							required />
					</div>
				</div>

				<div class="row mt-4">
					<div class="offset-sm-4">
						<button type="submit"
							class="col-sm-4 col-12 btn btn-outline-success">Login</button>
					</div>
				</div>

			</form>
		</div>
	</div>

	<c:remove var="login_error" />

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous">
		
	</script>

</body>

</html>