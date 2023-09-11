String? simpleValidator(String? val) {
  if (val!.isEmpty) {
    return '*please fill this field';
  } else {
    return '';
  }
}

const appName = 'My Online Friends';
