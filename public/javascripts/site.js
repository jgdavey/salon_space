// Time picker
$("#appointment_time").datepicker({
	constrainInput: false,
	buttonImage: '/images/calendar_icon.gif',
	showOn: 'button',
	onSelect: function(dateText, inst) {
		this.focus();
	}
});

// Handle birthdays a bit differently
$("#client_birthdate").datepicker({
	changeMonth: true,
	changeYear: true,
	yearRange: '1940:2000',
	dateFormat: 'yy-mm-dd'
});