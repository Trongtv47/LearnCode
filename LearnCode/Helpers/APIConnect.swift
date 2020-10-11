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
    
    typealias herroCallBack = (_ herro:[Hero]?, _ status: Bool, _ message:String) -> Void
    
    var callBack:herroCallBack?

    override init() {
        let config = URLSessionConfiguration.default
        session = Alamofire.Session(configuration: config)
    }
    
    
    func getHero() {
        AF.request(baseUrl + heroURL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil, interceptor: nil).response { (responseData) in
            
            guard let data = responseData.data else {
                self.callBack?(nil, false, "")
                return
                
            }
            
            do {
                let hero = try JSONDecoder().decode([Hero].self, from: data)
                self.callBack?(hero, true,"")
            } catch {
                print(error.localizedDescription)
                 self.callBack?(nil, false, error.localizedDescription)
            }
        }
    }
    
    func completionHandler(callBack: @escaping herroCallBack) {
          self.callBack = callBack
      }
    
}

