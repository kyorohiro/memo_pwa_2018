import 'package:service_worker/window.dart' as sw;
import 'dart:html' as html;
 main() async {
  if(!sw.isSupported) {
    print(">> service worker is not support ");
    return;
  }
  print(">> service worker is support ");
  //sw.ServiceWorkerRegistration reg =
  await sw.register("sw.dart.js");
  sw.onMessage.listen((sw.MessageEvent e) {
    print(">> receive: ${e.data} ");
  });
  html.querySelector("#btn").onClick.listen((html.MouseEvent e){
    sw.controller.postMessage("Hello,World");
  });
}
