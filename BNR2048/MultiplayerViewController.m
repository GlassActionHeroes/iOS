//
//  MultiplayerViewController.m
//  BNR2048
//
//  Created by SeanFarrell on 4/24/14.
//  Copyright (c) 2014 GlassActionHeroes. All rights reserved.
//

#import "MultiplayerViewController.h"

@interface MultiplayerViewController ()

@end

@implementation MultiplayerViewController

@synthesize swipeDownGesture;
@synthesize swipeLeftGesture;
@synthesize swipeRightGesture;
@synthesize swipeUpGesture;
@synthesize arrowImageView;

@synthesize client;
@synthesize privateChannel;
@synthesize publicChannel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    swipeUpGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeUp)];
    [swipeUpGesture setDirection:UISwipeGestureRecognizerDirectionUp];
    [self.view addGestureRecognizer:swipeUpGesture];
    
    swipeDownGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeDown)];
    [swipeDownGesture setDirection:UISwipeGestureRecognizerDirectionDown];
    [self.view addGestureRecognizer:swipeDownGesture];
    
    swipeLeftGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeLeft)];
    [swipeLeftGesture setDirection:UISwipeGestureRecognizerDirectionLeft];
    [self.view addGestureRecognizer:swipeLeftGesture];
    
    swipeRightGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeRight)];
    [swipeRightGesture setDirection:UISwipeGestureRecognizerDirectionRight];
    [self.view addGestureRecognizer:swipeRightGesture];
    
    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    
    client = [PTPusher pusherWithKey:@"514e04bbf50ba9b0b0b6" delegate:self encrypted:YES];
    NSURL *url = [NSURL URLWithString:@"http://mysterious-forest-1989.herokuapp.com/pusher/auth"];
    [client setAuthorizationURL:url];
    
    privateChannel = [client subscribeToPrivateChannelNamed:@"bnr_2048_channel"];
    
    [client connect];
    
    /*publicChannel = [client subscribeToChannelNamed:@"bnr_2048_channel"];
    [channel bindToEventNamed:@"send_direction" handleWithBlock:^(PTPusherEvent *channelEvent) {
        // channelEvent.data is a NSDictianary of the JSON object received
        NSLog(@"public channel");
    }];*/
    
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(didReceiveChannelEventNotification)
     name:PTPusherEventReceivedNotification
     object:privateChannel];
    
    
    [privateChannel bindToEventNamed:@"send_direction" handleWithBlock:^(PTPusherEvent *channelEvent) {
        NSLog(@"received event send_direction: %@", channelEvent);
    }];
}

-(void)didReceiveChannelEventNotification
{
    NSLog(@"received event from channel");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)handleSwipeUp
{
    NSString *jsonString = @"{\"direction\":\"up\",\"name\":\"sean farrell\"}";
    
    [privateChannel triggerEventNamed:@"send_direction" data:jsonString];
    
    UIImage *arrow = [UIImage imageNamed:@"arrowUp.png"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:arrow];

    imageView.center = CGPointMake(self.view.bounds.size.width / 2,
                                self.view.bounds.size.height / 2);
    
    [self.view addSubview:imageView];
    
    [UIView animateWithDuration:0.5 animations:^{
        imageView.transform = CGAffineTransformMakeScale(2.0, 2.0);
        imageView.alpha = 0.0;
    }
                     completion:^(BOOL finished){
                         [imageView removeFromSuperview];
    }];
}

-(void)handleSwipeDown
{
    NSString *jsonString = @"{\"direction\":\"down\",\"name\":\"sean farrell\"}";
    
    [privateChannel triggerEventNamed:@"send_direction" data:jsonString];
    
    UIImage *arrow = [UIImage imageNamed:@"arrowDown.png"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:arrow];
    
    imageView.center = CGPointMake(self.view.bounds.size.width / 2,
                                   self.view.bounds.size.height / 2);
    
    [self.view addSubview:imageView];
    
    [UIView animateWithDuration:0.5 animations:^{
        imageView.transform = CGAffineTransformMakeScale(2.0, 2.0);
        imageView.alpha = 0.0;
    }
                     completion:^(BOOL finished){
                         [imageView removeFromSuperview];
                     }];
}

-(void)handleSwipeLeft
{
    NSString *jsonString = @"{\"direction\":\"left\",\"name\":\"sean farrell\"}";
    
    [privateChannel triggerEventNamed:@"send_direction" data:jsonString];
    
    UIImage *arrow = [UIImage imageNamed:@"arrowLeft.png"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:arrow];
    
    imageView.center = CGPointMake(self.view.bounds.size.width / 2,
                                   self.view.bounds.size.height / 2);
    
    [self.view addSubview:imageView];
    
    [UIView animateWithDuration:0.5 animations:^{
        imageView.transform = CGAffineTransformMakeScale(2.0, 2.0);
        imageView.alpha = 0.0;
    }
                     completion:^(BOOL finished){
                         [imageView removeFromSuperview];
                     }];
}

-(void)handleSwipeRight
{
    NSString *jsonString = @"{\"direction\":\"right\",\"name\":\"sean farrell\"}";
    
    [privateChannel triggerEventNamed:@"send_direction" data:jsonString];
    
    UIImage *arrow = [UIImage imageNamed:@"arrowRight.png"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:arrow];
    
    imageView.center = CGPointMake(self.view.bounds.size.width / 2,
                                   self.view.bounds.size.height / 2);
    
    [self.view addSubview:imageView];
    
    [UIView animateWithDuration:0.5 animations:^{
        imageView.transform = CGAffineTransformMakeScale(2.0, 2.0);
        imageView.alpha = 0.0;
    }
                     completion:^(BOOL finished){
                         [imageView removeFromSuperview];
                     }];
}

