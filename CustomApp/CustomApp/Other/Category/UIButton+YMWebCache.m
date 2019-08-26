//
//  UIButton+YMWebCache.m
//  Commect
//
//  Created by cassfile on 2017/6/16.
//  Copyright © 2017年 eims. All rights reserved.
//

#import "UIButton+YMWebCache.h"
#import <UIButton+WebCache.h>
#import "NSString+Extension.h"
@implementation UIButton (YMWebCache)

- (void)ym_setImageWithURL:(NSString *)url forState:(UIControlState)state{
   
    NSURL *imageUrl;
    if ([url hasPrefix:@"http"]) {
        imageUrl = [NSURL URLWithString:url];
    }else{
        imageUrl= [url ym_imageurl];
    }
    [self sd_setImageWithURL:imageUrl forState:state];
}

-(void)ym_setImageWithURL:(NSString *)url forState:(UIControlState)state placeholderImage:(UIImage *)placeholder{

    NSURL *imageUrl;
    if ([url hasPrefix:@"http"]) {
        imageUrl = [NSURL URLWithString:url];
    }else{
        imageUrl= [url ym_imageurl];
    }
     [self sd_setImageWithURL:imageUrl forState:state placeholderImage:placeholder];
}

- (void)ym_setBackgroundImageWithURL:(NSString *)url forState:(UIControlState)state{
    NSURL *imageUrl;
    if ([url hasPrefix:@"http"]) {
        imageUrl = [NSURL URLWithString:url];
    }else{
        imageUrl= [url ym_imageurl];
    }
    [self sd_setBackgroundImageWithURL:imageUrl forState:state];
}

-(void)ym_setBackgroundImageWithURL:(NSString *)url forState:(UIControlState)state placeholderImage:(UIImage *)placeholder{
    NSURL *imageUrl;
    if ([url hasPrefix:@"http"]) {
        imageUrl = [NSURL URLWithString:url];
    }else{
        imageUrl= [url ym_imageurl];
    }
    [self sd_setBackgroundImageWithURL:imageUrl forState:state placeholderImage:placeholder];
}

-(void)ym_cancelImageLoadForState:(UIControlState)state{
    [self sd_cancelImageLoadForState:state];
}

- (void)ym_cancelBackgroundImageLoadForState:(UIControlState)state{
    [self sd_cancelBackgroundImageLoadForState:state];
}

@end
