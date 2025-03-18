import 'dart:js_interop';

@JS('alert')
external void _jsAlert(String message);

class JsInteropService {
  void showAlert(String message) {
    _jsAlert(message);
  }
}
