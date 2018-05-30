function autocomplete() {
  document.addEventListener("DOMContentLoaded", function() {
    var instrumentsCity = document.getElementById('instrument_city');

    if (instrumentCity) {
      var autocomplete = new google.maps.places.Autocomplete(instrumentCity, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(instrumentCity, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
  });
}

export { autocomplete };
