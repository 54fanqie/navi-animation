//
//  SecondViewController.m
//  视图错觉
//
//  Created by macmini2 on 16/8/15.
//  Copyright © 2016年 emiage. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()
@property (strong, nonatomic)  UIView *maskView;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImageView * grayIV = [[UIImageView alloc]initWithFrame:self.view.bounds];
    grayIV.image = [UIImage imageNamed:@"3fab7c0624337aeead4303767a893849副本"];
    [self.view addSubview:grayIV];
    
    
    self.maskView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    self.maskView.center = self.view.center;
    self.maskView.clipsToBounds = YES;
    self.maskView.layer.cornerRadius =100;
    [self.view addSubview:self.maskView];
    
 
    
    
    UIImageView * iv =[[UIImageView alloc]init];
    iv.translatesAutoresizingMaskIntoConstraints =NO;
    iv.image = [UIImage imageNamed:@"3fab7c0624337aeead4303767a893849"];
    [self.maskView addSubview:iv];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:iv
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeTop
                                                         multiplier:1
                                                           constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:iv
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1
                                                           constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:iv
                                                          attribute:NSLayoutAttributeLeading
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeLeading
                                                         multiplier:1
                                                           constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:iv
                                                          attribute:NSLayoutAttributeTrailing
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeTrailing
                                                         multiplier:1
                                                           constant:0]];
    
    
//    UIImageView * back =[[UIImageView alloc]initWithFrame:self.maskView.bounds];
//    back.image = [UIImage imageNamed:@"mask_image"];
//    [self.maskView addSubview:back];
//    [self.maskView bringSubviewToFront:back];
    
}
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    self.maskView.center = [[touches anyObject] locationInView:self.view];
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
