//
//  ShowsViewControllerParse.m
//  TheGranadaTheaterDallas
//
//  Created by me on 3/6/15.
//  Copyright (c) 2015 me. All rights reserved.
//

#import "ShowsViewControllerParse.h"
#import "ShowCell.h"
#import "GranadaShow.h"
#import "Reachability.h"

#define IS_IPHONE (!IS_IPAD)
#define IS_IPAD (UI_USER_INTERFACE_IDIOM() != UIUserInterfaceIdiomPhone)

@interface ShowsViewControllerParse ()

@end

@implementation ShowsViewControllerParse
@synthesize showTableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self performSelector:@selector(retrieveFromParse)];
    
    self.showTableView.backgroundView = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"granadabk4.png"]];
}







- (void) retrieveFromParse {
    
    NSDate *now = [NSDate date];
    
    NSLog(@"Todays date is %@", now);
    
    
    Reachability *networkReachability = [Reachability reachabilityForInternetConnection];
    NetworkStatus networkStatus = [networkReachability currentReachabilityStatus];
    
    PFQuery *retrieveShowData = [PFQuery queryWithClassName:@"GranadaShows"];
    [retrieveShowData whereKey:@"showdate" greaterThan:now];
    
    if (networkStatus == NotReachable)  {
        
        NSLog(@"No Internet.");
        
        
        [retrieveShowData fromLocalDatastore];
        
        
    } else if ( networkStatus != NotReachable ) {
        
         NSLog(@"Internet is up.");
        
        
        
        
        
        PFQuery *retrieveShowData = [PFQuery queryWithClassName:@"GranadaShows"];
        [retrieveShowData whereKey:@"showdate" greaterThan:now];
        
        NSArray *showObjects = [retrieveShowData findObjects];
        
        [PFObject unpinAllInBackground:showObjects];
        
        [PFObject pinAllInBackground:showObjects];
        
        
        
    }
    
        
        
        [retrieveShowData fromLocalDatastore];
        
        
        [retrieveShowData orderByAscending:@"showdate"];
        
        
        [retrieveShowData findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
            
            
            
            
            
         //   NSLog(@"%@",objects);
            
            if (!error)  {
                showsArray = [[NSArray alloc] initWithArray:objects];
            }
            
            [showTableView reloadData];
        }];

        
        
       
        
        
   /*     [retrieveShowData orderByAscending:@"showdate"];
        
        
        [retrieveShowData findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
            
            
            
            
            
            NSLog(@"%@",objects);
            
            if (!error)  {
                showsArray = [[NSArray alloc] initWithArray:objects];
            }
            
            [showTableView reloadData];
        }];
    
    
      */
        
        
        
        
    }
        
