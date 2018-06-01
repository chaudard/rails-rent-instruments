document.addEventListener('DOMContentLoaded', () => {

  // const startDateEl = document.getElementById("datepicker-start");
  // const endDateEl = document.getElementById("datepicker-end");
  // const totalPriceEl = document.getElementById("total-price");
  // const unitPriceEl = document.getElementById("unit-price");

  // // console.log(unitPriceEl);
  // const unitPrice = parseFloat(unitPriceEl.textContent);

  // function toDate(dateStr) {
  //   var parts = dateStr.split("-")
  //   if (parts.length != 3) {
  //     parts = dateStr.split("/")
  //   }
  //   return new Date(parts[2], parts[1] - 1, parts[0])
  // }

  // computeNbDays = () => {
  //   const startDate = toDate(startDateEl.value);
  //   const endDate = toDate(endDateEl.value);
  //   console.log(startDate);
  //   console.log(endDate);
  //   // const nbDays = endDate - startDate;
  //   const nbDays = Math.floor((endDate - startDate) / 60000);
  //   // console.log(nbDays);

  //   return nbDays;
  // }

  // updateTotalPrice = () => {
  //   const nbDays = computeNbDays();
  //   console.log(nbDays);
  //   // console.log(unitPrice);
  //   const totalPrice = nbDays * unitPrice;
  //   // console.log("computing total price");
  //   // console.log(totalPrice);
  //   totalPriceEl.textContent = totalPrice.toString();
  // }

  // startDateEl.addEventListener("change", (event) => {
  //   console.log('heho');
  //   // updateTotalPrice();
  // });

  // endDateEl.addEventListener("change", (event) => {
  //   console.log('heho');
  //   // updateTotalPrice();
  // });

});

$( document ).ready(function() {
  // Handler for .ready() called.
  $('#datepicker-end').datepicker().on('changeDate', function(e) { console.log(e)})
});
