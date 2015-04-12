//
//  AppDelegate.swift
//  Messenger
//
//  Created by kaku on 4/12/15.
//  Copyright (c) 2015 kaku. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
	func applicationDidFinishLaunching(aNotification: NSNotification) {
		// Insert code here to initialize your application
		setStatusMenu()
	}

	var statusItem = NSStatusBar.systemStatusBar().statusItemWithLength(-1)
	private func setStatusMenu() {
		let menu = NSMenu()
		let img = NSImage(named: "StatusBar")
		statusItem.image = img
		statusItem.highlightMode = true
		statusItem.menu = menu
		let quitItem = NSMenuItem()
		quitItem.title = "Quit"
		quitItem.action = Selector("quit:")
		menu.addItem(quitItem)
	}

	func applicationWillTerminate(aNotification: NSNotification) {
		// Insert code here to tear down your application
	}

	func applicationShouldHandleReopen(sender: NSApplication, hasVisibleWindows flag: Bool) -> Bool {
		if !flag {
			for window in sender.windows{
				if let w = window as? NSWindow{
					w.makeKeyAndOrderFront(self)
				}
			}
		}
		return true
	}

	func quit(sender: NSButton) {
		NSApplication.sharedApplication().terminate(self)
	}
}

