//
//  SetAlarm.m
//  iTalkAlarm
//
//  Created by ugsw on 30/07/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "SetAlarm.h"
#import "AlarmRepeat.h"


@implementation SetAlarm
@synthesize tableView,arrayAlarm,dateTimePicker;
@synthesize scheduleControl;

#pragma mark - View Life Cycle
- (void)viewWillAppear:(BOOL)animated {
	[self.tableView reloadData];
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	tableView.clipsToBounds = YES;
	tableView.layer.cornerRadius = 10;

	tableView.layer.borderWidth = 2.0;
	tableView.layer.borderColor = [UIColor blackColor].CGColor;
	
	arrayAlarm=[[NSMutableArray alloc]init];
	[arrayAlarm addObject:@"Repeat"];
	[arrayAlarm addObject:@"Sound"];
	[arrayAlarm addObject:@"Label"];
	
	dateTimePicker.date=[NSDate date];
	scheduleControl.hidden=YES;
	
	//[SingletonClass sharedobject].arrAlarmName=[[NSMutableArray alloc]init];
	[SingletonClass sharedobject].arrAlarmTime=[[NSMutableArray alloc]init];
	
	
	UIImageView *backgroundImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg.png"]];
	
	[self.view addSubview:backgroundImage];
	[self.view sendSubviewToBack:backgroundImage];
	[backgroundImage release];
}


- (void)presentMessage:(NSString *)message {
	UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Alarm Clock" message:message delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil];
	[alert show];
	[alert release];
}

- (void)addNewNotification {
	UILocalNotification* localNotification = [[UILocalNotification alloc] init];               
	localNotification.alertBody =@"HI";
	localNotification.fireDate = [[NSDate date] dateByAddingTimeInterval:5*60];
	localNotification.timeZone = [NSTimeZone localTimeZone];
	localNotification.applicationIconBadgeNumber = localNotification.applicationIconBadgeNumber+1;
	
	if([SingletonClass sharedobject].intrecord==1)
	{
		//AVAudioPlayer * avPlayer = [[AVAudioPlayer alloc] initWithData:ap.audio error:nil];
		//[avPlayer prepareToPlay];
		//[avPlayer play];
		
		//ap.intrecord=2;
	}
	else {
//		localNotification.soundName = [SingletonClass sharedobject].strAlarmSound;
        localNotification.soundName = [NSString stringWithFormat:@"../Documents/%@",[SingletonClass sharedobject].strRecordPath];
	}
	
	[[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
	[localNotification release];
}

- (void)showReminder:(NSString *)text {
	RecordVoice *voice=[[RecordVoice alloc]init];
//	NSLog(@"intsound..%d",[SingletonClass sharedobject].intsound);
		if([SingletonClass sharedobject].intsound==1)
		{
		
		[voice listenRecord];
		}
		if([SingletonClass sharedobject].intsound==2)
		{
			//RecordVoice *voice=[[RecordVoice alloc]init];
			[voice listenRecord];
		}
		if([SingletonClass sharedobject].intsound==3)
		{
		//RecordVoice *voice=[[RecordVoice alloc]init];
            [voice listenRecord];
		}
		if([SingletonClass sharedobject].intsound==4)
		{
		//RecordVoice *voice=[[RecordVoice alloc]init];
		[voice listenRecord];
		
		}
		if([SingletonClass sharedobject].intsound==5)
		{
		//RecordVoice *voice=[[RecordVoice alloc]init];
		[voice listenRecord];
		
		}
	
//	NSLog(@"alert text>>%@",text);
	UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Reminder" 
														message:text delegate:self
											  cancelButtonTitle:@"Ok"
											  otherButtonTitles:@"Snooze",nil];
	[alertView show];
	
	[alertView release];
	[voice release];
}

#pragma mark - UIAlertViewDelegate
-(void)alertView:(UIAlertView*)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *title = [alertView buttonTitleAtIndex:buttonIndex]; 
//	NSLog(@"alert titledelegate..>>%@",title);
	if(buttonIndex == 0)  
	{  
		[[UIApplication sharedApplication] cancelAllLocalNotifications];
//		NSLog(@"Button 1 was selected.");  
	}  
	else if([title isEqualToString:@"Snooze"])  
	{  
		[self addNewNotification];
	}
}


