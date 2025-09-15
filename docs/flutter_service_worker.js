'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {".git/COMMIT_EDITMSG": "2cb8fa1bb0d2c0534e5b30a2b2e1fdb9",
".git/config": "9a26513f41983c2971b27aab3dad4057",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/HEAD": "4a08bf04c58804c96d77b6e4f87512f2",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/fsmonitor-watchman.sample": "a0b2633a2c8e97501610bd3f73da66fc",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-commit.sample": "5029bfab85b1c39281aa9697379ea444",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/push-to-checkout.sample": "c7ab00c7784efeadad3ae9b228d4b4db",
".git/hooks/sendemail-validate.sample": "4d67df3a8d5c98cb8565c07e42be0b04",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/index": "e144640f35b3f93d3eb76b95d5029567",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "e3c06d73143096038d7273c7f3339530",
".git/logs/refs/heads/website-preview": "e3c06d73143096038d7273c7f3339530",
".git/logs/refs/remotes/origin/website-preview": "46b6a2e3ae0d85075e476e742ef53b47",
".git/objects/08/32d0db2def1613c1c45aa4fe9156a1c6b7d589": "e05df183e5eeaddf39672a2516f9c41d",
".git/objects/13/a5494ac76c4c5fb8eea45cc4945a995842e4ee": "99820d2be4aa81077acea7a5386dd2d7",
".git/objects/1a/035a46359e53ae55a8ce7e22df85c3ad34ff25": "2eb5062ff9eb52f83bb34e1595bb759d",
".git/objects/1b/ad7916905f2ce78f0974229d7d77301f7a37a1": "15b3025865f186e01ce942a07821c83a",
".git/objects/1d/8dbf4c5a1722f1335f12e64773a2b710c6a07e": "e34a5dab02334552a878b8209b301a0c",
".git/objects/23/cf232e77e2585579b84f854545981167c05c03": "f908bdfa8095577d8144105dd9ea79ee",
".git/objects/32/aa3cae58a7432051fc105cc91fca4d95d1d011": "4f8558ca16d04c4f28116d3292ae263d",
".git/objects/32/deec44af26e43743979835da9eefd2ed245e60": "50a2d2231f65b32b0e46071b77e40c71",
".git/objects/37/77d1625435ac657625e9cfc5c6535bb3d25338": "6be1eaa951ed779649bf6fd55b10d651",
".git/objects/3a/175dc8b85897336f70296f69c512825004a654": "ceae1a26e80644e0cebe41ce39afc574",
".git/objects/3a/7525f2996a1138fe67d2a0904bf5d214bfd22c": "ab6f2f6356cba61e57d5c10c2e18739d",
".git/objects/40/0d5b186c9951e294699e64671b9dde52c6f6a0": "f6bd3c7f9b239e8898bace6f9a7446b9",
".git/objects/43/bf57d897ec528ce999f6f105c393364d6922a7": "c388d3d04e0acec6f3d9048801760a97",
".git/objects/44/3aebd1160f4bb6a28d395fe5e1f83997efc527": "f8773d76dfb3ac9605691e820611779f",
".git/objects/44/a8b8e41b111fcf913a963e318b98e7f6976886": "5014fdb68f6b941b7c134a717a3a2bc6",
".git/objects/4a/f62e57bd134c3622ceeb433bbddbbeef22b5d0": "057c7ccd7b329bfbc9ce4849bdcc93c6",
".git/objects/4c/d6c10343031dfe5883b9ffe335cb81de09cf14": "61d12641520dd96acae7817088aa439f",
".git/objects/58/f06fd13a48f8e5eedf929cc4411c84366cb789": "8680cfe11e2654db03a97a8ae37207f9",
".git/objects/5e/bf37944a56f2b5e479e3858392c6e9030da2da": "d874f5ce1eb6512c7b77ebd17b676f00",
".git/objects/5f/f733d86bf457f5ec13aa1ac41211d9884625ca": "39da4b27f32db9d082ec8d9bb2f1153b",
".git/objects/62/e88dc1060d16a93c4ef0ce5ffc52add3693778": "b51f6c84956b2409ee3ed84d1e37af29",
".git/objects/64/6d682d5f4921ddd02ac2964b74ed5432461004": "f1f4dfb5e879a0e8f263f3bec1329d55",
".git/objects/6a/11a86b5bd3f14b12d17473010b5f298a9e7392": "1c9fb2b611c8a4772c8991039c0a9778",
".git/objects/6b/e909fbf40b23748412f0ea89bf0fae827ed976": "5f118419157d9534688915220cc803f7",
".git/objects/7e/3bb2f8ce7ae5b69e9f32c1481a06f16ebcfe71": "4ac6c0fcf7071bf9fc9c013172f9996f",
".git/objects/84/0516208d35dcb4298847ab835e2ef84ada92fa": "36a4a870d8d9c1c623d8e1be329049da",
".git/objects/88/cfd48dff1169879ba46840804b412fe02fefd6": "e42aaae6a4cbfbc9f6326f1fa9e3380c",
".git/objects/8a/260ada5baec322630961d7994cf7f485d7ddde": "85e9d90881f6072afb4112a052b8fbf7",
".git/objects/8a/aa46ac1ae21512746f852a42ba87e4165dfdd1": "1d8820d345e38b30de033aa4b5a23e7b",
".git/objects/90/bcfcf0a77ab618a826db0fd8b0942963b653af": "fc109675cdf1233dd6599a4c3c0a7a69",
".git/objects/98/57c9b3b0448c92818efc5fda0f206b21914168": "ecbde07c564dabbec0f249821051b8af",
".git/objects/9a/54dc82799e9ff1cd17629a503c9c084989376f": "fe1a2f7e8f9f22e6ad8f59404c6fee95",
".git/objects/9d/508ff9a47e1c84bb9b00d1df684435fb19022e": "ec61fd208abe32f9af9248adeec3b10e",
".git/objects/aa/31ec53204c46aa4c75471c55239deef75d7ec7": "790ac8d4d371a55fa1643d54de515027",
".git/objects/aa/416df4cad76432d2a819a0ee7cbd48ca529542": "bac82374c5e1669b6da019179033628c",
".git/objects/af/d57a53ef3bbe8dce2e8aac30a785e5d40508b5": "b48b5ee5b57a6243e40cde0edfb5d4c5",
".git/objects/b1/5ad935a6a00c2433c7fadad53602c1d0324365": "8f96f41fe1f2721c9e97d75caa004410",
".git/objects/b6/95083f98275cf49d018911e86b09c48b01267b": "e578eb69d29bbdf4a4ac6d323cdf2ab5",
".git/objects/b7/49bfef07473333cf1dd31e9eed89862a5d52aa": "36b4020dca303986cad10924774fb5dc",
".git/objects/b9/0efadfd3b29e71449fe720b0d503d3a71e78fc": "1e1acdc2ff3aebde051a6ce6c0c9315c",
".git/objects/b9/2a0d854da9a8f73216c4a0ef07a0f0a44e4373": "f62d1eb7f51165e2a6d2ef1921f976f3",
".git/objects/c6/5e9ee371a7b79b770569c417c8a67f85cb5526": "171bb08242295b73aca793d145b51029",
".git/objects/ca/58784bcfe029197c5c68d349781d522cda0f18": "615a88d35ed0d7448cd0fd89c41c3c31",
".git/objects/d0/23371979cf1e985205df19078051c10de0a82d": "700b71074bad7afee32068791dec7442",
".git/objects/d4/3532a2348cc9c26053ddb5802f0e5d4b8abc05": "3dad9b209346b1723bb2cc68e7e42a44",
".git/objects/d5/7caaf36f5eb72578d9a62adb1e8e14a54a3747": "237af08bc6fee1797f3d310b42ec4b5d",
".git/objects/d5/bb50b3c3bc534b51ba035a5e8495ba7af5025b": "81d30e6f235d2cd1960b1a0d917b3043",
".git/objects/d6/9c56691fbdb0b7efa65097c7cc1edac12a6d3e": "868ce37a3a78b0606713733248a2f579",
".git/objects/da/fd65422747502c19b5c74b4230282644d2169c": "d8a62caf99a372ff6c7692e143787ce3",
".git/objects/de/14d408cc6482a61a6753a54d0a053c7e41306d": "a129831925bdec446687e405c0b13a47",
".git/objects/e3/d0a64f3954b6392df7c1f8d7f18052914852ae": "53f5b403b7d12c901c8e062e7773a8a3",
".git/objects/eb/9b4d76e525556d5d89141648c724331630325d": "37c0954235cbe27c4d93e74fe9a578ef",
".git/objects/f2/04823a42f2d890f945f70d88b8e2d921c6ae26": "6b47f314ffc35cf6a1ced3208ecc857d",
".git/objects/fc/2c65d53020a69371f977cf9ade82c1c4df9cca": "987a960af0b39f1151735aa03ee6caf3",
".git/refs/heads/website-preview": "0925a492e28bf869d37cbb43366ca0aa",
".git/refs/remotes/origin/website-preview": "0925a492e28bf869d37cbb43366ca0aa",
"assets/AssetManifest.bin": "8813d9746d5852172963adce58e870b0",
"assets/AssetManifest.bin.json": "5c124d242802d3044fa77fadf1a52994",
"assets/AssetManifest.json": "0f1be2113c286100af330c0e7a27b951",
"assets/assets/images/ai_trolley/bill.jpg": "2fa8d59dd49d99a23475037febd33546",
"assets/assets/images/ai_trolley/home.jpg": "1ad1f8f39db04b08e983470bee50b66d",
"assets/assets/images/ai_trolley/trolley.jpg": "efc7631cd98ce49bde93a602e38bc5ac",
"assets/assets/images/profile.png": "d217c6a4e8c4e5ee83255616080da9bd",
"assets/assets/images/profile0.png": "d42b79c7bc6af82df8edcad4faa1aab2",
"assets/assets/images/solar_buyer_logo.png": "c4d17e0e38dc4f1687c8fb21e991d7f4",
"assets/assets/images/toolz/toolz_home1.jpg": "dac8823bf604e320d3fe1177302cfc7f",
"assets/assets/images/toolz/toolz_notifications_history.jpg": "da05271440db4aa08abae7371fbbfeeb",
"assets/assets/images/toolz/toolz_notifications_home.jpg": "613b1b7e26673d4830d58b32ee0409bc",
"assets/assets/images/toolz/toolz_whatsapp_status.jpg": "9f154c03a54b7b2950fccf7441f6d255",
"assets/FontManifest.json": "3e5f84b491d594f03c2e3039c1b75971",
"assets/fonts/MaterialIcons-Regular.otf": "edf966b722de447831d57e7a5b01a475",
"assets/fonts/Roboto-Regular.ttf": "303c6d9e16168364d3bc5b7f766cfff4",
"assets/NOTICES": "945b9804945f962190854d08b37bf0f9",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "cdfb02dea76c7baa84be0f84d2214927",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "3ca5dc7621921b901d513cc1ce23788c",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "03884bce4fbbae878004a3635a52ac65",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "66177750aff65a66cb07bb44b8c6422b",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
"canvaskit/chromium/canvaskit.js": "671c6b4f8fcc199dcc551c7bb125f239",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/skwasm.js": "694fda5704053957c2594de355805228",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "f393d3c16b631f36852323de8e583132",
"flutter_bootstrap.js": "2cafaa16c4c98b3d722cb2c41a8b40f9",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "bf7aaf771b219fe9a81c32fd0c3cbafc",
"/": "bf7aaf771b219fe9a81c32fd0c3cbafc",
"main.dart.js": "c353c68c90a7461e9ab7130dc4228195",
"manifest.json": "d8fe34f7ae4c072a77b924e01dac8a50",
"version.json": "528590cfb00fc1ca502120db4808bb64"};
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
