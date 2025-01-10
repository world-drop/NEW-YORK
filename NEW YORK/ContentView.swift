//
//  ContentView.swift
//  NEW YORK
//
//  Created by Maxwell Powell (student LM) on 12/18/24.
//

import SwiftUI

struct ContentView: View {
    @State var viewState:ViewState = .articleList
    var body: some View {
        if viewState == .articleList{
            ArticlesView(viewState: $viewState)
        }
        else {
            charView(viewState: $viewState)
        }
        
    }
}

#Preview {
    ContentView()
}
