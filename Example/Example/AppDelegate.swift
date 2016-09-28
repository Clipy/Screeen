//
//  AppDelegate.swift
//  Example
//
//  Created by 古林俊佑 on 2016/07/11.
//  Copyright © 2016年 Shunsuke Furubayashi. All rights reserved.
//

import Cocoa
import Screeen

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    // MARK: - Properties
    @IBOutlet weak var window: NSWindow!
    fileprivate let observer = ScreenShotObserver()

    // MARK: - NSApplication Delegate
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        observer.delegate = self
    }

    func applicationWillTerminate(_ aNotification: Notification) {}

}

// MARK: - ScreenShotObserver Delegate
extension AppDelegate: ScreenShotObserverDelegate {
    func screenShotObserver(_ observer: ScreenShotObserver, addedItem item: NSMetadataItem) {
        print("added item == \(item)")
    }

    func screenShotObserver(_ observer: ScreenShotObserver, updatedItem item: NSMetadataItem) {
        print("updated item == \(item)")
    }

    func screenShotObserver(_ observer: ScreenShotObserver, removedItem item: NSMetadataItem) {
        print("removed item == \(item)")
    }
}

