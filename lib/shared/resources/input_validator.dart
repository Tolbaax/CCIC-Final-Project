//TODO: REGISTER VALIDATOR
String? nameValidator(String? value) {
  if (value!.isEmpty) {
    return 'Please Enter your Name';
  }
  if (value.length < 5) {
    return 'Name must be at least 5 characters long';
  }
  if (value.length > 30) {
    return 'Name must be less than 30 characters long';
  }
  return null;
}

String? emailValidator(String? value) {
  if (value!.isEmpty) {
    return 'Please Enter Your Email';
  }
  String pattern = r'\w+@\w+\.\w+';
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(value)) {
    return 'Invalid E-mail Address format';
  }
  return null;
}

String? phoneValidator(value) {
  if (value!.isEmpty) {
    return 'Please Enter Your Phone';
  }
  if (value.length < 11) {
    return 'Phone must be at least 11 digits';
  }

  return null;
}

String? passwordValidator(String? value) {
  if (value!.isEmpty) {
    return 'Please Enter Your Password';
  }
  if (value.length < 8) {
    return 'Password must have at least 8 characters';
  }
  return null;
}

//TODO: UPLOAD PRODUCT VALIDATOR
String? titleValidator(String? value) {
  if (value!.isEmpty) {
    return 'Please Enter Product Name';
  }
  if (value.length < 2) {
    return 'Name must be at least 2 characters long';
  }
  if (value.length > 30) {
    return 'Name must be less than 30 characters long';
  }
  return null;
}

String? salaryValidator(String? value) {
  if (value!.isEmpty) {
    return 'Please Enter Salary';
  }
  if (value.length < 2) {
    return 'Name must be at least 2 characters long';
  }
  if (value.length > 8) {
    return 'Name must be less than 8 characters long';
  }
  return null;
}

String? descValidator(String? value) {
  if (value!.isEmpty) {
    return 'Please Enter Description';
  }
  if (value.length < 5) {
    return 'Name must be at least 5 characters long';
  }
  return null;
}
