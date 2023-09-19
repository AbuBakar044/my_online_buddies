String? simpleValidator(String? val) {
  if (val!.isEmpty) {
    return '*please fill this field';
  } else {
    return null;
  }
}

const appName = 'My Online Friends';

//Images Constants

const String kCamera = 'assets/images/camera.png';
const String kGallery = 'assets/images/gallery.png';

