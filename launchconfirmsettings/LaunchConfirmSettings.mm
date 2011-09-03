#import <Preferences/Preferences.h>

@interface LaunchConfirmSettingsListController: PSListController {
}
@end

@interface AppListController : LaunchConfirmSettingsListController {
}
@end

@implementation LaunchConfirmSettingsListController
- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"LaunchConfirmSettings" target:self] retain];
	}
	return _specifiers;
}
@end

@implementation AppListController

- (id)specifiers {
    _specifiers = [[self loadSpecifiersFromPlistName:@"LaunchConfirmAppList" target:self] retain];
    return _specifiers;
}

@end

// vim:ft=objc
