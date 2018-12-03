

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




## install as ICON
https://developers.google.com/web/fundamentals/web-app-manifest/

need folling param in manifest.json

- short_name
- name
- 192x192 の png アイコン（アイコンの宣言には MIME タイプ image/png の指定が必要）
- start_url


and must to write meta tag for manifest

```

<link rel="manifest" href="manifest.json" />

```
