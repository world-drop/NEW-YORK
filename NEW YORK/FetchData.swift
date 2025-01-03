//
//  FetchData.swift
//  NewsAPI
//
//  Created by James Conybear (student LM) on 12/12/24.
//

import Foundation
var page:Int = 1
struct FetchData{
    
    var response: Response = Response()
    
    mutating func getData() async{
        let URLString = "https://rickandmortyapi.com/api/character?page=\(page)"
        
        guard let url = URL(string: URLString) else {return}
        
        let(data, _) = try! await URLSession.shared.data(from: url)
        response = try! JSONDecoder().decode(Response.self, from: data)
       
        
        let dataString = String(data: data, encoding: .utf8)
        print(dataString ?? " ")
    }
}

func PageChange(P:Int){
    page = P
}

struct Response: Codable{
    var results: [Article] = []
}

struct Article: Codable{
    var name: String?
    var image: URL?
    var status: String?
}



extension Article: Identifiable{
    var id: String {name ?? ""}
}
