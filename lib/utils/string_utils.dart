String capitalizeFirst(String s) {
  if (s.length > 2) {
    return s[0].toUpperCase() + s.substring(1);
  } if (s.length > 1) {
    return s.toUpperCase();
  } else {
    return s;
  }
}