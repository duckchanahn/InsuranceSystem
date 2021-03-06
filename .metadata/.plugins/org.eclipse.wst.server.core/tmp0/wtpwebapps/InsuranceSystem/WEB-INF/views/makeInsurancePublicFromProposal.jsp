<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

  <script type="text/javascript">
	var whichProposal;
	var proposalID = -1;
	function setWhichProposal( proposalButton, setVal ){
		proposalID = proposalButton.value;
		// alert(proposalID);
		whichProposal = setVal;
	}	
	
	function publishProposal() {
		// alert("show! => " + whichProposal + " / " + proposalID);
		if(proposalID == -1) {
			alert('제안서를 선택해주세요');
		} else {
			var theForm = document.getElementById("checkedBeforePublicFromProposal");
			theForm.action = "checkedBeforePublicFromProposal?whichProposal=" + whichProposal + "&proposalID=" + proposalID;
			var result = confirm('제안서를 공시하시겠습니까?');
			if (result) {
				theForm.submit()
			} else {

			}
		}
	}
  </script>

<title>보험상품 공시하기</title>
</head>
<body>

   <div class="page-wrapper"> 
      <div class="container-fluid">
         <div class="col-lg-8">
            <!--게시판 넓이 -->
            <div class="col-lg-12">
               <h1 class="page-header">보험상품 공시하기</h1>
            </div>
            <div class="row">
               <div class="col-lg-12"></div>
            </div>
            <div class="panel panel-default">
               <div class="panel-heading">제안서 목록</div>
               <div class="panel-body">
               
            <form action="checkedProposal" id="checkedBeforePublicFromProposal" method="post">
               
                  <table class="table table-hover">
                     <thead>
					 <tr>화재보험</tr>
                        <tr>
                           <th></th>
                           <th>제안서ID</th>
                           <th>제안서이름</th>
                           <th>개발팀ID</th>
                           <th>제안서내용</th>
                        </tr>
                     </thead>
                     <tbody>
                        <c:forEach items="${fireList}" var="proposalVO">
                           <tr>
                           
<!--                            https://fors.tistory.com/233 : 라디오 버튼 -->
                              <td><input type = "radio" name = "proposalRequest"
                              onclick="setWhichProposal(this, 'fire')"
                              value="${proposalVO.fireProposalID}"></td>
                              <td>${proposalVO.fireProposalID}</td>
                              <td>${proposalVO.proposalName}</td>
                              <td>${proposalVO.insuranceDeveloperTeamID}</td>
                              <td>${proposalVO.proposalContent}</td>
                           </tr>
                        </c:forEach>
                     </tbody>
                  </table>
                        
				<table class="table table-hover">
                     <thead>
					 <tr>상해보험</tr>
                        <tr>
                           <th></th>
                           <th>제안서ID</th>
                           <th>제안서이름</th>
                           <th>개발팀ID</th>
                           <th>제안서내용</th>
                        </tr>
                     </thead>
                     <tbody>
                        <c:forEach items="${injuryList}" var="proposalVO">
                           <tr>
<!--                            https://fors.tistory.com/233 : 라디오 버튼 -->
                              <td><input type="radio" name="proposalRequest"
                              onclick="setWhichProposal(this, 'injury')"
                              value="${proposalVO.injuryProposalID}"></td>
                              <td>${proposalVO.injuryProposalID}</td>
                              <td>${proposalVO.proposalName}</td>
                              <td>${proposalVO.insuranceDeveloperTeamID}</td>
                              <td>${proposalVO.proposalContent}</td>
                           </tr>
                        </c:forEach>
                     </tbody>
                  </table>
                        
				<table class="table table-hover">
                     <thead>
					 <tr>자동차보험</tr>
                        <tr>
                           <th></th>
                           <th>제안서ID</th>
                           <th>제안서이름</th>
                           <th>개발팀ID</th>
                           <th>제안서내용</th>
                        </tr>
                     </thead>
                     <tbody>
                        <c:forEach items="${vehicleList}" var="proposalVO">
                           <tr>
<!--                            https://fors.tistory.com/233 : 라디오 버튼 -->
                              <td><input type = "radio" name = "proposalRequest"
                              onclick="setWhichProposal(this, 'vehicle')"
                              value="${ proposalVO.vehicleProposalID }"></td>
                              <td>${proposalVO.vehicleProposalID}</td>
                              <td>${proposalVO.proposalName}</td>
                              <td>${proposalVO.insuranceDeveloperTeamID}</td>
                              <td>${proposalVO.proposalContent}</td>
                           </tr>
                        </c:forEach>
                     </tbody>
                  </table>
                  
                </form>
                
               </div>
            </div>
         </div>
      </div>
   </div>

      <!-- 제안요청 버튼 -->
   <div class="row">
      <div class="col-lg-12">
         <button type="button" class="btn btn-outline btn-primary" onclick="publishProposal()">
            <i class="fa fa-edit fa-fw"></i> 공시하기
         </button>
         <button type="button" class="btn btn-outline btn-primary" onclick="location.href='index'">
            <i class="fa fa-edit fa-fw"></i> 처음으로
         </button>
      </div>
   </div>
</body>
</html>