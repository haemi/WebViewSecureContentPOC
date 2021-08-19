//
//  ViewController.swift
//  WebViewSecureContentPOC
//
//  Created by Stefan Walkner on 19.08.21.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()

        webView.navigationDelegate = self
        webView.load(URLRequest(url: URL(string: "https://derstandard.at")!))
    }
}

extension ViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        debugPrint("==> decidePolicyForNavigationAction", webView.hasOnlySecureContent)
        decisionHandler(.allow)
    }

    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        debugPrint("==> decidePolicyForNavigationResponse", webView.hasOnlySecureContent)
        decisionHandler(.allow)
    }

    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        debugPrint("==> didStartProvisionalNavigation", webView.hasOnlySecureContent)
    }

    func webView(_ webView: WKWebView, didReceiveServerRedirectForProvisionalNavigation navigation: WKNavigation!) {
        debugPrint("==> didReceiveServerRedirectForProvisionalNavigation", webView.hasOnlySecureContent)
    }

    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        debugPrint("==> didFailProvisionalNavigation", webView.hasOnlySecureContent)
    }

    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        debugPrint("==> didCommit navigation", webView.hasOnlySecureContent)
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        debugPrint("==> didFinish navigation", webView.hasOnlySecureContent)
    }

    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        debugPrint("==> didFail navigation", webView.hasOnlySecureContent)
    }

    func webViewWebContentProcessDidTerminate(_ webView: WKWebView) {
        debugPrint("==> webViewWebContentProcessDidTerminate", webView.hasOnlySecureContent)
    }

    func webView(_ webView: WKWebView, navigationAction: WKNavigationAction, didBecome download: WKDownload) {
        debugPrint("==> navigationAction: WKNavigationAction, didBecome", webView.hasOnlySecureContent)
    }

    func webView(_ webView: WKWebView, navigationResponse: WKNavigationResponse, didBecome download: WKDownload) {
        debugPrint("==> navigationResponse: WKNavigationResponse, didBecome", webView.hasOnlySecureContent)
    }
}
