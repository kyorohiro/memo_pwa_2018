import 'dart:html' as html;
import 'package:service_worker/window.dart' as sw;
import 'dart:convert' as conv;

void main() async {
  if (sw.isSupported) {
    registration;
    html.querySelector("#subscribe").onClick.listen((html.MouseEvent e) async {
      print(">>> call subscribe");
      print(">>> ${await getSubscription(subscribeIfNeeded: true)}");
    });

    html.querySelector("#unsubscribe").onClick.listen((html.MouseEvent e) async {
      print(">>> call unsubscribe ${await (await registration).unregister()}");
    });
  }
}


sw.ServiceWorkerRegistration _reg;
Future<sw.ServiceWorkerRegistration> get registration async =>
    _reg == null ? _reg = await sw.register("./sw.dart.js"):_reg;

sw.PushSubscriptionOptions get pushSubscriptionOption => new sw.PushSubscriptionOptions(
    userVisibleOnly: true,
    applicationServerKey: conv.base64.decode(conv.base64Url.normalize(
        "BEM6u6WTQr3MKqaHE4GoexJx1gtV2cbeAadXKeLtruEiVs7UB5JxYPOsfQ09OQTcMsaQbf_LAN4dY4DqctworyU")));


Future getSubscription({bool subscribeIfNeeded: false}) async {
  String status = await (await registration).pushManager.permissionState(pushSubscriptionOption);
  sw.PushSubscription subscription =  await (await registration).pushManager.getSubscription();

  //
  // if user is unsubscribed, try to subscribe
  if (subscribeIfNeeded && subscription == null && (status == "prompt" || status == "granted")) {
    try {
       subscription  = await (await registration).pushManager.subscribe(pushSubscriptionOption);
    } catch (e) {print(e);}
    return getSubscription(subscribeIfNeeded: false);
  }

  //
  // return subscription to send to
  if(subscription == null) {
    return "";
  } else {
    return conv.json.encode({
      "endpoint":subscription.endpoint,
      "keys": subscription.getKeysAsString()
    });
  }
}
