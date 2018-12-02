var cacheName = 'hello-v0.0.1';

self.addEventListener('install', function (event) {
  console.log('# install (1)');
  const installFunc = function (cache) {
    console.log('# install (2)');
    return cache.addAll(["/", "/index.html"]);
  };
  event.waitUntil(caches.open(cacheName).then(installFunc));
});

self.addEventListener('fetch', function (event) {
  const responceFunc = function (response) {
    console.log("# fetch : " + event.request.url);
    if (response) {
      return response;
    }
    return fetch(event.request);
  };
  //https://developer.mozilla.org/en/docs/Web/API/FetchEvent/request
  //https://developer.mozilla.org/en/docs/Web/API/FetchEvent/respondWith
  //https://developer.mozilla.org/en/docs/Web/API/Cache/match
  event.respondWith(caches.match(event.request).then(responceFunc));
});

