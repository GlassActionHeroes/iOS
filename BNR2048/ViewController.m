//
//  ViewController.m
//  BNR2048
//
//  Created by SeanFarrell on 4/24/14.
//  Copyright (c) 2014 GlassActionHeroes. All rights reserved.
//

#import "ViewController.h"
#import "MultiplayerViewController.h"
#import "F3HNumberTileGameViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)singlePlayerButtonPressed:(id)sender {
    [self performSegueWithIdentifier:@"nativeSinglePlayer" sender:self];
    
    /*F3HNumberTileGameViewController *c = [F3HNumberTileGameViewController numberTileGameWithDimension:4
                                                                                         winThreshold:2048
                                                                                      backgroundColor:[UIColor whiteColor]
                                                                                          scoreModule:YES
                                                                                       buttonControls:YES
                                                                                        swipeControls:YES];
    [self.navigationController presentViewController:c animated:YES completion:nil];*/
}

- (void)multiplayerButtonPressed:(id)sender {
    [self performSegueWithIdentifier:@"multiplayer" sender:self];
}

@end
