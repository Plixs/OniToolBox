//
//  GMainControllerViewController.m
//  NavAppLoseBar
//
//  Created by Onyx on 27/8/13.
//  Copyright (c) 2013 Onyx. All rights reserved.
//

#import "GMainControllerViewController.h"
#import "GFirstViewController.h"

@interface GMainControllerViewController ()

@end

@implementation GMainControllerViewController

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
    = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:@selector(firstView:)];
}

- (void) firstView:(id)sender {
    GFirstViewController * firstViewController = [[GFirstViewController alloc] initWithNibName:@"GFirstViewController" bundle:nil];
    
    [self.navigationController pushViewController:firstViewController animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
