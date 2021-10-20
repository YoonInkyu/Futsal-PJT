<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<div class="row my-5">

		<div class="col-2 mx-auto" style="font-size: 40px; text-align: center; border-bottom: 3px solid black;">FAQ</div>

	</div>




	<div class="row">

		<div class="row mt-5">

			<div class="col-8 mx-auto">

				<table class="table table-striped table-hover">

					<thead>

						<tr>
							<th scope="col">번호</th>
							<th scope="col">제목</th>
							<th scope="col">작성일자</th>
							<th scope="col">조회</th>
						</tr>

					</thead>

					<tbody>

						<tr>
							<td>2</td>
							<td>HM풋살파크 문의</td>
							<td>2020.11.23</td>
							<td>18,000</td>
						</tr>

						<tr>
							<td>1</td>
							<td>FAQ 1</td>
							<td>2019.11.23</td>
							<td>1,000</td>
						</tr>


					</tbody>

				</table>

			</div>

		</div>



		<div class="row mt-5">

			<div class="col-3 mx-auto m-0 p-0">

				<div class="row mx-auto">

					<div class="col-3">
						<select class="form-select form-select" aria-label=".form-select-lg example">
							<option selected>제목</option>
							<option value="1">내용</option>
						</select>
					</div>

					<div class="col">
						<input class="form-control" type="search" placeholder="Search" aria-label="Search">
					</div>

					<div class="col-1">
						<button class="btn btn-primary " type="submit">Search</button>
					</div>

				</div>

			</div>

		</div>




		<div class="row mt-5">

			<div class="col">

				<nav aria-label="Page navigation example">

					<ul class="pagination justify-content-center m-0 p-0">

						<li class="page-item"><a class="page-link" href="#" aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
						<li class="page-item active"><a class="page-link" href="#">1</a></li>
						<li class="page-item"><a class="page-link" href="#">2</a></li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item"><a class="page-link" href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a></li>

					</ul>

				</nav>

			</div>

		</div>



	</div>





</body>
</html>