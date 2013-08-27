//
//  GFirstViewController.m
//  NavAppLoseBar
//
//  Created by Onyx on 27/8/13.
//  Copyright (c) 2013 Onyx. All rights reserved.
//

#import "GFirstViewController.h"
#import "GPresentViewController.h"
#import "GRootNavController.h"

@interface GFirstViewController ()

@end

@implementation GFirstViewController

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
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.rightBarButtonItem
    = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:    UIBarButtonSystemItemBookmarks target:self action:@selector(goPresentView:)];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

    /* ----
     如果遇到 presentViewController,dismissViewControllerAnimated后
     [[UIApplication sharedApplication] statusBarOrientation];
     self.interfaceOrientation;
     都为空,即stausbar像被释放或根本不存在的情况可以用以下代码
     这样的丢失bar的情况
     可以在发起present的controller的viewDidApper来添加如下代码解决问题
     一般demo中是不会丢的,可能哪句代码/xib有问题造成,一时解决不了,先用小补丁解决一下
     
     */  
    [[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationPortrait animated:YES];
    //-------------------------------------------------------------
}

- (void) goPresentView:(id)sender {
    GPresentViewController * present = [[GPresentViewController alloc] initWithNibName:@"GPresentViewController" bundle:nil];
    
    GRootNavController * rootNav = [[GRootNavController alloc] initWithRootViewController:present];
    
    [self presentViewController:rootNav animated:YES completion:NULL];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
