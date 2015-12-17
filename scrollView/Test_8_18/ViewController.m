//
//  ViewController.m
//  Test_8_18
//
//  Created by 李涛 on 15/8/18.
//  Copyright (c) 2015年 敲代码的小毛驴. All rights reserved.
//

#import "ViewController.h"
#import "YXLDisplayListView.h"
#import "TestViewController.h"

#define HeadViewHeight 400
@interface ViewController ()<UIScrollViewDelegate>
{
    /**
     *  横向滚动的展示view
     */
    YXLDisplayListView *displayListView;
    /**
     *  点击滚动到顶部的手势view
     */
    UIView *_tapView;
    /**
     *  向上滚动的btn
     */
    UIButton *scrollBtn;
}
/**
 *  背景的容器scrollview
 */
@property (nonatomic, strong) UIScrollView *scrollview1;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self getScrollViewContainer];
    
    [self getScrollBtn];
    
    [self getdisplayListView];
}


#pragma mark - 观察scrollview的位移

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    
    if ([keyPath isEqualToString:@"contentOffset"] && object == self.scrollview1) {
        //如果快滑到边缘位置，直接滑动到最上面
        if (self.scrollview1.contentOffset.y > HeadViewHeight - 5 && self.scrollview1.contentOffset.y<=HeadViewHeight-0.1) {
            [UIView animateWithDuration:0.2 animations:^{
                [self.scrollview1 setContentOffset:CGPointMake(0, HeadViewHeight)];
            }];
            _tapView.hidden = YES;
            scrollBtn.hidden = NO;
            self.scrollview1.scrollEnabled = NO;
        }
        
    }
    
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    
    if (self.scrollview1.contentOffset.y == HeadViewHeight) {
        [UIView animateWithDuration:0.3 animations:^{
            [self.scrollview1 setContentOffset:CGPointMake(0, HeadViewHeight)];
        }];
        _tapView.hidden = YES;
        self.scrollview1.scrollEnabled = NO;
        scrollBtn.hidden = NO;
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if (self.scrollview1.contentOffset.y>HeadViewHeight - 5) {
        [UIView animateWithDuration:0.3 animations:^{
            [self.scrollview1 setContentOffset:CGPointMake(0, HeadViewHeight)];
        }];
        _tapView.hidden = YES;
        self.scrollview1.scrollEnabled = NO;
        scrollBtn.hidden = NO;
    }
}

#pragma mark - get

- (void)getScrollViewContainer{
    self.scrollview1 = [[UIScrollView alloc] initWithFrame:CGRectMake(0,64,kWindowWidth,kWindowHeight-49-64)];
    self.scrollview1.backgroundColor = [UIColor colorWithRed:1.0 green:0.7053 blue:0.7053 alpha:1.0];
    self.scrollview1.contentSize = CGSizeMake(0, kWindowHeight-64-49+HeadViewHeight);
    self.scrollview1.bounces = NO;
    self.scrollview1.showsVerticalScrollIndicator = YES;
    self.scrollview1.delegate = self;
    [self.view addSubview:self.scrollview1];
    
    [self.scrollview1 addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)getScrollBtn{
    
    scrollBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    scrollBtn.layer.cornerRadius = 35.0/2;
    scrollBtn.layer.masksToBounds = YES;
    scrollBtn.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.4];
    scrollBtn.frame = CGRectMake(kWindowWidth-50, kWindowHeight-100, 35, 35);
    [scrollBtn setImage:[UIImage imageNamed:@"Up_Arrow"] forState:(UIControlStateNormal)];
    scrollBtn.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [scrollBtn addTarget:self action:@selector(clickScrollToTop:) forControlEvents:(UIControlEventTouchUpInside)];
    scrollBtn.hidden = YES;
    [[UIApplication sharedApplication].keyWindow addSubview:scrollBtn];
}

- (void)getdisplayListView{
    
    displayListView = [[YXLDisplayListView alloc] initWithFrame:CGRectMake(0, HeadViewHeight, self.view.width, kWindowHeight-64-49)];
    
    TestViewController *v1 = [[TestViewController alloc] init];
    v1.view.backgroundColor = [UIColor redColor];
    v1.title = @"v1";
    
    TestViewController *v2 = [[TestViewController alloc] init];
    v2.view.backgroundColor = [UIColor colorWithRed:1.0 green:0.7233 blue:0.6005 alpha:1.0];
    v2.title = @"v2";
    
    TestViewController *v3 = [[TestViewController alloc] init];
    v3.view.backgroundColor = [UIColor redColor];
    v3.title = @"v3";
    
    TestViewController *v4 = [[TestViewController alloc] init];
    v4.view.backgroundColor = [UIColor redColor];
    v4.title = @"v4";
    
    displayListView.kBtnWInt = 4;
    NSArray * controllers = @[v1,v2,v3,v4];
    
    displayListView.isNeedTopUnderline = YES;
    displayListView.tabItemNormalColor = UIColorFromRGB_HEX(0x3e3e3e);
    displayListView.tabItemSelectedColor = UIColorFromRGB_HEX(0xff7cc5);
    displayListView.topUnderlineBackgroundColor = HEX_COLOR_THEME;
    displayListView.topBackgroundColor = [UIColor whiteColor];
    displayListView.viewControllers = controllers;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(displayViewScrollToTop:)];
    _tapView = [[UIView alloc] initWithFrame:displayListView.bounds];
    [_tapView addGestureRecognizer:tap];
    [displayListView addSubview:_tapView];
    
    [self.scrollview1 addSubview:displayListView];
}

#pragma mark - click

- (void)displayViewScrollToTop:(UITapGestureRecognizer *)tap{
    
    if (self.scrollview1.contentOffset.y < HeadViewHeight) {
        [UIView animateWithDuration:0.3 animations:^{
            [self.scrollview1 setContentOffset:CGPointMake(0, HeadViewHeight)];
        }];
        _tapView.hidden = YES;
        self.scrollview1.scrollEnabled = NO;
        scrollBtn.hidden = NO;
    }
}

- (void)clickScrollToTop:(UIButton *)btn{
    self.scrollview1.scrollEnabled = YES;
    [UIView animateWithDuration:0.3 animations:^{
        [self.scrollview1 setContentOffset:CGPointMake(0, 0)];
    }];
    _tapView.hidden = NO;
    btn.hidden = YES;
}



- (void)dealloc{
    
    [self.scrollview1 removeObserver:self forKeyPath:@"contentOffset"];
}

@end
