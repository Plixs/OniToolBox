//
//  UIImage+DataConvert.m
//  ImgeConvertTools
//
//  Created by Onyx on 11/8/13.
//  Copyright (c) 2013 Onyx. All rights reserved.
//

#import "UIImage+DataConvert.h"

@implementation UIImage (DataConvert)

- (NSData*) getImageColorData {
    NSData * data = (NSData*) CFBridgingRelease(CGDataProviderCopyData(CGImageGetDataProvider(self.CGImage)));
   
    return data;
}

+ (UIImage*) convertUseDataProvider:(const void*)bytes
                             length:(size_t)size
                              width:(size_t)w
                             height:(size_t)h
                   bitsPerComponent:(size_t)bitsPerComponent
                       bitsPerPixel:(size_t)bitsPerPixel
                        bytesPerRow:(size_t)bytesPerRow
                         bitmapInfo:(CGBitmapInfo)bitmapInfo {
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    
    CGDataProviderRef resultData = CGDataProviderCreateWithData(NULL, bytes, size, NULL);
    
    CGImageRef imgRef = CGImageCreate(w,h, bitsPerComponent, bitsPerPixel,bytesPerRow, colorSpace, bitmapInfo, resultData, NULL, false, kCGRenderingIntentDefault);
    
    
    UIImage* img = [UIImage imageWithCGImage:imgRef];
    CGColorSpaceRelease(colorSpace);
    CGImageRelease(imgRef);
    CGDataProviderRelease(resultData);
    
    return img;
}


+ (UIImage*) convertUseContext:(void*)bytes
                        width:(size_t)w
                       height:(size_t)h
              bitsPerComponent:(size_t)bitsPerComponent
                   bytesPerRow:(size_t)bytesPerRow
                    bitmapInfo:(CGBitmapInfo)bitmapInfo {
                        
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context =CGBitmapContextCreate(bytes, w, h, bitsPerComponent,bytesPerRow,colorSpace,bitmapInfo);
    
    CGImageRef imgRef = CGBitmapContextCreateImage(context);
    
    UIImage* img = [UIImage imageWithCGImage:imgRef];
    CGColorSpaceRelease(colorSpace);
    CGImageRelease(imgRef);
    
    CGContextRelease(context);
    
    return img;
}

@end
