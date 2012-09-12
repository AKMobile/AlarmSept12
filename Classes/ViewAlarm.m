//
//  ViewAlarm.m
//  iTalkAlarm
//
//  Created by ugsw on 30/07/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewAlarm.h"


@implementation ViewAlarm
@synthesize tableViewAlarm,alarmArray,myRow,btn;
@synthesize imgView,editBtn;
@synthesize EditButton,btnDone,btnEdit;

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	UIImageView *backgroundImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg.png"]];
	
	[self.view addSubview:backgroundImage];
	[self.view sendSubviewToBack:backgroundImage];
	[backgroundImage release];	
	
	tableViewAlarm.clipsToBounds = YES;
	tableViewAlarm.layer.cornerRadius = 10;
	tableViewAlarm.backgroundColor=[UIColor clearColor];
	//tableViewAlarm.layer.borderWidth = 2.0;
	//tableViewAlarm.layer.borderColor = [UIColor blackColor].CGColor;
	//self.navigationItem.rightBarButtonItem = self.editButtonItem;
	
	btnEdit=[[UIButton alloc]initWithFrame:CGRectMake(250,5,65,32)];
	btnEdit.backgroundColor=[UIColor whiteColor];
	btnEdit.clipsToBounds = YES;
	btnEdit.layer.cornerRadius = 10;
	[btnEdit setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
	[btnEdit setTitle:@"Edit" forState:UIControlStateNormal];
	[btnEdit addTarget:self action:@selector(EditTable:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:btnEdit];
	
	alarmArray=[[NSMutableArray alloc]init];
	
	 
}


-(IBAction)btnRecord_Clicked
{
	RecordVoice *record=[[RecordVoice alloc]init];
	
	//record.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
   // [self presentModalViewController:record animated:NO];
	
	[self.navigationController pushViewController:record animated:NO];
	[record release];
}

-(IBAction)btnSetAlarm_Clicked
{
	
	SetAlarm *setAlarm=[[SetAlarm alloc]init];
	
	//setAlarm.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    //[self presentModalViewController:setAlarm animated:NO];
	[self.navigationController pushViewController:setAlarm animated:NO];
	[setAlarm release];
	
}
-(IBAction)btnSendAlarm_Clicked
{
	
	sendAlarm *send=[[sendAlarm alloc]init];
	
//	send.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
  //  [self presentModalViewController:send animated:NO];
	
	[self.navigationController pushViewController:send animated:NO];
	[send release];
}


-(IBAction)btnBack_click
{

//[self dismissModalViewControllerAnimated:YES];
	[self.navigationController popViewControllerAnimated:YES];

}
-(IBAction)Edit_Click
{


	[self btnSetAlarm_Clicked];



}
-(void)Edit
{
	[super setEditing:NO animated:NO]; 
	[tableViewAlarm setEditing:NO animated:NO];
	//[self.editBtn setTitle:@"Edit" forState:UIControlStateNormal];
	
	btnDone.hidden=YES;
	//[self.tableViewAlarm cellForRowAtIndexPath:myRow];
	//[self.tableViewAlarm reloadData];
	[self viewWillAppear:YES];
	
}
- (IBAction) EditTable:(id)sender{
	
	  //UITableViewCell *selectedCell = (UITableViewCell *) [tableViewAlarm cellForRowAtIndexPath:myRow];
	
	//imgView.hidden=YES;
	
	if(self.editing)
	{
		

		[super setEditing:NO animated:NO]; 
		[tableViewAlarm setEditing:NO animated:NO];
		//[self.editBtn setTitle:@"Edit" forState:UIControlStateNormal];
		
				
		//[self.tableViewAlarm cellForRowAtIndexPath:myRow];
		//[self.tableViewAlarm reloadData];
		[self viewWillAppear:YES];
		//[self.navigationItem.leftBarButtonItem setTitle:@"Edit"];
		//[self.navigationItem.leftBarButtonItem setStyle:UIBarButtonItemStylePlain];
	}
	else
	{
		[super setEditing:YES animated:YES]; 
		[tableViewAlarm setEditing:YES animated:YES];
		//[self.editBtn setTitle:@"Done" forState:UIControlStateNormal];
		//self.EditButton.title=@"Done";
		//btnEdit.hidden=YES;
		btnDone=[[UIButton alloc]initWithFrame:CGRectMake(250,5,65,32)];
		btnDone.backgroundColor=[UIColor whiteColor];
		btnDone.clipsToBounds = YES;
		btnDone.layer.cornerRadius = 10;
		[btnDone setTitle:@"Done" forState:UIControlStateNormal];
		[btnDone setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
		[btnDone addTarget:self action:@selector(Edit) forControlEvents:UIControlEventTouchUpInside];
		
		
		
		[self.view addSubview:btnDone];
		
		
		
		
		
		
		[self viewWillAppear:YES];
		//[self.navigationItem.leftBarButtonItem setTitle:@"Done"];
		//[self.navigationItem.leftBarButtonItem setStyle:UIBarButtonItemStyleDone];
	}
}

//- (void)deleteRowsAtIndexPaths:(NSArray *)indexPaths
//              withRowAnimation:(UITableViewRowAnimation)animation
//{
//	NSLog(@"table inside");
//}




- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   // iTalkAlarmAppDelegate *ap=[[UIApplication sharedApplication] delegate];
	NSLog(@"arrayview..%@",[SingletonClass sharedobject].arrAlarmTime);
	NSLog(@"arrayview..%@",[SingletonClass sharedobject].arrAlarmName);
	int count = [[SingletonClass sharedobject].arrAlarmName  count];
	if(self.editing) count++;
	 return count;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	return 55;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    static NSString *CellIdentifier = @"Cell";
	
	//iTalkAlarmAppDelegate *ap=[[UIApplication sharedApplication] delegate];

	
    
    UITableViewCell *cell = nil;//(UITableViewCell *)[tableViewAlarm dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
		
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];   
	
    
	//cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
 /*   
    cell.lblAlarmName.lineBreakMode = UILineBreakModeWordWrap;
    cell.lblAlarmName.numberOfLines = 0;
    cell.lblAlarmName.font = [UIFont systemFontOfSize:20];
    
    cell.lblAlarmTime.lineBreakMode = UILineBreakModeWordWrap;
    cell.lblAlarmTime.numberOfLines = 0;
    cell.lblAlarmTime.font = [UIFont systemFontOfSize:20];
    
	
	[cell.btnEdit addTarget:self action:@selector(EditTable:) forControlEvents:UIControlEventTouchUpInside];
	
	
	cell.btnEdit.tag = [indexPath row];

	
	
	//NSLog(@"array check viewName..%@",[ap.arrAlarmName objectAtIndex:indexPath.row]);
	//NSLog(@"array check viewTime..%@",ap.arrAlarmTime);
	
        
    cell.lblAlarmName.text =[[SingletonClass sharedobject].arrAlarmName objectAtIndex:indexPath.row];
    //cell.lblAlarmTime.text =[[SingletonClass sharedobject].arrAlarmTime objectAtIndex:indexPath.row];
   */
	myRow=[indexPath row];
	
	
	//int count = 0;
	//if(self.editing && indexPath.row != 0)
	//	count = 1;
	//NSString *str=[NSString stringWithFormat:@"%i,%i",indexPath.row,(indexPath.row-count)];
	//NSLog(@"str >>%@",str);
    // Set up the cell...
	if(indexPath.row == ([[SingletonClass sharedobject].arrAlarmName count]) && self.editing){
		btn.hidden=YES;

		cell.textLabel.text = @"Don't delete";
				return cell;
	}
	
	
		
	imgView=(UIImageView *)self.view;
	
	imgView=[[UIImageView alloc]initWithFrame:CGRectMake(0,0,320,55)];
	imgView.image=[UIImage imageNamed:@"listbar.png"];
	
	[cell.contentView addSubview:imgView];
	
	NSString *str;
	str=[NSString stringWithFormat:@"%@%@",[[SingletonClass sharedobject].arrAlarmName objectAtIndex:indexPath.row],[[SingletonClass sharedobject].arrAlarmTime objectAtIndex:indexPath.row]];
	
	NSLog(@"alarmArray..%@",str);
	[alarmArray addObject:str];
	cell.textLabel.backgroundColor=[UIColor clearColor];
	cell.textLabel.textColor=[UIColor greenColor];
	cell.textLabel.text = [alarmArray objectAtIndex:indexPath.row];
	NSLog(@"in or out");
	//btn = (UIButton *)self.view;
//
//	btn=[[UIButton alloc]initWithFrame:CGRectMake(220,10,70,60)];
//	btn.backgroundColor=[UIColor redColor];
//	[btn setTitle:@"edit" forState:UIControlStateNormal];
		
//	[cell.contentView addSubview:btn];
	//[btn addTarget:self action:@selector(EditTable:) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{   
	
	    
    
    
}

