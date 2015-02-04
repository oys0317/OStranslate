//
//  ViewController.swift
//  OStranslate
//
//  Created by Younsuk Oh on 2/2/15.
//  Copyright (c) 2015 OS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
/*
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

