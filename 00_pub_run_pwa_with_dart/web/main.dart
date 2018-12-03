import 'package:angular/angular.dart';
import 'package:demo/app_component.template.dart' as ng;
import 'package:pwa/client.dart' as pwa;

void main() {
  runApp(ng.AppComponentNgFactory);
  pwa.Client client = new pwa.Client(scriptUrl: './pwa.dart.js');

}



