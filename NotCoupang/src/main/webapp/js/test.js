/**
 * test.js
 * 자바스크립트 테스트
 */

window.addEventListener('DOMContentLoaded', event => {
	fetch('testlist.do')
		.then(function(resolve) {
			return resolve.json();
		})
		.then(function(result) {
			console.log(result);
			inputinfo(result);

		})
		.catch(err => { console.log(err) })

	function inputinfo(result) {
		let tr = document.createElement('tr');
		let td = document.createElement('td');
		td.innerHTML = result.memberId;
		tr.appendChild(td);

		td = document.createElement('td');
		td.innerHTML = result.memberName;
		tr.appendChild(td);

		td = document.createElement('td');
		td.innerHTML = result.memberPhone;
		tr.appendChild(td);

		td = document.createElement('td');
		td.innerHTML = result.memberDivision;
		tr.appendChild(td);

		document.querySelector('.fre').appendChild(tr);
	}
});


$(function() {
	var bno = bno || 1;
	$.ajax({
		url: 'testlist.do',
		data: { bno: bno },
		method: "POST",
		dataType: "json"	//서버에서 가져온 결과값 // 문자열을 자바스크립트의 객체로 자동으로 파싱해줌
	})
	.done(function(result) {
		console.log(result);
		inputinfo2(result);
	})
	.fail(function(err) {
		console.log(err);
	});
	
	function inputinfo2(result){
		$('<tr />').append( 
			$('<td />').text(result.memberId),
			$('<td />').text(result.memberName),
			$('<td />').text(result.memberPhone),
			$('<td />').text(result.memberDivision)    
		).appendTo($('.after'));
	}
});