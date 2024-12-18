//
//  FetchData.swift
//  NewsAPI
//
//  Created by James Conybear (student LM) on 12/12/24.
//

import Foundation

struct FetchData{
    var response: Response = Response()
   mutating func getData() async{
        let URLString = "https://api.nytimes.com/svc/mostpopular/v2/viewed/1.json?api-key=M7FrbQ7kU0c94amThLxhvC3EndVwFQnm"
        
        guard let url = URL(string: URLString) else {return}
        
        let(data, _) = try! await URLSession.shared.data(from: url)
        response = try! JSONDecoder().decode(Response.self, from: data)
       
        
        let dataString = String(data: data, encoding: .utf8)
        print(dataString ?? " ")
    }
}

struct Response: Codable{
    var status: String = "AHHHHHH"
    var totalResults: Int = 0
    var articles: [Article] = []
}

struct Article: Codable{
    var title: String?
    var urlToImage: URL?
    var url: String?
}


extension Article: Identifiable{
    var id: String {title ?? ""}
}
