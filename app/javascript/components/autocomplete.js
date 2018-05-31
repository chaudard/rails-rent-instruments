function autocomplete() {
  document.addEventListener("DOMContentLoaded", function() {
    var instrumentAddress = document.getElementById('instrument_address');

    if (instrumentAddress) {
      var autocomplete = new google.maps.places.Autocomplete(instrumentAddress, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(instrumentAddress, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
  });
}

export { autocomplete };
