//
//  WebViewContainer.swift
//  CockTailAPI
//
//  Created by Joyce Wu (student LM) on 12/18/24.
//


import SwiftUI

struct WebViewContainer: View {
    
    @Binding var viewState: ViewState
    @Binding var articleURL: String
    
    var body: some View {
        VStack{
            Button(action: {
                viewState = .articleList
            }, label: {
                HStack {
                    Text("< Back")
                        .padding(.leading)
                    Spacer()
                }
            })
            
            SwiftUIWebView(urlString: articleURL)
            
        }
        
    }
}

#Preview {
    WebViewContainer(viewState: .constant(.articleList), articleURL: .constant("www.google.com"))
}
