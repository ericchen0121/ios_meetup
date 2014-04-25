//
//  NYCTableViewCell.m
//  BrowseMeetup
//
//  Created by Eric Chen on 4/25/14.
//  Copyright (c) 2014 TAMIM Ziad. All rights reserved.
//

#import "NYCTableViewCell.h"

@implementation NYCTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
