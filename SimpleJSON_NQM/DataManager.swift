//
//  DataManager.swift
//  SimpleJSON_NQM
//
//  Created by Nnamdi Massally on 3/4/19.
//  Copyright © 2019 Nnamdi Massally. All rights reserved.
//

import UIKit

class DataManager: NSObject {
    
    func getData() {
        
        let urlString = "https://api.myjson.com/bins/136w0u"
        
        let actualUrl = URL(string: urlString)
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: actualUrl!) { (data, response, error) in
            
            if error != nil {
                // handle the error
            }
            
            if let successfulData = data {
                print(successfulData)
            }
            
        }
        task.resume()
        
    }

}
