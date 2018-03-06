//
//  ViewController.m
//  视图错觉
//
//  Created by macmini2 on 16/8/15.
//  Copyright © 2016年 emiage. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    CALayer * maskLayer ;
}
@property (weak, nonatomic) IBOutlet UIImageView *backIV;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    
    maskLayer = [[CALayer alloc]init];
    maskLayer.frame = CGRectMake(0,0, 200, 200);
    maskLayer.position=self.view.center;
    maskLayer.cornerRadius =100;
//    maskLayer.backgroundColor = [UIColor redColor].CGColor;
    maskLayer.contents =(id)[UIImage imageNamed:@"mask_image"].CGImage;
    self.backIV.layer.mask = maskLayer;
}


-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [CATransaction setDisableActions:YES];//禁止隐式事务动画
    UITouch * touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.backIV];
    maskLayer.position = point;

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
