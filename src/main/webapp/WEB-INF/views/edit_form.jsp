
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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Edit Employee</title>
<style type="text/css">
	a:hover{
		color:white;
	}
</style>
</head>
<body>
	
	
	<div class="container">
		<div class="row col-12 mt-4">
			<h3 class="text-end text-muted px-5">Welcome ${USER.name} ! <a href="/logout"><i class="fa fa-sign-out text-danger border border-2 border-danger rounded-circle p-1"></i></a> </h3>
		</div>
		<form action="/edit" method="POST" class="border border-2 border-muted rounded px-5 mt-4">
			<span style="position: relative;top: -14px;padding:5px;background-color:white;color:rgb(27, 198, 228);">Edit Employee Details</span>
			<div class="row align-items-center mt-3">
				<div class="col-sm-4">Employee Code : </div>
				<div class="col-sm-6"> <input class="form-control" type="number" name="code" value="${code }" required/></div>
			</div>
			<div class="row align-items-center mt-3">
				<div class="col-sm-4">Employee Name : </div>
				<div class="col-sm-6"> <input class="form-control" type="text" name="name" value="${currentEmployee.name }" required/></div>
			</div>
			<div class="row align-items-center mt-3">
				<div class="col-sm-4">Location : </div>
				<div class="col-sm-6"> <textarea class="form-control" name="location" required>${currentEmployee.location }</textarea></div>
			</div>
			<div class="row align-items-center mt-3">
				<div class="col-sm-4">Email : </div>
				<div class="col-sm-6"> <input class="form-control" type="email" name="email" value="${currentEmployee.email }" required/></div>
			</div>
			<div class="row align-items-center mt-3">
				<div class="col-sm-4">Date of Birth : </div>
				<div class="col-sm-6"> <input class="form-control" type="date" name="dob" value="${currentEmployee.dob }" required/></div>
			</div>

			<div class="row align-items-center mb-3">
				<div class="col-sm-4"><button type="submit" class="col-12 btn btn-outline-primary mt-3">Save</button></div>
				<div class="col-sm-4"><a href="/"><button class="col-12 btn btn-outline-success mt-3">Back</button></a></div>
			</div>
		</form>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous">
	</script>
		
</body>

</html>