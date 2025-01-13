//
//  ContentView.swift
//  CockTailAPI
//
//  Created by Joyce Wu (student LM) on 12/16/24.
//

import SwiftUI

struct ContentView: View {
    @State var viewState: ViewState = .articleList
    @State var cocktailName: String = ""
    
    var body: some View {
        if viewState == .articleList {
            CockTailListView(viewState: $viewState, cocktailName: $cocktailName)
        }
        else {
            WebViewContainer(viewState: $viewState, cocktailName: $cocktailName)
        }
    }
}

#Preview {
    ContentView()
}
