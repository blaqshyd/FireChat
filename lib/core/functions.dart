String capitalizeFirstLetter(String text) {
  if (text.isEmpty) {
    return text;
  }
  return text[0].toUpperCase() + text.substring(1);
}

String getEmailPrefix(String email) {
  List<String> parts = email.split('@');
  if (parts.length > 1) {
    return capitalizeFirstLetter(parts[0]);
  } else {
    // Return the original email if no "@" symbol found

    return capitalizeFirstLetter(email);
  }
}
