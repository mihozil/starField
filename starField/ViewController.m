//
//  ViewController.m
//  starField
//
//  Created by Apple on 12/28/15.
//  Copyright (c) 2015 AMOSC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController{
    CGPoint center;
    CGFloat distance;
    UIImageView *green;
    UIImageView *brown;
    UIImageView *violet;
    UIImageView *red;
    
}

- (void) initproject{
    center = CGPointMake(self.view.bounds.size.width/2, self.view.bounds.size.height/2);
    distance = self.view.bounds.size.width/2 - 50;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initproject];
    [self addstar];
    [self starmove];
}
- (void) addstar{
    green = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"green.png"]];
    red = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"red.png"]];
    violet = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"violet.png"]];
    brown = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"brown.png"]];
    
    green.center = center;
    red.center= center;
    violet.center = center;
    brown.center = center;
    
    [self.view addSubview:green];
    [self.view addSubview:red];
    [self.view addSubview:violet];
    [self.view addSubview:brown];
    
    
}
- (void) starmove{
    [UIView animateWithDuration:1 animations:^{
        green.center = CGPointMake(center.x+distance, center.y-distance);
        red.center = CGPointMake(center.x-distance, center.y-distance);
        violet.center = CGPointMake(center.x -distance, center.y + distance);
        brown.center = CGPointMake(center.x+distance, center.y+distance);
        
    }completion:^(BOOL finished){
        
        [UIView animateWithDuration:1 animations:^{
            green.center = CGPointMake(center.x, center.y-distance);
            red.center = CGPointMake(center.x-distance, center.y);
            violet.center = CGPointMake(center.x, center.y+distance);
            brown.center = CGPointMake(center.x+distance, center.y);
            
        }completion:^(BOOL finished){
           
            [UIView animateWithDuration:2 animations:^{
                green.center = CGPointMake(center.x, center.y);
                red.center = CGPointMake(center.x, center.y);
                violet.center = CGPointMake(center.x, center.y);
                brown.center = CGPointMake(center.x, center.y);
            }completion:^(BOOL finished){
               
                [self performSelector:@selector(starmove) withObject:nil afterDelay:2];
            }];
        }];
        
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
