//
//  ApiService.swift
//  recruitment-tests-ahmed-chebbi
//
//  Created by Chebbi on 11/07/2021.
//


import Foundation

open class ApiService {
    
    enum Constants: String {
        case headerContentType = "Content-Type"
        case contentTypeJson = "application/json"
    }
    
    enum RequestType {
        case get
        case post
    }
    
    enum ContentType {
        case json
    }
    
    enum Path{
        enum BaseUrl : String {
            case path = "https://henri-potier.techx.fr/"
            case books = "books"
            case commercialOffers = "commercialOffers"
        }
    }
    
}

// MARK: - Private method
extension ApiService {
    func configureRequest(url: URL,data: Data? = nil, requestType: RequestType,contentType: ContentType? = nil) -> URLRequest? {
        var request = URLRequest(url: url)
        
        switch requestType {
        case .get:
            request.httpMethod = "GET"
        case .post:
            request.httpMethod = "POST"
        }
        
        request.setValue(Constants.contentTypeJson.rawValue, forHTTPHeaderField: Constants.headerContentType.rawValue)
        
        if let data = data {
            request.httpBody = data
        }
        return request
    }
    
    func loadData<T: Codable>(object: T.Type ,path: String,completion: @escaping ( (Bool, T?) -> Void )) {
        if let request = self.configureRequest(url: URL(string: path)!, requestType: .get) {
            let task = URLSession.shared.dataTask(with: request) { data, response , error in
                if let httpResponse = response as? HTTPURLResponse {
                    let decoder = JSONDecoder()
                    guard let data = data, (httpResponse.statusCode == 200), let response = try? decoder.decode(T.self, from: data) else {
                        completion(false,nil)
                        return
                    }
                    completion(true,response)

                } else {
                    completion(false,nil)
                }
            }
            task.resume()
        }
    }
 
}
