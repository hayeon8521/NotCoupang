<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>회원정보 수정</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<style>
body {
	padding: 20px;
	font-size: 0.9rem;
}
/*
.form-control{
    border: 1px solid #ced4da;
    border-radius: .25rem;
}
*/.
.form-label {
	font-weight: bold;
}

.form-section {
	border-bottom: 1px solid #ddd;
	margin-bottom: 20px;
}

.form-section:last-child {
	border-bottom: none;
}

.btn-custom {
	background-color: #f8f9fa;
	color: #000;
	border: 1px solid #ddd;
	padding: 5px 10px;
}


</style>
</head>



<body>
	<div class="container">
		<h4 class="mb-4 mt-3">회원정보 수정</h4>
		<form>
			<!-- ID -->
			<div class="form-section">
				<div class="mb-3 row">
					<label for="u_id" class="col-sm-2 col-form-label">아이디</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" id="u_id" name="u_id"
							value="${mvo.memberId }" readonly />
					</div>
				</div>
			</div>

			<!-- 이름 -->
			<div class="form-section">
				<div class="row">
					<label for="u_name" class="col-sm-2 col-form-label">이름</label>
					<div class="col-sm-8">
						<input type="text" class="form-control mb-2" id="u_name" name="u_name"
							value="${mvo.memberName }" readonly />
						<p class="text-primary mt-2 mb-3">※개명 회원 시 관리자에게 문의해주세요.</p>
					</div>
					<!-- <div class="col-sm-2">
                        <button type="button" class="btn btn-custom">이름 변경</button>
                    </div> -->
				</div>
			</div>

			<!-- 닉네임 -->
			<div class="form-section">
				<div class="mb-3 row">
					<label for="u_nick" class="col-sm-2 col-form-label d-inline">기존 닉네임</label>
					<div class="col-sm-8">
					<div class="d-grid gap-3">
						<input type="text" class="form-control" id="u_nick" name="u_nick"
							value="${mvo.memberNick }" readonly />
					</div>
					</div>
					</div>
				<div class="mb-3 row">
					<label for="new_u_nick" class="col-sm-2 col-form-label">변경 닉네임</label>
					<div class="col-sm-8">
						<input type="text" class="form-control"
							id="new_u_nick" name="new_u_nick" placeholder="변경할 닉네임을 입력하세요" />
							</div>
						<div class="col-sm-2">
						<button type="button" id="modifyNickBtn" name="modifyNickBtn"
							class="btn btn btn-secondary">닉네임 수정</button>
							</div>
					</div>
				</div>


			<!-- 연락처 -->
			<div class="form-section">
				<div class="mb-3 row">
					<label for="u_phone" class="col-sm-2 col-form-label">기존 연락처</label>
					<div class="col-sm-8">
						<input type="tel" class="form-control" id="u_phone"
							name="u_phone" value="${mvo.memberPhone }" />
					</div>
				</div>

				<div class="mb-3 row">
					<label for="new_u_phone" class="col-sm-2 col-form-label">변경
						연락처</label> 
						<div class="col-sm-8">
						<input type="tel" class="form-control" id="new_u_phone"
						name="new_u_phone" placeholder="변경할 연락처를 입력하세요" /></div>

					<div class="col-sm-2">
							<button type="button" id="ModifyPhoneBtn" name="ModifyPhoneBtn"
								class="btn btn-secondary">연락처 수정</button>
						</div>
				</div>
			</div>

			<!-- Password -->
			<div class="form-section">
				<div class="mb-3 row">
					<label class="col-sm-2 col-form-label">비밀번호 변경</label>
					<div class="col-sm-8">
						<div class="d-grid gap-3">
							<input type="password" id="thisPw" name="thisPw" class="form-control" placeholder="현재 비밀번호" /> 
							<input type="password" id="newPw" name="newPw" class="form-control" placeholder="새 비밀번호" /> 
							<input type="password" name="newPw2" id="newPw2" class="form-control" placeholder="비밀번호 다시 입력" />
							<div class="col-sm-4">
								<button type="button" id="modifyPwBtn" name="modifyPwBtn" class="btn btn-primary">비밀번호 변경</button>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- 주소 -->
			<div class="form-section">
				<div class="mb-3 row">
					<label for="u_address" class="col-sm-2 col-form-label">기존 배송지</label> 
					<div class="col-sm-8">
					<div class="d-grid gap-3">
					<input type="text" class="form-control mb-2" id="u_address"
						name="u_address" value="${mvo.memberAddress }" readonly />
						</div>
						</div>
						</div>
				<div class="mb-3 row">
					
						<label for="new_u_address" class="col-sm-2 col-form-label">수정 배송지</label> 
						<div class="col-sm-8">
						<input type="text" class="form-control mb-2"
							id="new_u_address" name="new_u_address" placeholder="변경할 주소를 입력하세요" />
					</div>
					<div class="col-sm-2">
						
							<button type="button" id="modifyAddress" name="modifyAddress"
								class="btn btn-secondary">배송지 수정</button>
						
					</div>
					</div>
				
			</div>

			<!-- Subscription Settings -->
			<div class="form-section">
				<div class="mb-3">
					<label class="form-label">수신설정</label>
					<div class="form-check">
						<input class="form-check-input" type="checkbox"
							id="marketing-consent" checked /> <label
							class="form-check-label" for="marketing-consent"> 마케팅 목적의
							개인정보 수집 및 이용 동의함 </label> <a href="#" class="text-muted">전문보기 ></a>
					</div>
					<div class="form-check mt-2">
						<input class="form-check-input" type="checkbox" id="ads-consent"
							checked /> <label class="form-check-label" for="ads-consent">
							광고성 정보 수신 동의함 </label> <a href="#" class="text-muted">전문보기 ></a>
					</div>
				</div>
			</div>

			<!-- 탈퇴/취소 -->
			<div class="d-flex justify-content-end mb-3">
				<button type="button" class="btn btn-outline-secondary me-2">
					탈퇴하기</button>
				<button type="submit" id="exitBtn" name="exitBtn" class="btn btn-primary">나가기</button>
			</div>
		</form>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
	<script>
    document.querySelector("#modifyNickBtn").addEventListener('click',function(){
         let nick = (document.querySelector("#new_u_nick").value);
         let uId = (document.querySelector("#u_id").value);
         console.log(uId);

         fetch('modifyNick.do?id=' + uId + '&nick=' + nick)
		.then(resolve => resolve.json())
		.then(result => {
			console.log(result); //{retCode: 'OK'} 리턴코드
			if (result.retCode == 'OK') {
				alert("닉네임 변경에 성공했습니다.");

			} else if (result.retCode == 'FAIL') {
				alert("닉네임 변경에 실패했습니다.");
			}
		})
		.catch(err => { console.log(err) })
      });
    
    document.querySelector("#ModifyPhoneBtn").addEventListener('click',function(){
        let phone = (document.querySelector("#new_u_phone").value);
        let uId = (document.querySelector("#u_id").value);
        console.log(uId);

        fetch('modifyPhone.do?id=' + uId + '&phone=' + phone)
		.then(resolve => resolve.json())
		.then(result => {
			console.log(result); //{retCode: 'OK'} 리턴코드
			if (result.retCode == 'OK') {
				alert("연락처 변경에 성공했습니다.");

			} else if (result.retCode == 'FAIL') {
				alert("연락처 변경에 실패했습니다.");
			}
		})
		.catch(err => { console.log(err) })
     });
    
    document.querySelector("#modifyAddress").addEventListener('click',function(){
    	let address = (document.querySelector("#new_u_address").value);
    	let uId = (document.querySelector("#u_id").value);
        console.log(address);
        
	    $.ajax({
	        url: 'modifyAddress.do',
	        data: { id: uId, address: address },
	        method: "POST",
	        dataType: "json"
	     })
	     .done(function(result) {
	    	 if (result.retCode == 'OK') {
					alert("배송지 변경에 성공했습니다.");
	
				} else if (result.retCode == 'FAIL') {
					alert("배송지 변경에 실패했습니다.");
				}
	     })
	     .fail(err => console.log(err));  // 세미콜론 추가
     });
    
    document.querySelector("#modifyPwBtn").addEventListener('click',function(){
			let thisPw = document.querySelector("#thisPw").value;
			let newPw = document.querySelector("#newPw").value;	
			let newPw2 = document.querySelector("#newPw2").value;
			let uId = document.querySelector("#u_id").value;
			
			console.log('a', thisPw);
			console.log('b', newPw);
			console.log('c', newPw2);
			console.log('d', uId);

			if(newPw == newPw2){
					//업데이트 진행
				fetch('modifyPw.do?id=' + uId +'&thisPw='+thisPw+'&newPw='+newPw)
				.then(resolve => resolve.json())
				.then(result => {
					console.log(result); //{retCode: 'OK'} 리턴코드
					if (result.retCode == 'OK') {
						alert("비밀번호 변경에 성공했습니다.");
	
					} else if (result.retCode == 'FAIL') {
						alert("비밀번호 변경에 실패했습니다.");
					}
				})
				.catch(err => { console.log(err) })

			}else{
				alert("비밀번호를 확인해주세요.")
			}

		});
    
    document.querySelector("#exitBtn").addEventListener('click',function(){
			window.location.replace('/NotCoupang/myOrderList.do?buyerId=+${LOGID }');
		});
		

    </script>
</body>
</html>
