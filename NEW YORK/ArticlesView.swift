//
//  ArticlesView.swift
//  NEW YORK
//
//  Created by Maxwell Powell (student LM) on 12/19/24.
//

import SwiftUI

struct ArticlesView: View {
    @Binding var viewState: ViewState
    @State var data: FetchData=FetchData()
    @State var page: Int = 1
    var body: some View {
      
            
            ZStack {
                Image("rickandmorty")
                    .resizable()
                    .ignoresSafeArea()
                
                
                VStack{
                    ScrollView{
                        
                        ForEach(data.response.results){
                            article in
                            Button(action: {
                                NavigationLink(destination: charView(viewState: <#Binding<ViewState>#>)){
                                    charView(viewState: <#Binding<ViewState>#>)
                                }
                                
                            }, label: {
                                
                                VStack{
                                    AsyncImage(url:article.image){
                                        phase in switch phase{
                                        case.failure:Image("fnf")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 400.0, height: 200.0)
                                                .padding()
                                        case .success(let image):
                                            image
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .padding()
                                                .frame(width: 400.0, height: 200.0)
                                            
                                        default:
                                            ProgressView()
                                                .frame(width: 100.0, height: 200.0)
                                        }
                                    }
                                    Text(article.name ?? "")
                                        .font(Constants.buttonFont)
                                        .foregroundColor(.black)
                                        .padding()
                                        .background()
                                        .cornerRadius(20)
                                    
                                }
                                
                            })
                            
                            
                        }
                    }.task {
                        await data.getData()
                    }
                    Picker(selection: $page, label:
                            Text("Page number:")){
                        ForEach(0...42, id: \.self) {
                            value
                            in Text("\(value)")}
                        .onChange(of: page, perform:
                                    { newValue in
                            Task {
                                await data.getData()
                            }
                            PageChange(P: page)
                        }
                                  
                        ) }
                            .font(Constants.buttonFont)
                            .foregroundColor(.black)
                            .padding()
                            .background()
                            .cornerRadius(20)
                    
                }
            
        }
    }
}


#Preview {
    ArticlesView(viewState: .constant(.articleList))
}
