//
//  AppDelegate.swift
//  Open iCloud Drive
//
//  Created by Gary Lai on 10/13/19.
//  Copyright © 2019 Gary Lai. All rights reserved.
//

import Cocoa
import SwiftUI

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    var statusBarItem: NSStatusItem!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        NSApp.setActivationPolicy(.prohibited)
        let statusBar = NSStatusBar.system
        statusBarItem = statusBar.statusItem(
            withLength: NSStatusItem.squareLength)
        statusBarItem.button?.title = "☁️"
        let statusBarMenu = NSMenu(title: "Cap Status Bar Menu")
        statusBarItem.menu = statusBarMenu
        statusBarMenu.addItem(
            withTitle: "Open iCloud Drive",
            action: #selector(AppDelegate.openiCloudDrive),
            keyEquivalent: "")
        statusBarMenu.addItem(NSMenuItem.separator())
        statusBarMenu.addItem(
            withTitle: "Quit",
            action: #selector(AppDelegate.quit),
            keyEquivalent: "")
    }
    
    @objc func openiCloudDrive() {
        let username = NSUserName()
        let icloudDrivePath = "/Users/" + username + "/Library/Mobile Documents/com~apple~CloudDocs"
        NSWorkspace.shared.selectFile(icloudDrivePath, inFileViewerRootedAtPath: icloudDrivePath)
    }

    @objc func quit() {
        NSApplication.shared.terminate(self)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

}



