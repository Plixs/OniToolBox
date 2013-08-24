//
//  GViewController.m
//  ChinesePinyinOnTextFieldLimt
//
//  Created by Onyx on 24/8/13.
//  Copyright (c) 2013 Onyx. All rights reserved.
//

#import "GViewController.h"

@interface GViewController ()

@property (nonatomic,strong) IBOutlet UITextField * textLimt;

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

- (BOOL) textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    const NSInteger maxStrLength = 8;
    
    //NSStringEncoding chineseEncoding = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    
    NSInteger textLength = 0;
    UITextRange *selectedRange = [textField markedTextRange];
    //获取高亮部分
    UITextPosition *position = [textField positionFromPosition:selectedRange.start offset:0];
    if (!position) {
        textLength = [textField.text length];
    }
    if (string.length > 0) {
        //输入状态
        if (textField.text.length > range.location) {       //候选词替换高亮拼音时
            NSString *newStr = [NSString stringWithFormat:@"%@%@",[textField.text substringToIndex:range.location],
                                string];
            textLength = [newStr length];
        }else {
            textLength += [string length];
        }
    }else {
        //删除状态
        if (textField.text.length > 0) {
            textLength = [[textField.text substringToIndex:range.location] length];
        }
    }

    if (textLength > maxStrLength) {
        //如果输入的字符长度超过限制长度，则进行截取
        if (textField.text.length >= range.location) {
            textField.text = [NSString stringWithFormat:@"%@%@",[textField.text substringToIndex:range.location],string];
        }
        textField.text = [textField.text substringToIndex:maxStrLength];
        return NO;
    }
    
    return YES;
}

@end
