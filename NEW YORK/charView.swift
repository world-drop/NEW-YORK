//
//  charView.swift
//  NEW YORK
//
//  Created by James Conybear (student LM) on 1/9/25.
//

import SwiftUI

struct charView: View {
    @Binding var viewState: ViewState
    @State var data: FetchData=FetchData()
    
    
    var body: some View {
        ForEach(data.response.results){
            article in
            
        }
    Text("penis")
        

        
        
    
    }
}

#Preview {
    charView(viewState: .constant(.articleList))
}
