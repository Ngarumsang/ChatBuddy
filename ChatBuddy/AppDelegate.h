//
//  AppDelegate.h
//  ChatBuddy
//
//  Created by Vashum on 17/03/17.
//  Copyright © 2017 mmadapps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FirebaseDatabase/FirebaseDatabase.h>
#import <Firebase.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) FIRDatabaseReference *ref;

- (void)setRootViewController:(UINavigationController *)vc;

@end

