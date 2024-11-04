

function makeImg() {
    fetch("goodsListImage.do?gno=" + gno)
        .then(resolve => resolve.json())
        .then(result => {
            let sumnail = "";
            
            sumnail += '<img src="images/'+ result.imgUrl + '" alt="상품 이미지" class="tab-image">'

            document.querySelector('.imgSection').innerHTML = sumnail;
        })
        .catch(err => console.log(err))
}