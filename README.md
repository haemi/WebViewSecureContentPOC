# WebViewSecureContentPOC
Repository used to open a DTS ticket. It's about where and how to handle the `hasOnlySecureContent` on a `WKWebView`.

In this example I'm using the URL of https://derstandard.at; the result is the following:

```
"==> decidePolicyForNavigationAction" false
"==> didStartProvisionalNavigation" true
"==> decidePolicyForNavigationAction" true
"==> didReceiveServerRedirectForProvisionalNavigation" true
"==> decidePolicyForNavigationAction" true
"==> didReceiveServerRedirectForProvisionalNavigation" true
"==> decidePolicyForNavigationResponse" true
"==> didCommit navigation" true
"==> decidePolicyForNavigationAction" true
"==> didFinish navigation" true
"==> decidePolicyForNavigationAction" true
"==> decidePolicyForNavigationResponse" true
```

I.e. the flag is `true` everywhere except in the very beginning in the delegate method `func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void)`. I don't know if that's expected behavior (if yes: where is the correct place to check for that flag?) or if there's a wrong implementation on the server part (which I doubt as I have the same behavior with other websites as well).
