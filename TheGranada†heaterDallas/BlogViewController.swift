//
//  BlogViewController.swift
//  TheGranadaTheatre_swift
//
//  Created by me on 12/15/14.
//  Copyright (c) 2014 me. All rights reserved.
//

import UIKit

class BlogViewController: UIViewController  {
    
    
    @IBOutlet weak var webView: UIWebView!
    
    @IBOutlet weak var blogWebView: UIWebView!
    
    let url = "http://granadatheater.com/blog/"
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.blackColor()
        
       
        
        let requestURL = NSURL(string:url)
        let request = NSURLRequest(URL: requestURL!)
        
        blogWebView.loadRequest(request)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
    }
    
    
}
