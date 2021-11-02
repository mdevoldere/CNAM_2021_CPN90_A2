fetch('http://localhost:8000/banks')
.then(response => {
    return response.json();
})
.then(json => {
    console.log(json);
});