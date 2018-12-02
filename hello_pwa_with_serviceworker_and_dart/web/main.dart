import 'package:service_worker/window.dart' as sw;

void main() {
  if(!sw.isSupported) {
    print(">> service worker is not support ");
    return;
  }
  print(">> service worker is support ");
  sw.register("sw.dart.js");
}