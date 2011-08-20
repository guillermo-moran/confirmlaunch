//Confirm Launch
//Confirm Launching an Application
//before launching it!
//Made by fr0st


#import <UIKit/UIKit.h>
#import <objc/runtime.h>




%hook SBApplicationIcon

-(void)launch {


	if(![[NSUserDefaults standardUserDefaults] boolForKey:@"loadApplication"]) { //Check if the BOOL key is set to "YES", if so, load the application.
		
		UIAlertView *launchAlert = [[UIAlertView alloc] initWithTitle:@"Application Launcher" message:@"Would you like to launch this application?" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Launch", nil];
		launchAlert.tag = 1996;
		[launchAlert show];
		[launchAlert release];
		
		}
		else {
		
		%orig; //Perform the original function
		
		}
		
		[[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"loadApplication"]; //After loading the application, set the BOOL back to NO
		[[NSUserDefaults standardUserDefaults] synchronize]; //Let's also save the changes that we have done
}

%new(v@:@:@i)
- (void)alertView:(UIAlertView *)launchAlert didDismissWithButtonIndex:(NSInteger)buttonIndex {
  if (launchAlert.tag == 1996)
    {
		if (buttonIndex == 1) {
			[[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"loadApplication"]; //If the user taps "Launch", set the BOOL key to "YES"
			[[NSUserDefaults standardUserDefaults] synchronize]; //meh. 
			[NSTimer scheduledTimerWithTimeInterval:0.3 target:self selector:@selector(launch) userInfo:nil repeats:NO];

		}
	}
}




%end

