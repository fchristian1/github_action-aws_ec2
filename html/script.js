const countText = document.getElementById("count")
const count_dec = document.getElementById("count_dec")
const count_inc = document.getElementById("count_inc")

let count = 0

count_dec.addEventListener("click", function () {
    count++;
})
count_inc.addEventListener("click", function () {
    count--;
})