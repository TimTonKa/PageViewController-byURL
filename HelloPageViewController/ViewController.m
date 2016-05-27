//
//  ViewController.m
//  HelloPageViewController
//
//  Created by XueXin Tsai on 2016/5/13.
//  Copyright © 2016年 XueXin Tsai. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    self.imageView.image = self.picture;
    // 將字串轉成網址物件
    NSURL * url = [NSURL URLWithString:self.imageURL];
    
    // 取得背景執行緒，並執行 block 中的內容
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        // 下載圖片的bytes
        NSData * imageData = [NSData dataWithContentsOfURL:url];
        
        // 將圖片 bytes 轉成 UIImage
        UIImage * image= [UIImage imageWithData:imageData];
        
        // 切回主執行緒
        dispatch_async(dispatch_get_main_queue(), ^{
            // 將 image 指定給圖片框
            self.imageView.image = image;
        });
    });
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
