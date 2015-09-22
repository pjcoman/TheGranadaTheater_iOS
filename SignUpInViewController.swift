//
//  SignUpInViewController.swift
//  TheGranadaTheaterDallas
//
//  Created by me on 7/12/15.
//  Copyright (c) 2015 me. All rights reserved.
//

import UIKit

class SignUpInViewController: UIViewController {
    

    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    @IBOutlet weak var message: UILabel!
    
    @IBOutlet weak var emailAddress: UITextField!

    @IBOutlet weak var password: UITextField!
    
    
    
    @IBAction func signUp(sender: AnyObject) {
        
        let alertController = UIAlertController(title: "Agree to terms and conditions", message: "Click I AGREE to signal that you agree to the End User Licence Agreement", preferredStyle: UIAlertControllerStyle.Alert)
        
        alertController.addAction(UIAlertAction(title: "I AGREE", style: UIAlertActionStyle.Default, handler: { alertController in self.processSignUp()}))
        
        alertController.addAction(UIAlertAction(title: "I do NOT agree", style: UIAlertActionStyle.Default, handler: nil))
        
        
        self.presentViewController(alertController, animated: true, completion: nil)
        
        
    }
    
    func processSignUp() {
        
        
        var userEmailAddress = emailAddress.text
        var userPassword = password.text
        
        userEmailAddress = userEmailAddress.lowercaseString
        
        activityIndicator.hidden = false
        activityIndicator.startAnimating()
        
        var user = PFUser()
        user.username = userEmailAddress
        user.password = userPassword
        user.email = userEmailAddress
        
        user.signUpInBackgroundWithBlock {
            (succeeded: Bool, error: NSError?) -> Void in
            
            if error == nil {
                dispatch_async(dispatch_get_main_queue()) {
                    self.performSegueWithIdentifier("signInToNavigation", sender: self)
                }
            } else {
                self.activityIndicator.stopAnimating()
                if let message: AnyObject = error!.userInfo!["error"] {
                    self.message.text = "\(message)"
                }
                
            }
        }
        
        
        
        
    }
    
    
    
    @IBAction func signIn(sender: AnyObject) {
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        activityIndicator.hidden = true
        activityIndicator.hidesWhenStopped = true
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
