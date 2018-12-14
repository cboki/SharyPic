import 'bootstrap';
import { getUserLocationOnClick } from '../location/getPosition';

import 'flatpickr/dist/flatpickr.css';
import { datePicker } from '../components/_datepicker';
import { fileUploader } from '../fileuploader/fileUploader';

getUserLocationOnClick();
datePicker();
fileUploader();
