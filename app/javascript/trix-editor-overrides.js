//Blacklist all attachment
window.addEventListener("trix-file-accept", function(event) {
    event.preventDefault()
    alert("Filetype not supported")
})

// only images
// window.addEventListener("trix-file-accept", function(event) {
//     const acceptedTypes = ['image/jpg', 'image/png']
//     if (acceptedTypes.includes(event.file.type)) {
//         event.preventDefault()
//         alert("Only support attachment of jpg or png")
//     }
// })

// //file size
// window.addEventListener("trix-file-accept", function(event) {
//     const maxFileSize = 1024 *1024
//     if (event.file.size > maxFileSize) {
//         event.preventDefault()
//         alert("only allow files less than 1mb")
//     }
// })