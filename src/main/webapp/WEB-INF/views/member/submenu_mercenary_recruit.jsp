<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>





	<div class="row my-5">

		<div class="col-2 mx-auto" style="font-size: 40px; text-align: center; border-bottom: 3px solid black;">용병 구인</div>

	</div>




	<div class="row">

		<div class="row mt-5">

			<div class="col-8 mx-auto">

				<div class="d-grid gap-2 d-md-flex justify-content-md-end mb-5">
					<button class="btn btn-primary col-3" type="button" style="font-size: 30px;">매치등록</button>
				</div>

				<table class="table table-striped table-hover">

					<thead>

						<tr>
							<th scope="col">매치형태</th>
							<th scope="col">지점구분</th>
							<th scope="col">매치일자</th>
							<th scope="col">신청가능팀</th>
							<th scope="col">작성자</th>
							<th scope="col">작성일자</th>
							<th scope="col">신청</th>
						</tr>

					</thead>

					<tbody>

						<tr>
							<td>6 vs 6</td>
							<td>창원점</td>
							<td>2021.10.18(월) 18:00 ~ 19:00</td>
							<td>1팀</td>
							<td>제훈</td>
							<td>2021.10.15</td>
							<td><button type="button" class="btn btn-danger">마감</button></td>
						</tr>

						<tr>
							<td>5 vs 5</td>
							<td>동대문점</td>
							<td>2021.10.20(수) 18:00 ~ 19:00</td>
							<td>2팀</td>
							<td>제훈</td>
							<td>2021.10.15</td>
							<td><button type="button" class="btn btn-danger">마감</button></td>
						</tr>

						<tr>
							<td>6 vs 6</td>
							<td>창원점</td>
							<td>2021.10.18(월) 18:00 ~ 19:00</td>
							<td>1팀</td>
							<td>제훈</td>
							<td>2021.10.15</td>
							<td><button type="button" class="btn btn-primary">가능</button></td>
						</tr>

						<tr>
							<td>6 vs 6</td>
							<td>창원점</td>
							<td>2021.10.18(월) 18:00 ~ 19:00</td>
							<td>1팀</td>
							<td>제훈</td>
							<td>2021.10.15</td>
							<td><button type="button" class="btn btn-danger">마감</button></td>
						</tr>

						<tr>
							<td>6 vs 6</td>
							<td>창원점</td>
							<td>2021.10.18(월) 18:00 ~ 19:00</td>
							<td>1팀</td>
							<td>제훈</td>
							<td>2021.10.15</td>
							<td><button type="button" class="btn btn-danger">마감</button></td>
						</tr>

						<tr>
							<td>6 vs 6</td>
							<td>창원점</td>
							<td>2021.10.18(월) 18:00 ~ 19:00</td>
							<td>1팀</td>
							<td>제훈</td>
							<td>2021.10.15</td>
							<td><button type="button" class="btn btn-danger">마감</button></td>
						</tr>

						<tr>
							<td>5 vs 5</td>
							<td>동대문점</td>
							<td>2021.10.20(수) 18:00 ~ 19:00</td>
							<td>2팀</td>
							<td>제훈</td>
							<td>2021.10.15</td>
							<td><button type="button" class="btn btn-danger">마감</button></td>
						</tr>

						<tr>
							<td>6 vs 6</td>
							<td>창원점</td>
							<td>2021.10.18(월) 18:00 ~ 19:00</td>
							<td>1팀</td>
							<td>제훈</td>
							<td>2021.10.15</td>
							<td><button type="button" class="btn btn-primary">가능</button></td>
						</tr>

						<tr>
							<td>6 vs 6</td>
							<td>창원점</td>
							<td>2021.10.18(월) 18:00 ~ 19:00</td>
							<td>1팀</td>
							<td>제훈</td>
							<td>2021.10.15</td>
							<td><button type="button" class="btn btn-danger">마감</button></td>
						</tr>

						<tr>
							<td>6 vs 6</td>
							<td>창원점</td>
							<td>2021.10.18(월) 18:00 ~ 19:00</td>
							<td>1팀</td>
							<td>제훈</td>
							<td>2021.10.15</td>
							<td><button type="button" class="btn btn-danger">마감</button></td>
						</tr>


					</tbody>

				</table>

			</div>

		</div>



		<div class="row mt-5">

			<div class="col-6 mx-auto m-0 p-0">

				<div class="row mx-auto">

					<div class="col-2">
						<select class="form-select form-select" aria-label=".form-select-lg example">
							<option selected>지점</option>
							<option value="1">동대문점</option>
							<option value="2">시흥점</option>
							<option value="3">서수원점</option>
							<option value="4">안산 고잔점</option>
							<option value="5">인천 청라점</option>
							<option value="6">일산점</option>
						</select>
					</div>

					<div class="col-3">
						<select class="form-select form-select" aria-label=".form-select-lg example">
							<option selected>매치형태</option>
							<option value="1">5 vs 5</option>
							<option value="1">6 vs 6</option>
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
						<li class="page-item"><a class="page-link" href="#">4</a></li>
						<li class="page-item"><a class="page-link" href="#">5</a></li>
						<li class="page-item"><a class="page-link" href="#">6</a></li>
						<li class="page-item"><a class="page-link" href="#">7</a></li>
						<li class="page-item"><a class="page-link" href="#">8</a></li>
						<li class="page-item"><a class="page-link" href="#">9</a></li>
						<li class="page-item"><a class="page-link" href="#">10</a></li>
						<li class="page-item"><a class="page-link" href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a></li>

					</ul>

				</nav>

			</div>

		</div>



	</div>




</body>
</html>