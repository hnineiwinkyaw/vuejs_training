// /// <reference path="../../dts/declaration.d.ts" />

// (global => {
//   'use strict';

//   // Load the sw-tookbox library.
//   importScripts('/js/sw-toolbox.js');

//   // Turn on debug logging, visible in the Developer Tools' console.
//   global['toolbox'].options.debug = true;

//   // The route for the images
//   global['toolbox'].router.get('images/(.*)', global['toolbox'].cacheFirst, {
//     cache: {
//       name: 'images',
//       maxEntries: 10,
//       maxAgeSeconds: 86400 // cache for a day
//     }
//   });

//   // The route for any requests from the googleapis origin
//   global['toolbox'].router.get('/(.*)', global['toolbox'].cacheFirst, {
//     cache: {
//       name: 'lilgov-shell-content',
//       maxEntries: 10,
//       maxAgeSeconds: 86400 // cache for a day
//     },
//     // origin: /\.googleapis\.com$/,
//     // Set a timeout threshold of 2 seconds
//     networkTimeoutSeconds: 2
//   });

//   // By default, all requests that don't match our custom handler will use the toolbox.networkFirst
//   // cache strategy, and their responses will be stored in the default cache.
//   global['toolbox'].router.default = global['toolbox'].networkFirst;

//   // Boilerplate to ensure our service worker takes control of the page as soon as possible.
//   // global.addEventListener('install', event => event.waitUntil(skipWaiting()));
//   // global.addEventListener('activate', event => event.waitUntil(clients.claim()));
// })(self);
