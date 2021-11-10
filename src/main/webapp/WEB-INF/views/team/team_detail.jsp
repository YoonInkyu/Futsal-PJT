<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resources/team/js/team_detail.js?ver=16"></script>
</head>
<body>



   <div class="container">


     <%--  <div class="modal-header">
      <c:forEach items="${teamDetail }" var="teamDetail" begin="0" end="0">
         <h5 class="modal-title" id="staticBackdropLabel">${teamDetail.teamName }</h5>
         </c:forEach>
         <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div> --%>


      <div class="modal-body my-3">

         <div class="col text-center shadow-lg p-3  bg-body rounded">

            <table class="table table-striped table-hover">

               <thead>

                  <tr>
                     <th scope="col" width="15%">팀로고</th>
                     <th scope="col" width="15%">팀 이 름</th>
                     <th scope="col" width="15%">지 역</th>
                     <th scope="col" width="*%">팀 소개</th>
                     <th scope="col" width="15%">회원 수</th>
                     <th scope="col" width="15%">팀장</th>
                  </tr>

               </thead>

               <tbody>


                     <tr>
                        <%-- <c:if test="${not empty teamDetail.memberImgAttachedName  }">
                        <td><img style="height: 38px; object-fit: cover;" src="/resources/img/member/${teamDetail.memberImgAttachedName }"></td>
                        </c:if>
                        <c:if test="${empty teamDetail.memberImgAttachedName  }">
                        <td><img style="height: 38px; object-fit: cover;" src="/resources/img/member/nullImg.png"></td>
                        </c:if> --%>
                        
                        <td><img style="height: 38px; object-fit: cover;" src="/resources/img/team/${teamDetail.teamLogoImgAttachedName }"></td>
                        <td>${teamDetail.teamName }</td>
                        <td>${teamDetail.teamLocation}</td>
                        <td>${teamDetail.teamIntro }</td>
                        <td>${teamDetail.memberCount}</td>
                        <td>${teamDetail.masterName }</td>
 
                     </tr>

                  <%-- <c:forEach items="${teamDetail }" var="teamDetail">
                  </c:forEach> --%>

               </tbody>

            </table>

         </div>

      </div>

      <div class="modal-footer d-flex justify-content-around">
         <button style="width: 10rem;" type="button" class="btn btn-outline-primary" id="addTeambutt">가입 신청</button>
         <button style="width: 10rem;" type="button" class="btn btn-outline-danger" data-bs-dismiss="modal">취 소</button>
      </div>


   </div>
<input type="hidden" id="teamCodeInput" value="${teamCode}">
<input type="hidden" id="memberCodeInput" value="${memberCode}">
<input type="hidden" id="myTeamCodeInput" value="${sessionScope.loginInfo.teamCode}">
</body>
</html>




