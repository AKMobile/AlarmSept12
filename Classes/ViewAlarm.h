//
//  ViewAlarm.h
//  iTalkAlarm
//
//  Created by ugsw on 30/07/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RecordVoice.h"
#import "SetAlarm.h"
#import "CustomViewAlarmTable.h"


@interface ViewAlarm : UIViewController {
	
	IBOutlet UITableView *tableViewAlarm;
	IBOutlet UIButton *btnRecord;
	IBOutlet UIButton *btnSetAlarm;
	IBOutlet UIButton *btnSendAlarm;
	
	IBOutlet UIBarButtonItem *EditButton;
	UIButton *btnDone;
	UIButton *btnEdit;
	UIImageView *imgView;
	UIButton *btn;
	
	IBOutlet UIButton *editBtn;
	
	NSMutableArray *alarmArray;
	int myRow;
	
	
}

@property(nonatomic,retain)IBOutlet UITableView *tableViewAlarm;
@property(nonatomic,retain)UIButton *btn;
@property (nonatomic, retain) NSMutableArray *alarmArray;
@property (nonatomic,assign)int myRow;
@property (nonatomic,retain)UIImageView *imgView;
@property (nonatomic,retain)UIButton *editBtn;
@property (nonatomic,retain)UIBarButtonItem *EditButton;
@property(nonatomic,retain)UIButton *btnDone,*btnEdit;


-(IBAction)btnRecord_Clicked;
-(IBAction)btnSetAlarm_Clicked;
-(IBAction)btnSendAlarm_Clicked;
-(IBAction)btnBack_click;
-(IBAction)Edit_Click;
- (void) EditTable:(id)sender;
//-(void) removeFromList:(NSInteger)index;

@end
