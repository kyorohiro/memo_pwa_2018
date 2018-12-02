import 'package:pwa/worker.dart';

void main() {
  Worker worker = new Worker();
  worker.offlineUrls = <String>[
    "./",
    "./index.html",
    "./main.dart.js",
  ];
  worker.run(version: "v0.0.1");
}
