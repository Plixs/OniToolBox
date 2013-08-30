//
//  ChinesePinyinOnTextFieldLimt
//
//  Created by Onyx on 24/8/30.
//  Copyright (c) 2013 Onyx. All rights reserved.
//

#import "UITextView+TextInput.h"

@implementation UITextView (TextInput)

- (BOOL) shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)string length:(NSInteger)length
{
    NSInteger maxStrLength =length;
    
    NSInteger textLength = 0;
    UITextRange *selectedRange = [self markedTextRange];
    //获取高亮部分
    UITextPosition *position = [self positionFromPosition:selectedRange.start offset:0];
    if (!position) {
        textLength = [self.text length];
    }
    if (string.length > 0) {
        //输入状态
        NSString * newText = [self textInRange:selectedRange];
        
         //候选词替换高亮拼音时
        if (newText && [string length] > 1) {      
            
            if (newText != nil) {
                NSInteger tvLength = [self.text length];
                textLength += (tvLength-[newText length]);
            }
            
            textLength += [string length];
        }else {
            if (newText != nil) {
                NSInteger tvLength = [self.text length];
                textLength += (tvLength-[newText length]);
            }
            
            textLength += 1;
        }
    }else {
        //删除状态
        if (self.text.length > 0) {
            /*textLength = [[textField.text substringToIndex:range.location] length];*/
        }
    }

    if (textLength > maxStrLength) {
    
        //如果输入的字符长度超过限制长度，则进行截取
        if (self.text.length >= range.location) {

            NSString * newText = [self textInRange:selectedRange];
            if (newText) {
                NSMutableString * string = [NSMutableString stringWithString:self.text  ];
                
                [string insertString:newText atIndex:range.location];
                
                self.text = string;
            }
        }
        NSInteger minx = MIN(maxStrLength, self.text.length);
        self.text = [self.text substringToIndex:minx];
        
        return NO;
    }
    
    return YES;
}

- (NSInteger) lengthWithInRange:(NSRange)range replacementText:(NSString *)string {
    NSInteger textLength = 0;
    UITextRange *selectedRange = [self markedTextRange];
    //获取高亮部分
    UITextPosition *position = [self positionFromPosition:selectedRange.start offset:0];


    if (!position) {
        textLength = [self.text length];
    }
    if (string.length > 0) {
        //输入状态
        NSString * newText = [self textInRange:selectedRange];
        
        //候选词替换高亮拼音时
        if (newText && [string length] > 1) {       
            
            if (newText != nil) {
                NSInteger tvLength = [self.text length];
                textLength += (tvLength-[newText length]);
            }
            
            textLength += [string length];
        }else {
            if (newText != nil) {
               NSInteger tvLength = [self.text length];
                textLength += (tvLength-[newText length]);
            }
            
            textLength += 1;
        }
    }else {
        //删除状态
        if (self.text.length > 0) {
            NSString * newText = [self textInRange:selectedRange];
            if (newText != nil) {
                NSInteger newLength = [newText length];
                NSInteger tvLength = [self.text length];
                textLength += (tvLength-newLength);
                if (newLength > 1) {
                   textLength += 1; 
                }
            }
            else {
               textLength = [[self.text substringToIndex:range.location] length]; 
            }
        }
    }
    
    return textLength;
}

@end
