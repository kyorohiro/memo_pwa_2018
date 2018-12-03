import 'package:pwa/worker.dart' as pwa;

void main() {
  pwa.Worker worker = new pwa.Worker();
  worker.offlineUrls = <String> [
   // "/", "/index.html","/main.dart.js"
  ];

  worker.pushHandler = (pwa.PushContext context) async {
    await context.showNotification(new pwa.Notification("pushed"));
  };

  worker.run(version: "v0.0.1");
}