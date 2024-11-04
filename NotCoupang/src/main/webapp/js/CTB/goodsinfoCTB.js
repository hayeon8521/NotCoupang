/*!
	장바구니 넣기, 구매하기, 페이징
*/
//리뷰 초기페이지
let rpage = 1;
//QnA 초기 페이지
let qpage = 1;


document.addEventListener("DOMContentLoaded", function() {
	document.querySelector("#addCartBtn").addEventListener('click', sendCartView);
});

//장바구니 담기
function addCart() {
	//유저가 입력한 수량
	let count = Number(document.querySelector('#inputQuantity').value);
	//재고
	let stock = Number(document.querySelector('#stock-area span').innerHTML);
	//만약 재고보다 많은 양을 장바구니에 담을 경우 오류창 출력
	if (logID.length < 1) {
		alert('로그인 후에 이용하실수 있습니다\n로그인 페이지로 이동합니다');
		location.href = 'login.do';
		return "stop";
	}
	
	if (count > stock) {
		alert("재고 수가 부족합니다 \n수량을 확인해주세요.");
		return "stop";
	} else if (count <= 0) {
		alert("잘못된 입력값입니다.");
		return "stop";
	}

	//이름, 가격, 선택수량 넘기면 됨
	fetch("cartView.do?logid=" + logID + "&gno=" + gno + "&count=" + count)
		.then(resolve => resolve.json())
		.then(result => {
			if (result.reCode == "FAIL") {
				alert("실패");
			}
		})
		.catch(err => { console.log(err) })
}

function sendCartView() {
	if (addCart() == "stop") {
		return;
	}
	alert("상품이 장바구니에 담겼습니다.")
}
//구매하기) 장바구니 넣고 페이지로 이동
function sendCheckout() {
	//유저가 입력한 수량
	let count = document.querySelector('#inputQuantity').value;

	//장바구니 담기
	if (addCart() == "stop") {
		return;
	}
	//구매하기 페이지 이동
	//checkout.do로 옮기기
	location.href = "checkout.do?logid=" + logID + "&gno=" + gno + "&count=" + count + "&price=" + price;
}
listReview();
//리뷰 리스팅
function listReview() {
	document.querySelector('.review-content').innerHTML = '';

	fetch('reviewList.do?gno=' + gno + '&page=' + rpage)
		.then(resolve => resolve.json())
		.then(result => {
			if (result.length == 0) {
				let p = document.createElement('p');
				p.innerHTML = "<br>-등록된 리뷰가 없습니다-<br>";
				document.querySelector(".review-content").append(p);
				return;
			}
			result.forEach((item) => {

				//console.log(item);
				makeLi(item);
				reviewPaging();
			})
		})
		.catch(err => console.log(err))
}



//ul li태그 만들어서 리뷰 내용 그리기
function makeLi(param) {
	//result로 받는 결과물의 reviewDate를 Date객체로 변경
	//let reviewDate = new Date(param.reviewDate);
	//시간같은 자잘한거 (T기준으로 나뉨) 버림
	//let formattedDate = reviewDate.toISOString().split('T')[0];

	//배열에 넣어서 반복문사용
	let buyerIdPlus = '<b>' + param.buyerId + "</b>:";
	let reviewWithLine = param.review.replace(/\n/g, "<br>");
	let field = [buyerIdPlus, reviewWithLine];

	let template = document.createElement('ul');
	template.classList.add('reviewSt');

	for (let i = 0; i < 2; i++) {
		let li = document.createElement('li');
		li.innerHTML = field[i];
		template.appendChild(li);
	}

	let reviewSec = document.querySelector(".review-content");
	reviewSec.appendChild(template);

}
//전체 리뷰 개수 가져오기
function reviewPaging() {
	fetch('reviewCount.do?gno=' + gno)
		.then(resolve => resolve.json())
		.then(createRPageList)
		.catch(err => console.log(err));
}


