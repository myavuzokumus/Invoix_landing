'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "ae01868a27014a9364e1bc455ce891ee",
"assets/AssetManifest.bin.json": "4303601fd275e30b0a8c87c538571871",
"assets/AssetManifest.json": "8d275265e2cac0cc05ef8bb97534b7b3",
"assets/assets/images/branding_image.png": "7c03c28917eaf8878e525da37944d8d6",
"assets/assets/images/fast_process.png": "a9e9e1be4db3076d6b7f860cc6582888",
"assets/assets/images/holding_phone.png": "89819bd5d53c0296a798f14b90b67420",
"assets/assets/images/invoix_logo.png": "538af8e5abc34bf6efe5474b5e0f5ec4",
"assets/assets/images/logo_banner2.png": "67d87e5fc032bcdfd7354d75665eff7b",
"assets/assets/images/phone_canvas.png": "041ae498a71af93fe74f9b06d201d1a6",
"assets/assets/images/play_store.png": "8f489991ed264652895eeda1ebfe4c38",
"assets/assets/images/secure_infrastructure.png": "8d6332967293c8eb0036c9b8abdca7f2",
"assets/assets/loading/InvoiceReadLoading.gif": "5e4b6217d143a9755eb7b3ddc7522e55",
"assets/assets/pages/patches.md": "16842978bf2fb2fcbb0c9d3e0da0f003",
"assets/assets/pages/privacy_policy.md": "c3debf0b56bbf9904174e256a241a821",
"assets/assets/pages/terms_of_service.md": "2900245419f8d6b09615a5581d080b86",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "74b99f0a1e9caadcad9381d412a30de0",
"assets/NOTICES": "797e19e3b1528963ebe801d411d8f08a",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "26eef3024dbc64886b7f48e1b6fb05cf",
"canvaskit/canvaskit.js.symbols": "efc2cd87d1ff6c586b7d4c7083063a40",
"canvaskit/canvaskit.wasm": "e7602c687313cfac5f495c5eac2fb324",
"canvaskit/chromium/canvaskit.js": "b7ba6d908089f706772b2007c37e6da4",
"canvaskit/chromium/canvaskit.js.symbols": "e115ddcfad5f5b98a90e389433606502",
"canvaskit/chromium/canvaskit.wasm": "ea5ab288728f7200f398f60089048b48",
"canvaskit/skwasm.js": "ac0f73826b925320a1e9b0d3fd7da61c",
"canvaskit/skwasm.js.symbols": "96263e00e3c9bd9cd878ead867c04f3c",
"canvaskit/skwasm.wasm": "828c26a0b1cc8eb1adacbdd0c5e8bcfa",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"favicon.png": "538af8e5abc34bf6efe5474b5e0f5ec4",
"flutter.js": "4b2350e14c6650ba82871f60906437ea",
"flutter_bootstrap.js": "3fe36e691985f8a7230a4c797edfb416",
"icons/Icon-192.png": "2ca2a60366f4258e9652b259661d8427",
"icons/Icon-512.png": "538af8e5abc34bf6efe5474b5e0f5ec4",
"icons/Icon-maskable-192.png": "2ca2a60366f4258e9652b259661d8427",
"icons/Icon-maskable-512.png": "538af8e5abc34bf6efe5474b5e0f5ec4",
"index.html": "7ab1dec8fb2b5489515c953f015ce8b2",
"/": "7ab1dec8fb2b5489515c953f015ce8b2",
"main.dart.js": "cc07bb1b52671c78f6401dd31c7e10c8",
"manifest.json": "d79bb9808c95236a72f08ab889c9d6a5",
"splash/img/branding-1x.png": "d037e711088d5800455a74b47f351023",
"splash/img/branding-2x.png": "4589ab23740d3493948aebcfc97094f2",
"splash/img/branding-3x.png": "bc7cb86084538434fec94a5c47d6528f",
"splash/img/branding-4x.png": "f738440769ebecc9bad50ab5cc7012ed",
"splash/img/branding-dark-1x.png": "d037e711088d5800455a74b47f351023",
"splash/img/branding-dark-2x.png": "4589ab23740d3493948aebcfc97094f2",
"splash/img/branding-dark-3x.png": "bc7cb86084538434fec94a5c47d6528f",
"splash/img/branding-dark-4x.png": "f738440769ebecc9bad50ab5cc7012ed",
"splash/img/dark-1x.png": "c0788b9fb2bc318b65bc7d17703ffd8a",
"splash/img/dark-2x.png": "b05782840b34ec505c158bfa6922beae",
"splash/img/dark-3x.png": "da126c1498c357043a9827f45bc7ff1f",
"splash/img/dark-4x.png": "2fd90652b45cc731b4e98ce0818a84be",
"splash/img/light-1x.png": "c0788b9fb2bc318b65bc7d17703ffd8a",
"splash/img/light-2x.png": "b05782840b34ec505c158bfa6922beae",
"splash/img/light-3x.png": "da126c1498c357043a9827f45bc7ff1f",
"splash/img/light-4x.png": "2fd90652b45cc731b4e98ce0818a84be",
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