-(void)hideArrowImageView
{
    arrowImageView.hidden = YES;
}

/*
#pragma mark - Navigation

 Notifies the delegate that the PTPusher instance has connected to the Pusher service successfully.
 
 @param pusher The PTPusher instance that has connected.
 @param connection The connection for the pusher instance.
 */
- (void)pusher:(PTPusher *)pusher connectionDidConnect:(PTPusherConnection *)connection
{
    NSLog(@"connectionDidConnect: %@", connection);
}

/** Notifies the delegate that the PTPusher instance has disconnected from the Pusher service.
 
 Clients should check the value of the willAttemptReconnect parameter before trying to reconnect manually.
 In most cases, the client will try and automatically reconnect, depending on the error code returned by
 the Pusher service.
 
 If willAttemptReconnect is YES, clients can expect a pusher:connectionWillReconnect:afterDelay: message
 immediately following this one. Clients can return NO from that delegate method to cancel the automatic
 reconnection attempt.
 
 If the client has disconnected due to a fatal Pusher error (as indicated by the error code),
 willAttemptReconnect will be NO and the error domain will be `PTPusherFatalErrorDomain`.
 
 @param pusher The PTPusher instance that has connected.
 @param connection The connection for the pusher instance.
 @param error If the connection disconnected abnormally, error will be non-nil.
 @param willAttemptReconnect YES if the client will try and reconnect automatically.
 */
- (void)pusher:(PTPusher *)pusher connection:(PTPusherConnection *)connection didDisconnectWithError:(NSError *)error willAttemptReconnect:(BOOL)willAttemptReconnect
{
    NSLog(@"didDisconnectWithError: %@", error);
}

/** Notifies the delegate that the PTPusher instance failed to connect to the Pusher service.
 
 In the case of connection failures, the client will *not* attempt to reconnect automatically.
 Instead, clients should implement this method and check the error code and manually reconnect
 the client if it makes sense to do so.
 
 @param pusher The PTPusher instance that has connected.
 @param connection The connection for the pusher instance.
 @param error The connection error.
 */
- (void)pusher:(PTPusher *)pusher connection:(PTPusherConnection *)connection failedWithError:(NSError *)error
{
    NSLog(@"connectionFailedWithError: %@", error);
}

///------------------------------------------------------------------------------------/
/// @name Channel subscription and authorization
///------------------------------------------------------------------------------------/

/** Notifies the delegate of the request that will be used to authorize access to a channel.
 
 When using the Pusher Javascript client, authorization typically relies on an existing session cookie
 on the server; when the Javascript client makes an AJAX POST to the server, the server can return
 the user's credentials based on their current session.
 
 When using libPusher, there will likely be no existing server-side session; authorization will
 need to happen by some other means (e.g. an authorization token or HTTP basic auth).
 
 By implementing this delegate method, you will be able to set any credentials as necessary by
 modifying the request as required (such as setting POST parameters or headers).
 
 @param pusher The PTPusher instance that is requesting authorization
 @param channel The channel that requires authorizing
 @param request A mutable URL request that will be POSTed to the configured `authorizationURL`
 */
- (void)pusher:(PTPusher *)pusher willAuthorizeChannel:(PTPusherChannel *)channel withRequest:(NSMutableURLRequest *)request
{
    NSLog(@"willAuthorizeChannel: %@", request);
}

/** Notifies the delegate that the PTPusher instance has subscribed to the specified channel.
 
 This method will be called after any channel authorization has taken place and when a subscribe event has been received.
 
 @param pusher The PTPusher instance that has connected.
 @param channel The channel that was subscribed to.
 */
- (void)pusher:(PTPusher *)pusher didSubscribeToChannel:(PTPusherChannel *)channel
{
    NSLog(@"didSubscribeToChannel: %@", channel);
}

/** Notifies the delegate that the PTPusher instance has unsubscribed from the specified channel.
 
 This method will be called immediately after unsubscribing from a channel.
 
 @param pusher The PTPusher instance that has connected.
 @param channel The channel that was unsubscribed from.
 */
- (void)pusher:(PTPusher *)pusher didUnsubscribeFromChannel:(PTPusherChannel *)channel
{
    NSLog(@"didUnsubscribeFromChannel: %@", channel);
}

/** Notifies the delegate that the PTPusher instance failed to subscribe to the specified channel.
 
 The most common reason for subscribing failing is authorization failing for private/presence channels.
 
 @param pusher The PTPusher instance that has connected.
 @param channel The channel that was subscribed to.
 @param error The error returned when attempting to subscribe.
 */
- (void)pusher:(PTPusher *)pusher didFailToSubscribeToChannel:(PTPusherChannel *)channel withError:(NSError *)error
{
    NSLog(@"didFailToSubscribeToChannel: %@", error);
}

///------------------------------------------------------------------------------------/
/// @name Errors
///------------------------------------------------------------------------------------/

/** Notifies the delegate that an error event has been received.
 
 If a client is binding to all events, either through the client or using NSNotificationCentre, they will also
 receive notification of this event like any other.
 
 @param pusher The PTPusher instance that received the event.
 @param errorEvent The error event.
 */
- (void)pusher:(PTPusher *)pusher didReceiveErrorEvent:(PTPusherErrorEvent *)errorEvent
{
    NSLog(@"didReceiveErrorEvent: %@", errorEvent);
}

@end
