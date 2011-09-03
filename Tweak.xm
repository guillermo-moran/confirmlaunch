//Confirm Launch
//Confirm Launching an Application
//before launching it!
//Made by fr0st
//Thanks to theiostream for some ideas on how to imporve this :P
//Thanks to EvilPenguin for his help :P

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

static BOOL canLaunch = NO; 
static UIAlertView *launchAlert = nil; 
static NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.gmoran.launchconfirmsettings.plist"];

@interface SBApplicationIcon : NSObject
    - (id)displayName;
    - (void)launch; 
	- (id)leafIdentifier;
@end


%hook SBApplicationIcon

- (void)launch {

	
	launchAlert = [[UIAlertView alloc] 
	initWithTitle:@"Application Launcher" 
	message:[NSString stringWithFormat:@"%@ requires confirmation to be launched. Would you like to launch this application?", [self displayName]] 
	delegate:self 
	cancelButtonTitle:@"No" 
	otherButtonTitles:@"Yes", nil];
	
	//launchAlert.tag = 5296;
	
	if (canLaunch) { 
		%orig; 
		canLaunch = NO;
	}
	
	else if ([[dict objectForKey:@"Enabled"] boolValue]) {
	
		if ([[dict objectForKey:@"Listed"] boolValue]) {
	
			if (!canLaunch && [[dict objectForKey:[@"WhiteListed-" stringByAppendingString:[self leafIdentifier]]] boolValue]) {
			[launchAlert show];
			[launchAlert release];
			
			}
			
			else {
			%orig;
			}
		}
		else {
		
		[launchAlert show];
		[launchAlert release];
		
		}
	}
	
	else {
	
	%orig;
	return;
	
	}
	NSLog(@"Thanks to theiostream, EvilPenguin, and Maximus for their help, I appreciate it :)");
	canLaunch = NO;
	 
}

%new //Create a new thingy to make more magic

- (void)alertView:(UIAlertView *)alert didDismissWithButtonIndex:(NSInteger)buttonIndex {
	if (alert == launchAlert) { 
		
		if (buttonIndex == 1) {  
			canLaunch = YES; 
			[self launch]; 
			
		}
	}
}



%end