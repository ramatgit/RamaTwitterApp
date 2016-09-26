//
//  ViewController.m
//  RamaTwitterApp
//
//  Created by Rama Pillutla on 9/19/16.
//  Copyright © 2016 codepath. All rights reserved.
//

#import "ViewController.h"
#import "BDBOAuth1SessionManager.h"
#import "TwitterClient.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onLoginButton:(id)sender {

    TwitterClient *myInstance = [TwitterClient sharedInstance];
    [myInstance login];
}


@end
