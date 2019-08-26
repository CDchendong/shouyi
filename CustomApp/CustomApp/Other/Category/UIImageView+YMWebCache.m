//
//  UIImageView+YMWebCache.m
//  Commect
//
//  Created by cassfile on 2017/6/16.
//  Copyright © 2017年 eims. All rights reserved.
//

#import "UIImageView+YMWebCache.h"
#import <UIImageView+WebCache.h>

#import "NSString+Extension.h"

@implementation UIImageView (YMWebCache)

- (void)ym_setImageWithURL:(nullable NSString *)url{
    
    NSURL *imageUrl;
    if ([url hasPrefix:@"http"]) {
        imageUrl = [NSURL URLWithString:url];
    }else{
        imageUrl= [url ym_imageurl];
    }

    [self sd_setImageWithURL:imageUrl];
}

- (void)ym_setImageWithURL:(nullable NSString *)url
          placeholderImage:(nullable UIImage *)placeholder{
    
    NSURL *imageUrl;
    if ([url hasPrefix:@"http"]) {
        imageUrl = [NSURL URLWithString:url];
    }else{
        imageUrl= [url ym_imageurl];
    }
    
    [self sd_setImageWithURL:imageUrl placeholderImage:placeholder];
    
}


@end