-(void)scheduleLocalNotificationWithDate:(NSDate *)fireDate
{
	if([[SingletonClass sharedobject].strAlarmTitle isEqualToString:@""]||[SingletonClass sharedobject].strAlarmTitle==nil)
	{
		NSLog(@"in if");
		[SingletonClass sharedobject].strAlarmTitle=@"Alarm";
		[[SingletonClass sharedobject].arrAlarmName addObject:[SingletonClass sharedobject].strAlarmTitle];
		NSLog(@"in if...%@",[SingletonClass sharedobject].arrAlarmName);
	}
	else {
		NSLog(@"in else");
		[[SingletonClass sharedobject].arrAlarmName addObject:[SingletonClass sharedobject].strAlarmTitle];
	}
	
	Class cls = NSClassFromString(@"UILocalNotification");
	if (cls != nil) {
        UILocalNotification *notification =[[cls alloc] init];
        notification.fireDate=fireDate;
        notification.alertBody=[SingletonClass sharedobject].strAlarmTitle;
        notification.timeZone = [NSTimeZone defaultTimeZone];
        //notification.repeatInterval    = 0;
        notification.alertAction = @"Show me";
        //notification.applicationIconBadgeNumber = 0;
//		notification.soundName=[SingletonClass sharedobject].strAlarmSound;
        NSString *pathOfVoice = [NSString stringWithFormat:@"../Documents/%@",[SingletonClass sharedobject].strRecordPath];
        notification.soundName = pathOfVoice;

/*	if([[SingletonClass sharedobject].strAlarmTitle isEqualToString:@""]||[SingletonClass sharedobject].strAlarmTitle==nil)
	{
		NSLog(@"in if");
		[SingletonClass sharedobject].strAlarmTitle=@"Alarm";
		[[SingletonClass sharedobject].arrAlarmName addObject:[SingletonClass sharedobject].strAlarmTitle];
		NSLog(@"in if...%@",[SingletonClass sharedobject].arrAlarmName);
	}
	else {
		NSLog(@"in else");
		[[SingletonClass sharedobject].arrAlarmName addObject:[SingletonClass sharedobject].strAlarmTitle];
	}
 */
	
	[[SingletonClass sharedobject].arrAlarmTime addObject:[SingletonClass sharedobject].strAlarmTime];
	
//	NSLog(@"in time...%@",[SingletonClass sharedobject].arrAlarmTime);
	
	NSInteger index =	[SingletonClass sharedobject].segmentValue;// [scheduleControl selectedSegmentIndex];
	switch (index) {
		case 1:
			notification.repeatInterval = NSMinuteCalendarUnit;
		
			break;
		case 2:
			notification.repeatInterval = NSHourCalendarUnit;
			break;
		case 3:
			notification.repeatInterval = NSDayCalendarUnit;
			break;
		case 4:
			notification.repeatInterval = NSWeekCalendarUnit;
			break;
		default:
			notification.repeatInterval = 0;
			break;
	}
//	NSLog(@"title...%@",[SingletonClass sharedobject].strAlarmTitle);
	
	NSDictionary *userDict = [NSDictionary dictionaryWithObject:[SingletonClass sharedobject].strAlarmTitle
														 forKey:kRemindMeNotificationDataKey];
	notification.userInfo = userDict;
	
	[[UIApplication sharedApplication] scheduleLocalNotification:notification];
		
	[notification release];
		
//    NSArray *eventArray = [[UIApplication sharedApplication] scheduledLocalNotifications];
//		
//    NSLog(@"eventArray...%@",eventArray);	
	}
}

-(IBAction)alarmSetButtonTapped:(id)sender
{
//	NSLog(@"alarm set button tapped");
	NSDateFormatter *dateFormatter=[[NSDateFormatter alloc]init];
	//dateFormatter.timeZone=[NSLocale defaultTimeZone];
	dateFormatter.locale = [NSLocale systemLocale];
	dateFormatter.timeStyle =NSDateFormatterShortStyle;
	dateFormatter.dateStyle=NSDateFormatterShortStyle;
	
	NSString *dateTimeString=[dateFormatter stringFromDate:dateTimePicker.date];
	NSLog(@"date>>>>>%@",dateTimeString);
	[SingletonClass sharedobject].strAlarmTime=dateTimeString;

	[dateFormatter release];
	
	[self scheduleLocalNotificationWithDate:dateTimePicker.date];
	
	[self presentMessage:@"Alarm set!"];
}
-(IBAction)alarmCancelButtonTapped:(id)sender
{
//	NSLog(@"alarm cancel button tapped");	
	[[UIApplication sharedApplication] cancelAllLocalNotifications];
	[self presentMessage:@"Alarm Cancelled!"];
}

-(IBAction)btnRecord_Clicked
{
	RecordVoice *record=[[RecordVoice alloc]init];
	[self.navigationController pushViewController:record animated:NO];
	[record release];
}

-(IBAction)btnViewAlarm_Clicked
{
	ViewAlarm *viewAlarm=[[ViewAlarm alloc]init];
		
	[self.navigationController pushViewController:viewAlarm animated:NO];
	
	[viewAlarm release];
}

