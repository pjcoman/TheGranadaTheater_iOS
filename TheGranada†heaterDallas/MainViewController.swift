//
//  MainViewController.swift
//  TheGranadaTheaterDallas
//
//  Created by me on 12/23/14.
//  Copyright (c) 2014 me. All rights reserved.
//

import Foundation
import UIKit
import MessageUI
import MapKit
import CoreLocation
import Parse

class MainViewController: UIViewController, MFMailComposeViewControllerDelegate {
    
    
    @IBOutlet weak var settingsSwitch: UISwitch!
    
     var showObjects: NSMutableArray! = NSMutableArray()
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     //   self.view.backgroundColor = UIColor(patternImage: UIImage(named: "granadabk3.png")!)
        
        let mainScreenSize: CGSize = UIScreen.mainScreen().bounds.size
        let imageForBackground:UIImage! = self.imageResize(UIImage(named: "granadabk3.png")!, sizeChange: CGSizeMake(mainScreenSize.width, mainScreenSize.height - 64 ))
        self.view.backgroundColor = UIColor(patternImage: imageForBackground)
        
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
        
        //   Networking.getGranadaShows();
        
     //   var testObject = PFObject(className: "TestObject")
     //   testObject.addObject("Foo", forKey: "Bar")
     //   testObject.save()
        
        
        
        if Reachability.isConnectedToNetwork()  {
        
        
        let query: PFQuery = PFQuery(className: "GranadaShows")
        let now = NSDate()
        print(now)
        query.whereKey("showdate", greaterThan: now)
        
        query.findObjectsInBackgroundWithBlock { (objects: [AnyObject]?, error: NSError?) -> Void in
            
            
            
            
            
                        for showobject in objects! {
                
                                                self.showObjects.addObject(showobject)
                            
                                               
                            
                                                }
            
            PFObject.unpinAllObjects()
           
            PFObject.pinAllInBackground(objects, block: nil)
            
            PFObject.saveAllInBackground(objects, block: nil)
            
            
         //   println(objects)
            
            
        }
            
        } else {
            
            
            print("Internet not available")
            
            
            
            
        }
        
        
        
       showQuery()
        
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        let userDefaults = NSUserDefaults()
    
        var userDefaultsDictionary = ["all": userDefaults.objectForKey("all") as? NSNumber, "none": userDefaults.objectForKey("none") as? NSNumber,
            "indie": userDefaults.objectForKey("indie") as? NSNumber, "rock": userDefaults.objectForKey("rock") as? NSNumber, "country": userDefaults.objectForKey("country") as? NSNumber, "jazz": userDefaults.objectForKey("jazz") as? NSNumber, "funk": userDefaults.objectForKey("funk") as? NSNumber, "soul": userDefaults.objectForKey("soul") as? NSNumber, "alt": userDefaults.objectForKey("alt") as? NSNumber, "tribute": userDefaults.objectForKey("tribute") as? NSNumber, "movie": userDefaults.objectForKey("movie") as? NSNumber, "sports": userDefaults.objectForKey("sports") as? NSNumber, "comedy": userDefaults.objectForKey("comedy") as? NSNumber, "acoustic": userDefaults.objectForKey("acoustic") as? NSNumber, "industrial": userDefaults.objectForKey("industrial") as? NSNumber, "metal": userDefaults.objectForKey("metal") as? NSNumber]
    
        var totalLikes = 0
    
        for (_, likeSetting) in userDefaultsDictionary {
    
          //   println("Act style preference \(actStylePreference) has a like setting of \(likeSetting)")
            
            if likeSetting == 1 {
                
                    totalLikes++
    
            }
    
          //      println("\(totalLikes)")
            
            let s = userDefaultsDictionary["none"]
    
            if s != nil && s! != 1 {
    
            settingsSwitch.setOn(true, animated: true )
    
            } else {
                
            settingsSwitch.setOn(false, animated: true)
            }
            
            
            
            
        }
    

    }
    
    
    func showQuery() -> PFQuery  {
        
        showObjects.removeAllObjects()
        
        let query: PFQuery = PFQuery(className: "GranadaShows").fromLocalDatastore()
        
        let now = NSDate()
        print(now)
        query.whereKey("showdate", greaterThan: now)
        
        query.findObjectsInBackgroundWithBlock { (objects: [AnyObject]?, error: NSError?) -> Void in
            
            
            
            
            for showobject in objects! {
                
                self.showObjects.addObject(showobject)
                
                
                
                
            }
            

            
         //   PFObject.pinAllInBackground(objects, block: nil)
            
            
        //    println(objects)
            
            

            
        }
        
        
        
        return query
        

        
    }
    
    func imageResize (imageObj:UIImage, sizeChange:CGSize) -> UIImage {
        
        let hasAlpha = false
        let scale: CGFloat = 0.0
        
        UIGraphicsBeginImageContextWithOptions(sizeChange, !hasAlpha, scale)
        imageObj.drawInRect(CGRect(origin: CGPointZero, size: sizeChange))
        
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        
        return scaledImage
        
    }
    
    
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.All
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func callGranada(sender: AnyObject) {
        
       UIApplication.sharedApplication().openURL(NSURL(string:"telprompt:2148249933")!)    }
    
    
    
    @IBAction func emailGranada(sender: AnyObject) {
        
        let mailComposeViewController = configuredMailComposeViewController()
        if MFMailComposeViewController.canSendMail() {
            self.presentViewController(mailComposeViewController, animated: true, completion: nil)
        } else {
            self.showSendMailErrorAlert()
        }
    }
    
    func configuredMailComposeViewController() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self // Extremely important to set the --mailComposeDelegate-- property, NOT the --delegate-- property
        
        mailComposerVC.setToRecipients(["management@granadatheater.com"])
        mailComposerVC.setSubject("Subject...")
        mailComposerVC.setMessageBody("your message", isHTML: false)
        
        return mailComposerVC
    }
    
    func showSendMailErrorAlert() {
        let sendMailErrorAlert = UIAlertView(title: "Could Not Send Email", message: "Your device could not send e-mail.  Please check e-mail configuration and try again.", delegate: self, cancelButtonTitle: "OK")
        sendMailErrorAlert.show()
    }
    
    // MARK: MFMailComposeViewControllerDelegate Method
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        controller.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func openURL(sender: AnyObject) {
        
        
        
        UIApplication.sharedApplication().openURL(NSURL(string: "https://www.google.com/maps/dir//3524+Greenville+Ave,+Dallas,+TX+75206/@32.8284337,-96.7682162,16z/data=!4m13!1m4!3m3!1s0x864e9f6adbcaf5bf:0xf9062692386b046e!2s3524+Greenville+Ave,+Dallas,+TX+75206!3b1!4m7!1m0!1m5!1m1!1s0x864e9f6adbcaf5bf:0xf9062692386b046e!2m2!1d-96.769815!2d32.83084")!)
        
        
        
        
        
        
        
        
       
        
        
        
        
       
        
        
        
        
    }
    
    
    
    
    
}











