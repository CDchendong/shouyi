//
//  EVNetworking.m
//  AAAAFNetworking
//
//  Created by apple on 16/7/15.
//  Copyright © 2016年 ANGELEN. All rights reserved.
//

#import "EVNetworking.h"
#import "AFNetworking.h"
static NSTimeInterval const kTimeoutInterval = 45;
static NSInteger const kDefaultLimit = 10; // 默认请求条数
@interface EVNetworking() {
    NSInteger _age;
}

/**
 *  存放每条请求更多数据的 page，@{URLString: page, URLString: page}
 */
@property(nonatomic, strong) NSMutableDictionary *pageDictionary;

@end

@implementation EVNetworking

static EVNetworking *instance;
static AFHTTPSessionManager *manager;

#pragma mark - Initialize

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [super allocWithZone:zone];
        [instance initializeManager];
        [instance initializeData];
    });
    return instance;
}

/**
 *  EVNetworking 单例，推荐使用此方法创建 EVNetworking 实例对象
 *
 *  @return EVNetworking 实例对象
 */
+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (id)copyWithZone:(NSZone *)zone {
    return instance;
}

/**
 *  初始化 AFHTTPSessionManager
 */
- (void)initializeManager {
    manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:kEVCurrentIP]];
    
    // 去掉这两句，当返回的数据不能解析成 JSON 都时候，Error Code = 3840
    // 如果加上这两句，那么返回都数据将会成功返回，不过是类似 <3c21444f 43545950 45206874 6d6c3e0d 这样的数据
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager.requestSerializer setValue:@"token" forHTTPHeaderField:@""];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"multipart/form-data",@"application/octet-stream", @"text/html", @"text/plain", @"image/jpeg", @"image/png",nil];
    manager.requestSerializer.timeoutInterval = kTimeoutInterval;
}

/**
 *  初始化数据
 */
- (void)initializeData {
    self.pageDictionary = [[NSMutableDictionary alloc] init];
}

#pragma mark - Network request
//get请求
- (void)GET:(NSString *)URLString success:(requestSuccessBlock)success failure:(requestFailureBlock)failure {
    [manager GET:URLString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}

- (void)GET:(NSString *)URLString params:(NSString *)params loadingType:(EVLoadingType)loadingType success:(requestSuccessBlock)success failure:(requestFailureBlock)failure
{
    NSInteger nextPage = 1;
    
    if (self.pageDictionary[URLString]) {
        // 如果该 key 有对应的 value，那么 value + 1 之后赋值给 page，然后再把这个 key-value 放回去覆盖
        nextPage = (loadingType == EVLoadingTypeRefresh) ? 1 : ([self.pageDictionary[URLString] integerValue] + 1);
    }
    [self.pageDictionary setValue:[NSNumber numberWithInteger:nextPage] forKey:URLString];
    
    if(params.length == 0)
    {
        params = [NSString stringWithFormat:@"%@/%zd/%zd",params,nextPage,kDefaultLimit];
    }
    else
    {
        params = [NSString stringWithFormat:@"/%@/%zd/%zd",params,nextPage,kDefaultLimit];
    }
    [manager GET:EVGetUrl(URLString, params) parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}

//针对音频的接口
- (void)GET:(NSString *)URLString params:(NSString *)params count:(NSInteger)count loadingType:(EVLoadingType)loadingType success:(requestSuccessBlock)success failure:(requestFailureBlock)failure
{
    NSInteger nextPage = 1;
    
    if (self.pageDictionary[URLString]) {
        // 如果该 key 有对应的 value，那么 value + 1 之后赋值给 page，然后再把这个 key-value 放回去覆盖
        nextPage = (loadingType == EVLoadingTypeRefresh) ? 1 : ([self.pageDictionary[URLString] integerValue] + 1);
    }
    [self.pageDictionary setValue:[NSNumber numberWithInteger:nextPage] forKey:URLString];
    
    if(params.length == 0)
    {
        params = [NSString stringWithFormat:@"?page=%zd&count=%zd",nextPage,count == 0 ? kDefaultLimit : count];
    }
    else
    {
        params = [NSString stringWithFormat:@"?%@&page=%zd&count=%zd",params,nextPage,count == 0 ?kDefaultLimit : count];
    }
    [manager GET:EVGetUrl(URLString, params) parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
//    NSLog(@"+++++++++++++++url:%@",EVGetUrl(URLString, params));
}

//post请求
- (void)post:(NSString *)URLString params:(NSDictionary *)params success:(requestSuccessBlock)success failure:(requestFailureBlock)failure {
//    NSLog(@"++++++++++++++++=%@,%@",URLString,params);
    [manager POST:URLString parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}

//上传图片
- (void)uploadImgs:(NSString *)URLString params:(NSDictionary *)params bodyBlock:(requestBodyBlock)body success:(requestSuccessBlock)success failure:(requestFailureBlock)failure
{
    [manager POST:URLString parameters:params constructingBodyWithBlock:body progress:^(NSProgress * _Nonnull uploadProgress) {
        ;
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}
// 上传视频图片
- (void)uploadVideoImg:(NSString *)URLString params:(NSDictionary *)params bodyBlock:(requestBodyBlock)body success:(requestSuccessBlock)success failure:(requestFailureBlock)failure{
    [manager POST:URLString parameters:params constructingBodyWithBlock:body progress:^(NSProgress * _Nonnull uploadProgress) {
        ;
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}
// 上传视频
- (void)uploadVids:(NSString *)URLString params:(NSDictionary *)params bodyBlock:(requestBodyBlock)body proBlock:(requestProgressBlock)proBlock success:(requestSuccessBlock)success failure:(requestFailureBlock)failure
{
    [manager POST:URLString parameters:params constructingBodyWithBlock:body progress:^(NSProgress * _Nonnull uploadProgress) {
        proBlock(uploadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}

- (void)uploadImg:(NSString *)URLString params:(NSDictionary *)params bodyBlock:(requestBodyBlock)body success:(requestSuccessBlock)success failure:(requestFailureBlock)failure proBlock:(requestProgressBlock)proBlock
{
    [manager POST:URLString parameters:params constructingBodyWithBlock:body progress:^(NSProgress * _Nonnull uploadProgress) {
        proBlock(uploadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}
@end
