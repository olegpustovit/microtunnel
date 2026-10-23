# Local output capture

Captured on 23 October 2026 from base revision `cd2cb6a2e9860db088990e3c964e0a18898a9734` with the copy and demo changes in this commit.

Go 1.26.6 and Node.js on Linux ARM64. The current binary forwarded a synthetic GET /demo through its actual server, WebSocket client and yamux stream. The returned body and HTTP 200 were checked; Chromium then loaded the same host through a loopback DNS mapping. No page errors occurred. The server bind address was explicitly 127.0.0.1. The browser image shows the synthetic upstream app, not a public HTTPS deployment. The CLI output reports a host, without promising that TLS exists. Go builds and go test completed, but there are no Go tests. No Cloudflare, certificate authority or public DNS was used.

Commands from the repository root:

```sh
node docs/demo/run.cjs
```

For a browser capture, set DEMO_PLAYWRIGHT_MODULE to an installed Playwright module and DEMO_CHROMIUM to its Chromium executable before running the script. The harness starts Chromium with a *.tunnel.test to 127.0.0.1 resolver mapping and blocks other browser requests. The Node-only path needs no Playwright.
