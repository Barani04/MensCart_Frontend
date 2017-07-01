$(function() {
	
	switch(menu){
		case 'About Us':
				$('#About').addClass('active');
				break;
				
		case 'Contact Us':
			$('#Contact').addClass('active');
			break;
			
		case 'Log In':
			$('#login').addClass('active');
			break;
			
		case 'Sign Up':
			$('#signup').addClass('active');
			break;
			
		case 'Product':
			$('#Product').addClass('active');
			break;
			
		case 'Category':
			$('#Category').addClass('active');
			break;
			
		case 'Supplier':
			$('#Supplier').addClass('active');
			break;
			
		default:
			$('#home').addClass('active');
			break;
	}
	
});
	
	
	
