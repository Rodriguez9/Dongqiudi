//
//  FirstViewController.m
//  Dong
//
//  Created by 姚智豪 on 2018/6/13.
//  Copyright © 2018年 姚智豪. All rights reserved.
//
#import "SLiderMenuViewController.h"
#import <Masonry.h>
#import "UtilsMacro.h"

@interface SLiderMenuViewController ()

@property (weak, nonatomic) IBOutlet UIView *user;
@property (weak, nonatomic) IBOutlet UIView *Home;

@property(nonatomic,strong)IBOutlet UIButton *maskButton;
@property(nonatomic,assign) BOOL folder;
@property(nonatomic,assign) CGPoint originalPoint;
@property(nonatomic,assign) CGFloat scaleFactor;
@property(nonatomic,assign) CGFloat offsetX;
@property(nonatomic,assign) CGFloat originalX;
@property(nonatomic,assign) CGFloat deltaScaleFactor;
@property(nonatomic,assign) CGFloat deltaAlphaFactor;
@property(nonatomic,assign) CGFloat miniumOffestX;

@end

@implementation SLiderMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initParams];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)switchController{
    _folder = !_folder;
    if (_folder) {
        [self showHomeViewController];
    }else{
        [self showUserViewController];
    }
}

- (IBAction)panned:(UIPanGestureRecognizer *)sender {
    //locationInView:返回计算为手势位置的点
    CGPoint point = [sender locationInView:self.view];
    switch (sender.state) {
        case UIGestureRecognizerStateBegan:
            _originalPoint = point;
            [self setShadowVisible:YES];
            break;
        case UIGestureRecognizerStateChanged:{
            CGFloat tx = point.x-self.originalPoint.x+self.originalX;
            tx = tx < 0 ? 0 :tx;

            CGFloat s = 1-tx*self.deltaScaleFactor;
            s = s < 0 ? 0 : s;

            CGAffineTransform transform = CGAffineTransformMakeTranslation(tx,0);
            transform = CGAffineTransformScale(transform, s, s);
            _Home.transform = transform;

            CGFloat alaph = tx*self.deltaAlphaFactor;
            alaph=alaph > 1 ? 1 : alaph;
            _user.alpha=alaph;
            }break;
        case UIGestureRecognizerStateEnded:
        case UIGestureRecognizerStateCancelled:{
            CGAffineTransform transform = _Home.transform;
            if (transform.tx >= _miniumOffestX) {
                self.folder = NO ;
                [self showUserViewController];
            }else{
                self.folder = YES ;
                [self showHomeViewController];
            }
        }
        default:
            NSLog(@"other");
            break;
    }
}

-(CGFloat)originalX{
    return (_folder? 0 : _offsetX);
}

#pragma MARK - Private

-(void)initParams{
    //默认折叠
    _folder = YES;
    //缩小
    _scaleFactor=0.95;
    //最终偏移量
    _offsetX = self.view.frame.size.width/2+30;
    //滑动透明度的变化
    _deltaAlphaFactor=1/_offsetX;
    //最小滑动偏移量
    _miniumOffestX=_offsetX/2;
    _deltaScaleFactor=(1-_scaleFactor)/_offsetX;
}

-(void)showUserViewController{
    [self setShadowVisible:YES];
    CGAffineTransform transform = CGAffineTransformMakeTranslation(_offsetX, 0);
    transform = CGAffineTransformScale(transform, _scaleFactor, _scaleFactor);
    [UIView animateWithDuration:kAnimationDuration animations:^{
        self.user.alpha=1;
        self.Home.transform=transform;
    } completion:^(BOOL finished){
        [self setMaskButtonVisible:YES];
    }];
}

-(void)showHomeViewController{
    [self setShadowVisible:NO];
    [UIView animateWithDuration:kAnimationDuration animations:^{
        self.user.alpha=0;
        self.Home.transform=CGAffineTransformIdentity;
    }completion:^(BOOL finished){
        [self setMaskButtonVisible:NO];
    }];
}

//设置阴影
-(void)setShadowVisible:(BOOL)visible{
    if (visible) {
        UIBezierPath *path = [UIBezierPath bezierPathWithRect:_Home.layer.bounds];
        _Home.layer.shadowPath=path.CGPath;
        _Home.layer.shadowColor = [UIColor blackColor].CGColor;
        _Home.layer.shadowOffset=CGSizeZero;
        _Home.layer.shadowOpacity=0.4;
        _Home.layer.shadowRadius=4.5;
    }else{
        _Home.layer.shadowRadius=0;
    }
}

//点击home界面弹回
-(void)setMaskButtonVisible:(BOOL)visible{
    if (_maskButton==nil) {
        self.maskButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_maskButton addTarget:self action:@selector(maskButtonPressed) forControlEvents:UIControlEventTouchUpInside];
        [_Home addSubview:_maskButton];
        [_maskButton mas_makeConstraints:^(MASConstraintMaker *make){
            make.edges.equalTo(self.Home).insets(UIEdgeInsetsZero);
        }];
    }
    _maskButton.hidden = !visible;
}

-(void)maskButtonPressed{
    _folder=!_folder;
    [self showHomeViewController];
}


@end
