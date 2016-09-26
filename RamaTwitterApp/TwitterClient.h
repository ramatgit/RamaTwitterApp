//
//  TwitterClient.h
//  RamaTwitterApp
//
//  Created by Rama Pillutla on 9/19/16.
//  Copyright © 2016 codepath. All rights reserved.
//

#import <BDBOAuth1Manager/BDBOAuth1SessionManager.h>

@interface TwitterClient : BDBOAuth1SessionManager

+ (TwitterClient *)sharedInstance;
- (void)login;

@end
