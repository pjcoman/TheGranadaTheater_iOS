//
//  AboutVC.swift
//  TheGranadaTheaterDallas
//
//  Created by me on 6/24/15.
//  Copyright (c) 2015 me. All rights reserved.
//

import UIKit

class AboutVC: UIViewController  {
    
    
   
    
    
    @IBOutlet weak var aboutWebView: UIWebView!
    
    let url = "http://granadatheater.com/about/"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.blackColor()
        aboutWebView.hidden = true
        
        
       
        
        
        
        let requestURL = NSURL(string:url)
        let request = NSURLRequest(URL: requestURL!)
        
        aboutWebView.loadRequest(request)
        
        aboutWebView.hidden = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
}