# 00_zero_pwa_with_dart

add dependencies 

### crate target web app
```:commandline
> stagehand web-angular
> pub get
> webdev serve
```


### generate offline function 

```:pubspec.yaml
dependencies:
  ..
  .
  pwa: 
    git: 
      url: https://github.com/kyorohiro/pwa.git

```

```:main.dart
import 'package:angular/angular.dart';
import 'package:demo/app_component.template.dart' as ng;
import 'package:pwa/client.dart' as pwa;

void main() {
  runApp(ng.AppComponentNgFactory);
  pwa.Client client = new pwa.Client(scriptUrl: './pwa.dart.js');
}
```

### confirm

``
> webdev serve
``