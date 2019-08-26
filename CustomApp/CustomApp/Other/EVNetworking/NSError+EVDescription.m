//
//  NSError+EVDescription.m
//  AAAAFNetworking
//
//  Created by apple on 16/7/18.
//  Copyright © 2016年 ANGELEN. All rights reserved.
//

#import "NSError+EVDescription.h"
#import "NSBundle+EVNetworking.h"

@implementation NSError (EVDescription)

- (NSInteger)evCode {
    return self.code;
}

- (NSString *)evDescription {

    switch (self.code) {
        case NSURLErrorUnknown:
            return [NSBundle ev_localizedStringForKey:@"NSURLErrorUnknown"];
            
        case NSURLErrorCancelled:
            return [NSBundle ev_localizedStringForKey:@"NSURLErrorCancelled"];
            
        case NSURLErrorBadURL:
            return [NSBundle ev_localizedStringForKey:@"NSURLErrorBadURL"];
            
        case NSURLErrorTimedOut:
            return [NSBundle ev_localizedStringForKey:@"NSURLErrorTimedOut"];
            
        case NSURLErrorUnsupportedURL:
            return [NSBundle ev_localizedStringForKey:@"NSURLErrorUnsupportedURL"];
            
        case NSURLErrorCannotFindHost:
            return [NSBundle ev_localizedStringForKey:@"NSURLErrorCannotFindHost"];
            
        case NSURLErrorCannotConnectToHost:
            return [NSBundle ev_localizedStringForKey:@"NSURLErrorCannotConnectToHost"];
            
        case NSURLErrorDataLengthExceedsMaximum:
            return [NSBundle ev_localizedStringForKey:@"NSURLErrorDataLengthExceedsMaximum"];
            
        case NSURLErrorNetworkConnectionLost:
            return [NSBundle ev_localizedStringForKey:@"NSURLErrorNetworkConnectionLost"];
            
        case NSURLErrorDNSLookupFailed:
            return [NSBundle ev_localizedStringForKey:@"NSURLErrorDNSLookupFailed"];
            
        case NSURLErrorHTTPTooManyRedirects:
            return [NSBundle ev_localizedStringForKey:@"NSURLErrorHTTPTooManyRedirects"];
            
        case NSURLErrorResourceUnavailable:
            return [NSBundle ev_localizedStringForKey:@"NSURLErrorResourceUnavailable"];
            
        case NSURLErrorNotConnectedToInternet:
            return [NSBundle ev_localizedStringForKey:@"NSURLErrorNotConnectedToInternet"];
            
        case NSURLErrorRedirectToNonExistentLocation:
            return [NSBundle ev_localizedStringForKey:@"NSURLErrorRedirectToNonExistentLocation"];
            
        case NSURLErrorBadServerResponse:
            return [NSBundle ev_localizedStringForKey:@"NSURLErrorBadServerResponse"];
            
        case NSURLErrorUserCancelledAuthentication:
            return [NSBundle ev_localizedStringForKey:@"NSURLErrorUserCancelledAuthentication"];
            
        case NSURLErrorUserAuthenticationRequired:
            return [NSBundle ev_localizedStringForKey:@"NSURLErrorUserAuthenticationRequired"];
            
        case NSURLErrorZeroByteResource:
            return [NSBundle ev_localizedStringForKey:@"NSURLErrorZeroByteResource"];
            
        case NSURLErrorCannotDecodeRawData:
            return [NSBundle ev_localizedStringForKey:@"NSURLErrorCannotDecodeRawData"];
            
        case NSURLErrorCannotDecodeContentData:
            return [NSBundle ev_localizedStringForKey:@"NSURLErrorCannotDecodeContentData"];
            
        case NSURLErrorCannotParseResponse:
            return [NSBundle ev_localizedStringForKey:@"NSURLErrorCannotParseResponse"];
            
        case NSURLErrorFileDoesNotExist:
            return [NSBundle ev_localizedStringForKey:@"NSURLErrorFileDoesNotExist"];
            
        case NSURLErrorFileIsDirectory:
            return [NSBundle ev_localizedStringForKey:@"NSURLErrorFileIsDirectory"];
            
        case NSURLErrorNoPermissionsToReadFile:
            return [NSBundle ev_localizedStringForKey:@"NSURLErrorNoPermissionsToReadFile"];
            
        case NSURLErrorSecureConnectionFailed:
            return [NSBundle ev_localizedStringForKey:@"NSURLErrorSecureConnectionFailed"];
            
        case NSURLErrorServerCertificateHasBadDate:
            return [NSBundle ev_localizedStringForKey:@"NSURLErrorServerCertificateHasBadDate"];
            
        case NSURLErrorServerCertificateUntrusted:
            return [NSBundle ev_localizedStringForKey:@"NSURLErrorServerCertificateUntrusted"];
            
        case NSURLErrorServerCertificateHasUnknownRoot:
            return [NSBundle ev_localizedStringForKey:@"NSURLErrorServerCertificateHasUnknownRoot"];
            
        case NSURLErrorServerCertificateNotYetValid:
            return [NSBundle ev_localizedStringForKey:@"NSURLErrorServerCertificateNotYetValid"];
            
        case NSURLErrorClientCertificateRejected:
            return [NSBundle ev_localizedStringForKey:@"NSURLErrorClientCertificateRejected"];
            
        case NSURLErrorClientCertificateRequired:
            return [NSBundle ev_localizedStringForKey:@"NSURLErrorClientCertificateRequired"];
            
        case NSURLErrorCannotLoadFromNetwork:
            return [NSBundle ev_localizedStringForKey:@"NSURLErrorCannotLoadFromNetwork"];
            
        case NSURLErrorCannotCreateFile:
            return [NSBundle ev_localizedStringForKey:@"NSURLErrorCannotCreateFile"];
            
        case NSURLErrorCannotOpenFile:
            return [NSBundle ev_localizedStringForKey:@"NSURLErrorCannotOpenFile"];
            
        case NSURLErrorCannotCloseFile:
            return [NSBundle ev_localizedStringForKey:@"NSURLErrorCannotCloseFile"];
            
        case NSURLErrorCannotWriteToFile:
            return [NSBundle ev_localizedStringForKey:@"NSURLErrorCannotWriteToFile"];
            
        case NSURLErrorCannotRemoveFile:
            return [NSBundle ev_localizedStringForKey:@"NSURLErrorCannotRemoveFile"];
            
        case NSURLErrorCannotMoveFile:
            return [NSBundle ev_localizedStringForKey:@"NSURLErrorCannotMoveFile"];
            
        case NSURLErrorDownloadDecodingFailedMidStream:
            return [NSBundle ev_localizedStringForKey:@"NSURLErrorDownloadDecodingFailedMidStream"];
            
        case NSURLErrorDownloadDecodingFailedToComplete:
            return [NSBundle ev_localizedStringForKey:@"NSURLErrorDownloadDecodingFailedToComplete"];
    }
    
    return [NSBundle ev_localizedStringForKey:@"NSURLErrorUnknown"];
}

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