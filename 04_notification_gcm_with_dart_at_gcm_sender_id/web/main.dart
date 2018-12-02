import 'package:pwa/client.dart' as pwa;
import 'dart:html' as html;

void main() async {
  pwa.Client client =  new pwa.Client(scriptUrl: './pwa.dart.js');
  pwa.PushPermission p = await client.getPushPermission();

  html.querySelector("#subscribe").onClick.listen((html.MouseEvent e) async {
    print("subscribe");
    p = await client.getPushPermission(subscribeIfNeeded: true);
  });

  html.querySelector("#unsubscribe").onClick.listen((html.MouseEvent e)async{
    print("unsubscribe");
    await p.unsubscribe();
  });

  html.querySelector("#log").onClick.listen((html.MouseEvent e)async{
    print("log");
    String info = "";
    info += "isDenied : ${p.isDenied}<br>";
    info += "isGranted : ${p.isGranted}<br>";
    info += "isSubscribed : ${p.isSubscribed}<br>";
    info += "isPrompt : ${p.isPrompt}<br>";
    info += "endpointUrl : ${p.endpointUrl}<br>";
    info += "clientKeys :${p.clientKeys}<br>";
    info += """curl -X POST  --header "TTL: 600" --header "Authorization: key={YourKey}" ${p.endpointUrl}<br>""";
    print(">>${info}");
    html.querySelector("#info").setInnerHtml("<div>${info}</div>");
  });
}
