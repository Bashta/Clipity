//
//  PasteboardMonitor.swift
//  Clipity
//
//  Created by Erison Veshi on 5.9.24.
//


import SwiftUI
import AppKit

@Observable
class PasteboardMonitor {
    var clipboardHistory: [String] = []
    private let pasteboard = NSPasteboard.general
    private var lastChangeCount: Int = 0
    private let maxHistoryItems = 10
    
    init() {
        startMonitoring()
    }
    
    private func startMonitoring() {
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { [weak self] _ in
            self?.checkForPasteboardChanges()
        }
    }
    
    private func checkForPasteboardChanges() {
        guard pasteboard.changeCount != lastChangeCount else { return }
        
        lastChangeCount = pasteboard.changeCount
        
        if let newString = pasteboard.string(forType: .string) {
            if !clipboardHistory.contains(newString) {
                clipboardHistory.insert(newString, at: 0)
                if clipboardHistory.count > maxHistoryItems {
                    clipboardHistory.removeLast()
                }
            }
        }
    }
    
    func copyToPasteboard(_ string: String) {
        pasteboard.clearContents()
        pasteboard.setString(string, forType: .string)
    }
}