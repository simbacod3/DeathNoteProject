/*
 * THIS FILE IS A VIEW CONTROLLER FOR 
 * THE ADMIN PANEL.
 */

function openWrapper(event) {
	let wrapDatabase = document.getElementById('wrap_database'),
		wrapAddEvent = document.getElementById('wrap_forms'),
		wrapUser = document.getElementById('wrap_admin'),
		wrapMail = document.getElementById('wrap_mail');
	console.log("bite")
	switch(event.target.getAttribute("menu-value")) {
		case "wrap_database":
			wrapDatabase.style.display = 'block';
			closeOtherWrappers(wrapDatabase);
			break;
		case "wrap_forms":
			wrapAddEvent.style.display = 'block';
			
			closeOtherWrappers(wrapAddEvent);
			break;
		case "wrap_admin":
			wrapAdmin.style.display = 'block';
			closeOtherWrappers(wrapAdmin);
			break;
		case "wrap_mail":
			wrapMail.style.display = 'block';
			closeOtherWrappers(wrapMail);
			break;
	}
	
}

function closeOtherWrappers(el) {
	let wrapDatabase = document.getElementById('wrap_database'),
	wrapAddEvent = document.getElementById('wrap_forms'),
	wrapUser = document.getElementById('wrap_admin'),
	wrapMail = document.getElementById('wrap_mail');
	
	if(el == wrapDatabase) {
		wrapAddEvent.style.display = 'none';
		wrapMail.style.display = 'none';
		wrapUser.style.display = 'none';
	}  
	else if(el == wrapAddEvent) {
		wrapDatabase.style.display = 'none';
		wrapMail.style.display = 'none';
		wrapUser.style.display = 'none';
	}	
	else if(el == wrapMail) {
		wrapDatabase.style.display = 'none';
		wrapAddEvent.style.display = 'none';
		wrapUser.style.display = 'none';
	}
	else if(el == wrapUser) {
		wrapDatabase.style.display = 'none';
		wrapAddEvent.style.display = 'none';
		wrapMail.style.display = 'none';
	}
	
}