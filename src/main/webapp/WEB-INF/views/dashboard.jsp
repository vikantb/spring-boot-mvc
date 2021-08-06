
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
<title>Dashboard</title>

</head>
<body>
	
<div class="container">
    <div class="row col-12 mt-4">
        <h3 class="text-muted text-end px-5">Welcome ${USER.name} ! <a href="/logout"><i class="fa fa-sign-out text-danger border border-2 border-danger rounded-circle p-1"></i></a> </h3>
    </div>
    <div class="border border-2 border-muted rounded px-5 mt-4">
	<span style="position: relative;top: -14px;padding:5px;background-color:white;color:rgb(27, 198, 228);">Employee Listings</span>
    
    <c:if test="${not empty isAdded}">
			<div class="alert alert-danger m-3" role="alert">${isAdded}</div>
	</c:if>
    
    <div class="row">
        <div class="offset-sm-2 col-sm-5 col-12">
            <a href="/add">
                <button class="col-12 btn btn-outline-success">Upload Employee Details</button>
            </a>
        </div>
        <div class="col-sm-5 col-12">
            <a href="/download">
                <button class="col-12 btn btn-outline-primary">Download Employee Details</button>
            </a>
        </div>
    </div>

    <div class="row">
        <table class="table text-center table-bordered mt-5">
			<thead>
				<tr>
					<th scope="col">Employee Code</th>
					<th scope="col">Employee Name</th>
					<th scope="col">Location</th>
					<th scope="col">Email</th>
					<th scope="col">Date of Birth</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${employees}" var="employee">
					<tr>
						<td>${employee.code}</td>
						<td>${employee.name}</td>
						<td>${employee.location}</td>
						<td>${employee.email}</td>
						<td>${employee.dob}</td>
						<td><a href="/edit/${employee.code}">Edit</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
    </div>
	</div>
</div>

<c:remove var="isAdded" />

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous">
	</script>
		
</body>

</html>