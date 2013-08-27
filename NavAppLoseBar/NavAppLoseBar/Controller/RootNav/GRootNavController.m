//
//  GRootNavController.m
//  NavAppLoseBar
//
//  Created by Onyx on 27/8/13.
//  Copyright (c) 2013 Onyx. All rights reserved.
//

#import "GRootNavController.h"

@interface GRootNavController ()

@end

@implementation GRootNavController

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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotate
{
	return [self.topViewController shouldAutorotate];
}

- (NSUInteger)supportedInterfaceOrientations
{
	return [self.topViewController supportedInterfaceOrientations];
}

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // You do not need this method if you are not supporting earlier iOS Versions
    return [self.topViewController shouldAutorotateToInterfaceOrientation:interfaceOrientation];
}

@end
