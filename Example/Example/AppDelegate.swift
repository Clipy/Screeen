//
//  AppDelegate.swift
//
//  Example
//  GitHub: https://github.com/clipy
//  HP: https://clipy-app.com
//
//  Copyright © 2015-2019 Clipy Project.
//

import Cocoa
import Screeen

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    // MARK: - Properties
    @IBOutlet weak var window: NSWindow!
    private let observer = ScreenShotObserver()

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

