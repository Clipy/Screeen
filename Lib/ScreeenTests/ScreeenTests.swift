//
//  ScreeenTests.swift
//
//  ScreeenTests
//  GitHub: https://github.com/clipy
//  HP: https://clipy-app.com
//
//  Copyright © 2015-2020 Clipy Project.
//

import XCTest
@testable import Screeen

class ScreeenTests: XCTestCase {

    func testDefaultSearchDirectoriesIncludeCustomScreenshotLocationAndDesktop() {
        let paths = ScreenShotObserver.defaultSearchDirectoryPaths(
            screenshotLocation: "/Users/example/Pictures/Screen Captures",
            desktopDirectoryPath: "/Users/example/Desktop"
        )

        XCTAssertEqual(paths, ["/Users/example/Pictures/Screen Captures", "/Users/example/Desktop"])
    }

    func testDefaultSearchDirectoriesFallBackToDesktopWithoutCustomLocation() {
        let paths = ScreenShotObserver.defaultSearchDirectoryPaths(
            screenshotLocation: nil,
            desktopDirectoryPath: "/Users/example/Desktop"
        )

        XCTAssertEqual(paths, ["/Users/example/Desktop"])
    }

    func testDefaultSearchDirectoriesIgnoreEmptyScreenshotLocation() {
        let paths = ScreenShotObserver.defaultSearchDirectoryPaths(
            screenshotLocation: "",
            desktopDirectoryPath: "/Users/example/Desktop"
        )

        XCTAssertEqual(paths, ["/Users/example/Desktop"])
    }

    func testDefaultSearchDirectoriesExpandTildeInScreenshotLocation() {
        let paths = ScreenShotObserver.defaultSearchDirectoryPaths(
            screenshotLocation: "~/Pictures/Screen Captures",
            desktopDirectoryPath: "/Users/example/Desktop"
        )

        XCTAssertEqual(paths, [NSHomeDirectory() + "/Pictures/Screen Captures", "/Users/example/Desktop"])
    }

    func testDefaultSearchDirectoriesDoNotDuplicateDesktopAfterExpandingTilde() {
        let desktop = NSHomeDirectory() + "/Desktop"
        let paths = ScreenShotObserver.defaultSearchDirectoryPaths(
            screenshotLocation: "~/Desktop",
            desktopDirectoryPath: desktop
        )

        XCTAssertEqual(paths, [desktop])
    }

    func testDefaultSearchDirectoriesUseCustomLocationWhenDesktopIsUnavailable() {
        let paths = ScreenShotObserver.defaultSearchDirectoryPaths(
            screenshotLocation: "/Volumes/Screenshots",
            desktopDirectoryPath: nil
        )

        XCTAssertEqual(paths, ["/Volumes/Screenshots"])
    }

    func testDefaultSearchDirectoriesAreEmptyWhenNoLocationsAreAvailable() {
        let paths = ScreenShotObserver.defaultSearchDirectoryPaths(
            screenshotLocation: nil,
            desktopDirectoryPath: nil
        )

        XCTAssertTrue(paths.isEmpty)
    }

}
