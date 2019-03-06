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
                if let jsonObj = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? NSDictionary {
                    
                    // getting the characters tag array from json and converting it to NSArray
                    if let veggieArray = jsonObj!.value(forKey:"characters") as? Array<String> {
                        self.dataArray = veggieArray
                        
                        // printing the json in onsole
                        print(jsonObj!.value(forKey: "characters")!)
                    
                    }
                }
                
            } else {
                // we had an error or the data didn't come back
                success = false
            }
            

            // call back to the completion handler that was passed in, notifying to do things (we don't care what)
                completion(success)
            
        }
        task.resume()
        
    }

}
