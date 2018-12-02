import 'package:service_worker/worker.dart' as sw;

void main() {
  String cacheName = "v0.0.2";

  sw.onInstall.listen((sw.InstallEvent e) async {
    print("##>> install");
    Future installTask = new Future(() async {
      sw.Cache cache = await sw.caches.open(cacheName);
      cache.addAll([
        "/","/index.html","main.dart.js"
      ]);
    });
    e.waitUntil(installTask);
  });

  sw.onFetch.listen((sw.FetchEvent e) {
    print("##>> fetch");
    Future<sw.Response> responseTask = new Future(() async {
      String lastPath = e.request.url.replaceFirst(RegExp(r".*\/"), "");
      sw.Response resonseCache = await sw.caches.match(e.request);
      if(resonseCache != null){
        return resonseCache;
      } else if(lastPath != "") {
        return new sw.Response.custom("## ${lastPath}",status: 200,statusText: "OK");
      } else {
        return sw.fetch(e.request);
      }
    });
    e.respondWith(responseTask);
  });
}
