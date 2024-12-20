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

    var body: some View {
        ZStack {
            Rectangle()
                .ignoresSafeArea()
                .foregroundColor(.gray)
            Rectangle()
                .rotation(.degrees(45))
                .ignoresSafeArea()
                .foregroundColor(.red)
            
            ScrollView{
                
                ForEach(data.response.results){
                    article in
                    Button(action: {
                        
                        
//                        viewState = .webView
                        
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
                        }
                        
                    })
                    
                  
                }
            }.task {
                await data.getData()
            }
        }
    }
}

#Preview {
    ArticlesView(viewState: .constant(.articleList))
}
