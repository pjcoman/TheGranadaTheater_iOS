//
//  CustomCell.h
//  TheGranadaTheatre
//
//  Created by me on 10/1/14.
//  Copyright (c) 2014 me. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCell : UITableViewCell
@property (retain, nonatomic) IBOutlet UIImageView *actimageLabel;
@property (retain, nonatomic) IBOutlet UILabel *actnameLabel;
@property (retain, nonatomic) IBOutlet UILabel *showdateLabel;
@property (weak, nonatomic) IBOutlet UILabel *showdateLabel2;

@end
