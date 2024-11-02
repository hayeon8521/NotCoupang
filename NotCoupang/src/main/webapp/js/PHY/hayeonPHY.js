/**
 * 로그인 및 장바구니 및 구매에 대한 모든 스크립트
 */
const KR = /[가-힣ㄱ-ㅎㅏ-ㅣ]/;
const PHON = /^\d{3}-\d{4}-\d{4}$/;

$(function() {
	console.log("hayeonPHY.js페이지 도착");
});

function loginAction() {
	let spinner = document.querySelector('.spinnermap');
	spinner.style.display = 'flex';
	let id = document.querySelector('#id').value;
	let pw = document.querySelector('#pw').value;
	console.log(id + ' ' + pw);
	if (id && pw) {
		if (!KR.test(id)) {
			// 아작스 실행
			$.ajax({
				url: 'loginconfig.do',
				data: { id: id, pw: pw },
				method: "POST",
				dataType: "json"
			})
			.done(function(result) {
				if (result.retCode == 'buyer') {
					console.log('성공');
					window.location.href = '/NotCoupang/welcome.do';	//welcome.do
				} else if (result.retCode == 'seller') {
					console.log('성공');
					window.location.href = '/NotCoupang/Admin_main.do';
				} else if (result.retCode == 'FAIL') {
					console.log('실패');
					document.querySelector('#pwconfig').innerHTML = "ID와 PW 가 다릅니다 다시 시도해주세요!";
					spinner.style.display = 'none';
				}
			})
			.fail(err => console.log(err));  // 세미콜론 추가
		}
	}
}

function joinAction(division) {
	console.log(division);
	window.location.href = '/NotCoupang/join.do?division=' + division;
}

// 아이디 있는지 안내 뛰워주는 함수
function foucsOutId() {
	let id = document.querySelector('#id').value;
	if (!id) {
		document.querySelector('#idconfig').innerHTML = "ID를 입력 해주세요";
	} else {
		if (KR.test(id)) {
			document.querySelector('#idconfig').innerHTML = "ID는 영문과 숫자로 입력해주세요";
		} else {
			document.querySelector('#idconfig').innerHTML = "";
		}
	}
}

// 비밀번호 입력 안내 함수 (로그인페이지, 회원가입페이지)
function foucsOutPw() {
	console.log('검증 요청');
	let pw = document.querySelector('#pw').value;
	if (!pw) {
		document.querySelector('#pwconfig').innerHTML = "PW를 입력 해주세요";
		console.log('비밀번호 확인 실패');
		return false;
	} else {
		document.querySelector('#pwconfig').innerHTML = "";
	}
}

// 회원가입페이지 아이디 확인
function foucsOutjoinId() {
    return new Promise((resolve) => {
        let id = document.querySelector('#id').value;
        if (!id) {
            document.querySelector('#idconfig').innerHTML = "ID를 입력 해주세요";
            resolve(false);
        } else {
            if (KR.test(id)) {
                document.querySelector('#idconfig').innerHTML = "ID는 영문과 숫자로 입력해주세요";
                resolve(false);
            } else {
                $.ajax({
                    url: 'joinconfig.do',
                    data: { id: id },
                    method: "POST",
                    dataType: "json"
                })
                .done(function(result) {
                    if (result.retCode === 'OK') {
                        console.log('동일 ID 존재');
                        document.querySelector('#idconfig').innerHTML = "동일한 ID가 존재합니다";
                        resolve(false);
                    } else if (result.retCode === 'FAIL') {
                        resolve(true);
                    }
                })
                .fail(err => {
					console.log(err);
					resolve(false);
				});  // 세미콜론 추가
                document.querySelector('#idconfig').innerHTML = "";
            }
        }
    });
}

// 회원가입페이지 비밀번호 확인
function foucsOutjoinIdPwCF() {
	let pwcf = document.querySelector('#pwcf').value;
	let pw = document.querySelector('#pw').value;
	if (!pwcf) {
		document.querySelector('#pwcfconfig').innerHTML = "PW를 입력해주세요";
		return false;
	} else {
		if(pwcf == pw){
			document.querySelector('#pwcfconfig').innerHTML = "";
		}else{
			document.querySelector('#pwcfconfig').innerHTML = "비밀번호가 동일하지 않습니다 확인해주세요";
			return false;
		}
	}
}

// 회원가입페이지 이름 확인
function foucsOutjoinName() {
	let fname = document.querySelector('#fname').value;
	if (!fname) {
		document.querySelector('#nameconfig').innerHTML = "이름을 입력해주세요";
		return false;
	} else {
		document.querySelector('#nameconfig').innerHTML = "";
	}
}

// 회원가입페이지 별명 확인
function foucsOutjoinNick() {
	let nick = document.querySelector('#nick').value;
	if (!nick) {
		document.querySelector('#nickconfig').innerHTML = "별명 또는 사업장명을 입력해주세요";
		return false;
	} else {
		document.querySelector('#nickconfig').innerHTML = "";
	}
}

// 회원가입페이지 연락처 확인
function foucsOutjoinPhone() {
	let phone = document.querySelector('#phone').value;
	if (!phone) {
		document.querySelector('#phoneconfig').innerHTML = "연락처를 입력해주세요";
		return false;
	} else {
		if (PHON.test(phone)) {
			document.querySelector('#phoneconfig').innerHTML = "";
		} else {
			document.querySelector('#phoneconfig').innerHTML = "연락처 형식은 000-0000-0000 입니다";
			return false;
		}
	}
}

// 회원가입페이지 주소 확인
function foucsOutjoinAddres() {
	let addres = document.querySelector('#addres').value;
	if (!addres) {
		document.querySelector('#addresconfig').innerHTML = "주소를 입력해주세요";
		return false;
	} else {
		document.querySelector('#addresconfig').innerHTML = "";
	}
}

document.addEventListener("DOMContentLoaded", function() {
    // 회원가입 완료 버튼
    async function joinGoAction() {
        console.log('회원가입 검증 시작!');
        if (foucsOutPw() === false) {
            console.log('PW 검증 실패!');
            return;
        }
        if (foucsOutjoinIdPwCF() === false) {
            console.log('PW 확인 검증 실패!');
            return;
        }
        if (foucsOutjoinName() === false) {
            console.log('이름 검증 실패!');
            return;
        }
        if (foucsOutjoinNick() === false) {
            console.log('별명 검증 실패!');
            return;
        }
        if (foucsOutjoinPhone() === false) {
            console.log('연락처 검증 실패!');
            return;
        }
        if (foucsOutjoinAddres() === false) {
            console.log('주소 검증 실패!');
            return;
        }
        console.log('다음 검증 시작!');
        console.log('회원가입 검증 끝!');

        const isIdValid = await foucsOutjoinId();
        if (!isIdValid) {
            console.log('ID 검증 실패!');
            return;
        } else {
            console.log('ID 검증 성공!');
            document.querySelector('#joinform').submit();
        }
    }

    document.getElementById("joingobutton").addEventListener("click", joinGoAction);
});