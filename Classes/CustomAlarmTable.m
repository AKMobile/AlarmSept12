//
//  CustomAlarmTable.m
//  iTalkAlarm
//
//  Created by ugsw on 03/08/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "CustomAlarmTable.h"


@implementation CustomAlarmTable

@synthesize lblCategoryName,lblPicked,cellImage;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
		lblCategoryName = [[[UILabel alloc]initWithFrame:CGRectMake(5,5,150,30)]autorelease];
        lblCategoryName.backgroundColor = [UIColor clearColor];
		lblCategoryName.textColor = [UIColor greenColor];
        
		
		lblPicked = [[[UILabel alloc]initWithFrame:CGRectMake(180,6,90, 25)]autorelease];
        lblPicked.backgroundColor = [UIColor clearColor];
		lblPicked.textColor = [UIColor greenColor];
		
		cellImage=[[[UIImageView alloc]initWithFrame:CGRectMake(0,0, 320,50)]autorelease];
		cellImage.image=[UIImage imageNamed:@"listbar.png"];
		
		[self.contentView addSubview:cellImage];
		[self.cellImage addSubview:lblCategoryName];
		[self.cellImage addSubview:lblPicked];
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state.
}


- (void)dealloc {
    [super dealloc];
}


@end