-(IBAction)btnSendAlarm_Clicked
{
	sendAlarm *send=[[sendAlarm alloc]init];
	
	[self.navigationController pushViewController:send animated:NO];
	
	[send release];
}


/*
// When the user taps Done, invokes the delegate's method that dismisses the table view.
- (IBAction) doneShowingMusicList: (id) sender {
	
	[self.delegate musicTableViewControllerDidFinish: self];	
}


// Configures and displays the media item picker.
- (IBAction) showMediaPicker: (id) sender {
	
	MPMediaPickerController *picker =
	[[MPMediaPickerController alloc] initWithMediaTypes: MPMediaTypeAnyAudio];
	
	picker.delegate						= self;
	picker.allowsPickingMultipleItems	= YES;
	picker.prompt						= NSLocalizedString (@"AddSongsPrompt", @"Prompt to user to choose some songs to play");
	
	[[UIApplication sharedApplication] setStatusBarStyle: UIStatusBarStyleDefault animated:YES];
	
	[self presentModalViewController: picker animated: YES];
	[picker release];
}


// Responds to the user tapping Done after choosing music.
- (void) mediaPicker: (MPMediaPickerController *) mediaPicker didPickMediaItems: (MPMediaItemCollection *) mediaItemCollection {
	
	[self dismissModalViewControllerAnimated: YES];
	[self.delegate updatePlayerQueueWithMediaCollection: mediaItemCollection];
	[self.tableView reloadData];
	
	[[UIApplication sharedApplication] setStatusBarStyle: UIStatusBarStyleBlackOpaque animated:YES];
}


// Responds to the user tapping done having chosen no music.
- (void) mediaPickerDidCancel: (MPMediaPickerController *) mediaPicker {
	
	[self dismissModalViewControllerAnimated: YES];
	
	[[UIApplication sharedApplication] setStatusBarStyle: UIStatusBarStyleBlackOpaque animated:YES];
}
*/


#pragma mark - Table view methods

// To learn about using table views, see the TableViewSuite sample code  
//		and Table View Programming Guide for iPhone OS.

- (NSInteger) tableView: (UITableView *) table numberOfRowsInSection: (NSInteger)section {
	
//	RecordVoice *mainViewController = (RecordVoice *) self.delegate;
//	MPMediaItemCollection *currentQueue = mainViewController.userMediaItemCollection;
	return [arrayAlarm count];//[currentQueue.items count];
}

- (UITableViewCell *) tableView: (UITableView *) tableView1 cellForRowAtIndexPath: (NSIndexPath *) indexPath {
	
	static NSString *kCellIdentifier = @"Cell";

	//iTalkAlarmAppDelegate *ap=[[UIApplication sharedApplication] delegate];
	
	NSInteger row = [indexPath row];
	CustomAlarmTable *cell =(CustomAlarmTable *) [tableView dequeueReusableCellWithIdentifier: kCellIdentifier];
	
	if (cell == nil) {
		
		cell = [[[CustomAlarmTable alloc] initWithFrame: CGRectZero 
									   reuseIdentifier: kCellIdentifier] autorelease];
	}
	
//	RecordVoice  *mainViewController = (RecordVoice *) self.delegate;
//	MPMediaItemCollection *currentQueue = mainViewController.userMediaItemCollection;
//	MPMediaItem *anItem = (MPMediaItem *)[currentQueue.items objectAtIndex: row];
	
	//if (anItem) {
	cell.lblCategoryName.text = [arrayAlarm objectAtIndex:row];
	
	if(row==1)
		cell.lblPicked.text = [SingletonClass sharedobject].strSoundName;
	
	if(row==2)
	{
	cell.lblPicked.text = [SingletonClass sharedobject].strAlarmTitle;
	}
	
	//[tableView deselectRowAtIndexPath: indexPath animated: YES];
	
	return cell;
}

//	 To conform to the Human Interface Guidelines, selections should not be persistent --
//	 deselect the row after it has been selected.
- (void) tableView: (UITableView *) tableView didSelectRowAtIndexPath: (NSIndexPath *) indexPath {
	if(indexPath.row==0)
	{		
		AlarmRepeat *repeat=[[AlarmRepeat alloc]init];
		repeat.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
		[self presentModalViewController:repeat animated:YES];  
	}
	
	if(indexPath.row==1)
	{
		setSound *sound=[[setSound alloc]init];
		
		sound.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
		[self presentModalViewController:sound animated:YES];  
	}
	
	if(indexPath.row==2)
	{
		setLabel *lbl=[[setLabel alloc]init];
		lbl.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
		[self presentModalViewController:lbl animated:YES];  
	}
}

#pragma mark -
#pragma mark Navigation Controller delegate

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
}


- (void)dealloc {	
	[[SingletonClass sharedobject].strAlarmTitle release];
    [super dealloc];
}
@end
