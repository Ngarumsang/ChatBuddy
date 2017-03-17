//
//  ViewController.m
//  ChatBuddy
//
//  Created by Vashum on 17/03/17.
//  Copyright © 2017 mmadapps. All rights reserved.
//

#import "LandingViewController.h"
#import "AccountActionViewController.h"
@interface LandingViewController ()

@end

@implementation LandingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    AccountActionViewController  *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"AccountActionViewController"];
    if ([segue.identifier isEqualToString:@"signInSegue"]) {
        
        vc.isLogin = YES;
        
    } else if([segue.identifier isEqualToString:@"signUpSegue"]) {
        vc.isLogin = false;

    } else {
        NSLog(@"Unknown Seque");
    }
}



@end
