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

    @IBOutlet weak var window: NSWindow!
    private let observer = ScreenShotObserver()


    func applicationDidFinishLaunching(aNotification: NSNotification) {
        observer.delegate = self
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }


}

extension AppDelegate: ScreenShotObserverDelegate {
    func screenShotObserver(observer: ScreenShotObserver, addedItem item: NSMetadataItem) {
        print("added item == \(item)")
    }

    func screenShotObserver(observer: ScreenShotObserver, updatedItem item: NSMetadataItem) {
        print("updated item == \(item)")
    }

    func screenShotObserver(observer: ScreenShotObserver, removedItem item: NSMetadataItem) {
        print("removed item == \(item)")
    }
}

