const places = require('places.js');
const event_location = document.getElementById('event_location');

const algoliaSearchBar = () => {
  if (event_location) {
    const options = {
      appId: 'plOJ7TLSVPU0',
      apiKey: '33071d412686702d6db8d1a5f16113e2',
      container: event_location,

    };
    places(options);
  }
};

export { algoliaSearchBar };
