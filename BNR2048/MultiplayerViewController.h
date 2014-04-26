//
//  MultiplayerViewController.h
//  BNR2048
//
//  Created by SeanFarrell on 4/24/14.
//  Copyright (c) 2014 GlassActionHeroes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <PTPusher.h>
#import <PTPusherChannel.h>
#import <PTPusherEvent.h>
#import <PTPusherAPI.h>

@interface MultiplayerViewController : UIViewController <PTPusherDelegate>

@property (strong) IBOutlet UIImageView *arrowImageView;

@property (strong) UISwipeGestureRecognizer *swipeUpGesture;
@property (strong) UISwipeGestureRecognizer *swipeDownGesture;
@property (strong) UISwipeGestureRecognizer *swipeLeftGesture;
@property (strong) UISwipeGestureRecognizer *swipeRightGesture;

@property (strong) PTPusher *client;
@property (strong) PTPusherPrivateChannel *privateChannel;
@property (strong) PTPusherChannel *publicChannel;

@end
