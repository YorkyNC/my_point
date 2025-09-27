import 'dart:convert';
import 'dart:typed_data';

class ImageHelper {
  static Uint8List convertBase64ToBinary(String base64String) {
    // data:image/png;base64, handle this case also
    if (base64String.startsWith('data:image/png;base64,')) {
      base64String = base64String.substring(23);
    }
    return base64Decode(base64String);
  }

  static Uint8List? maybeConvertBase64ToBinary(String? base64String) {
    if (base64String == null) return null;
    return base64Decode(base64String);
  }

  static String? maybeConvertBinaryToBase64(Uint8List? base64List) {
    if (base64List == null) return null;
    return base64Encode(base64List);
  }
}
