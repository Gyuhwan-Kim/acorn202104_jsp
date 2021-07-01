<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/promise/test01.jsp</title>
</head>
<body>
	<script>
		// 주어진 작업을 수행하는 함수
		// 첫 번째 인자로는 작업의 내용이 전달되고
		// 두 번째 인자로는 작업이 끝나면 호출할 함수를 전달한다.
		function work(job, callback){
			// 작업을 끝마치는데 5초가 걸린다고 가정
			setTimeout(function(){
				console.log(job+" 을(를) 수행 완료했습니다.");
				// 작업이 끝났으니 callback function을 호출해준다.
				callback();
			}, 5000); // 5초 이후에 출력
		}
		// 1. promise 객체를 생성하면서 function을 전달한다.
		let p=new Promise(function(resolve){
			// 2. 작업을 마쳤다면 resolve 함수를 호출
			work("달리기", resolve);
			//reject();
		});
		
		// 3. resolve function이 호출되면
		p.then(function(){
			console.log("then 안에 있는 function이 호출되었습니다.");
			return new Promise(function(resolve){
				work("물마시기", resolve);
			});
		}).then(function(){
			return new Promise(function(resolve){
				work("쉬기", resolve);
			});
		}).then(function(){
			return new Promise(function(resolve){
				work("밥먹기", resolve);
			});
		}).then(function(){
			console("모든 공부를 마쳤습니다. 불금 ㄱㄱ");
		});
		
		// 인자로 전달한 작업을 수행할 Promise 객체를 생성해서 return해주는 function
		function doSomething(job){
			let p=new Promise(function(resolve){
				work(job, resolve);
			})
			return p;
		}
		
		doSomething("달리기")
		.then(function(){
			return doSomething("물마시기");
		})
		.then(function(){
			return doSomething("쉬기");
		})
		.then(function(){
			return doSomething("밥먹기");
		})
		.then(function(){
			console.log("모든 공부를 마쳤습니다. 불금입니다. 주말 잘 보내세요.");
		});
		
		/*
		new Promise(function(resolve){
			// 2. 작업을 마쳤다면 resolve 함수를 호출
			work("달리기", resolve);
			//reject();
		}).then(function(){
			console.log("then 안에 있는 function이 호출되었습니다.");
		});
		*/
		/*
		work("달리기", function(){
			work("물마시기", function(){
				work("쉬기", function(){
					work("밥먹기", function(){
						
					})
				})
			})
			
		});
		*/

		
	</script>
</body>
</html>