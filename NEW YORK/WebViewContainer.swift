//
//  WebViewContainer.swift
//  NEW YORK
//
//  Created by Maxwell Powell (student LM) on 12/19/24.
//


import SwiftUI

struct WebViewContainer: View {
    @Binding var viewState: ViewState
    @Binding var ArticleURL: String

    var body: some View {

        VStack{
            Button(action: {
                viewState = .articleList
            }, label: {
                HStack{
                    Text("<")
                    Spacer()
                }
            })
            
            SwiftUIWebView(urlString: ArticleURL)
            
            
            
        }

    }
}

#Preview {
    WebViewContainer(viewState: .constant(.articleList), ArticleURL: .constant("https://www.coolmathgames.com"))
}
