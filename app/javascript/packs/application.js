import 'bootstrap';
import { getUserLocationOnClick } from '../location/getPosition';

import 'flatpickr/dist/flatpickr.css';
import { datePicker } from '../components/_datepicker';
import { fileUploader } from '../fileuploader/fileUploader';
import { like } from '../like/_like.js';

getUserLocationOnClick();
datePicker();
fileUploader();
like();
