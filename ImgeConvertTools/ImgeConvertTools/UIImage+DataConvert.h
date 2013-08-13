//
//  UIImage+DataConvert.h
//  ImgeConvertTools
//
//  Created by Onyx on 11/8/13.
//  Copyright (c) 2013 Onyx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (DataConvert)

//get image color information data
- (NSData*) getImageColorData;

//convert color data to image with data provider
+ (UIImage*) convertUseDataProvider:(const void*)bytes
                             length:(size_t)size
                              width:(size_t)w
                             height:(size_t)h
                   bitsPerComponent:(size_t)bitsPerComponent
                       bitsPerPixel:(size_t)bitsPerPixel
                        bytesPerRow:(size_t)bytesPerRow
                         bitmapInfo:(CGBitmapInfo)bitmapInfo;


//convert color data to image with context
+ (UIImage*) convertUseContext:(void*)bytes
                         width:(size_t)w
                        height:(size_t)h
              bitsPerComponent:(size_t)bitsPerComponent
                   bytesPerRow:(size_t)bytesPerRow
                    bitmapInfo:(CGBitmapInfo)bitmapInfo;

@end
