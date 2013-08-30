//
//  ChinesePinyinOnTextFieldLimt
//
//  Created by Onyx on 24/8/30.
//  Copyright (c) 2013 Onyx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextView (TextInput)

- (NSInteger) lengthWithInRange:(NSRange)range replacementText:(NSString *)string;
- (BOOL) shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)string length:(NSInteger)length;

@end
