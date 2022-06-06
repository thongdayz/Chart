async function jsReload() {
    window.location.reload();
}

async function jsAlert(val) {
    alert(val);
}

window.logger = (flutter_value) => {
    console.log({ js_context: this, flutter_value });
}