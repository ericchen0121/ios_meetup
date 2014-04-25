//
//  NYCTableViewCell.h
//  BrowseMeetup
//
//  Created by Eric Chen on 4/25/14.
//  Copyright (c) 2014 TAMIM Ziad. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NYCTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@end
