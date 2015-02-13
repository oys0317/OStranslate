//
//  ViewController.swift
//  OStranslate
//
//  Created by Younsuk Oh on 2/2/15.
//  Copyright (c) 2015 OS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var authToken:String = "Bearer "
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getAccessToken()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func getAccessToken() {
        
        let clientID = "493812bd-af10-46d9-9b1f-ea1528018dc8"
        let clientSecret = "HN85XwPAgYe804BYL60VmDec53GnHFwAn4r4O%2B4M0Y4%3D"
        //let clientSecret = "HN85XwPAgYe804BYL60VmDec53GnHFwAn4r4O+4M0Y4="
        let baseURL = NSURL(string: "https://datamarket.accesscontrol.windows.net/v2/OAuth2-13")
        let postString = "grant_type=client_credentials&client_id=\(clientID)&client_secret=\(clientSecret)&scope=http://api.microsofttranslator.com"
        var request = NSMutableURLRequest(URL: baseURL!)
        var session = NSURLSession.sharedSession()
        
        request.HTTPMethod = "POST"
        var err: NSError?
        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)
        var task = session.dataTaskWithRequest(request, completionHandler: {data, response, error -> Void in

            var strData = NSString(data: data, encoding: NSUTF8StringEncoding)
            var err: NSError?
            var json = NSJSONSerialization.JSONObjectWithData(data, options: .MutableLeaves, error: &err) as NSDictionary

            if((err) != nil) {
                println(err!.localizedDescription)
            }
            else {
                let accessToken = json["access_token"]! as String
                self.authToken += accessToken
                println(self.authToken)
                dispatch_async(dispatch_get_main_queue(), {
                    //self.loginStatusLB.text=self.responseMsg
                })
            }
        })
        task.resume()
        sleep(1)
        getTranslateData()
    }
    
    func getTranslateData() {
        
        var text = NSString(format: "hello")
        var from = "en"
        var to = "ko"
        var uri = NSURL(string: "http://api.microsofttranslator.com/v2/Http.svc/Translate?text=\(text)&from=\(from)&to=\(to)")
        
        let webRequest = NSMutableURLRequest(URL: uri!)
        webRequest.HTTPMethod = "GET"
        webRequest.setValue(self.authToken, forHTTPHeaderField: "Authorization")
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(webRequest) {(data, response, error) in
            var translation = ""
            if let xmlString = NSString(data: data, encoding: NSUTF8StringEncoding) {
                translation = xmlString.stringByReplacingOccurrencesOfString("<string xmlns=\"http://schemas.microsoft.com/2003/10/Serialization/\">", withString: "")
                translation = translation.stringByReplacingOccurrencesOfString("</string>", withString: "")
            }
            println(translation)
        }
        task.resume()
    
    }
 
    
}


