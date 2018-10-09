declare var describe: any;
declare var it: any;
declare var expect: any;
declare var beforeEach: any;
declare var baseUrl: string;
declare var require: any;
declare var $: any;
declare var shared: any;
declare var __webpack_public_path__: string;
declare var toolbox: any;
declare var addthis: any;
declare var addthis_share: any;
// declare var import: any;
// declare var fetch: any;

declare module 'jquery' { var m: any; export = m; }
declare module 'bootstrap' { var m: any; export = m; }
declare module 'swiper' { var m: any; export = m; }
declare module 'underscore' { var m: any; export = m; }
declare module 'shared' { var m: any; export = m; }
declare module 'dropzone' { var m: any; export = m; }
declare module 'import' { var m: any; export = m; }

declare function importScripts(...urls: string[]): void;
