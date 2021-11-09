<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table {
	text-align: center;
}
</style>
</head>
<body>



	<div class="container">
		<div class="row my-5">

			<div class="col-1 text-end">
				<img alt="" src="/resources/img/common/bg3.png" width="120%;" class="pr-5">
			</div>

			<div class="col-6 text-starts align-self-center">
				<h2 style="border-bottom: 3px solid gray;">매 치 관 리</h2>
			</div>

		</div>



		<div class="col-8">

			<div class="accordion" id="accordionPanelsStayOpenExample">
				<div class="accordion-item">
					<h2 class="accordion-header" id="panelsStayOpen-headingOne">
						<button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="true" aria-controls="panelsStayOpen-collapseOne">
							<img style="margin-right: 1rem;" src="/resources/img/common/vs.png" width="10%">경기 예정 리스트
						</button>
					</h2>
					<div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse show" aria-labelledby="panelsStayOpen-headingOne">
						<div class="accordion-body">


							<table class="table table-striped table-hover">

								<thead>

									<tr>
										<th scope="col" width="*%">경기 일정 (날자 / 시간)</th>
										<th scope="col" width="20%">HOME TEAM</th>
										<th scope="col" width="20%"></th>
										<th scope="col" width="20%">AWAY TEAM</th>
									</tr>

								</thead>

								<tbody>
									<c:forEach items="${matchBeforeManage }" var="beforeMatch">
										<tr>
											<td>${beforeMatch.matchDate }&nbsp;/&nbsp;${beforeMatch.matchStartTime}&nbsp;~&nbsp;${beforeMatch.matchEndTime}</td>
											<td>${beforeMatch.homeTeamName}</td>
											<td style="color: red;">VS</td>
											<td>${beforeMatch.awayTeamName }</td>
											<td></td>
										</tr>
									</c:forEach>
								</tbody>

							</table>

						</div>
					</div>
				</div>
				<div class="accordion-item">
					<h2 class="accordion-header" id="panelsStayOpen-headingTwo">
						<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseTwo" aria-expanded="false" aria-controls="panelsStayOpen-collapseTwo">
							<img style="margin-right: 1rem;" src="/resources/img/common/closed.png" width="12%">지난 경기 리스트
						</button>
					</h2>
					<div id="panelsStayOpen-collapseTwo" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingTwo">
						<div class="accordion-body">


							<table class="table table-striped table-hover">

								<thead>

									<tr>
										<th scope="col" width="*%">경기 일정 (날자 / 시간)</th>
										<th scope="col" width="20%">HOME TEAM</th>
										<th scope="col" width="20%">SCORE</th>
										<th scope="col" width="20%">AWAY TEAM</th>
									</tr>

								</thead>

								<tbody>
									<c:forEach items="${matchAfterManage }" var="afterMatch">
										<tr>
											<td>${afterMatch.matchDate }&nbsp;/&nbsp;${afterMatch.matchStartTime}&nbsp;~&nbsp;${afterMatch.matchEndTime}</td>
											<td>${afterMatch.homeTeamName}</td>

											<td><c:choose>
													<c:when test="${afterMatch.matchResultHometeamScore > afterMatch.matchResultAwayteamScore }">
														<div class="row">
															<div style="color: red;" class="col">${afterMatch.matchResultHometeamScore }</div>
															<div class="col">:</div>
															<div class="col">${afterMatch.matchResultAwayteamScore }</div>
														</div>
													</c:when>

													<c:when test="${afterMatch.matchResultHometeamScore < afterMatch.matchResultAwayteamScore}">
														<div class="row">
															<div class="col">${afterMatch.matchResultHometeamScore }</div>
															<div class="col">:</div>
															<div style="color: red;" class="col">${afterMatch.matchResultAwayteamScore }</div>
														</div>
													</c:when>


													<c:otherwise>
														<div class="row">
															<div style="color: blue;" class="col">${afterMatch.matchResultHometeamScore }</div>
															<div class="col">:</div>
															<div style="color: blue;" class="col">${afterMatch.matchResultAwayteamScore }</div>
														</div>
													</c:otherwise>

												</c:choose></td>

											<td>${afterMatch.awayTeamName }</td>
										</tr>
									</c:forEach>
								</tbody>

							</table>


						</div>
					</div>
				</div>
			</div>

		</div>

	</div>





</body>
</html>