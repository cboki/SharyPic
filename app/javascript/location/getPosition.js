function getUserLocationOnClick() {
  const button = document.getElementById('search-by-location');
  if (button) {
    var options = {
    enableHighAccuracy: true,
    timeout: 5000,
    maximumAge: 0
    };

    const sendPositionToServer = (coordinates) => {
      console.log(coordinates);
      fetch('/events/nearby', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json'
        },
        body: JSON.stringify({ query: coordinates })
      })
        .then(response => response.json())
        .then((data) => {
          console.log(data);
        });
    }

    const success = (pos) => {
      var crd = pos.coords;
      sendPositionToServer(crd);
    };

    const error = (err) => {
      console.warn(`ERROR(${err.code}): ${err.message}`);
    };

    button.addEventListener('click', (event) => {
      navigator.geolocation.getCurrentPosition(success, error, options);
    });
  }
}

export { getUserLocationOnClick };
