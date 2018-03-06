//
//  ThirdViewController.m
//  视图错觉
//
//  Created by macmini2 on 16/8/15.
//  Copyright © 2016年 emiage. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()<UIScrollViewDelegate>{
    CALayer * maskLayer;
    CALayer * maskView;
}
@property (weak, nonatomic) IBOutlet UILabel *upper;//上层
@property (weak, nonatomic) IBOutlet UILabel *lower;//底层

@property (weak, nonatomic) IBOutlet UIView *upperView;
@property (weak, nonatomic) IBOutlet UIView *lowerView;
@property (weak, nonatomic) IBOutlet UIScrollView *backScro;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contentViewWIdth;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lead;
@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    maskLayer=[[CALayer alloc]init];
    maskLayer.frame=CGRectMake(110, 0,60,30);
    maskLayer.cornerRadius =15;
    maskLayer.backgroundColor = [UIColor blackColor].CGColor;
    self.upper.layer.mask = maskLayer;
    
    
    
    maskView=[[CALayer alloc]init];
    maskView.frame=CGRectMake(0, 0,CGRectGetWidth(self.view.frame)/5,CGRectGetHeight(self.upperView.frame));
    maskView.cornerRadius =CGRectGetHeight(self.upperView.frame)/2;
    maskView.backgroundColor = [UIColor blackColor].CGColor;
    self.upperView.layer.mask = maskView;
    
    self.backScro.delegate=self;
  
    
    for (NSInteger i=0; i<5; i++) {
        UIView * view =[[UIView alloc]initWithFrame:CGRectMake(i*CGRectGetWidth(self.view.frame), 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame))];
        if (i%2==0) {
            view.backgroundColor = [UIColor redColor];
        }else{
            view.backgroundColor = [UIColor yellowColor];
        }
        [self.backScro addSubview:view];
    }
    self.backScro.contentSize = CGSizeMake(CGRectGetWidth(self.view.frame)*5, 0);
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [CATransaction setDisableActions:YES];
    [UIView animateWithDuration:.5 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        CGRect frame2 =maskView.frame;
        frame2.origin.x =scrollView.contentOffset.x/5;
        maskView.frame=frame2;
    } completion:^(BOOL finished) {
        
    }];


}
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [CATransaction setDisableActions:YES];
    UITouch * touch =[touches anyObject];
    CGPoint point = [touch locationInView:self.upper];
    CGRect frame =maskLayer.frame;
    frame.origin.x =point.x;
    maskLayer.frame=frame;
    
    
//    CGRect frame2 =maskView.frame;
//    frame2.origin.x =point.x;
//    maskView.frame=frame2;

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
