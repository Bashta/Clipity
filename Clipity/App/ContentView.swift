//
//  ContentView.swift
//  Clipity
//
//  Created by Erison Veshi on 5.9.24.
//

import SwiftUI

struct ContentView: View {

    private var pasteboardMonitor = PasteboardMonitor()
    
    var body: some View {
        List(pasteboardMonitor.clipboardHistory, id: \.self) { item in
            Text(item)
                .lineLimit(1)
                .truncationMode(.tail)
                .onTapGesture {
                    pasteboardMonitor.copyToPasteboard(item)
                }
        }
        .frame(width: 300, height: 400)
    }
}
