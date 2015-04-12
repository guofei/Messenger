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
	var statusItem = NSStatusBar.systemStatusBar().statusItemWithLength(-1)

	func applicationDidFinishLaunching(aNotification: NSNotification) {
		// Insert code here to initialize your application
		let menu = NSMenu()
		self.statusItem.title = "Messenger"
		self.statusItem.highlightMode = true
		self.statusItem.menu = menu
		
		let menuItem = NSMenuItem()
		menuItem.title = "Quit"
		menuItem.action = Selector("quit:")
		menu.addItem(menuItem)
	}

	func applicationWillTerminate(aNotification: NSNotification) {
		// Insert code here to tear down your application
	}

	@IBAction func quit(sender: NSButton) {
		NSApplication.sharedApplication().terminate(self)
	}
}

