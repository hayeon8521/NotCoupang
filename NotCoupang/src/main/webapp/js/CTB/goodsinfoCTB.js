/*!
	장바구니 넣기, 구매하기, 페이징
*/
//리뷰 초기페이지
let page = 1;
//QnA 초기 페이지
let qpage = 1;


document.addEventListener("DOMContentLoaded", function() {
	document.querySelector("#addCartBtn").addEventListener('click', sendCartView);
});


function addCart() {
	//유저가 입력한 수량
	let count = Number(document.querySelector('#inputQuantity').value);
	//재고
	let stock = Number(document.querySelector('#stock-area span').innerHTML);
	//만약 재고보다 많은 양을 장바구니에 담을 경우 오류창 출력

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
//구매하기 장바구니 넣고 페이지로 이동
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
	
	fetch('reviewList.do?gno=' + gno + '&page=' + page)
		.then(resolve => resolve.json())
		.then(result => {
			result.forEach((item) => {
				if (item == null) {
					let p = document.createElement('p');
					p.innerHTML = "<br>-등록된 리뷰가 없습니다-<br>";
					return;
				}
				console.log(item);
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
	let buyerIdPlus = param.buyerId + ":";
	let field = [buyerIdPlus, param.review];

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
		.then(createPageList)
		.catch(err => console.log(err));
}


//리뷰 페이지 목록 출력
function createPageList(result) {
	document.querySelector(".totalReviewCnt").innerHTML = result;
	let totalCnt = result;
	let startPage, endPage, realEnd;
	let prev, next;

	endPage = Math.ceil(page / 5) * 5;
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
		list += '  <a class="page-link" href="#" aria-label="Previous" data-page="' + (startPage - 1) + '">&lt;</a>';
	else
		list += '  <span class="page-link" aria-hidden="true">&lt;</span>';
	list += '    </li>';

	//페이징	
	for (let p = startPage; p <= endPage; p++) {
		if (p == page) {
			list += '<li class="page-item now-rpage-Oncolor" ><a class="page-link" href="#" data-page="' + p + '">' + p + '</a></li>';
		} else {
			list += '<li class="page-item now-page"><a class="page-link" href="#" data-page="' + p + '">' + p + '</a></li>';
		}


	}

	//다음페이지 이동
	list += '<li class="page-item">';
	if (next)
		list += '  <a class="page-link" href="#" aria-label="Next" data-page="' + (endPage + 1) + '">&gt;</a>';
	else
		list += '  <span class="page-link" disabled aria-hidden="true">&gt;</span>';
	list += '    </a></li></ul></nav>';

	document.querySelector('.review-paging').innerHTML = list;

	linkMove();
}

//리뷰 페이징 링크 누르면 이동
function linkMove() {
	document.querySelectorAll("nav ul.pagination a").forEach(function(aTag) {
		aTag.addEventListener('click', function(e) {
			console.log(aTag.innerHTML);
			//a태그는 원래 누르면 다른 페이지로 이동하지만, 이 코드를 통해 이동하지 않고 현재 페이지에서만 동작하도록 만들었음
			e.preventDefault();
			page = parseInt(aTag.dataset.page);	//a태그의 data-page="n" 이것의 n값을 가져옴

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
			for (let i = 0; i < 5; i++) {
				console.log(result.asks[i]);
				console.log(result.answers[i]);
				let ul = document.createElement('ul');
				//질문
				let qli = document.createElement('li');
				qli.innerHTML = '<p>' + result.asks[i].buyerId + ': </p>' + result.asks[i].ask + '<hr>';
				ul.appendChild(qli);

				//답변
				let nli = document.createElement('li');
				nli.className = "answerSt";
				nli.innerHTML = '<p>' + result.answers[i].sellerId + ': </p>' + result.answers[i].answer;
				ul.appendChild(nli);

				document.querySelector('.qna-content').appendChild(ul);
			}
			
		})
		.catch(err => console.log(err))
}


//전체 문의 개수 가져오기


function askPaging() {
	fetch('askCount.do?gno=' + gno)
		.then(resolve => resolve.json())
		.then(result => console.log(result))
		.catch(err => console.log(err));
}



