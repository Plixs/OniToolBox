//
//  GViewController.m
//  ChinesePinyinOnTextFieldLimt
//
//  Created by Onyx on 24/8/13.
//  Copyright (c) 2013 Onyx. All rights reserved.
//

#import "GViewController.h"
#import "UITextView+TextInput.h"

@interface GViewController ()

@property (nonatomic,strong) IBOutlet UITextView * textLimt;

@end

@implementation GViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (BOOL) textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    
    const NSInteger maxStrLength = 8;
    
    //NSStringEncoding chineseEncoding = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    
    BOOL shouldCanInput = [textView shouldChangeTextInRange:range replacementText:text length:maxStrLength];
    
    return shouldCanInput;
}

@end
