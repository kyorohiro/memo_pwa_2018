var cacheName = 'hello_newResponse-v0.0.1';


self.addEventListener('message', function(e) {
  console.log("# receive message " + e.data);
  //
  // https://developer.mozilla.org/en/docs/Web/API/ServiceWorkerGlobalScope/clients
  // https://developer.mozilla.org/en/docs/Web/API/Clients
  self.clients.matchAll().then(clients =>
    clients.forEach(client => client.postMessage(e.data))
  );
}, false);

self.addEventListener('install', function(event) {
    event.waitUntil(self.skipWaiting()); // Activate worker immediately
});

// https://stackoverflow.com/questions/38168276/navigator-serviceworker-controller-is-null-until-page-refresh
self.addEventListener('activate', function(event) {
    event.waitUntil(self.clients.claim()); // Become available to all pages
});