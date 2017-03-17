//
//  AccountActionViewController.m
//  ChatBuddy
//
//  Created by Vashum on 17/03/17.
//  Copyright © 2017 mmadapps. All rights reserved.
//

#import "AccountActionViewController.h"
#import "AppDelegate.h"
#import "ProgressHUD.h"
#import <FirebaseAuth/FirebaseAuth.h>
@interface AccountActionViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *tfEmail;
@property (weak, nonatomic) IBOutlet UITextField *tfPassword;
@property (weak, nonatomic) IBOutlet UIButton *btnAction;
@property (weak, nonatomic) IBOutlet UIButton *btnDismiss;


@end

@implementation AccountActionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _tfEmail.delegate = self;
    _tfPassword.delegate = self;
    [self setUpView];
    
    // Do any additional setup after loading the view.
}


- (void)setUpView {
    
    if (_isLogin) {

        [_btnDismiss setTitle:@"Don't have an account? Sign Up" forState:UIControlStateNormal];
        [_btnAction setTitle:@"Sign In" forState:UIControlStateNormal];
        
    } else {
        [_btnDismiss setTitle:@"Already have an account? Sign In" forState:UIControlStateNormal];
         [_btnAction setTitle:@"Sign Up" forState:UIControlStateNormal];
    }
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - IBAction

- (IBAction)btnAction:(id)sender {
    //
    
    if (_isLogin) {
        [self signInUser];
    } else {
        [self signUpUser];
    }
    
}
- (IBAction)backAction:(id)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}

- (void)signInUser {
    
    NSString *email = [_tfEmail.text lowercaseString];
    NSString *password = _tfPassword.text;
    
    if ([email length] == 0)	{ [ProgressHUD showError:@"Please enter your email."]; return; }
    if ([password length] == 0)	{ [ProgressHUD showError:@"Please enter your password."]; return; }
    
    [ProgressHUD show:nil Interaction:NO];
    
    
    [[FIRAuth auth] signInWithEmail:email
                           password:password
                         completion:^(FIRUser *user, NSError *error) {
                             if (error == nil)
                             {
                                 
                                 [self dismissViewControllerAnimated:YES completion:^{
                                     NSLog(@"Sign Up");
                                     
                                     UINavigationController *nav = [self.storyboard instantiateViewControllerWithIdentifier:@"rootNavigation"];
                                     AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
                                     [app setRootViewController:nav];
                                     
                                     
                                 }];
                             }
                             else [ProgressHUD showError:[error description]];
                         }];
    
    
}

- (void)signUpUser {
    
    NSString *email = [_tfEmail.text lowercaseString];
    NSString *password = _tfPassword.text;

    if ([email length] == 0)	{ [ProgressHUD showError:@"Please enter your email."]; return; }
    if ([password length] == 0)	{ [ProgressHUD showError:@"Please enter your password."]; return; }
 
    [ProgressHUD show:nil Interaction:NO];
    
    
    [[FIRAuth auth]
     createUserWithEmail:email
     password:password
     completion:^(FIRUser *_Nullable user,
                  NSError *_Nullable error) {
         if (error == nil)
         {
           
             [self dismissViewControllerAnimated:YES completion:^{
                 NSLog(@"Sign Up");
                 
                 UINavigationController *nav = [self.storyboard instantiateViewControllerWithIdentifier:@"rootNavigation"];
                 AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
                 [app setRootViewController:nav];
                 
                 
             }];
         }
         else [ProgressHUD showError:[error description]];
     }];
    

   }










/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
