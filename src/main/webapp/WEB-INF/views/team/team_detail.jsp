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


      <div class="modal-header">
         <h5 class="modal-title" id="staticBackdropLabel">팀 이름 불러서 넣어라</h5>
         <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>


      <div class="modal-body my-3">

         <div class="col text-center shadow-lg p-3  bg-body rounded">

            <table class="table table-striped table-hover">

               <thead>

                  <tr>
                     <th scope="col" width="15%">사 진</th>
                     <th scope="col" width="15%">이 름</th>
                     <th scope="col" width="15%">성 별</th>
                     <th scope="col" width="*%">연 락 처</th>
                     <th scope="col" width="15%">포 지 션</th>
                     <th scope="col" width="15%">등 급</th>
                  </tr>

               </thead>

               <tbody>

                  <c:forEach items="${teamDetail }" var="teamDetail">

                     <tr>
                        <c:if test="${not empty teamDetail.memberImgAttachedName  }">
                        <td><img width="30%;" src="/resources/img/member/${teamDetail.memberImgAttachedName }"></td>
                        </c:if>
                        <c:if test="${empty teamDetail.memberImgAttachedName  }">
                        <td><img width="30%;" src="/resources/img/member/nullImg.png"></td>
                        </c:if>
                        <td>${teamDetail.memberName }</td>
                        <td>${teamDetail.memberGender }</td>
                        <td>${teamDetail.memberTell }</td>
                        <td>${teamDetail.position }</td>
                        <td>${teamDetail.teamAdmin }</td>
                     </tr>

                  </c:forEach>

               </tbody>

            </table>

         </div>

      </div>

      <div class="modal-footer d-flex justify-content-around">
         <button style="width: 10rem;" type="button" class="btn btn-outline-primary" id="addTeambutt">가입 신청</button>
         <button style="width: 10rem;" type="button" class="btn btn-danger" data-bs-dismiss="modal">취 소</button>
      </div>


   </div>
<input type="hidden" id="teamCodeInput" value="${teamCode}">
<input type="hidden" id="memberCodeInput" value="${memberCode}">
<input type="hidden" id="myTeamCodeInput" value="${sessionScope.loginInfo.teamCode}">
</body>
</html>




