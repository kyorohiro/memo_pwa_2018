import 'package:service_worker/worker.dart'  as sw;

main() async {
  
  sw.onInstall.listen((sw.InstallEvent e){
    print("#>>on install");
    e.waitUntil(sw.skipWaiting());
  });
  sw.onActivate.listen((sw.ExtendableEvent e){
    print("#>>on activate");
    e.waitUntil(sw.clients.claim());
  });

  sw.onPush.listen((sw.PushEvent e) {
    print("#>>on pushevent ${e.data.text()}");
    
    e.waitUntil(
      sw.registration.showNotification("title",
      new sw.ShowNotificationOptions(
        body: "body:${e.data.text()}",
        icon: "favicon.ico",
        badge: "favicon.ico")
      ));
  });
}