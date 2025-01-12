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
    @Binding var Page: Int
    @Binding var CharId: Int
    @State var page: Int = 1
    
    var body: some View {
        ScrollView{
            ForEach(data.response.results){
                
                article in
                
                if article.id == CharId{
                    
                    VStack{
                        Button(action: {
                            viewState = .articleList
                        }, label: {
                            Text("Return")
                        })
                        AsyncImage(url:article.image){
                            phase in switch phase{
                            case.failure:Image("fnf")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 400.0, height: 200.0)
                                    .padding()
                            case.success(let image):
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
                }
            }
        }.task {
            await data.getData()
        }
    }
}
#Preview {
    charView(viewState: .constant(.articleList), Page: .constant(1), CharId: .constant(11))
}
