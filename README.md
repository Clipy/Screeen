# Screeen
[![Actions Status](https://github.com/Clipy/Screeen/workflows/Xcode-Build/badge.svg)](https://github.com/Clipy/Screeen/actions)
[![Release version](https://img.shields.io/github/release/Clipy/Screeen.svg)](https://github.com/Clipy/Screeen/releases/latest)
[![License: MIT](https://img.shields.io/github/license/Clipy/Screeen.svg)](https://github.com/Clipy/Screeen/blob/master/LICENSE)

Observe user screen shot event and image in macOS.

## Example
```swift
let observer = ScreenShotObserver()
observer.delegate = self
observer.start()
```

```swift
func screenShotObserver(_ observer: ScreenShotObserver, addedItem item: NSMetadataItem) {
    print("added item == \(item)")
}

func screenShotObserver(_ observer: ScreenShotObserver, updatedItem item: NSMetadataItem) {
    print("updated item == \(item)")
}

func screenShotObserver(_ observer: ScreenShotObserver, removedItem item: NSMetadataItem) {
    print("removed item == \(item)")
}
```

Change observing status
```swift
observer.isEnabled = false // Stop observing
observer.isEnabled = true  // Restart observing
```

## Security features of macOS 10.15 or higher
Security features have been enhanced since mac10.15 Catalina, and screenshot monitoring must be granted permission. The monitoring target can be specified for each directory, and the desktop directory is specified by default.　

When call `start()` for the first time, a permission alert will be displayed and monitoring will start when allow it.

### Desktop directory monitoring (default)
```
let observer = ScreenShotObserver()
observer.start()
```

### Desktop and Picture directories monitoring
```
let desktopPath = NSSearchPathForDirectoriesInDomains(.desktopDirectory, .userDomainMask, true).first
let picturePath = NSSearchPathForDirectoriesInDomains(.picturesDirectory, .userDomainMask, true).first
let directoryPaths = [desktopPath, picturePath].compactMap { $0 }
let observer = ScreenShotObserver(searchDirectoryPaths: directoryPaths)
observer.start()
```

### Monitoring all screenshots on macOS 10.14 or earlier
```
let observer: ScreenShotObserver
if #available(macOS 10.15, *) {
    observer = ScreenShotObserver()
} else {
    observer = ScreenShotObserver(searchDirectoryPaths: [])
}
observer.start()
```

## Sandbox support
In order to monitor screen shots in a Sandbox enabled application, the user must manually select the directory to be monitored.  
[See here](./Documentation/SANDBOX.md) for more details on how to implement it.
