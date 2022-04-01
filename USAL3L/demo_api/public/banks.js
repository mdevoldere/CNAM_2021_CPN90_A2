const app = {
    data() {
        return {
            title: "The banks",
            banks: []
        }
    },

    mounted() {
        fetch('/api/banks', { 
            method: 'GET', 
            headers: { 
                Accept: "application/json"
            }
        })
        .then(response => {
            return response.json();
        })
        .then(json => {
            console.log(json);
            this.banks = json;
        })
        .catch();
    }
}

Vue.createApp(app).mount('#app');


