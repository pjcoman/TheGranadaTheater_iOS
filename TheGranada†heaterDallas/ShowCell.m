//
//  ShowCell.m
//  TheGranadaTheaterDallas
//
//  Created by me on 2/12/15.
//  Copyright (c) 2015 me. All rights reserved.
//

#import "ShowCell.h"

@implementation ShowCell

@synthesize dateLabel, actImage, actNameLabel, otherActsLabel, actStyleLabel, showPriceLabel, showDescriptionLabel, detailimage, detaildate, detailname, detailothers, detailstyle, detailwherefrom, detailprice, detaildescription, dateLabel2, detailbuyticketsurl, buyTicketsButton;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}


@end