//리뷰 페이지 목록 출력
function createRPageList(result) {
 	let totalReviews = document.querySelector(".totalReviewCnt");
	
	totalReviews.innerHTML = result;
	
	let totalCnt = result;
	let startPage, endPage, realEnd;
	let prev, next;

	endPage = Math.ceil(rpage / 5) * 5;
	startPage = endPage - 4;
	realEnd = Math.ceil(totalCnt / 5);
	endPage = endPage > realEnd ? realEnd : endPage;

	prev = startPage > 1;
	next = endPage < realEnd;

	let list = "";

	//이전 페이지 이동
	list += '<nav aria-label="Page navigation pageCenter">';
	list += '<ul class="pagination"> <li class="page-item">';
	if (prev)
		list += '  <a class="page-link" href="#review" aria-label="Previous" data-rpage="' + (startPage - 1) + '">&lt;</a>';
	else
		list += '  <span class="page-link disablePageBtn" aria-hidden="true">&lt;</span>';
	list += '    </li>';

	//페이징	
	for (let p = startPage; p <= endPage; p++) {
		if (p == rpage) {
			list += '<li class="page-item now-rpage-Oncolor" ><a class="page-link" href="#review" data-rpage="' + p + '">' + p + '</a></li>';
		} else {
			list += '<li class="page-item now-page"><a class="page-link" href="#review" data-rpage="' + p + '">' + p + '</a></li>';
		}


	}

	//다음페이지 이동
	list += '<li class="page-item">';
	if (next)
		list += '  <a class="page-link" href="#review" aria-label="Next" data-rpage="' + (endPage + 1) + '">&gt;</a>';
	else
		list += '  <span class="page-link disablePageBtn" disabled aria-hidden="true">&gt;</span>';
	list += '    </a></li></ul></nav>';

	document.querySelector('.review-paging').innerHTML = list;

	linkMove();
}

//리뷰 페이징 링크 누르면 이동
function linkMove() {
	document.querySelectorAll(".review-paging a").forEach(function(aTag) {
		aTag.addEventListener('click', function(e) {
			//a태그는 원래 누르면 다른 페이지로 이동하지만, 이 코드를 통해 이동하지 않고 현재 페이지에서만 동작하도록 만들었음
			rpage = parseInt(aTag.dataset.rpage);	//a태그의 data-page="n" 이것의 n값을 가져옴

			listReview();
			document.querySelectorAll('.review-content ul').forEach((ul) => {
				ul.remove();
			})
			reviewPaging();

		})
	})
}

listQna();
//문의, 답변리스트 가져오기
function listQna() {
	fetch("qnaList.do?gno=" + gno + "&page=" + qpage + "&mid=" + mid)
		.then(resolve => resolve.json())
		.then(result => {
			if (result.asks.length == 0) {
				let p = document.createElement('p');
				p.innerHTML = "<br>-등록된 문의가 없습니다-<br>";
				document.querySelector(".qna-content").append(p);
				return;
			}
			makeQLi(result);
			askPaging();
		})
		.catch(err => console.log(err))
}

//리스트 만들기
function makeQLi(result) {
	for (let i = 0; i < 5; i++) {
		//console.log(result.asks[i]);
		//console.log(result.answers[i]);
		let ul = document.createElement('ul');
		//질문
		let qli = document.createElement('li');
		qli.innerHTML = '<p>' + result.asks[i].buyerId + ': </p>' + '<p class="qna-font">' + result.asks[i].ask.replace(/\n/g, "<br>") + '</p>' + '<hr>';
		ul.appendChild(qli);

		//답변
		let nli = document.createElement('li');
		nli.className = "answerSt";
		nli.innerHTML = '<p>' + result.answers[i].sellerId + ': </p>' + '<p class="qna-font">' + result.answers[i].answer.replace(/\n/g, "<br>") + '</p>';
		ul.appendChild(nli);

		document.querySelector('.qna-content').appendChild(ul);
	}

}

//전체 문의 개수 가져오기
function askPaging() {
	fetch('askCount.do?gno=' + gno)
		.then(resolve => resolve.json())
		.then(createQPageList)
		.catch(err => console.log(err));
}

