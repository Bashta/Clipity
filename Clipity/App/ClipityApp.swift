//
//  ClipityApp.swift
//  Clipity
//
//  Created by Erison Veshi on 5.9.24.
//

import SwiftUI
import AppKit

@main
struct PasteboardMonitorApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}