// The editing style for a row is the kind of button displayed to the left of the cell when in editing mode.
- (UITableViewCellEditingStyle)tableView:(UITableView *)aTableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    // No editing style if not editing or the index path is nil.
    if (self.editing == NO || !indexPath) 
			return UITableViewCellEditingStyleNone;
		//return CustomViewAlarmTableEditingStyleNone;
    // Determine the editing style based on whether the cell is a placeholder for adding content or already 
    // existing content. Existing content can be deleted.    
    //if (self.editing && indexPath.row == ([[SingletonClass sharedobject].arrAlarmName count])) {
	//	return UITableViewCellEditingStyleInsert;
	//}
 else {
		return UITableViewCellEditingStyleDelete;
	}
    return UITableViewCellEditingStyleNone;
}


// Update the data model according to edit actions delete or insert.
- (void)tableView:(UITableView *)aTableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle 
forRowAtIndexPath:(NSIndexPath *)indexPath {
	
    if (editingStyle == UITableViewCellEditingStyleDelete) {
       // [[SingletonClass sharedobject].arrAlarmName removeObjectAtIndex:indexPath.row];
		
		
		
		
		
		/*
		 
		UIApplication *app = [UIApplication sharedApplication];
		NSArray *eventArray = [app scheduledLocalNotifications];
		NSLog(@"eventArray...%@",eventArray);
		for (int i=0; i<[eventArray count]; i++)
		{
			UILocalNotification *notification = [eventArray objectAtIndex:i];
			NSDictionary *userInfoCurrent = notification.userInfo;
			NSString *uid=[NSString stringWithFormat:@"%@",[userInfoCurrent valueForKey:@"kRemindMeNotificationDataKey"]];
			NSLog(@"id...%@",uid);
			NSLog(@"info...%@",userInfoCurrent);
			if ([uid isEqualToString:[[SingletonClass sharedobject].arrAlarmName objectAtIndex:indexPath.row]])
			{
			//Cancelling local notification
				[app cancelLocalNotification:notification];
				break;
			}
		}
		*/
		
		NSMutableArray *Arr=[[NSMutableArray alloc] initWithArray:[[UIApplication sharedApplication]scheduledLocalNotifications]];
		for (int k=0;k<[Arr count];k++) 
		{
            UILocalNotification *not=[Arr objectAtIndex:k];
            NSString *DateString=[not.userInfo valueForKey:@"kRemindMeNotificationDataKey"];
			NSLog(@"DateString...%@",DateString);
			NSLog(@"arrAlarmName...%@",[SingletonClass sharedobject].arrAlarmName);

            if([DateString isEqualToString:[[SingletonClass sharedobject].arrAlarmName objectAtIndex:indexPath.row]])
			{ 
				NSLog(@"info...");
				NSLog(@"array...%@",[SingletonClass sharedobject].arrAlarmName);
				//[[SingletonClass sharedobject].arrAlarmName removeObjectAtIndex:indexPath.row];
				[alarmArray removeObjectAtIndex:indexPath.row];
				NSLog(@"arrayremove...%@",[SingletonClass sharedobject].arrAlarmName);
				imgView.image=[UIImage imageNamed:@""];
				[[UIApplication sharedApplication] cancelLocalNotification:not];
				//NSLog(@"array...%@",[[SingletonClass sharedobject].arrAlarmName objectAtIndex:indexPath.row]);
			}
		}
		[Arr release];
		//[self.tableViewAlarm cellForRowAtIndexPath:indexPath];

	}
		
			
		[tableViewAlarm reloadData];
	
    // else if (editingStyle == UITableViewCellEditingStyleInsert) {
     //   [[SingletonClass sharedobject].arrAlarmName insertObject:@"Mac Mini" atIndex:[[SingletonClass sharedobject].arrAlarmName count]];
	//	[tableViewAlarm reloadData];
    //}
}

#pragma mark Row reordering
/*
// Determine whether a given row is eligible for reordering or not.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
// Process the row move. This means updating the data model to correct the item indices.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath 
	  toIndexPath:(NSIndexPath *)toIndexPath {
	NSString *item = [[[SingletonClass sharedobject].arrAlarmName objectAtIndex:fromIndexPath.row] retain];
	[[SingletonClass sharedobject].arrAlarmName removeObject:item];
	[[SingletonClass sharedobject].arrAlarmName insertObject:item atIndex:toIndexPath.row];
	[item release];
}
*/
/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
	
}


@end
