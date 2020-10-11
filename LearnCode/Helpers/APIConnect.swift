//
//  APIConnect.swift
//  LearnCode
//
//  Created by Trần Trọng on 10/11/20.
//  Copyright © 2020 Trần Trọng. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class APIConnect: NSObject {
    static let instance = APIConnect()
    var session = Session.default
    

    override init() {
        let config = URLSessionConfiguration.default
        session = Alamofire.Session(configuration: config)
    }
    
    
    func getHero() {
        AF.request(baseUrl + heroURL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil, interceptor: nil).response { (responseData) in
            
            guard let data = responseData.data else { return }
            
            do {
                let hero = try JSONDecoder().decode([Hero].self, from: data)
                print(hero)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    

    
}

