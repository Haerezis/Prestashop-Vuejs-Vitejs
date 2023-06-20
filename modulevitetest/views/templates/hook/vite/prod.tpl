<!-- CSS Vite -->
<link rel="stylesheet" href="/modules/modulevitetest/views/dist/{MODULEVITETEST_CSS_FILEPATH}">
<!-- ES6 Vite -->
<script type="module" crossorigin src="/modules/modulevitetest/views/dist/{MODULEVITETEST_JS_FILEPATH}"></script>
{literal}
<script type="module">try{import.meta.url;import("_").catch(()=>1);}catch(e){}window.__vite_is_modern_browser=true;</script>
<script type="module">!function(){if(window.__vite_is_modern_browser)return;console.warn("vite: loading legacy build because dynamic import or import.meta.url is unsupported, syntax error above should be ignored");var e=document.getElementById("modulevitetest-vite-legacy-polyfill"),n=document.createElement("script");n.src=e.src,n.onload=function(){System.import(document.getElementById('modulevitetest-vite-legacy-entry').getAttribute('data-src'))},document.body.appendChild(n)}();</script>
{/literal}
<!-- Legacy Vite -->
{literal}
<script nomodule>!function(){var e=document,t=e.createElement("script");if(!("noModule"in t)&&"onbeforeload"in t){var n=!1;e.addEventListener("beforeload",(function(e){if(e.target===t)n=!0;else if(!e.target.hasAttribute("nomodule")||!n)return;e.preventDefault()}),!0),t.type="module",t.src=".",e.head.appendChild(t),t.remove()}}();</script>
{/literal}
<script nomodule crossorigin id="modulevitetest-vite-legacy-polyfill" src="/modules/modulevitetest/views/dist/{MODULEVITETEST_POLYFILLS_LEGACY_FILEPATH}"></script>
<script nomodule crossorigin id="modulevitetest-vite-legacy-entry" data-src="/modules/modulevitetest/views/dist/{MODULEVITETEST_JS_LEGACY_FILEPATH}">System.import(document.getElementById('modulevitetest-vite-legacy-entry').getAttribute('data-src'))</script>
