//
//  LoadWebViewController.swift
//  newsApp
//
//  Created by Pawan Kumar on 19/11/18.
//  Copyright © 2018 Pawan Kumar. All rights reserved.
//

import UIKit
import WebKit

class LoadWebViewController: UIViewController, WKNavigationDelegate, WKUIDelegate {

    // MARK: - IB Outlets
    
    @IBOutlet var webView: WKWebView!
    
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    // // MARK: - Variables
    var urlString: String = ""
    
    // MARK: - Instance Object -
    
    class func loadWebViewControllerInstanceObject() -> LoadWebViewController {
        let loadWebViewController: LoadWebViewController = UIStoryboard.mainStoryboard().instantiateViewController(withIdentifier: Constants.ViewControllerIdentifiers.loadWebViewControllerIdentifier) as! LoadWebViewController
        return loadWebViewController
    }
    
    // MARK: - View Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        doIntitialSetup()
    }
    
    // MARK: - IB Actions
    
    @IBAction func backButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Helper Methods
    
    func doIntitialSetup() {
        webView.navigationDelegate = self
        webView.uiDelegate = self
        activityIndicator.center = view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = UIActivityIndicatorView.Style.gray
        webView.addSubview(activityIndicator)
        let url = URL(string: urlString)!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    }
    
    func showActivityIndicator(show: Bool) {
        if show {
            activityIndicator.startAnimating()
        } else {
            activityIndicator.stopAnimating()
        }
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        showActivityIndicator(show: false)
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        showActivityIndicator(show: true)
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        showActivityIndicator(show: false)
    }
}
