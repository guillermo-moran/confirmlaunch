//Confirm Launch
//Confirm Launching an Application
//before launching it!
//Made by fr0st
//Thanks to theiostream for some ideas on how to imporve this :P

//============================== I COMMENT ON MY CODE ALOT. IT MAKES IT LOOK COOL AND PRO ==========================//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

static BOOL canLaunch = NO; //Set to no, else it won't function :P

@interface SBApplicationIcon : NSObject {} //meh. whatever
- (id)displayName; //Application's displa name (ex. Cydia)
- (void)launch; //Springboard's very own Launch method! 
@end


%hook SBApplicationIcon //Hook the SBApplicationIcon class 

-(void)launch { // Springboard's own launch methods! (again)


	if(canLaunch == NO) { //Checks the BOOL 
		
		//========================== SHOW THE CONFIRMATION ALERT ========================//
		
		UIAlertView *launchAlert = [[UIAlertView alloc] initWithTitle:@"Application Launcher" message:[NSString stringWithFormat:@"Would you like to launch %@?",[self displayName]] delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Launch", nil];
		launchAlert.tag = 1996;
		[launchAlert show];
		[launchAlert release];
		
		//============================ END CONFIRMATION ALERT ===========================//
		
		}
		
		else { // If the BOOL is set to "YES", launch the application, THEN set the BOOL back to "NO"
		
		%orig; //Launch the application.... If we don't do this, SpringBoard gets angry :P
		canLaunch = NO; // Set the BOOL back to "NO"
		
		}
		
}

%new(v@:@:@i) //Create a new whatever this thingy is called

//=============================== SOME FANCY STUFF THAT MAKES THIS TWEAK MAGICAL ===============================//

- (void)alertView:(UIAlertView *)launchAlert didDismissWithButtonIndex:(NSInteger)buttonIndex {
  if (launchAlert.tag == 1996)
    {
		if (buttonIndex == 1) {
			canLaunch = YES; //Set the BOOL to yes so that the application can launch itself
			[self launch]; //re-run the "launch" method to launch the selected application

		}
	}
}




%end //end (DUH)

