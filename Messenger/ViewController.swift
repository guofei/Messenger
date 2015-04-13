//
//  ViewController.swift
//  Messenger
//
//  Created by kaku on 4/12/15.
//  Copyright (c) 2015 kaku. All rights reserved.
//

import Cocoa
import WebKit

class ViewController: NSViewController {
	@IBOutlet weak var messengerView: WebView! {
		didSet {
			loadWebView()
		}
	}

	private func loadWebView() {
		let url = NSURL(string: "https://www.messenger.com")
		let request = NSURLRequest(URL: url!)
		messengerView?.UIDelegate = self
		messengerView?.policyDelegate = self
		messengerView?.mainFrame.loadRequest(request)
	}

	override func viewDidLoad() {
		super.viewDidLoad()

		// Do any additional setup after loading the view.
	}

	override var representedObject: AnyObject? {
		didSet {
		// Update the view, if already loaded.
		}
	}

	override func webView(sender: WebView!, runOpenPanelForFileButtonWithResultListener resultListener: WebOpenPanelResultListener!) {
		var openPanel = NSOpenPanel()
		openPanel.beginWithCompletionHandler { (result) -> Void in
			if result == NSFileHandlingPanelOKButton {
				resultListener.chooseFilename(openPanel.URL!.path)
			}
		}
	}

	/*
	override func webView(webView: WebView!, willPerformDragDestinationAction action: WebDragDestinationAction, forDraggingInfo draggingInfo: NSDraggingInfo!) {
	}
	*/

	override func webView(sender: WebView!, createWebViewWithRequest request: NSURLRequest!) -> WebView! {
		let url = request.URL?.absoluteURL
		NSWorkspace.sharedWorkspace().openURL(url!)
		return nil
	}

	override func webView(webView: WebView!, decidePolicyForNewWindowAction actionInformation: [NSObject : AnyObject]!, request: NSURLRequest!, newFrameName frameName: String!, decisionListener listener: WebPolicyDecisionListener!) {
		let url = request.URL?.absoluteURL
		NSWorkspace.sharedWorkspace().openURL(url!)
	}
}

