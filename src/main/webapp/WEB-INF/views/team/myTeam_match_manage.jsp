<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 팀, 매치 관리</title>
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
<!-- 							<img style="margin-right: 1rem;" src="/resources/img/common/vs.png" width="10%"> -->
							<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" fill="currentColor" class="bi bi-alarm-fill" viewBox="0 0 16 16">
							  <path d="M6 .5a.5.5 0 0 1 .5-.5h3a.5.5 0 0 1 0 1H9v1.07a7.001 7.001 0 0 1 3.274 12.474l.601.602a.5.5 0 0 1-.707.708l-.746-.746A6.97 6.97 0 0 1 8 16a6.97 6.97 0 0 1-3.422-.892l-.746.746a.5.5 0 0 1-.707-.708l.602-.602A7.001 7.001 0 0 1 7 2.07V1h-.5A.5.5 0 0 1 6 .5zm2.5 5a.5.5 0 0 0-1 0v3.362l-1.429 2.38a.5.5 0 1 0 .858.515l1.5-2.5A.5.5 0 0 0 8.5 9V5.5zM.86 5.387A2.5 2.5 0 1 1 4.387 1.86 8.035 8.035 0 0 0 .86 5.387zM11.613 1.86a2.5 2.5 0 1 1 3.527 3.527 8.035 8.035 0 0 0-3.527-3.527z"/>
							</svg><h4 style="margin-left: 3rem;">경기 예정 리스트</h4>
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
<!-- 							<img style="margin-right: 1rem;" src="/resources/img/common/closed.png" width="12%"> -->
							<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" fill="currentColor" class="bi bi-trophy-fill" viewBox="0 0 16 16">
							  <path d="M2.5.5A.5.5 0 0 1 3 0h10a.5.5 0 0 1 .5.5c0 .538-.012 1.05-.034 1.536a3 3 0 1 1-1.133 5.89c-.79 1.865-1.878 2.777-2.833 3.011v2.173l1.425.356c.194.048.377.135.537.255L13.3 15.1a.5.5 0 0 1-.3.9H3a.5.5 0 0 1-.3-.9l1.838-1.379c.16-.12.343-.207.537-.255L6.5 13.11v-2.173c-.955-.234-2.043-1.146-2.833-3.012a3 3 0 1 1-1.132-5.89A33.076 33.076 0 0 1 2.5.5zm.099 2.54a2 2 0 0 0 .72 3.935c-.333-1.05-.588-2.346-.72-3.935zm10.083 3.935a2 2 0 0 0 .72-3.935c-.133 1.59-.388 2.885-.72 3.935z"/>
							</svg><h4 style="margin-left: 3rem;">지난 경기 리스트</h4>
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