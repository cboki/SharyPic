function getUserLocationOnClick() {
  const button = document.getElementById('search-by-location');
  const eventsNearby = document.getElementById('events-nearby');
  const userPosition = document.getElementById('user-position');


  if (button) {
    var options = {
    enableHighAccuracy: true,
    timeout: 5000,
    maximumAge: 0
    };

    const sendPositionToServer = (coordinates) => {
      console.log(coordinates);
      fetch(`/events/nearby?lat=${coordinates.latitude}&lon=${coordinates.longitude}&acc=${coordinates.accuracy}`)
        .then(response => response.json())
        .then((data) => {
          console.log(data);
          // userPosition.innerText = `latitude: ${data.position.latitude}, longitude: ${data.position.longitude}, accuracy: ${data.position.accuracy}`;
          data.events.forEach((event) => {
            if (event.creator === 'unknown.png') {
              event.creator = 'https://cdn1.iconfinder.com/data/icons/user-pictures/100/unknown-512.png';
            }
            const item = `<a href="/events/${event.id}"><div class='result'><div class="event-creator-avatar"><img src=${event.creator} style="height:40px; width:40px; border-radius:50px;"></div><div class="result-central"><div class="event-name">${event.name}</div><div class="event-location-results">${event.location}</div></div><div class="event-distance">${event.distance} m away</div></div></a>`;
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
