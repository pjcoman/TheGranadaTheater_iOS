//
//  SettingsViewController.swift
//  TheGranadaTheaterDallas
//
//  Created by me on 7/12/15.
//  Copyright (c) 2015 me. All rights reserved.
//

import UIKit
import Parse


class SettingsViewController: UIViewController {
    
    
    @IBOutlet weak var allSwitch: UISwitch!
    @IBOutlet weak var noneSwitch: UISwitch!
    @IBOutlet weak var indieSwitch:   UISwitch!
    @IBOutlet weak var rockSwitch: UISwitch!
    @IBOutlet weak var countrySwitch: UISwitch!
    @IBOutlet weak var jazzSwitch: UISwitch!
    @IBOutlet weak var funkSwitch: UISwitch!
    @IBOutlet weak var soulSwitch: UISwitch!
    @IBOutlet weak var altSwitch: UISwitch!
    @IBOutlet weak var tributeSwitch: UISwitch!
    @IBOutlet weak var movieSwitch: UISwitch!
    @IBOutlet weak var sportsSwitch: UISwitch!
    @IBOutlet weak var comedySwitch: UISwitch!
    @IBOutlet weak var acousticSwitch: UISwitch!
    @IBOutlet weak var industrialSwitch: UISwitch!
    @IBOutlet weak var metalSwitch: UISwitch!
    
    
    let userDefaults = NSUserDefaults()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    
        
        // self.view.backgroundColor = UIColor(patternImage: UIImage(named: "granadarowbg.png")!)
        