- (IBAction)justAnnouncedFromParse:(id)sender {
    
    
    NSDate *now = [NSDate date];
    
    NSLog(@"Todays date is %@", now);
    
    
    
    PFQuery *retrieveShowData = [PFQuery queryWithClassName:@"GranadaShows"];
    [retrieveShowData whereKey:@"createdAt" lessThan:now];
    [retrieveShowData fromLocalDatastore];
    [retrieveShowData orderByDescending:@"createdAt"];
    retrieveShowData.limit = 10;
    
    
    [retrieveShowData findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        
        
        
        
        
        //   NSLog(@"%@",objects);
        
        if (!error)  {
            showsArray = [[NSArray alloc] initWithArray:objects];
        }
        
        [showTableView reloadData];
    }];
    
    
    
    
    
    
    
}

        
 /*   PFQuery *retrieveShowData = [PFQuery queryWithClassName:@"GranadaShows"];
    
    NSArray *showObjects = [retrieveShowData findObjects];
    [PFObject pinAllInBackground:showObjects];
    
    
    
    
    
    
    
    
  
    
    [retrieveShowData fromLocalDatastore];
    
    
    [retrieveShowData orderByAscending:@"showdate"];
    
    
    [retrieveShowData findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        
        
        
     
        
        NSLog(@"%@",objects);
        
        if (!error)  {
            showsArray = [[NSArray alloc] initWithArray:objects];
        }
        
        [showTableView reloadData];
    }];
    
    */



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

   
    
    // Return the number of rows in the section.
    return showsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    ShowCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    
    // Configure the cell...
    
    if (cell == nil) {
        cell = [[ShowCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    PFObject *tempObject = [showsArray objectAtIndex:indexPath.row];
    
    
    cell.dateLabel.text = [tempObject objectForKey:@"showdatestring"];
    cell.dateLabel2.text = [tempObject objectForKey:@"doors"];
    cell.actNameLabel.text = [tempObject objectForKey:@"actname"];
    cell.showPriceLabel.text = [tempObject objectForKey:@"price"];
    cell.whereFrom.text = [tempObject objectForKey:@"actfrom"];
    cell.otherActsLabel.text = [tempObject objectForKey:@"otheracts"];
    cell.actStyleLabel.text = [tempObject objectForKey:@"actstyle"];
    cell.showDescriptionLabel.text = [tempObject objectForKey:@"description"];
    cell.dateLabel2.text = [tempObject objectForKey:@"doors"];
    
    
    NSURL *imageUrl = [NSURL URLWithString:[tempObject objectForKey:@"actimage"]];
    NSData *data = [[NSData alloc] initWithContentsOfURL:imageUrl];
    UIImage *showimage = [UIImage imageWithData:data];


    
  //  PFFile *image = [tempObject objectForKey:@"actimagefile"];
  //  NSData *imagedata = [image getData];
  //  UIImage *showimage = [UIImage imageWithData:imagedata];
    
  //  UIGraphicsBeginImageContext(CGSizeMake(100,100));
  //  [showimage drawInRect: CGRectMake(0,0,100,100)];
  //  UIImage *loadimage = UIGraphicsGetImageFromCurrentImageContext();
  //  UIGraphicsEndImageContext();
    
    PFFile *image2 = [tempObject objectForKey:@"ticketsimage"];
    NSData *imagedata2 = [image2 getData];
    UIImage *ticketsimage = [UIImage imageWithData:imagedata2];
    
    cell.actImage.image = showimage;
    
    
    
    
    
    [cell.buyTicketsButton setBackgroundImage:ticketsimage forState:UIControlStateNormal];
    
    
    cell.buyTicketsButton.tag = indexPath.row;
    
    [cell.buyTicketsButton addTarget:self action:@selector(buyTickets:) forControlEvents:UIControlEventTouchUpInside];
    
 /*   if (IS_IPAD)  {
        
        cell.actNameLabel.font = [UIFont fontWithName:@"MarkerFelt-Wide" size:30];
        cell.dateLabel.font = [UIFont fontWithName:@"MarkerFelt-Wide" size:30];
        cell.dateLabel2.font = [UIFont fontWithName:@"MarkerFelt-Wide" size:30];
        cell.otherActsLabel.font = [UIFont fontWithName:@"MarkerFelt-Wide" size:30];
        cell.actStyleLabel.font = [UIFont fontWithName:@"MarkerFelt-Wide" size:30];
        cell.showPriceLabel.font = [UIFont fontWithName:@"MarkerFelt-Wide" size:30];
        cell.showDescriptionLabel.font = [UIFont fontWithName:@"MarkerFelt-Wide" size:30];
        
        
        
    }
  
  */
    
    
    
    
    
    
    return cell;
}
    


-(void)buyTickets:(id)sender {
    
    UIButton *senderButton = (UIButton *)sender;
    
    
    NSLog(@"current row=%ld",(long)senderButton.tag);
    
    PFObject *tempObject = [showsArray objectAtIndex:senderButton.tag];
    NSString *showUrl = [tempObject objectForKey:@"ticketslink"];
    
   
    
    NSLog(@"%@", showUrl);
    
    if (showUrl.length != 0)  {
        
        
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:showUrl]];
        
    }
    
    

    
   


}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
