//
//  PGGTabBarController.m
//  PGG_Sina
//
//  Created by 陈鹏 on 2017/12/13.
//  Copyright © 2017年 penggege.CP. All rights reserved.
//

#import "PGGTabBarController.h"
#import "SYHomeVC.h"
#import "SYMineVC.h"
#import "SYSendVC.h"
#import "SYShopVC.h"
#import "SYMessageVC.h"
#import "PGGAddTabBar.h"
#import "PGGNavigationController.h"

@interface PGGTabBarController ()<PGGTabBarDelegate>
@property (nonatomic,weak) UIButton *plus;
//@property (nonatomic,weak)FXBlurView *blurView;
@property (nonatomic,weak) UIImageView *text;
@property (nonatomic,weak) UIImageView *ablum;
@property (nonatomic,weak) UIImageView *camera;
@property (nonatomic,weak) UIImageView *sign;
@property (nonatomic,weak) UIImageView *comment;
@property (nonatomic,weak) UIImageView *more;

@end

@implementation PGGTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
        // 设置子控制器
    SYHomeVC *home = [[SYHomeVC alloc]init];
    [self addChildViewController:home title:@"首页" image:@"icon_home_not_select" selImage:@"icon_home_select"];
    
    SYShopVC *shop = [[SYShopVC alloc] init];
    [self addChildViewController:shop title:@"商城" image:@"icon_shop_not_select" selImage:@"icon_shop_select"];
    
    SYMessageVC *message = [[SYMessageVC alloc] init];
    [self addChildViewController:message title:@"消息" image:@"icon_news_not_select" selImage:@"icon_news_select"];
    
    SYMineVC *profile = [[SYMineVC alloc] init];
    [self addChildViewController:profile title:@"我的" image:@"icon_person_not_select" selImage:@"icon_person_select"];
    
        //更换系统自带的tabbar
    PGGAddTabBar *tab = [[PGGAddTabBar alloc]init];
    tab.delegate = self;
    [self setValue:tab forKey:@"tabBar"];
}
#pragma mark - 添加子控制器
-(void)addChildViewController:(UIViewController *)childVc  title:(NSString *)title image:(NSString *)image selImage:(NSString *)selImage {
    static NSInteger index = 0;
        //设置子控制器的TabBarButton属性
    childVc.tabBarItem.title = title;
    childVc.tabBarItem.image = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVc.tabBarItem.tag = index;
    index++;
        //让子控制器包装一个导航控制器
    PGGNavigationController *nav = [[PGGNavigationController alloc]initWithRootViewController:childVc];
    [self addChildViewController:nav];
}

+ (void)initialize
{
        //设置未选中的TabBarItem的字体颜色、大小
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    attrs[NSForegroundColorAttributeName] = [UIColor grayColor];
        //设置选中了的TabBarItem的字体颜色、大小
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    selectedAttrs[NSForegroundColorAttributeName] =  [UIColor orangeColor];
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    NSLog(@"点击的item:%ld title:%@", item.tag, item.title);
}

#pragma mark - 加号按钮响应方法
-(void)tabBarDidClickPlusButton:(PGGAddTabBar *)tabBar {
    NSLog(@"点击加号???");
//    FXBlurView *blurView = [[FXBlurView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
//    blurView.tintColor = [UIColor clearColor];
//    self.blurView = blurView;
//    UITapGestureRecognizer *tap =[[UITapGestureRecognizer alloc]initWithTarget:self     action:@selector(tapAction:)];
//    tap.numberOfTapsRequired =1;
//    tap.numberOfTouchesRequired =1;
//    [blurView addGestureRecognizer:tap];
//    [self.view addSubview:blurView];
//    UIImageView *compose = [[UIImageView alloc]init];
//    [compose setImage:[UIImage imageNamed:@"compose_slogan"]];
//    compose.frame = CGRectMake(0, 100, self.view.frame.size.width, 48);
//    compose.contentMode = UIViewContentModeCenter;
//    [blurView addSubview:compose];
//    UIView *bottom = [[UIView alloc]init];
//    bottom.frame = CGRectMake(0, self.view.bounds.size.height - 44, self.view.bounds.size.height, 44);
//    bottom.backgroundColor = [UIColor whiteColor];
//    UIButton *plus = [UIButton buttonWithType:UIButtonTypeCustom];
//    plus.frame = CGRectMake((self.view.bounds.size.width - 25) * 0.5, 8, 25, 25);
//    [plus setImage:[UIImage imageNamed:@"tabbar_compose_background_icon_add"] forState:UIControlStateNormal];
//    [bottom addSubview:plus];
//
//    [UIView animateWithDuration:0.2 animations:^{
//        plus.transform = CGAffineTransformMakeRotation(M_PI_4);
//        self.plus = plus;
//    }];
//    [plus addTarget:self action:@selector(closeClick) forControlEvents:UIControlEventTouchUpInside];
//
//    [blurView addSubview:bottom];
//    UIImageView *text = [self btnAnimateWithFrame:CGRectMake(31, 500, 71, 100) imageName:@"tabbar_compose_idea" text:@"文字" animateFrame:CGRectMake(31, 280, 71, 100) delay:0.0];
//    [self setAction:text action:@selector(compose)];
//    self.text = text;
//
//    UIImageView *ablum = [self btnAnimateWithFrame:CGRectMake(152, 500, 71, 100) imageName:@"tabbar_compose_photo" text:@"相册" animateFrame:CGRectMake(152, 280, 71, 100) delay:0.1];
//    self.ablum = ablum;
//
//    UIImageView *camera = [self btnAnimateWithFrame:CGRectMake(273, 500, 71, 100) imageName:@"tabbar_compose_camera" text:@"摄影" animateFrame:CGRectMake(273, 280, 71, 100) delay:0.15];
//    self.camera = camera;
//
//    UIImageView *sign = [self btnAnimateWithFrame:CGRectMake(31, 700, 71, 100) imageName:@"tabbar_compose_lbs" text:@"签到" animateFrame:CGRectMake(31, 410, 71, 100) delay:0.2];
//    self.sign = sign;
//
//
//    UIImageView *comment = [self btnAnimateWithFrame:CGRectMake(152, 700, 71, 100) imageName:@"tabbar_compose_review" text:@"评论" animateFrame:CGRectMake(152, 410, 71, 100) delay:0.25];
//    self.comment = comment;
//
//    UIImageView *more = [self btnAnimateWithFrame:CGRectMake(273, 700, 71, 100) imageName:@"tabbar_compose_more" text:@"更多" animateFrame:CGRectMake(273, 410, 71, 100) delay:0.3];
//    self.more = more;
}

