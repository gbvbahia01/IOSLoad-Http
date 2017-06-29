//
//  ViewController.swift
//  LoadContent
//
//  Created by Guilherme B V Bahia on 29/06/17.
//  Copyright © 2017 Planet Bang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   
   @IBOutlet weak var label: UILabel!
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      if let url = URL(string: "https://www.stackoverflow.com") {
         let request = NSMutableURLRequest(url: url);
         let task = URLSession.shared.dataTask(with: request as URLRequest) {
            data, response, error in
            if error != nil {
               print(error)
            } else {
               if let unrappedData = data {
                  let dataString = NSString(data: unrappedData, encoding: String.Encoding.utf8.rawValue)
                  print(dataString)
                  DispatchQueue.main.sync {
                     self.label.text = "http://www.stackoverflow.com"
                  }
               }
            }
         }
         task.resume()
      }
      
   }

   override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
   }


}

