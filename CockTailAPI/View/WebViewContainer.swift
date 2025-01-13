//
//  WebViewContainer.swift
//  CockTailAPI
//
//  Created by Joyce Wu (student LM) on 12/18/24.
//


import SwiftUI

struct WebViewContainer: View {
    
    @Binding var viewState: ViewState
    @Binding var cocktailName: String
    
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
            
            SwiftUIWebView(urlString: "https://www.google.com/search?q="+cocktailName + " cocktail")
            
        }
        
    }
}

#Preview {
    WebViewContainer(viewState: .constant(.articleList), cocktailName: .constant("www.google.com"))
}
