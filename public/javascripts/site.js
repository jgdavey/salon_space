$("#appointment_time").datetime({userLang: 'en', americanMode: true });
$("#client_birthdate").datepicker({
	changeMonth: true,
	changeYear: true,
	yearRange: '1940:2000',
	dateFormat: 'yy-mm-dd'
});