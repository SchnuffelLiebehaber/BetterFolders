#import <UIKit/UIKit.h>

// Enable Pinch to Close

%hook SBFolderSettings

	%group ungrouped

-(void)setPinchToClose:(BOOL)enabled{
	%orig(YES);
}

	%end

%end

// Allow Nested

// Thanks to Bensge for that https://github.com/Bensge/FolderCeption

%hook SBIconView

	%group ungrouped

-(BOOL)canReceiveGrabbedIcon:(id)icon{

	return YES;
}

	%end
	
%end


%hook SBFolderIconListView

	%group moreIcons

+ (unsigned long long)maxVisibleIconRowsInterfaceOrientation:(long long)arg1{
	return 4;
}

+ (unsigned long long)iconColumnsForInterfaceOrientation:(long long)arg1{
	return 4;
}

	%end
		
%end

%ctor{

	if([[[UIDevice currentDevice]model]isEqualToString:@"iPad"])
		%init(moreIcons);
		
	%init(ungrouped);
}