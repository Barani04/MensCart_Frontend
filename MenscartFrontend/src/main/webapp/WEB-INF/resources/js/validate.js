function formRegister() {
	// Make quick references to our fields
	var firstname = document.getElementById('firstName');
	var lastname = document.getElementById('lastName');
	var username = document.getElementById('userName');
	var password = document.getElementById('password');
	var phone = document.getElementById('contactNo');
	var email = document.getElementById('emailId');
	var address = document.getElementById('address');

	if (notEmpty(firstname, "Firstname Should not be empty")) {
		if (isAlphabet(firstname, "Please enter only letters for Fsername")) {
			if (notEmpty(username, "Username Should not be empty")) {
				if (isAlphabet(username,
						"Please enter only letters for Username")) {
					if (notEmpty(email, "EmailId Should not be empty")) {
						if (emailValidator(email, "Enter a valid EmailId")) {
							if (notEmpty(password,
									"password Should not be empty")) {
								if (isAlphanumeric(password,
										"Numbers and Letters Only for Passwords")) {
									if (notEmpty(phone,
											"PhoneNumber Should not be empty")) {
										if (isNumeric(phone,
												"Please enter only number for PhoneNumber")) {
											if (notEmpty(address,
													"Address Should not be empty")) {

												return true;
											}
										}
									}
								}
							}
						}
					}
				}
			}
		}
	}

	return false;
}

function formCategory() {
	// Make quick references to our fields

	var categoryname = document.getElementById('categoryName');
	var description = document.getElementById('description');
	// Check each input in the order that it appears in the form!

	if (notEmpty(categoryname, "Category Name Should not be empty")) {
		if (isAlphabet(categoryname,
				"Please enter only letters for Category Name")) {
			if (notEmpty(description,
					"Category Description Should not be empty")) {
				if (isAlphabet(description,
						"Please enter only letters for Category Description")) {
					return true;
				}
			}
		}
	}

	return false;
}

function formSupplier() {
	// Make quick references to our fields

	var suppliername = document.getElementById('supplierName');
	var contactnumber = document.getElementById('contactNo');
	var address = document.getElementById('address');
	// Check each input in the order that it appears in the form!

	if (notEmpty(suppliername, "Supplier Name Should not be empty")) {
		if (isAlphabet(suppliername,
				"Please enter only letters for Supplier Name")) {
			if (notEmpty(contactnumber, "Contact Number Should not be empty")) {
				if (isNumeric(contactnumber,
						"Please enter only letters for Contact Number")) {
					if (notEmpty(address, "Address Should not be empty")) {
						return true;
					}
				}
			}
		}
	}

	return false;
}

function formProduct() {
	// Make quick references to our fields

	var productname = document.getElementById('productName');
	var productdescription = document.getElementById('productDescription');
	var category = document.getElementById('category');
	var suppliername = document.getElementById('supplier');
	var price = document.getElementById('price');
	var stock = document.getElementById('stock');
	// Check each input in the order that it appears in the form!

	if (notEmpty(productname, "Product Name Should not be empty")) {
		if (isAlphabet(productname,
				"Please enter only letters for Product Name")) {
			if (notEmpty(productdescription,
					"Product Description Should not be empty")) {
				if (isAlphabet(productdescription,
						"Please enter only letters for Product Description")) {
					if (notEmpty(category, "Category Should not be empty")) {
						if (notEmpty(suppliername,
								"Supplier Name should not be empty")) {

							if (notEmpty(price, "Price Should not be empty")) {
								if (isNumeric(price,
										"Please enter only number for Price")) {
									if (notEmpty(stock,
											"Stock Should not be empty")) {
										if (isNumeric(stock,
												"Please enter a valid Stock")) {
											if (notEmpty(file,
													"File should not be empty")) {
												return true;
											}
										}
									}
								}
							}
						}
					}
				}
			}
		}
	}
	return false;
}

function formShiping() {
	// Make quick references to our fields

	var userName = document.getElementById('userName');
	var contactNumber = document.getElementById('contactNo');
	var address = document.getElementById('address');
	// Check each input in the order that it appears in the form!

	if (notEmpty(userName, "Username Should not be empty")) {
		if (isAlphabet(userName, "Please enter only letters for Username")) {
			if (notEmpty(contactNumber, "Contact Number Should not be empty")) {
				if (isNumeric(contactNumber,
						"Please enter only number for Contact Number")) {
					if (notEmpty(address, "Address Should not be empty")) {
						return true;
					}
				}
			}
		}

	}
	return false;
}

function notEmpty(elem, helperMsg) {
	if (elem.value.length == 0) {
		alert(helperMsg);
		elem.focus(); // set the focus to this input
		return false;
	}
	return true;
}
function isNumeric(elem, helperMsg) {
	var numericExpression = /^[0-9]+$/;
	if (elem.value.match(numericExpression)) {
		return true;
	} else {
		alert(helperMsg);
		elem.focus();
		return false;
	}
}
function isAlphabet(elem, helperMsg) {
	var alphaExp = /^[a-z A-Z]+$/;
	if (elem.value.match(alphaExp)) {
		return true;
	} else {
		alert(helperMsg);
		elem.focus();
		return false;
	}
}
function isAlphanumeric(elem, helperMsg) {
	var alphaExp = /^[0-9a-zA-Z]+$/;
	if (elem.value.match(alphaExp)) {
		return true;
	} else {
		alert(helperMsg);
		elem.focus();
		return false;
	}
}
function emailValidator(elem, helperMsg) {
	var emailExp = /^[\w\-\.\+]+\@[a-zA-Z0-9\.\-]+\.[a-zA-z0-9]{2,4}$/;
	if (elem.value.match(emailExp)) {
		return true;
	} else {
		alert(helperMsg);
		elem.focus();
		return false;
	}
}