#pragma mark - 按钮出来动画
-(UIImageView *)btnAnimateWithFrame:(CGRect)frame imageName:(NSString *)imageName text:(NSString *)text animateFrame:(CGRect)aniFrame delay:(CGFloat)delay {
    UIImageView *btnContainer = [[UIImageView alloc]init];
    btnContainer.frame  = frame;
    UIImageView *image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:imageName]];
    [btnContainer addSubview:image];
    UILabel *word = [[UILabel alloc]initWithFrame:CGRectMake(0, 75, 71, 25)];
    [word setText:text];
    [word setTextAlignment:NSTextAlignmentCenter];
    [word setFont:[UIFont systemFontOfSize:15]];
    [word setTextColor:[UIColor grayColor]];
    [btnContainer addSubview:word];
//    [self.blurView addSubview:btnContainer];
    [UIView animateWithDuration:0.5 delay:delay usingSpringWithDamping:0.6 initialSpringVelocity:0.05 options:UIViewAnimationOptionAllowUserInteraction animations:^{
        btnContainer.frame  = aniFrame;
    } completion:^(BOOL finished) {
    }];
    return btnContainer;
}
    //设置按钮方法
-(void)setAction:(UIImageView *)imageView action:(SEL)action{
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:action];
    imageView.userInteractionEnabled = YES;
    [imageView addGestureRecognizer:gesture];
}
#pragma mark - 消失
-(void)tapAction:(UITapGestureRecognizer *)tap{
    [self closeClick];
}

    //跳转
-(void)compose {
    [self closeClick];
//    PGGTestViewController *compose = [[PGGTestViewController alloc]init];
//    PGGNavigationController *nav = [[PGGNavigationController alloc]initWithRootViewController:compose];
//    [self presentViewController:nav animated:YES completion:nil];
}

#pragma mark - 关闭动画
-(void)btnCloseAnimateWithFrame:(CGRect)rect delay:(CGFloat)delay btnView:(UIImageView *)btnView{
    [UIView animateWithDuration:0.3 delay:delay usingSpringWithDamping:0.6 initialSpringVelocity:0.05 options:UIViewAnimationOptionAllowUserInteraction animations:^{
        btnView.frame  = rect;
    } completion:^(BOOL finished) {
    }];
}

#pragma mark - 关闭按钮
-(void)closeClick {
    [UIView animateWithDuration:0.6 animations:^{
        self.plus.transform = CGAffineTransformMakeRotation(-M_PI_2);
        [self btnCloseAnimateWithFrame:CGRectMake(273, 700, 71, 100) delay:0.1 btnView:self.more];
        [self btnCloseAnimateWithFrame:CGRectMake(152, 700, 71, 100) delay:0.15 btnView:self.comment];
        [self btnCloseAnimateWithFrame:CGRectMake(31, 700, 71, 100) delay:0.2 btnView:self.sign];
        [self btnCloseAnimateWithFrame:CGRectMake(273, 700, 71, 100) delay:0.25 btnView:self.camera];
        [self btnCloseAnimateWithFrame:CGRectMake(152, 700, 71, 100) delay:0.3 btnView:self.ablum];
        [self btnCloseAnimateWithFrame:CGRectMake(31, 700, 71, 100) delay:0.35 btnView:self.text];
    } completion:^(BOOL finished) {
        [self.text removeFromSuperview];
        [self.ablum removeFromSuperview];
        [self.camera removeFromSuperview];
        [self.sign removeFromSuperview];
        [self.comment removeFromSuperview];
        [self.more removeFromSuperview];
//        [self.blurView removeFromSuperview];
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
