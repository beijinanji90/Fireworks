//
//  ViewController.m
//  FireWorks
//
//  Created by chenfenglong on 16/10/17.
//  Copyright © 2016年 chenfenglong. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic,strong) CAEmitterLayer *emiterrLayer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initFireworks];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)initFireworks
{
    self.view.backgroundColor = [UIColor blackColor];
    
    self.emiterrLayer = [[CAEmitterLayer alloc] init];
    [self.view.layer addSublayer:self.emiterrLayer];
    self.emiterrLayer.frame = self.view.bounds;
    self.emiterrLayer.emitterPosition = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height - 50);
    self.emiterrLayer.emitterSize = CGSizeMake(20, 20);
    self.emiterrLayer.emitterShape = kCAEmitterLayerLine;
    self.emiterrLayer.emitterMode = kCAEmitterLayerOutline;
    self.emiterrLayer.renderMode = kCAEmitterLayerAdditive;
    self.emiterrLayer.seed = arc4random() % 100;
    self.emiterrLayer.birthRate = 1.0;
    self.emiterrLayer.velocity = 1.0;
    
    //开始发射的
    UIImage *image1 = [UIImage imageNamed:@"FFTspark"];
    CAEmitterCell *emitterCellStart = [[CAEmitterCell alloc] init];
    emitterCellStart.contents = (id)[image1 CGImage];
    emitterCellStart.birthRate = 120;
    // 粒子的颜色
    emitterCellStart.color                      = [[UIColor colorWithRed:0.6
                                                       green:0.6
                                                        blue:0.6
                                                       alpha:1.0] CGColor];
    emitterCellStart.velocity = 300;
    emitterCellStart.velocityRange = 150;
    emitterCellStart.scale = 0.2;
    emitterCellStart.emissionRange = 0.11 * M_PI;
    emitterCellStart.lifetime = 1.15;
    emitterCellStart.spinRange = M_PI;
    emitterCellStart.scale = 0.2;
    emitterCellStart.greenRange = 1.0;
    emitterCellStart.redRange = 1.0;
    emitterCellStart.blueRange = 1.0;
    emitterCellStart.yAcceleration = 75;
    
    
    //爆炸
    CAEmitterCell *burst = [CAEmitterCell emitterCell];
    burst.birthRate = 1.0;
    burst.velocity = 0;
    burst.scale = 2.3;
    burst.redSpeed = -1.5;
    burst.blueSpeed = 1.5;
    burst.greenSpeed = 1.0;
    burst.lifetime = 0.4;
    
//    // 火花 and finally, the sparks
//    CAEmitterCell *spark            = [CAEmitterCell emitterCell];
//    //粒子产生系数，默认为1.0
//    spark.birthRate                 = 400;
//    //速度
//    spark.velocity                  = 125;
//    // 360 deg//周围发射角度
//    spark.emissionRange             = 2 * M_PI;
//    // gravity//y方向上的加速度分量
//    spark.yAcceleration             = 75;
//    //粒子生命周期
//    spark.lifetime                  = 2;
//    //是个CGImageRef的对象,既粒子要展现的图片
//    spark.contents                  = (id)
//    [[UIImage imageNamed:@"FFTspark"] CGImage];
//    //缩放比例速度
//    spark.scaleSpeed                = -0.2;
//    //粒子green在生命周期内的改变速度
//    spark.greenSpeed                = -0.1;
//    //粒子red在生命周期内的改变速度
//    spark.redSpeed                  = 0.4;
//    //粒子blue在生命周期内的改变速度
//    spark.blueSpeed                 = -0.1;
//    //粒子透明度在生命周期内的改变速度
//    spark.alphaSpeed                = -0.25;
//    //子旋转角度
//    spark.spin                      = 2* M_PI;
//    //子旋转角度范围
//    spark.spinRange                 = 2* M_PI;
    
    //火花
    UIImage *image2 = [UIImage imageNamed:@"FFTspark"];
    CAEmitterCell *spark = [[CAEmitterCell alloc] init];
    spark.contents = (id)[image2 CGImage];
    spark.birthRate = 800;
    spark.velocity = 125;
    spark.emissionRange = 2 * M_PI;
    spark.yAcceleration = 75;
    spark.lifetime = 1;
    spark.lifetime = +0.5;
    spark.scaleSpeed = -0.2;
    spark.greenSpeed = -0.1;
    spark.redSpeed = 0.4;
    spark.blueSpeed  = -0.1;
    spark.alphaSpeed  = -0.25;
    spark.spin = 2 * M_PI;
    spark.spinRange = 2 * M_PI;
    spark.color                      = [[UIColor colorWithRed:0.6
                                                        green:0.6
                                                         blue:0.6
                                                        alpha:1.0] CGColor];
    
    self.emiterrLayer.emitterCells = @[emitterCellStart];
    emitterCellStart.emitterCells = @[burst];
//    burst.emitterCells = @[spark];
    
    self.emiterrLayer.emitterCells = @[emitterCellStart,burst];
    
//    self.emiterrLayer.emitterCells = @[spark];
}

@end
