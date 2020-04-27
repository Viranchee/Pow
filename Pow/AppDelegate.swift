//
//  AppDelegate.swift
//  Pow
//
//  Created by Viranchee L on 27/04/20.
//  Copyright © 2020 Viranchee L. All rights reserved.
//

import Cocoa
import SwiftUI
import MASShortcut

func pow(with window: NSWindow) {
  let iv = NSImageView(frame: window.contentView!.bounds)
  iv.wantsLayer = true
  iv.image = NSImage(named: "ben10")
  window.contentView?.addSubview(iv)
  iv.layer?.anchorPoint = .init(x: 0.5, y: 0.5)
  
  let animation = CABasicAnimation(keyPath: "transform.scale")
  animation.fromValue = 0.8
  animation.toValue = 12
  
  let opacityAnimation = CABasicAnimation(keyPath: "opacity")
  opacityAnimation.fromValue = 1
  opacityAnimation.toValue = 00
  
  let group = CAAnimationGroup()
  group.duration = 5
  group.timingFunction = .init(name: .easeIn)
  
  CATransaction.begin()
  CATransaction.setCompletionBlock {
    print(window)
  }
  iv.layer?.add(group, forKey: "")
  CATransaction.commit()
  
}


@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
  
  var window: NSWindow!
  var sv: MASShortcutView!
  
  func applicationDidFinishLaunching(_ aNotification: Notification) {
    let rect = NSScreen.main!.frame
    window = NSWindow(contentRect: rect, styleMask: .borderless, backing: .buffered, defer: false)
    window.backgroundColor = .clear
    window.isOpaque = false
    window.alphaValue = 1
    window.makeKeyAndOrderFront(NSApplication.shared)
    window.center()
    window.level = .statusBar

    sv = .init(frame: rect)
    let udef = UserDefaults()
    dump(udef.value(forKey: "test"))
    udef.set("F1", forKey: "test")
    sv.associatedUserDefaultsKey = "test"
    MASShortcutBinder.shared()?.bindShortcut(withDefaultsKey: "test") {
      print("I was called")
    }
    pow(with: self.window)
    
  }
   
  
}

