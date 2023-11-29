<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>신한DS</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<style>
#here {
	background: #aaa;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script>

	function boardDelete(bno){
		$.ajax({
			url:"${appPath}/board/boardDelete.do/" + bno,
			type:"delete",
			success: function(responseData){
				alert(responseData);
				boardList();
			}
			
		})
	}

	function boardUpdate(){
		alert("수정하고자한다.");
		//var formData = $("#myfrm").serialize(); //?a=100&b=200;
		var formData = $("#myfrm").serializeArray();
		console.log(formData);
		var obj = {};
		$.each(formData, function(index, item){
			obj[item.name] = item.value;
		});
		console.log(obj);
		$.ajax({
			url:"${appPath}/board/boardUpdate.do",
			data:JSON.stringify(obj),
			contentType:"application/json;charset=utf-8",
			type: "put",
			success: function(responseData){
				alert(responseData);
			}
		});
	}

	function boardDetail(bno){
		var loginUser = "${sessionScope.loginCust.cust_id}";
		$.ajax({
			url:"${appPath}/board/boardDetail.do/" + bno,
			type:"get",
			success: function(board){
				//console.log(board.pic);
				var disabled="";
				if(loginUser != board.writer) disabled="disabled";
					
				var regD = new Date(board.regdate).toISOString().split("T")[0];
				var upD = board.updatedate;
				
				if(upD != null){
					upD = new Date(upD).toISOString().split("T")[0];
				}
				
				var output = `
					<div class="container mt-3">
					<h2>게시글 수정</h2>
					<form id="myfrm">
					<img src="${appPath}/uploads/\${board.pic}" width="200" height="200">
					<div class="mb-3 mt-3">
						<label for="bno">번호:</label> 
						<input type="text"	class="form-control" id="bno" name="bno" value="\${board.bno}" readonly>
					</div>
					<div class="mb-3 mt-3">
						<label for="title">제목:</label> 
						<input type="text" class="form-control" id="title" name="title" value="\${board.title}">
					</div>
					<div class="mb-3">
						<label for="content">내용:</label>
						<textarea class="form-control" rows="5" id="content" name="content">\${board.content}</textarea>
					</div>
					<div class="mb-3">
						<label for="writer">작성자:</label>
						<input type="text" class="form-control" id="writer" name="writer" value="\${board.writer}" readonly>
					</div>
					<div class="mb-3">
						<label for="regdate">작성일:</label>
						<input type="date" class="form-control" id="regdate" value="\${regD}" readonly>
					</div>
					<div class="mb-3">
						<label for="updatedate">수정일:</label>
						<input type="date" class="form-control" id="updatedate" value="\${upD}" readonly>
					</div>
					<div class="mb-3">
						<label for="viewcnt">조회수:</label>
						<input type="number" class="form-control" id="viewcnt" value="\${board.viewcnt}" readonly>
					</div>
					<input type="button" \${disabled} onclick="boardUpdate()" class="btn btn-primary" value="수정">
					<input type="button" \${disabled} onclick="boardDelete(\${bno})" class="btn btn-primary" value="삭제">
				</form>
				</div>
				`;
				$("#here").html(output);
			}
			
		});
	}
	

	function boardInsert() {
		$.ajax({
			url:"${appPath}/board/insert.do",
			success:function(responseData){
				$("#here").html(responseData);
			}
				
		});
	}
		
	function boardInsertPost(){
		
		var formData = new FormData($("#myfrm")[0]);
		
		$.ajax({
			 url:"${appPath}/board/insertPost.do",
			 type:"post",
			 enctype: 'multipart/form-data',// 필수
			 processData: false,//필수
			 cache: false,
			 contentType: false, //필수
			 //contentType:"application/json;charset=utf-8",
			 data: formData ,
			 success:function(responseData){ alert(responseData); }
			});
		
		/* for (let key of fomData.keys()){
			console.log(key,":",formData.get(key));
		}
		
		$.ajax({
			url:"${appPath}/board/insertPost.do",
			type: "post",
			data: JSON.stringify(obj),
			contentType: "application/json;charset=utf-8",
			success: function(responseData){
				alert(responseData);
			}
		});
		*/
	}
		
	
	
	function boardList() {
		$.ajax({
			url:"${appPath}/board/boardList.do",
			type: "get",
			success: function(responseData){
				var output = `
				<table>
					<tr>
						<td>번호</td>
						<td>제목</td>
						<td>내용</td>
						<td>작성자</td>
						<td>조회수</td>
					</tr>`;
				$.each(responseData, function(index,item){
					output += `
						<tr>
							<td><a href="javascript:boardDetail(\${item.bno})">
							\${item.bno}
							</a>
							</td>
							<td>\${item.title}</td>
							<td>\${item.content}</td>
							<td>\${item.writer}</td>
							<td>\${item.viewcnt}</td>
						</tr>`;
				});
				$("#here").html(output + "</table>");
			},
			fail: function(err){
				alert(err);
			}
		});
	}
</script>
</head>
<body>
	<%@ include file="../auth/logout.jsp"%>

	<div class="container mt-5">
		<div class="row">
			<div class="col-sm-4">
				<h3 class="mt-4">Ajax로 보내기</h3>
				<p>RestController처리</p>
				<ul class="nav nav-pills flex-column">
					<li class="nav-item"><a class="nav-link"
						href="javascript:boardList()">게시목록</a></li>
					<li class="nav-item"><a class="nav-link"
						href="javascript:boardInsert()">게시글입력</a></li>
				</ul>
				<hr class="d-sm-none">
			</div>
			<div class="col-sm-8">
				<h2>결과</h2>
				<h5></h5>
				<div id="here">여기</div>
			</div>
		</div>
		<div class="fixed-bottom mt-3 p-1 bg-dark text-white text-center">
			<p>신한금융소프트아카데미</p>
		</div>
	</div>

</body>
</html>