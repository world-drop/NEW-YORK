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
       
        ArticlesView(viewState: $viewState)
    }
}

#Preview {
    ContentView()
}
