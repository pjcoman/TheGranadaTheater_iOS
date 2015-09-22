//
//  CustomCell.m
//  TheGranadaTheatre
//
//  Created by me on 10/1/14.
//  Copyright (c) 2014 me. All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell
@synthesize actimageLabel;
@synthesize actnameLabel;
@synthesize showdateLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
