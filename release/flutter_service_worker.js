'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "04c210068c9ba350c08a7b6929dc3434",
"assets/AssetManifest.bin.json": "e9f3b33e0dd60a096e5512d130a17b76",
"assets/AssetManifest.json": "aa8ea356f899f80b4cc169b985760021",
"assets/assets/fonts/NotoColorEmoji.ttf": "aca215e01cbbe3a587de8555269b9233",
"assets/assets/images/branding_image.png": "7c03c28917eaf8878e525da37944d8d6",
"assets/assets/images/fast_process.png": "a924c6b5bc76c53048aa7f91516c020e",
"assets/assets/images/holding_phone.png": "89819bd5d53c0296a798f14b90b67420",
"assets/assets/images/invoix_logo.png": "538af8e5abc34bf6efe5474b5e0f5ec4",
"assets/assets/images/logo_banner_new.png": "2398f9d832801393966ad90d6fbd5f39",
"assets/assets/images/logo_banner_splash.png": "6c18f606f81e6443a07b11e0cbacdcf2",
"assets/assets/images/phone_canvas.png": "cda013ad2659a8190ae3542c03c5941e",
"assets/assets/images/pie-chart.png": "87f9217c9cb74c995d6879e87c0bb655",
"assets/assets/images/play_store.png": "8f489991ed264652895eeda1ebfe4c38",
"assets/assets/images/secure_infrastructure.png": "8d6332967293c8eb0036c9b8abdca7f2",
"assets/assets/loading/InvoiceReadLoading.gif": "5e4b6217d143a9755eb7b3ddc7522e55",
"assets/assets/pages/account_deletion.md": "e5b965a70d37b41dce0594e801e613d4",
"assets/assets/pages/patches.md": "6dd1ef3d3b30234d8920938f542910cd",
"assets/assets/pages/privacy_policy.md": "c3debf0b56bbf9904174e256a241a821",
"assets/assets/pages/terms_of_service.md": "a8684391de81d09ca600843bfc7674a9",
"assets/FontManifest.json": "cda665d8caa3062bd627a4450d3a4ad0",
"assets/fonts/MaterialIcons-Regular.otf": "0f3e1a74a73a66901a4fc42d58810081",
"assets/NOTICES": "2ed7b5f817274748304825f27a8812b9",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/packages/youtube_player_iframe/assets/player.html": "663ba81294a9f52b1afe96815bb6ecf9",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "86e461cf471c1640fd2b461ece4589df",
"canvaskit/canvaskit.js.symbols": "68eb703b9a609baef8ee0e413b442f33",
"canvaskit/canvaskit.wasm": "efeeba7dcc952dae57870d4df3111fad",
"canvaskit/chromium/canvaskit.js": "34beda9f39eb7d992d46125ca868dc61",
"canvaskit/chromium/canvaskit.js.symbols": "5a23598a2a8efd18ec3b60de5d28af8f",
"canvaskit/chromium/canvaskit.wasm": "64a386c87532ae52ae041d18a32a3635",
"canvaskit/skwasm.js": "f2ad9363618c5f62e813740099a80e63",
"canvaskit/skwasm.js.symbols": "80806576fa1056b43dd6d0b445b4b6f7",
"canvaskit/skwasm.wasm": "f0dfd99007f989368db17c9abeed5a49",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"canvaskit/skwasm_st.js": "d1326ceef381ad382ab492ba5d96f04d",
"canvaskit/skwasm_st.js.symbols": "c7e7aac7cd8b612defd62b43e3050bdd",
"canvaskit/skwasm_st.wasm": "56c3973560dfcbf28ce47cebe40f3206",
"favicon.png": "538af8e5abc34bf6efe5474b5e0f5ec4",
"flutter.js": "76f08d47ff9f5715220992f993002504",
"flutter_bootstrap.js": "c2622a65092bbdcb865e5f6b15feb049",
"icons/Icon-192.png": "2ca2a60366f4258e9652b259661d8427",
"icons/Icon-512.png": "538af8e5abc34bf6efe5474b5e0f5ec4",
"icons/Icon-maskable-192.png": "2ca2a60366f4258e9652b259661d8427",
"icons/Icon-maskable-512.png": "538af8e5abc34bf6efe5474b5e0f5ec4",
"index.html": "9c135a0ec5eae46581ce25f2e4f257a3",
"/": "9c135a0ec5eae46581ce25f2e4f257a3",
"main.dart.js": "f172f89815d96edb8b1083f0272c9e4b",
"manifest.json": "d79bb9808c95236a72f08ab889c9d6a5",
"splash/img/branding-1x.png": "53a17445bad70d745fbcbffa31a1cc1b",
"splash/img/branding-2x.png": "97120498a2d091b0f2a29d5124b14ce6",
"splash/img/branding-3x.png": "38a649da8ec7951bf3a35da5befd9613",
"splash/img/branding-4x.png": "940e93126a19b29ca035f9f76e64d53d",
"splash/img/branding-dark-1x.png": "53a17445bad70d745fbcbffa31a1cc1b",
"splash/img/branding-dark-2x.png": "97120498a2d091b0f2a29d5124b14ce6",
"splash/img/branding-dark-3x.png": "38a649da8ec7951bf3a35da5befd9613",
"splash/img/branding-dark-4x.png": "940e93126a19b29ca035f9f76e64d53d",
"splash/img/dark-1x.png": "a492d6f08b432a5d22fc7ec31daf01c3",
"splash/img/dark-2x.png": "7cbad03c9ec94355d2ad9b43cac08fcc",
"splash/img/dark-3x.png": "94e0f186bc05bd6b1072ab715d705e06",
"splash/img/dark-4x.png": "3cb26909e73185b4ed7dd9febe28fbe8",
"splash/img/light-1x.png": "a492d6f08b432a5d22fc7ec31daf01c3",
"splash/img/light-2x.png": "7cbad03c9ec94355d2ad9b43cac08fcc",
"splash/img/light-3x.png": "94e0f186bc05bd6b1072ab715d705e06",
"splash/img/light-4x.png": "3cb26909e73185b4ed7dd9febe28fbe8",
"version.json": "9315ada7323559b4cecf946408516a05"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
