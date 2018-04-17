//
//  APIManager.swift
//  sendMyEmail
//
//  Created by Luciano Gucciardo on 22/01/2018.
//  Copyright © 2018 Luciano Gucciardo. All rights reserved.
//

import Foundation

class APIManager {
    
    // Singleton to store shared infor
    
    static let shared = APIManager()
    
    // Endpoints ussually in enum but not now
    
    let urlUnina = "https://www.developeracademy.it/playground/hello/email.php"
    
    func sendEmail (onSuccess: @escaping(String) -> Void, onFailure: @escaping(String) -> Void, email: String) {
        
        //Configuration
        let ep = urlUnina
        let url = URL(string: ep)!
        let session = URLSession.shared
        var requestURL = URLRequest(url: url)
        requestURL.httpMethod = "POST"
        requestURL.httpBody = ("email=" + email).data(using: .utf8)
        
        // Session
        
        session.dataTask(with: requestURL) { (data, response, error) in
            guard error == nil else {
                onFailure ("Request Error!")
                return
            }
            if let message = String(data: data!, encoding: .utf8) {
                onSuccess(message)
            } else {
                onFailure("Data Error!")
            }
            }.resume()
    }
    
}


