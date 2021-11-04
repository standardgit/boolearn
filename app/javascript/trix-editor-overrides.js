//Blacklist all attachment
window.addEventListener("trix-file-accept", function(event) {
    event.preventDefault()
    alert("Filetype not supported")
})