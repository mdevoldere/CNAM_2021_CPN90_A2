function isMajor(_age) {
    return  new Promise((resolve, reject) => {
        if(_age >= 18) {
            resolve(_age + " majeur");
        }
        else {
            reject(_age + " mineur");
        }
    })
}

isMajor(23).then(message => { console.log(message) }).catch(err => { console.error(err)});
isMajor(15).then(message => { console.log(message) }).catch(err => { console.error(err)});