function createQPageList(result) {
	let totalCnt = result;
	let startPage, endPage, realEnd;
	let prev, next;

	endPage = Math.ceil(qpage / 5) * 5;
	startPage = endPage - 4;
	realEnd = Math.ceil(totalCnt / 5);
	endPage = endPage > realEnd ? realEnd : endPage;

	prev = startPage > 1;
	next = endPage < realEnd;

	let list = "";

	//이전 페이지 이동
	list += '<nav aria-label="Page navigation pageCenter">';
	list += '<ul class="pagination"> <li class="page-item">';
	if (prev)
		list += '  <a class="page-link" href="#qna" aria-label="Previous" data-qpage="' + (startPage - 1) + '">&lt;</a>';
	else
		list += '  <span class="page-link disablePageBtn" aria-hidden="true">&lt;</span>';
	list += '    </li>';

	//페이징	
	for (let p = startPage; p <= endPage; p++) {
		if (p == qpage) {
			list += '<li class="page-item now-qpage-Oncolor" ><a class="page-link" href="#qna" data-qpage="' + p + '">' + p + '</a></li>';
		} else {
			list += '<li class="page-item now-page"><a class="page-link" href="#qna" data-qpage="' + p + '">' + p + '</a></li>';
		}


	}

	//다음페이지 이동
	list += '<li class="page-item">';
	if (next)
		list += '  <a class="page-link" href="#qna" aria-label="Next" data-qpage="' + (endPage + 1) + '">&gt;</a>';
	else
		list += '  <span class="page-link disablePageBtn" disabled aria-hidden="true">&gt;</span>';
	list += '    </a></li></ul></nav>';

	document.querySelector('.qna-paging').innerHTML = list;

	linkMoveQ();
}

function linkMoveQ() {
	document.querySelectorAll(".qna-paging a").forEach(function(aTag) {
		aTag.addEventListener('click', function(e) {
			console.log(aTag.innerHTML);
			//a태그는 원래 누르면 다른 페이지로 이동하지만, 이 코드를 통해 이동하지 않고 현재 페이지에서만 동작하도록 만들었음
			qpage = parseInt(aTag.dataset.qpage);	//a태그의 data-page="n" 이것의 n값을 가져옴

			listQna();
			document.querySelectorAll('.qna-content ul').forEach((ul) => {
				ul.remove();
			})
			askPaging()

		})
	})
}

document.addEventListener('DOMContentLoaded', (event) => {
	makeImg()
});

function makeImg() {
	fetch("goodsinfoImgs.do?gno=" + gno)
		.then(resolve => resolve.json())
		.then(result => {
			let sumnail = "";
			let details = "";
			for (let i = 0; i < result.length; i++) {
				if (i == 0) {
					sumnail += '<img class="card-img-top mb-5 mb-md-0" id="sumnail" src="images/' + result[i].imgUrl + '" alt="..." style="width: 530px; height: 600px;" />';
				} else {
					details += '<img src="images/' + result[i].imgUrl + '" class="detailPic" alt="..." style="width: 100%;">';
				}
			}
			document.querySelector('.content-left').innerHTML = sumnail;
			document.querySelector('#detail').innerHTML = details + '<br> <br> <br>';
		})
		.catch(err => console.log(err))
}

let modal = document.querySelector(".Qna-modal");
let openModalBtn = document.querySelector("#open-modal-Btn");
let close = document.querySelector(".close");
let cancel = document.querySelector(".cancel-submit");
let submitQ = document.querySelector(".submit-qna");

openModalBtn.addEventListener("click", () => {
	if(logID.length < 1) {
		alert('문의하기는 로그인 후에 이용하실수 있습니다\n로그인 페이지로 이동합니다');
		location.href = 'login.do';
		return;
	}
	modal.style.display = "block";
		
    
});

close.addEventListener("click", () => {
    modal.style.display = "none";
});
cancel.addEventListener("click", () => {
    modal.style.display = "none";
});
//모달 외부에 클릭하면 모달 닫기
window.addEventListener("click", (event) => {
    if (event.target === modal) {
        modal.style.display = "none";
    }
});

//문의 보내기
submitQ.addEventListener("click", () => {
	let question = document.querySelector(".modal-content textarea").value;
	if(question.length < 10) {
		alert('문의 내용은 최소 10자 이상입니다');
		return;
	}	
	fetch('sendQuestion.do?logId=' + logID + '&qcontent=' + encodeURIComponent(question) + "&gno=" + gno)
		.then(resolve => resolve.json())
		.then(result => {
			alert('문의를 보냈습니다');
			location.href = "goodsinfo.do?gno=" + gno;
		})
		.catch(err => console.log(err));
});