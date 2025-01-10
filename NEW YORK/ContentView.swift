//
//  ContentView.swift
//  NEW YORK
//
//  Created by Maxwell Powell (student LM) on 12/18/24.
//

import SwiftUI

struct ContentView: View {
    @State var viewState:ViewState = .articleList
    @State var Page:String = "https://rickandmortyapi.com/api/character?page=1"
    @State var CharId:Int = 1
    var body: some View {
        if viewState == .articleList{
            ArticlesView(viewState: $viewState, Page: $Page, CharId: $CharId)
        }
        else {
            charView(viewState: $viewState)
        }
        
    }
}

#Preview {
    ContentView()
}
