function makeImg() {
    fetch("goodsinfoImgs.do?gno=" + gno)
        .then(resolve => resolve.json())
        .then(result => {
            let sumnail = "";
            for (let i = 0; i < result.length; i++) {
                if (i == 0) {
                    sumnail += '<img class="card-img-top mb-5 mb-md-0" id="sumnail" src="images/' + result[i].imgUrl + '" alt="..." style="width: 530px; height: 600px;" />';
                }
            }
            document.querySelector('.content-left').innerHTML = sumnail;
        })
        .catch(err => console.log(err))
}