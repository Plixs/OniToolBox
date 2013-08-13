//
//  GViewController.m
//  ImgeConvertTools
//
//  Created by w hy on 11/8/13.
//  Copyright (c) 2013 Onyx. All rights reserved.
//

#import "GViewController.h"
#import "UIImage+DataConvert.h"

@interface GViewController ()

@end

@implementation GViewController {
    UIImageView * imageView;
}

- (void) imageProgress {
    UIImage * display = [self createImage];
    
    imageView = [[UIImageView alloc] initWithImage:display];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    [imageView setFrame:self.view.frame];
    [self.view addSubview:imageView];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UIBarButtonItem * barSwitch = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector( doSwitch:)];
    
    self.navigationItem.rightBarButtonItem = barSwitch;

    
    [self imageProgress];
}

- (UIImage*) createImage {
    static int i = 0;
    i++;
    if (i%2 == 0) {
        UIImage * displayImage = [UIImage imageNamed:@"octocat.png"];
        
        NSData * data = [displayImage getImageColorData];
        
        const void * bytes = [data bytes];
        
        CGSize displaySize = [displayImage size] ;
        UIImage * nowDisplayImage = [UIImage convertUseDataProvider:bytes length:[data length] width:displaySize.width height:displaySize.height bitsPerComponent:8 bitsPerPixel:32 bytesPerRow:4 * displaySize.width bitmapInfo:kCGImageAlphaPremultipliedLast |kCGBitmapByteOrder32Big];
        
        return nowDisplayImage;
    }
    else {
        UIImage * displayImage = [UIImage imageNamed:@"octocat.png"];
        
        NSData * data = [displayImage getImageColorData];
        
        const void * bytes = [data bytes];
        
        CGSize displaySize = [displayImage size] ;
        UIImage * nowDisplayImage = [UIImage convertUseContext:(void*)bytes width:displaySize.width height:displaySize.height bitsPerComponent:8 bytesPerRow:4 * displaySize.width bitmapInfo:kCGImageAlphaPremultipliedLast |kCGBitmapByteOrder32Big];
        
        return nowDisplayImage;
    }
    
    return nil;
}

- (void) doSwitch:(id)sender {
    @autoreleasepool {
        imageView.alpha = 0.0f;
        
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:2.0f];
        
        
        imageView.image = [self createImage];
        
        imageView.alpha = 1.0f;
        
        [UIView commitAnimations];
    }


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
