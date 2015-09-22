//
//  DetailViewController.m
//  TheGranada†heaterDallas
//
//  Created by me on 12/23/14.
//  Copyright (c) 2014 me. All rights reserved.
//

#import "DetailViewController.h"
#define IS_IPHONE (!IS_IPAD)
#define IS_IPAD (UI_USER_INTERFACE_IDIOM() != UIUserInterfaceIdiomPhone)

@interface DetailViewController ()

@end

@implementation DetailViewController

@synthesize dateLabel, actImage, actNameLabel, otherActsLabel, actStyleLabel, showPriceLabel, showDescriptionLabel, detailimage, detaildate, detailname, detailothers, detailstyle, detailprice, detaildescription, dateLabel2, detailbuyticketsurl, buyTicketsButton;




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSArray *datesplit =[detaildate componentsSeparatedByString:@"Doors:"];
    
    NSString* detailtime = [NSString stringWithFormat:@"Doors at%@", datesplit[1]];
    
    actNameLabel.text = detailname;
    dateLabel.text = datesplit[0];
    dateLabel2.text = detailtime;
    
    otherActsLabel.text = detailothers;
    actStyleLabel.text = detailstyle;
    showPriceLabel.text = detailprice;
    showDescriptionLabel.text = detaildescription;
    actImage.image = detailimage;
    
    if (IS_IPAD)  {
        
        actNameLabel.font = [UIFont fontWithName:@"MarkerFelt-Wide" size:50  ];
        dateLabel.font = [UIFont fontWithName:@"MarkerFelt-Wide" size:30];
        dateLabel2.font = [UIFont fontWithName:@"MarkerFelt-Wide" size:30];
        otherActsLabel.font = [UIFont fontWithName:@"MarkerFelt-Wide" size:30];
        actStyleLabel.font = [UIFont fontWithName:@"MarkerFelt-Wide" size:30];
        showPriceLabel.font = [UIFont fontWithName:@"MarkerFelt-Wide" size:30];
        showDescriptionLabel.font = [UIFont fontWithName:@"MarkerFelt-Wide" size:30];
       
            
            
            
     

        
        
        
    }

    
    
    
 //   NSLog(@"%@", actNameLabel.text);
 //   NSLog(@"%@", dateLabel.text);
 //   NSLog(@"%@", dateLabel2.text);
 //   NSLog(@"%@", otherActsLabel);
 //   NSLog(@"%@", actStyleLabel);
 //   NSLog(@"%@", showPriceLabel.text);
 //   NSLog(@"%@", showDescriptionLabel);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)buyTickets:(id)sender {
    
    if (detailbuyticketsurl.length != 0)  {
    
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:detailbuyticketsurl]];
        
    }
    

    


}



@end
