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
        getTranslateData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func getTranslateData() {
        
        
        
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

            println("Response: \(response)")

            var strData = NSString(data: data, encoding: NSUTF8StringEncoding)

            println("Body: \(strData)\n\n")
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
        
        
    }
 
    
}




/*
1: string clientID = "<Your ClientID>";
2: string clientSecret = "<Your Client Secret>";
3:
4: String strTranslatorAccessURI = "https://datamarket.accesscontrol.windows.net/v2/OAuth2-13";
5: String strRequestDetails = string.Format("grant_type=client_credentials&client_id={0}&client_secret={1}&scope=http://api.microsofttranslator.com", HttpUtility.UrlEncode(clientID), HttpUtility.UrlEncode(clientSecret));
6:
7: System.Net.WebRequest webRequest = System.Net.WebRequest.Create(strTranslatorAccessURI);
8: webRequest.ContentType = "application/x-www-form-urlencoded";
9: webRequest.Method = "POST";
10:
11: byte[] bytes = System.Text.Encoding.ASCII.GetBytes(strRequestDetails);
12: webRequest.ContentLength = bytes.Length;
13: using (System.IO.Stream outputStream = webRequest.GetRequestStream())
14: {
    15:     outputStream.Write(bytes, 0, bytes.Length);
    16: }
17: System.Net.WebResponse webResponse = webRequest.GetResponse();
18:
19: System.Runtime.Serialization.Json.DataContractJsonSerializer serializer = new System.Runtime.Serialization.Json.DataContractJsonSerializer(typeof(AdmAccessToken));
20: //Get deserialized object from JSON stream
21: AdmAccessToken token = (AdmAccessToken)serializer.ReadObject(webResponse.GetResponseStream());
22:
23: string headerValue = "Bearer " + token.access_token;












private let apiKey = "81741a98d5fd6db509906b1049ab2d79"

override func viewDidLoad() {
    super.viewDidLoad()
    refreshActivityIndicator.hidden = true
    getCurrentWeatherData()
    
}

func getCurrentWeatherData() -> Void {
    let baseURL = NSURL(string: "https://api.forecast.io/forecast/\(apiKey)/")
    let forecastURL = NSURL(string: "49.261192,-123.247953", relativeToURL: baseURL)
    //let weatherData = NSData(contentsOfURL: forecastURL!, options:nil, error:nil)
    let sharedSession = NSURLSession.sharedSession()
    let downloadTask: NSURLSessionDownloadTask = sharedSession.downloadTaskWithURL(forecastURL!, completionHandler: { (location: NSURL!, response: NSURLResponse!, error: NSError!) -> Void in
        
        if (error == nil) {
            let dataObject = NSData(contentsOfURL: location)
            let weatherDictionary: NSDictionary = NSJSONSerialization.JSONObjectWithData(dataObject!, options: nil, error: nil) as NSDictionary
            
            let currentWeather = Current(weatherDictionary: weatherDictionary)
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.temperatureLabel.text = "\(currentWeather.temperature)"
                self.iconView.image = currentWeather.icon!
                self.currentTimeLabel.text = "At \(currentWeather.currentTime!) it is"
                self.humidityLabel.text = "\(currentWeather.humidity)"
                self.precipitationLabel.text = "\(currentWeather.precipProbability)"
                self.summaryLabel.text = "\(currentWeather.summary)"
                
                self.refreshActivityIndicator.stopAnimating()
                self.refreshButton.hidden = false
                self.refreshActivityIndicator.hidden = true
            })
        } else {
            let errorAlert = UIAlertController(title: "Error", message: "Fail to update! :[", preferredStyle: .Alert)
            self.presentViewController(errorAlert, animated: true, completion: nil)
            let okButton = UIAlertAction(title: "OK", style: .Default, handler: nil)
            let cancelButton = UIAlertAction(title: "CANCEL", style: .Default, handler: nil)
            errorAlert.addAction(okButton)
            errorAlert.addAction(cancelButton)
            
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.refreshActivityIndicator.stopAnimating()
                self.refreshButton.hidden = false
                self.refreshActivityIndicator.hidden = true
            })
        }
    })
    downloadTask.resume()
    
}
*/

