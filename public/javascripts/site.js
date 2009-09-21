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
	yearRange: '1970:2000',
	dateFormat: 'yy-mm-dd',
	buttonImage: '/images/calendar_icon.gif',
	showOn: 'button',
	onSelect: function(dateText, inst) {
		this.focus();
	}	
});