        if ( userDefaults.objectForKey("all") != nil ) {
        
        let allSetting = userDefaults.objectForKey("all") as? NSNumber
        let noneSetting = userDefaults.objectForKey("none") as? NSNumber
        let indieSetting = userDefaults.objectForKey("indie") as? NSNumber
        let rockSetting = userDefaults.objectForKey("rock") as? NSNumber
        let countrySetting = userDefaults.objectForKey("country") as? NSNumber
        let jazzSetting = userDefaults.objectForKey("jazz") as? NSNumber
        let funkSetting = userDefaults.objectForKey("funk") as? NSNumber
        let soulSetting = userDefaults.objectForKey("soul") as? NSNumber
        let altSetting = userDefaults.objectForKey("alt") as? NSNumber
        let tributeSetting = userDefaults.objectForKey("tribute") as? NSNumber
        let movieSetting = userDefaults.objectForKey("movie") as? NSNumber
        let sportsSetting = userDefaults.objectForKey("sports") as? NSNumber
        let comedySetting = userDefaults.objectForKey("comedy") as? NSNumber
        let acousticSetting = userDefaults.objectForKey("acoustic") as? NSNumber
        let industrialSetting = userDefaults.objectForKey("industrial") as? NSNumber
        let metalSetting = userDefaults.objectForKey("metal") as? NSNumber
        
        allSwitch.setOn(allSetting!.boolValue, animated: false)
        noneSwitch.setOn(noneSetting!.boolValue, animated: false)
        indieSwitch.setOn(indieSetting!.boolValue, animated: false)
        rockSwitch.setOn(rockSetting!.boolValue, animated: false)
        countrySwitch.setOn(countrySetting!.boolValue, animated: false)
        jazzSwitch.setOn(jazzSetting!.boolValue, animated: false)
        funkSwitch.setOn(funkSetting!.boolValue, animated: false)
        soulSwitch.setOn(soulSetting!.boolValue, animated: false)
        altSwitch.setOn(altSetting!.boolValue, animated: false)
        tributeSwitch.setOn(tributeSetting!.boolValue, animated: false)
        movieSwitch.setOn(movieSetting!.boolValue, animated: false)
        sportsSwitch.setOn(sportsSetting!.boolValue, animated: false)
        comedySwitch.setOn(comedySetting!.boolValue, animated: false)
        acousticSwitch.setOn(acousticSetting!.boolValue, animated: false)
        industrialSwitch.setOn(industrialSetting!.boolValue, animated: false)
        metalSwitch.setOn(metalSetting!.boolValue, animated: false)
            
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func allSwitch(sender: AnyObject) {
        
        if allSwitch.on {
            noneSwitch.setOn(false, animated: true)
            indieSwitch.setOn(false, animated: true)
            rockSwitch.setOn(false, animated: true)
            countrySwitch.setOn(false, animated: true)
            jazzSwitch.setOn(false, animated: true)
            funkSwitch.setOn(false, animated: true)
            soulSwitch.setOn(false, animated: true)
            altSwitch.setOn(false, animated: true)
            tributeSwitch.setOn(false, animated: true)
            movieSwitch.setOn(false, animated: true)
            sportsSwitch.setOn(false, animated: true)
            comedySwitch.setOn(false, animated: true)
            acousticSwitch.setOn(false, animated: true)
            industrialSwitch.setOn(false, animated: true )
            metalSwitch.setOn(false, animated: true)
            
            indieSwitch.hidden = true
            rockSwitch.hidden = true
            countrySwitch.hidden = true
            jazzSwitch.hidden = true
            funkSwitch.hidden = true
            soulSwitch.hidden = true
            altSwitch.hidden = true
            tributeSwitch.hidden = true
            movieSwitch.hidden = true
            sportsSwitch.hidden = true
            comedySwitch.hidden = true
            acousticSwitch.hidden = true
            industrialSwitch.hidden = true
            metalSwitch.hidden = true
            
            
        
            
            
        }
    }
    
    
    
  
    @IBAction func noneSwitch(sender: AnyObject) {
        
        if noneSwitch.on {
            
            allSwitch.setOn(false, animated: true)
            indieSwitch.setOn(false, animated: true)
            rockSwitch.setOn(false, animated: true)
            countrySwitch.setOn(false, animated: true)
            jazzSwitch.setOn(false, animated: true)
            funkSwitch.setOn(false, animated: true)
            soulSwitch.setOn(false, animated: true)
            altSwitch.setOn(false, animated: true)
            tributeSwitch.setOn(false, animated: true)
            movieSwitch.setOn(false, animated: true)
            sportsSwitch.setOn(false, animated: true)
            comedySwitch.setOn(false, animated: true)
            acousticSwitch.setOn(false, animated: true)
            industrialSwitch.setOn(false, animated: true)
            metalSwitch.setOn(false, animated: true)
            
            indieSwitch.hidden = false
            rockSwitch.hidden = false
            countrySwitch.hidden = false
            jazzSwitch.hidden = false
            funkSwitch.hidden = false
            soulSwitch.hidden = false
            altSwitch.hidden = false
            tributeSwitch.hidden = false
            movieSwitch.hidden = false
            sportsSwitch.hidden = false
            comedySwitch.hidden = false
            acousticSwitch.hidden = false
            industrialSwitch.hidden = false
            metalSwitch.hidden = false
    }
    }
    
    
    @IBAction func indieSwitch(sender: AnyObject) {
        
        if indieSwitch.on {
            noneSwitch.setOn(false, animated: true)
            allSwitch.setOn(false, animated: true)
        
        
    }
    }
    
    
    @IBAction func rockSwitch(sender: AnyObject) {
        
        if rockSwitch.on {
            noneSwitch.setOn(false, animated: true)
            allSwitch.setOn(false, animated: true)
        }
    }
    
    
        
    @IBAction func countrySwitch(sender: AnyObject) {
        
        if countrySwitch.on {
            noneSwitch.setOn(false, animated: true)
            allSwitch.setOn(false, animated: true)
        }
    }
    
    @IBAction func jazzSwitch(sender: AnyObject) {
        
        if jazzSwitch.on {
            noneSwitch.setOn(false, animated: true)
            allSwitch.setOn(false, animated: true)
        }
    }
    
    
    
    @IBAction func funkSwitch(sender: AnyObject) {
        
        if funkSwitch.on {
            noneSwitch.setOn(false, animated: true)
            allSwitch.setOn(false, animated: true)
        }

    }
    
    
    
    @IBAction func soulSwitch(sender: AnyObject) {
        
        if soulSwitch.on {
            noneSwitch.setOn(false, animated: true)
            allSwitch.setOn(false, animated: true)
        }

    }
    
    
    
    @IBAction func altSwitch(sender: AnyObject) {
        
        if altSwitch.on {
            noneSwitch.setOn(false, animated: true)
            allSwitch.setOn(false, animated: true)
        }

    }
    
    
    
    @IBAction func tributeSwitch(sender: AnyObject) {
        
        if tributeSwitch.on {
            noneSwitch.setOn(false, animated: true)
            allSwitch.setOn(false, animated: true)
        }

    }
    
    
    @IBAction func movieSwitch(sender: AnyObject) {
        
        if movieSwitch.on {
            noneSwitch.setOn(false, animated: true)
            allSwitch.setOn(false, animated: true)
        }

    }
    
    
    
    @IBAction func sportsSwitch(sender: AnyObject) {
        
        if sportsSwitch.on {
            noneSwitch.setOn(false, animated: true)
            allSwitch.setOn(false, animated: true)
        }

    }
    
    
    
    
    @IBAction func comedySwitch(sender: AnyObject) {
        
        if comedySwitch.on {
            noneSwitch.setOn(false, animated: true)
            allSwitch.setOn(false, animated: true)
        }

    }
    
    
    
    
    @IBAction func acousticSwitch(sender: AnyObject) {
        
        if acousticSwitch.on {
            noneSwitch.setOn(false, animated: true)
            allSwitch.setOn(false, animated: true)
        }

    }
    
    
    
    @IBAction func industrialSwitch(sender: AnyObject) {
        
        if industrialSwitch.on {
            noneSwitch.setOn(false, animated: true)
            allSwitch.setOn(false, animated: true)
        }

    }
    
    
    @IBAction func metalSwitch(sender: AnyObject) {
        
        if metalSwitch.on {
            noneSwitch.setOn(false, animated: true)
            allSwitch.setOn(false, animated: true) 
        }

    }
    
    @IBAction func setChannels(sender: AnyObject) {
        
        let currentInstallation = PFInstallation.currentInstallation();
        
        if let channels: [String] = currentInstallation.channels as? [String] {
            
            let channel = channels
            print(channel)
            

            
        }
        
        let array = [String]()
        
        currentInstallation.channels = array
        
        

        currentInstallation.save()
        
        if let channels: [String] = currentInstallation.channels as? [String] {
            
            let channel = channels
            print(channel)
            
        }

        
        
        
        
        if allSwitch.on {
            
            currentInstallation.addUniqueObject("ALL", forKey: "channels")
            
        }
        
        if noneSwitch.on {
            
            currentInstallation.addUniqueObject("XXXXXX", forKey: "channels")
            
        }
        
        if indieSwitch.on {
            
            currentInstallation.addUniqueObject("INDIE", forKey: "channels")
            
        }
        
        if rockSwitch.on {
            
            currentInstallation.addUniqueObject("ROCK", forKey: "channels")
            
        }
        
        if countrySwitch.on {
            
            currentInstallation.addUniqueObject("COUNTRY", forKey: "channels")
            
        }
        
        if jazzSwitch.on {
            
            currentInstallation.addUniqueObject("JAZZ", forKey: "channels")
            
        }
        
        if funkSwitch.on {
            
            currentInstallation.addUniqueObject("FUNK", forKey: "channels")
           
        }
        
        if soulSwitch.on {
            
            currentInstallation.addUniqueObject("SOUL", forKey: "channels")
            
        }
        
        if altSwitch.on {
            
            currentInstallation.addUniqueObject("ALTERNATIVE", forKey: "channels")
            
        }
        
        if tributeSwitch.on {
            
            currentInstallation.addUniqueObject("TRIBUTE", forKey: "channels")
            
        }
        
        if movieSwitch.on {
            
            currentInstallation.addUniqueObject("MOVIE", forKey: "channels")
            
        }
        
        if sportsSwitch.on {
            
            currentInstallation.addUniqueObject("SPORTS", forKey: "channels")
            
        }
        
        if comedySwitch.on {
            
            currentInstallation.addUniqueObject("COMEDY", forKey: "channels")
            
        }
        
        if acousticSwitch.on {
            
            currentInstallation.addUniqueObject("ACOUSTIC", forKey: "channels")
           
        }
        
        if industrialSwitch.on {
            
            currentInstallation.addUniqueObject("INDUSTRIAL", forKey: "channels")
            
        }
        
        if metalSwitch.on {
            
            currentInstallation.addUniqueObject("METAL", forKey: "channels")
            
        }
        
        

    currentInstallation.save()
        
        userDefaults.setObject(NSNumber(bool: allSwitch.on), forKey: "all")
        userDefaults.setObject(NSNumber(bool: noneSwitch.on), forKey: "none")
        userDefaults.setObject(NSNumber(bool: indieSwitch.on), forKey: "indie")
        userDefaults.setObject(NSNumber(bool: rockSwitch.on), forKey: "rock")
        userDefaults.setObject(NSNumber(bool: countrySwitch.on), forKey: "country")
        userDefaults.setObject(NSNumber(bool: jazzSwitch.on), forKey: "jazz")
        userDefaults.setObject(NSNumber(bool: funkSwitch.on), forKey: "funk")
        userDefaults.setObject(NSNumber(bool: soulSwitch.on), forKey: "soul")
        userDefaults.setObject(NSNumber(bool: altSwitch.on), forKey: "alt")
        userDefaults.setObject(NSNumber(bool: tributeSwitch.on), forKey: "tribute")
        userDefaults.setObject(NSNumber(bool: movieSwitch.on), forKey: "movie")
        userDefaults.setObject(NSNumber(bool: sportsSwitch.on), forKey: "sports")
        userDefaults.setObject(NSNumber(bool: comedySwitch.on), forKey: "comedy")
        userDefaults.setObject(NSNumber(bool: acousticSwitch.on), forKey: "acoustic")
        userDefaults.setObject(NSNumber(bool: industrialSwitch.on), forKey: "industrial")
        userDefaults.setObject(NSNumber(bool: metalSwitch.on), forKey: "metal")
        
        
        
        
        self.dismissViewControllerAnimated(true, completion: {})
        
        
    
    }
    
    
    
    
    
    
    
}




