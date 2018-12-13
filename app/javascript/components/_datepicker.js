import flatpickr from 'flatpickr';

function datePicker() {
  const startDateinput = document.getElementById('event_start_date');
  const endDateinput = document.getElementById('event_end_date');
  console.log (startDateinput);
  console.log (endDateinput);
  if (startDateinput && endDateinput) {
    flatpickr(startDateinput, {
      minDate: 'today',
      dateFormat: 'd-m-Y',
      onChange: function(_, selectedDate) {
        if (selectedDate === '') {
          return endDateinput.disabled = true;
        }
        endDateCalendar.set('minDate', selectedDate);
        endDateinput.disabled = false;
      }
    });
    const endDateCalendar =
    flatpickr(endDateinput, {
      dateFormat: 'd-m-Y',
    });
  }
}

export { datePicker };
