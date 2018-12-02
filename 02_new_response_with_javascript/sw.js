var cacheName = 'hello_newResponse-v0.0.1';

self.addEventListener('install', function (event) {
    console.log('# install (1)');
    const installFunc = function (cache) {
        console.log('# install (2)');
        return cache.addAll(["/", "/index.html"]);
    };
    event.waitUntil(caches.open(cacheName).then(installFunc));
});

self.addEventListener('fetch', function (event) {
    console.log("# fetch : " + event.request.url);
    const responceFunc = function (response) {
        if (response) {
            return response;
        }
        if (event.request.url.replace(/^.*\//, "") != "") {
            // https://developer.mozilla.org/en/docs/Web/API/Response/Response
            var body = "" + event.request.url.replace(/^.*\//, "");
            var init = { "status": 200, "statusText": "OK" };
            var myResponse = new Response(body, init);
            return myResponse;
        }
        return fetch(event.request);
    };
    //https://developer.mozilla.org/en/docs/Web/API/FetchEvent/request
    //https://developer.mozilla.org/en/docs/Web/API/FetchEvent/respondWith
    //https://developer.mozilla.org/en/docs/Web/API/Cache/match
    event.respondWith(caches.match(event.request).then(responceFunc));
});
