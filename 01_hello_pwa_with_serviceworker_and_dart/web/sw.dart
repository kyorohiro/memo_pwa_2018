import 'package:service_worker/worker.dart' as sw;

void main() {
  String cacheName = "v0.0.1";

  sw.onInstall.listen((sw.InstallEvent e) async {
    print("##>> install");
    Future installTask = new Future(() async {
      sw.Cache cache = await sw.caches.open(cacheName);
      cache.addAll([
        "/","/index.html"
      ]);
    });
    e.waitUntil(installTask);
  });

  sw.onFetch.listen((sw.FetchEvent e) {
    print("##>> fetch");
    Future<sw.Response> responseTask = new Future(() async {
      sw.Response resonse = await sw.caches.match(e.request);
      if(resonse != null){
        return resonse;
      } else {
        return sw.fetch(e.request);
      }
    });
    e.respondWith(responseTask);
  });
}
