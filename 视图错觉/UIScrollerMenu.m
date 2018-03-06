//
//  UIScrollerMenu.m
//  视图错觉
//
//  Created by macmini2 on 16/8/16.
//  Copyright © 2016年 emiage. All rights reserved.
//

#import "UIScrollerMenu.h"
@interface UIScrollerMenu()
@property (weak, nonatomic) IBOutlet UIScrollView *titleScro;

@end

@implementation UIScrollerMenu
-(void)awakeFromNib{
    NSArray * nibs = [[NSBundle mainBundle]loadNibNamed:@"UIScrollerMenu" owner:self options:0];
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
