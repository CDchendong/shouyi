//
//  EVNetworking.h
//  AAAAFNetworking
//
//  Created by apple on 16/7/15.
//  Copyright © 2016年 ANGELEN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSError+EVDescription.h"
@protocol AFMultipartFormData;
typedef NS_ENUM(NSUInteger, EVHTTPMethod) {
    GET,
    POST,
    PUT,
    DELETE,
    HEAD,
};

typedef NS_ENUM(NSUInteger, EVLoadingType) {
    EVLoadingTypeRefresh,
    EVLoadingTypeLoadMore,
};

typedef void(^requestSuccessBlock)(NSDictionary *result);
typedef void(^requestFailureBlock)(NSError *error);
typedef void(^requestBodyBlock)(id<AFMultipartFormData>  _Nonnull formData);
typedef void(^requestProgressBlock)(NSProgress * _Nonnull uploadProgress);

@interface EVNetworking : NSObject<NSCopying>

+ (instancetype)sharedInstance;
/**
 *  post 一次性请求
 *
 *  @param URLString URL 地址，只需要传入模块名，不需要传入 baseURL
 *  @param params    参数（username=小良&age=23）
 *  @param success   成功回调
 *  @param failure   失败回调
 */
- (void)GET:(NSString *)URLString success:(requestSuccessBlock)success failure:(requestFailureBlock)failure;
/**
 *  post 刷新请求 & 请求更多
 *
 *  @param URLString   URL 地址，只需要传入模块名，不需要传入 baseURL
 *  @param params      参数（username=小良&age=23）
 *  @param loadingType 请求类型
 *  @param success     成功回调
 *  @param failure     失败回调
 */
- (void)GET:(NSString *)URLString params:(NSString *)params loadingType:(EVLoadingType)loadingType success:(requestSuccessBlock)success failure:(requestFailureBlock)failure;


/**
 *  专门针对音频的列表加的一个接口，同时分页自定义count通用
 */
- (void)GET:(NSString *)URLString params:(NSString *)params count:(NSInteger)count loadingType:(EVLoadingType)loadingType success:(requestSuccessBlock)success failure:(requestFailureBlock)failure;
/**
 *  post 一次性请求
 *
 *  @param URLString URL 地址，只需要传入模块名，不需要传入 baseURL
 *  @param params    参数（username=小良&age=23）
 *  @param success   成功回调
 *  @param failure   失败回调
 */
- (void)post:(NSString *)URLString params:(NSDictionary *)params success:(requestSuccessBlock)success failure:(requestFailureBlock)failure;


/**
 *上传多张图片和视频
 *
 */
- (void)uploadImgs:(NSString *)URLString params:(NSDictionary *)params bodyBlock:(requestBodyBlock)body success:(requestSuccessBlock)success failure:(requestFailureBlock)failure;

/**
 *上传视频图片
 *
 */
- (void)uploadVideoImg:(NSString *)URLString params:(NSDictionary *)params bodyBlock:(requestBodyBlock)body success:(requestSuccessBlock)success failure:(requestFailureBlock)failure;
/**
 *上传视频
 *
 */
- (void)uploadVids:(NSString *)URLString params:(NSDictionary *)params bodyBlock:(requestBodyBlock)body proBlock:(requestProgressBlock)proBlock success:(requestSuccessBlock)success failure:(requestFailureBlock)failure;

/**
 *  上传单张图片
 */
- (void)uploadImg:(NSString *)URLString params:(NSDictionary *)params bodyBlock:(requestBodyBlock)body success:(requestSuccessBlock)success failure:(requestFailureBlock)failure proBlock:(requestProgressBlock)proBlock;
@end


/**
 NSURLErrorUnknown = -1, 未知错误
 NSURLErrorCancelled = -999,
 NSURLErrorBadURL = -1000,
 NSURLErrorTimedOut = -1001, 请求超时
 NSURLErrorUnsupportedURL = -1002,
 NSURLErrorCannotFindHost = -1003,
 NSURLErrorCannotConnectToHost = -1004,
 NSURLErrorDataLengthExceedsMaximum = -1103,
 NSURLErrorNetworkConnectionLost = -1005,
 NSURLErrorDNSLookupFailed = -1006,
 NSURLErrorHTTPTooManyRedirects = -1007,
 NSURLErrorResourceUnavailable = -1008,
 NSURLErrorNotConnectedToInternet = -1009,
 NSURLErrorRedirectToNonExistentLocation = -1010,
 NSURLErrorBadServerResponse = -1011,
 NSURLErrorUserCancelledAuthentication = -1012,
 NSURLErrorUserAuthenticationRequired = -1013,
 NSURLErrorZeroByteResource = -1014,
 NSURLErrorCannotDecodeRawData = -1015,
 NSURLErrorCannotDecodeContentData = -1016,
 NSURLErrorCannotParseResponse = -1017,
 NSURLErrorFileDoesNotExist = -1100,
 NSURLErrorFileIsDirectory = -1101,
 NSURLErrorNoPermissionsToReadFile = -1102,
 NSURLErrorSecureConnectionFailed = -1200,
 NSURLErrorServerCertificateHasBadDate = -1201,
 NSURLErrorServerCertificateUntrusted = -1202,
 NSURLErrorServerCertificateHasUnknownRoot = -1203,
 NSURLErrorServerCertificateNotYetValid = -1204,
 NSURLErrorClientCertificateRejected = -1205,
 NSURLErrorClientCertificateRequired = -1206,
 NSURLErrorCannotLoadFromNetwork = -2000,
 NSURLErrorCannotCreateFile = -3000,
 NSURLErrorCannotOpenFile = -3001,
 NSURLErrorCannotCloseFile = -3002,
 NSURLErrorCannotWriteToFile = -3003,
 NSURLErrorCannotRemoveFile = -3004,
 NSURLErrorCannotMoveFile = -3005,
 NSURLErrorDownloadDecodingFailedMidStream = -3006,
 NSURLErrorDownloadDecodingFailedToComplete = -3007
 */
