function getUserLocationOnClick() {
  const button = document.getElementById('search-by-location');
  const eventsNearby = document.getElementById('events-nearby');

  if (button) {
    var options = {
    enableHighAccuracy: true,
    timeout: 5000,
    maximumAge: 0
    };

    const sendPositionToServer = (coordinates) => {
      console.log(coordinates);
      fetch(`/events/nearby?lat=${coordinates.latitude}&lon=${coordinates.longitude}`)
        .then(response => response.json())
        .then((data) => {
          console.log(data);
          data.forEach((event) => {
            const item = `<li>${event.location}</li>`;
            console.log(item);
            eventsNearby.insertAdjacentHTML('beforeend', item);
          });
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
