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
})
.catch();

const app = {
    data() {
        return {
            title: "The banks"
        }
    },

    mounted() {
        setInterval(() => {
            this.title += 'a';
        }, 10);
    }
}

Vue.createApp(app).mount('#app');