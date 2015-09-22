//
//  ActStylePicker.swift
//  TheGranadaTheaterDallas
//
//  Created by me on 8/15/15.
//  Copyright (c) 2015 me. All rights reserved.
//

import UIKit

class ActStylePicker: UIViewController, UIPickerViewDelegate  {
    
     var showObjects: NSMutableArray! = NSMutableArray()
    
    
     var actStyles : [String] = []
    
    

     var itemSelectedSplit = [""]
     var actStyleToPass = ""
    
    
    
    @IBOutlet weak var selectStyleButton: UIButton!
    
    
    @IBOutlet weak var stylePicker: UIPickerView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        
        
        //   self.fetchAllObjectsFromBackground()
           self.fetchAllObjectsFromParse()
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    func fetchAllObjectsFromParse()  {
        
            showObjects.removeAllObjects()
            actStyles.removeAll(keepCapacity: true)
        
        
        
            let query: PFQuery = PFQuery(className: "GranadaShows").fromLocalDatastore()
        
        
        
        
        
        
            let now = NSDate()
            print(now)
            query.whereKey("showdate", greaterThan: now)
            query.orderByAscending("showdate")
        
        
        
            let objects = query.findObjects()! as! [PFObject]
        
           
        
           
        
        
        
        
        
            
            for showobject in objects {
                
                self.showObjects.addObject(showobject)
                
                let actStylesFromParse: AnyObject! = showobject.objectForKey("actstyle")
                // println(actStylesFromParse)
                
                var splitStyles = actStylesFromParse?.componentsSeparatedByString(", ")
              
                for var i = 0; i<splitStyles?.count; i++ {
                  //  println(splitStyles![i])
                    
                    actStyles.append(splitStyles![i] )
                    
                  //  println(actStyles.count)
                    
                }
                
                let styleSet = Set<String>(actStyles)
                actStyles = [String](styleSet)
                actStyles.sortInPlace() { $0 < $1 }
                
                
                
                
                
            }

            actStyles.insert("All", atIndex: 0)
            actStyles.insert("NEW", atIndex: 1)
        
          //  print(actStyles)
        
    
            
            let showcount = self.showObjects.count
            print("# of shows \(showcount)")
            
            
            
            self.actStyles[0] = self.actStyles[0] + " (" + String(showcount) + ")"
            
            print(self.actStyles[0])
            
        
            
        
            let dateMinusTwoWeeks = 2.weeks.ago
        
            print("2 weeks ago the date was \(dateMinusTwoWeeks)")
        
        
            
            
            query.whereKey("showdate", greaterThan: now)
            //     query.whereKey("createdAt", greaterThan: dateMinusTwoWeeks!)
            query.orderByDescending("createdAt").whereKey("createdAt", greaterThan: dateMinusTwoWeeks)
            
            
            let justAnnouncedCount = query.countObjects()
            
            self.actStyles[1] = self.actStyles[1] + " (" + String(justAnnouncedCount) + ")"
            
            print("\(justAnnouncedCount)")
        
        
            
            
            
            
            
            
            
            for index in 2...(self.actStyles.count - 1) {
                
                
                let query: PFQuery = PFQuery(className: "GranadaShows").fromLocalDatastore()
                
                let now = NSDate()
         //       println(now)
                query.whereKey("showdate", greaterThan: now)
                
                
                
                query.whereKey("actstyle", containsString: self.actStyles[index])
                
                let x = query.countObjects()
                
                if ( x != 0 ) {
                    
                    self.actStyles[index] = self.actStyles[index] + " (" + String(x) + ")"
                    
                    print(self.actStyles[index])
                    
                    
                    
                }
                

                
            }
            
        
        
        
        
            stylePicker.reloadAllComponents()
        
            
            
        }
    

    

    
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView!) -> Int  {
        
        return 1
        
        
    }
    
    // returns the # of rows in each component..
    func pickerView(pickerView: UIPickerView!, numberOfRowsInComponent component: Int) -> Int  {
        
        return self.actStyles.count
        
        
    }
    
    
    
    
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView
    {
        let pickerLabel = UILabel()
        
        
        
        pickerLabel.textColor = UIColor.whiteColor()
        
        pickerLabel.text = self.actStyles[row]
        
        let string = self.actStyles[row]
        
        
        let subString = (string as String).contains("(")
        
        
        if(subString) {
            
            pickerLabel.textColor = UIColor.yellowColor()
            
   
        }
        
        // pickerLabel.font = UIFont(name: pickerLabel.font.fontName, size: 15)
        pickerLabel.font = UIFont(name: "MarkerFelt-Wide", size: 30) // In this use your custom font
        pickerLabel.textAlignment = NSTextAlignment.Center
        return pickerLabel
    }
    
    
    
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        let itemSelected = self.actStyles[row]
        
   
        let subString = (itemSelected as String).contains("(")
       

        print(subString)
        
        if(subString) {
            
            itemSelectedSplit = itemSelected.componentsSeparatedByString(" ")
        actStyleToPass = itemSelectedSplit[0]
        print(itemSelectedSplit[0])
        print(actStyleToPass)
            
            selectStyleButton.enabled = true
            selectStyleButton.hidden = false
        
        

        
        } else {
            
            
            selectStyleButton.enabled = false
            selectStyleButton.hidden = true
            
            
            
            
        }
        
        
    }

    
    
    
    @IBAction func styleSelectedButton(sender: UIButton) {
        
        print(actStyleToPass)
        
       
            
            self.performSegueWithIdentifier("actStyleSelection", sender: sender)
            
            
       
            
        
            
        

        
        
    }
    
        
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        
        if (segue.identifier == "actStyleSelection")  {
            
            (segue.destinationViewController as! GranadaShowsTableView).receivedString = actStyleToPass
            
            
            
        }
        
        
        
     //   let destinationVC = segue.destinationViewController as! GranadaShowsTableView.receivedString = actStyleToPass
        
        
    // let tableVC = destinationVC.topViewController as! GranadaShowsTableView
       
        
   //     tableVC.receivedString = actStyleToPass
        
        
    }
    
    
    
    
    
}



