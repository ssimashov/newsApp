//
//  NetworkService.swift
//  NewsApp
//
//  Created by Sergey Simashov on 03.02.2023.
//

import Foundation

class NetworkService {
    
    //MARK: - API Key
    let apiKey : String = "9e1c4e5be4944f4286d37ec0827ed9c0"
    
    //MARK: - Configure url
    let session = URLSession.shared
    
    lazy var mySession = URLSession(configuration: configuration)
    let configuration: URLSessionConfiguration = {
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 10.0
        config.httpAdditionalHeaders = [
            "token": "someToken",
        ]
        return config
    }()
    
    private var urlConstructor: URLComponents = {
        var constructor = URLComponents()
        constructor.scheme = "https"
        constructor.host = "newsapi.org"
        return constructor
    }()
    
    //MARK: - FetchData
    func fetchData(completion: @escaping (Result<[Article], Error>) -> Void){
        
        var constructor = urlConstructor
        
        constructor.path = "/v2/top-headlines"
        constructor.queryItems = [
            URLQueryItem(name: "country", value: "us"),
            URLQueryItem(name: "apiKey", value: apiKey),
            
        ]
        
        guard let url = constructor.url else { return }
        
        let task = session.dataTask(with: url) { data, response, error in
            if let response = response as? HTTPURLResponse {
                print(response.statusCode)
            }
            guard
                error == nil,
                let data = data
            else { return }
            do {
                let result = try JSONDecoder().decode(
                    Response.self,
                    from: data)
                completion(.success(result.articles))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
