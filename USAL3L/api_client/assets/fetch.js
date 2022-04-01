/*fetch('http://localhost:8000/banks', {
    headers: {
        'content-type': 'application/json',
        'accept': 'application/json'
    }
})
.then(response => {
    return response.json();
})
.then(json => {
    console.log(json);
    let list = document.querySelector('#banklist');
    console.log(list);
    //list.textContent = json;
    json.forEach(bank => {
        list.innerHTML += '<p>' +bank.bankName +'</p>';
    });
})
.catch(err => {

});
*/