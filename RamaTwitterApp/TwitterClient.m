//
//  TwitterClient.m
//  RamaTwitterApp
//
//  Created by Rama Pillutla on 9/19/16.
//  Copyright © 2016 codepath. All rights reserved.
//

#import "TwitterClient.h"

NSString * const twitterConsumerKey = @"8y12NovfxubeA9foFIIHa8YLV";
NSString * const twitterConsumerSecret = @"Phh7WpbHfG80A3iYG0XsGqEkTqrSUvaJ8rD2WlNZhNUH4zb1GK";
NSString * const twitterBaseUrl = @"https://api.twitter.com";

@implementation TwitterClient

+ (TwitterClient *)sharedInstance; {
    static TwitterClient *instance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (instance == nil) {
            instance = [[TwitterClient alloc] initWithBaseURL:[NSURL URLWithString:twitterBaseUrl] consumerKey:twitterConsumerKey consumerSecret:twitterConsumerSecret];
        }
    });
    
    return instance;
}

-(void)login {
    [self fetchRequestTokenWithPath:@"oauth/request_token" method:@"GET" callbackURL:[NSURL URLWithString:@"RamaTwitterApp://oauth"] scope:nil success:^(BDBOAuth1Credential *requestToken) {
        NSLog(@"got the request token!");
        
        NSURL *authURL = [NSURL URLWithString:[NSString stringWithFormat:@"https://api.twitter.com/oauth/authorize?force_login=1&oauth_token=%@", requestToken.token]];
        [[UIApplication sharedApplication] openURL:authURL];
        
    } failure:^(NSError *error) {
        NSLog(@"Failed to get the request token!");
    }];
}

@end
