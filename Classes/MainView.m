//
//  MainView.m
//  iTalkAlarm
//
//  Created by ugsw on 30/07/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "MainView.h"


@implementation MainView

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
	
}

- (void) viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [super viewWillAppear:animated];
    
   
    
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
	SetAlarm *alarm=[[SetAlarm alloc]init];
	
	//alarm.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    //[self presentModalViewController:alarm animated:NO];
	[self.navigationController pushViewController:alarm animated:NO];
	[alarm release];
	
}



-(IBAction)btnViewAlarm_Clicked
{
	
	ViewAlarm *viewAlarm=[[ViewAlarm alloc]init];
	
	//viewAlarm.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    //[self presentModalViewController:viewAlarm animated:NO];
	[self.navigationController pushViewController:viewAlarm animated:NO];
	
	[viewAlarm release];
}
-(IBAction)btnSendAlarm_Clicked
{
	sendAlarm *send=[[sendAlarm alloc]init];
	
	//send.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
   // [self presentModalViewController:send animated:NO];
	
	[self.navigationController pushViewController:send animated:NO];
	
	[send release];
	
}


//-(IBAction)btnViewAlarm_Clicked;
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
