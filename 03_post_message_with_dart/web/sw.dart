import 'package:service_worker/worker.dart' as sw;

void main() {
  String cacheName = "v0.0.1";

  sw.onInstall.listen((sw.InstallEvent e) async {
     e.waitUntil(sw.skipWaiting()); // Activate worker immediately
  });

  sw.onActivate.listen((sw.ExtendableEvent e){
    print("##>> activate");
    // https://stackoverflow.com/questions/38168276/navigator-serviceworker-controller-is-null-until-page-refresh
    e.waitUntil(sw.clients.claim()); // Become available to all pages
  });


  //
  // message
  //
  sw.onMessage.listen((sw.ExtendableMessageEvent e){
    sw.clients.matchAll().then((List<sw.ServiceWorkerClient> cls) {
      cls.forEach((sw.ServiceWorkerClient cl){
        //e.source
        print("receive: ${e.data} : ${e.source.toString()}");
        cl.postMessage(e.data);
      });
    });
  });
}


