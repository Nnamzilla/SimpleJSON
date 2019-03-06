//
//  DataManager.swift
//  SimpleJSON_NQM
//
//  Created by Nnamdi Massally on 3/4/19.
//  Copyright © 2019 Nnamdi Massally. All rights reserved.
//

import UIKit

class DataManager: NSObject {
    
    let urlString = "https://api.myjson.com/bins/136w0u"
    
    var dataArray = ["Unexpected item in baggage area"]
    
    func getData(completion: @escaping (_ success: Bool) -> ()) {
        var success = true
        
        let actualUrl = URL(string: urlString)
        
        let task = URLSession.shared.dataTask(with: actualUrl!) { (data, response, error) in
            
            if let _ = data, error == nil {
                // we had an arror or the data didn't come back
                if let jsonObj = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? NSDictionary {
                    
                    //getting the characters tag array from json and converting it to NSArray
                    if let veggieArray = jsonObj!.value(forKey:"characters") as? Array<String> {
                        self.dataArray = veggieArray
                        
                        //printing the json in onsole
                        print(jsonObj!.value(forKey: "characters")!)
                    
                    }
                }
                
            } else {
                success = false
                completion(success)
                return
            }
            
            
//            if let successfulData = data {
//                print(String(data: successfulData, encoding: String.Encoding.ascii))
//            }
            
            // call back to the completion handler that was passed
            completion(success)
            
        }
        task.resume()
        
    }

}
