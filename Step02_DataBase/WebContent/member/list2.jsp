<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/list2.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
<script id="one" type="text/template">
	<tr>
		<td>\${tmp.num}</td>
		<td>\${tmp.name}</td>
		<td>\${tmp.addr}</td>
		<td>
			<a href="javascript:updateMember(\${tmp.num})">
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
					<path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
					<path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
					</svg>
					<span class="visually-hidden">회원 정보 수정</span>
			</a>
				</td>
		<td>
			<a href="javascript:deleteConfirm(\${tmp.num})">
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
					<path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
					<path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
				</svg>
				<span class="visually hidden">회원 정보 삭제</span>
			</a>
		</td>
	</tr>
</script>
</head>
<body>
<jsp:include page="../include/navbar.jsp">
	<jsp:param name="thisPage" value="member2" />
</jsp:include>
   	<div class="container">
    	<nav aria-label="breadcrumb">
           	<ol class="breadcrumb">
             	<li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/">Home</a></li>
             	<li class="breadcrumb-item active">회원목록</li>
          	</ol>
      	</nav>
      	<a href="javascript:" data-bs-toggle="modal" data-bs-target="#insertModal">
         	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-square" viewBox="0 0 16 16">
             	<path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
             	<path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
         	</svg>
         	<span class="visually-hidden">새 회원 추가</span>
      	</a>
      	<table class="table table-sm table-striped">
         	<thead class="table-dark">
            	<tr>
               		<th>번호</th>
               		<th>이름</th>
               		<th>주소</th>
               		<th>수정</th>
               		<th>삭제</th>
            	</tr>
         	</thead>
         	<tbody>
            
         	</tbody>
      	</table>

      	<nav>
         	<ul class="pagination pagination-sm">
            
         	</ul>
      	</nav>
   	</div>
   	
   	<!-- modal -->
	<div class="modal fade" id="insertModal" tabindex="-1" aria-labelledby="insertModalLabel" aria-hidden="true">
	  	<div class="modal-dialog modal-dialog-centered">
	    	<div class="modal-content">
	      		<div class="modal-header">
	        		<h5 class="modal-title" id="insertModalLabel">회원 추가 양식</h5>
	        		<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      		</div>
	    		<div class="modal-body">
	        		<form action="ajax_insert.jsp" method="post" id="insertForm">
	        			<div class="form-group">
	        				<label for="name" class="form-label">이름</label>
	        				<input type="text" class="form-control" name="name" id="name"/>
	        			</div>
	        			<div class="form-group">
	        				<label for="addr" class="form-label">주소</label>
	        				<input type="text" class="form-control" name="addr" id="addr"/>
	        			</div>
	        		</form>
	    		</div>
	    		<div class="modal-footer">
	        		<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
	        		<button id="saveBtn" type="button" class="btn btn-primary" data-bs-dismiss="modal">저장하기</button>
	    		</div>
			</div>
		</div>
	</div>
   	<!-- modal -->
	<div class="modal fade" id="updateModal" tabindex="-1" aria-labelledby="updateModalLabel" aria-hidden="true">
	  	<div class="modal-dialog modal-dialog-centered">
	    	<div class="modal-content">
	      		<div class="modal-header">
	        		<h5 class="modal-title" id="updateModalLabel">회원 수정 양식</h5>
	        		<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      		</div>
	    		<div class="modal-body">
	        		<form action="ajax_update.jsp" method="post" id="updateForm">
	        			<div class="form-group">
	        				<input type="hidden" class="form-control" name="num"/>
	        				<label for="num" class="form-label">이름</label>
	        				<input type="text" class="form-control" name="num" id="num" disabled/>
	        			</div>
	        			<div class="form-group">
	        				<label for="name" class="form-label">이름</label>
	        				<input type="text" class="form-control" name="name" id="name"/>
	        			</div>
	        			<div class="form-group">
	        				<label for="addr" class="form-label">주소</label>
	        				<input type="text" class="form-control" name="addr" id="addr"/>
	        			</div>
	        		</form>
	    		</div>
	    		<div class="modal-footer">
	        		<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
	        		<button id="updateSaveBtn" type="button" class="btn btn-primary" data-bs-dismiss="modal">저장하기</button>
	    		</div>
			</div>
		</div>
	</div>			
	<script src="../js/gura_util.js"></script>
	<script>
		// 현재 페이지 번호를 저장할 변수를 만들고 초기값 부여
		let currentPage=1;
	
	
		// 페이지 loading 시에 1페이지가 나오도록 한다.
		//pageUpdate(1);
		pageUpdate(currentPage);
		// 현재 페이지는 1페이지라고 history의 상태를 바꿔준다.
		//history.replaceState(1, "", "?pageNum=1");
		history.replaceState(currentPage, "", "?pageNum="+currentPage);
		
		function pageUpdate(pageNum){
			//현재 페이지 번호 수정
			currentPage=pageNum;
			// 페이지가 처음 loading 되었을 때 1페이지 내용을 보여준다.
			//let pageNum=1;
			// 페이지의 내용을 ajax로 요청하고 받아오기
			ajaxPromise("ajax_list.jsp", "get", "pageNum="+pageNum)
			.then(function(response){
				// return response.text();
				return response.json();
			})
			.then(function(data){
				// data는 회원 목록이 들어있는 array다
				console.log(data);
				// 응답된 tr 요소들을 tbody에 html 형식으로 해석하라고 넣어주기
				//document.querySelector("tbody").innerHTML=data;
	
				// tr을 누적할 변수
				let trs="";
				for(let i=0; i<data.length; i++){
					// tmp는 회원 한 병의 정보가 들어있는 object이다.
					let tmp=data[i];
					// tr의 template 문자열을 읽어온다.
					let template=document.querySelector("#one").innerText;
					// template 문자열에 object의 값을 넣어서 결과 문자열 html을 얻어낸다.
					let result=eval('`'+template+'`');
					//결과를 trs에 누적시킨다
					trs += result;
				}
				// trs를 html로 해석해서 tbody에 넣어주기
				document.querySelector("tbody").innerHTML=trs;
			});
			
			ajaxPromise("ajax_pagination.jsp", "get", "pageNum="+pageNum)
			.then(function(response){
				//return response.text();
				return response.json();
			}).then(function(data){
				document.querySelector(".pagination").innerHTML=data;
				// data는 {pageNum:x, startPageNum:x, endPageNum:x, totalPage:x}
				let lis='';
	            /*
	            `
	               <li class="page-item  ">
	                  <a class="page-link" href="javascript:movePage(\${})"> </a>
	               </li>
	            `
	            */
	            if(data.startPageNum != 1){
	               lis += `
	                  <li class="page-item  ">
	                     <a class="page-link" href="javascript:movePage(\${data.startPageNum-1})">&laquo;</a>
	                  </li>
	               `;
	            }
	            for(let i=data.startPageNum; i<=data.endPageNum ; i++){
	               if(data.pageNum == i){
	                  lis += `
	                     <li class="page-item active">
	                        <a class="page-link" href="javascript:movePage(\${i})">\${i}</a>
	                     </li>
	                  `;
	               }else{
	                  lis += `
	                     <li class="page-item">
	                        <a class="page-link" href="javascript:movePage(\${i})">\${i}</a>
	                     </li>
	                  `;
	               }
	            }
	            if(data.endPageNum < data.totalPageCount){
	               lis += `
	                  <li class="page-item">
	                     <a class="page-link" href="javascript:movePage(\${data.endPageNum+1})">&raquo;</a>
	                  </li>
	               `;
	            }
	            document.querySelector(".pagination").innerHTML=lis;
	         });
		}
		// 페이지 이동 버튼을 눌렀을 때 호출되는 함수
		/*
		function movePage(pageNum){
			ajaxPromise("ajax_list.jsp", "get", "pageNum="+pageNum)
			.then(function(response){
				return response.text();
			})
			.then(function(data){
				console.log(data);
				// 응답된 tr 요소들을 tbody에 html 형식으로 해석하라고 넣어주기
				document.querySelector("tbody").innerHTML=data;
			});
			
			ajaxPromise("ajax_pagination.jsp", "get", "pageNum="+pageNum)
			.then(function(response){
				return response.text();
			}).then(function(data){
				document.querySelector(".pagination").innerHTML=data;
			});			
		}
		*/
		function movePage(pageNum){
			// history 객체에 page 번호를 
			history.pushState(pageNum, "", "?pageNum="+pageNum);
			pageUpdate(pageNum);
		}
		
		// 뒤로가기 혹은 앞으로가기 버튼을 눌렀을 때 호출되는 함수 등록
		window.onpopstate=function(event){
			console.log("popstate!");
			// event.state는 history.pushState(data, x, x); 에서 담았던 data이다.
			console.log(event.state);
			// 페이지 번호로 활용하면 된다.
			pageUpdate(event.state);
		};
		
		// 삭제 링크를 클릭했을 때 호출되는 함수
		function deleteConfirm(num){
			const beDelete=confirm(num+"번 회원의 정보를 삭제하시겠습니까?");
			if(beDelete){
				// ajax 요청을 통해서 삭제한다.
				ajaxPromise("ajax_delete.jsp", "post", {num:num})
				.then(function(response){
					return response.json();
				}).then(function(data){
					// data는 {beSuccess:true} or {beSuccess:false} 형태의 object
					if(data.beSuccess){
						// 현재 페이지가 다시 업데이트 되도록 한다.
						pageUpdate(currentPage);
					} else {
						alert("삭제 실패!");
					}
				})
			} else {
				
			}
		}
		
		// 저장 버튼을 눌렀을 때 호출되는 함수 등록
		document.querySelector("#saveBtn").addEventListener("click", function(){
			// ajax 제출할 form의 참조값을 얻어오기
			let insertForm=document.querySelector("#insertForm");
			// gura_util.js 에 있는 함수를 이용해서 ajax를 전송한다.
			ajaxFormPromise(insertForm)
			.then(function(response){
				return response.json();
			}).then(function(data){
				if(data.beSuccess){
					pageUpdate(currentPage);
				} else {
					alert("추가 실패!");
				}
			});
		})
		
		// 수정 버튼을 눌렀을 때 호출되는 함수
		function updateMember(num){
			// 1. 수정할 회원의 정보를 ajax 요청을 통해서 얻어온다.
			ajaxPromise("ajax_get_data.jsp", "get", "num="+num)
			.then(function(response){
				return response.json();
			}).then(function(data){
				// data {num:x, name:xxx, addr:xxx}
				// 2.data를 update form에 출력하고 updateModal을 띄운다.
				console.log(data);
				let modal=new bootstrap.Modal(document.querySelector("#updateModal"));
				// 3. 수정 form에 data를 출력한다.
				// 그냥 .value=data.num 해도 되는구나
				document.querySelector("#updateModal [name=num]").value=data.num;
				document.querySelector("#updateModal #num").value=data.num;
				document.querySelector("#updateModal [name=name]").value=data.name;
				document.querySelector("#updateModal [name=addr]").value=data.addr;
				/*
				document.querySelector("#updatenum").setAttribute("value", data.num);
				document.querySelector("#updatenum2").setAttribute("value", data.num);
				document.querySelector("#updatename").setAttribute("value", data.name);
				document.querySelector("#updateaddr").setAttribute("value", data.addr);
				*/
				modal.show();
			});
		}
		
		// 수정 후 저장 버튼을 눌렀을 때 호출되는 함수 등록
		document.querySelector("#updateSaveBtn").addEventListener("click", function(){
			// 수정 form의 참조값 얻어오기
			let updateForm=document.querySelector("#updateForm");
			// form을 ajax로 전송한다.
			ajaxFormPromise(updateForm)
			.then(function(response){
				return response.json();
			}).then(function(data){
				if(data.beSuccess){
					pageUpdate(currentPage);
					//document.querySelector("#updateForm").reset();
				} else {
					alert("수정 실패!");
				}
			});
		});
		
		
	</script>

</body>
</html>