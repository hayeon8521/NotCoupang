/*!
	장바구니 넣기, 구매하기, 페이징
*/
console.log("연결ok")

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
		return;
	} else if (count <= 0) {
		alert("잘못된 입력값입니다.");
		return;
	}

	//이름, 가격, 선택수량 넘기면 됨
	fetch("cartView.do?logid=" + logID + "&gno=" + gno + "&count=" + count)
		.then(resolve => resolve.json())
		.then(result => {
			if(result.reCode == "FAIL") {
				alert("실패");
			}
		})
		.catch(err => { console.log(err) })
}

function sendCartView() {
	addCart();
	alert("상품이 장바구니에 담겼습니다.")
}
//구매하기 장바구니 넣고 페이지로 이동
function sendCheckout() {
	//유저가 입력한 수량
	let count = document.querySelector('#inputQuantity').value;
	
	//장바구니 담기
	addCart();
	
	//구매하기 페이지 이동
	//checkout.do로 옮기기
	location.href = "checkout.do?logid="+ logID +"&gno="+ gno +"&count="+ count +"&price=" + price;
}

