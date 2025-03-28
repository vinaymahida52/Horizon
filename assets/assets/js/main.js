const init = () => { 
    // console.log('Hello World');
    const showAlert = (message) => { 
        alert(message);
    }

    window.showAlert = showAlert;
}

window.onload  = () =>{
    init();
}