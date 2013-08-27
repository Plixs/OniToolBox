//
//  GPresentViewController.m
//  NavAppLoseBar
//
//  Created by Onyx on 27/8/13.
//  Copyright (c) 2013 Onyx. All rights reserved.
//

#import "GPresentViewController.h"

@interface GPresentViewController ()

@end

@implementation GPresentViewController

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
    = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:    UIBarButtonSystemItemDone target:self action:@selector(back:)];
}

- (void) back:(id)sender {
    //这里dismiss可能不太好,当不至于违反苹果协议
    if ([self respondsToSelector:@selector(presentingViewController)])
    {
        [[self presentingViewController] dismissViewControllerAnimated:YES completion:^{
            [self completeDelegate];
        }];
    }
    else
    {
        [[self parentViewController] dismissViewControllerAnimated:YES completion:^{
            [self completeDelegate];
        }];
    }
}

- (void) completeDelegate {
    //process your delegate
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
