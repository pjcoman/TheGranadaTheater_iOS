//
//  BuyTicketsVC.swift
//  TheGranadaTheaterDallas
//
//  Created by me on 6/23/15.
//  Copyright (c) 2015 me. All rights reserved.
//

class BuyTicketsVC: UIViewController  {
    
    var showUrlID: Int = 0
    var showUrl: String = ""
    
    
    @IBOutlet weak var buyTicketsWebView: UIWebView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(showUrlID)
        print(showUrl)
        
        let requestURL = NSURL(string:showUrl)
        let request = NSURLRequest(URL: requestURL!)
        
        buyTicketsWebView.loadRequest(request)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
}