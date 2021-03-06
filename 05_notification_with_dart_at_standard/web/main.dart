import 'package:pwa/client.dart' as pwa;
import 'dart:html' as html;
import 'dart:convert' as conv;
void main() async {
  pwa.Client client =  new pwa.Client(scriptUrl: './pwa.dart.js');
  pwa.PushPermission p = await client.getPushPermission(applicationServerKey: "BEM6u6WTQr3MKqaHE4GoexJx1gtV2cbeAadXKeLtruEiVs7UB5JxYPOsfQ09OQTcMsaQbf_LAN4dY4DqctworyU");

  html.querySelector("#subscribe").onClick.listen((html.MouseEvent e) async {
    print("subscribe");                                                               
    p = await client.getPushPermission(subscribeIfNeeded: true,applicationServerKey: "BEM6u6WTQr3MKqaHE4GoexJx1gtV2cbeAadXKeLtruEiVs7UB5JxYPOsfQ09OQTcMsaQbf_LAN4dY4DqctworyU");
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
    info += "clientKeys :${p.clientKeys}<br><br><br><br>";
    info += conv.json.encode({
      "endpoint": p.endpointUrl,
      "keys": p.clientKeys
    }) + "<br><br>";
    info += """<br><br> <a href="https://web-push-codelab.glitch.me/">https://web-push-codelab.glitch.me/</a> <br><br>""";
    print(">>${info}");
    html.querySelector("#info").setInnerHtml("<div>${info}</div>");
  });
}
