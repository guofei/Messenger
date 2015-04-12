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


}

