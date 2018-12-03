

### Crate target web app
```:commandline
> stagehand web-angular
> pub get
> webdev serve
```


### Generate offline function 

```:pubspec.yaml
dependencies:
  ..
  .
  pwa: 
    git: 
      url: https://github.com/kyorohiro/pwa.git

```

and 'new Client' in main.dart

```:main.dart
import 'package:angular/angular.dart';
import 'package:demo/app_component.template.dart' as ng;
import 'package:pwa/client.dart' as pwa;

void main() {
  runApp(ng.AppComponentNgFactory);
  pwa.Client client = new pwa.Client(scriptUrl: './pwa.dart.js');
}
```

### Confirm


```

> webdev serve

```