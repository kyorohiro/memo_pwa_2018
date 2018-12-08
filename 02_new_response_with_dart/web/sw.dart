import 'package:service_worker/worker.dart' as sw;

void main() {
  sw.onInstall.listen((sw.InstallEvent e){
    print("#>>on install");
    e.waitUntil(sw.skipWaiting());
  });

//
//  sw.onActivate.listen((sw.ExtendableEvent e){
//    print("#>>on activate");
//    e.waitUntil(sw.clients.claim());
//  });
//

  sw.onFetch.listen((sw.FetchEvent e) {
    print("##>> fetch");
    Future<sw.Response> responseTask = new Future(() async {
      String path = e.request.url.replaceFirst(RegExp(r"(http|https)://[^/]*"), "");
      return new sw.Response.custom("### ${path}",status: 200,statusText: "OK");
    });
    e.respondWith(responseTask);
  });
}
