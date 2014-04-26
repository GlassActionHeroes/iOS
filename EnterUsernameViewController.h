//
//  EnterUsernameViewController.h
//  BNR2048
//
//  Created by SeanFarrell on 4/25/14.
//  Copyright (c) 2014 GlassActionHeroes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EnterUsernameViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic, retain) IBOutlet UITextField *textView;

-(IBAction)nextButtonPressed:(id)sender;

@end
