//
//  LandingViewController.m
//  HelloPageViewController
//
//  Created by XueXin Tsai on 2016/5/13.
//  Copyright © 2016年 XueXin Tsai. All rights reserved.
//

#import "LandingViewController.h"
#import "ViewController.h" //專門放照片的 viewcontroller

static NSString * image1 = @"http://rack.0.mshcdn.com/media/ZgkyMDEzLzA3LzAyL2Q2L25ld3lvcmtjaXR5LjRlNDRjLmpwZwpwCXRodW1iCTk1MHg1MzQjCmUJanBn/d597b3a0/7f4/new-york-city.jpg";
static NSString * image2 = @"http://www.travellink.com/images/PC/destination/topic_large/new_york.jpg";
static NSString * image3 = @"http://www.themusehotel.com/design/images/930-481/nyc-skyline.jpg";
static NSString * image4 = @"http://www.bertelsmann.com/media/unternehmen/corporate-center/corporate-center-new-york_article_landscape_gt_1200_grid.jpg";


@interface LandingViewController ()<UIPageViewControllerDataSource>
@property (nonatomic,strong) NSArray * viewcontrollers;
@property (nonatomic,strong) UIPageViewController * pageViewController;
@end

@implementation LandingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIPageControl * pageControl = [UIPageControl appearance];
    pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
    pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
    pageControl.backgroundColor = [[UIColor alloc] initWithRed:0 green:0 blue:0 alpha:1];
    
    // 建立第一個 ViewController，裡面放第一張圖片
    ViewController * vc1 = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
//    UIImage * image1 = [UIImage imageNamed:@"1.jpg"];
//    vc1.picture = image1;
    vc1.imageURL = image1;
    
    // 建立第二個 ViewController，裡面放第二張圖片
    ViewController * vc2 = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
//    UIImage * image2 = [UIImage imageNamed:@"2.jpg"];
//    vc2.picture = image2;
    vc2.imageURL = image2;
    
//    // 建立第三個 ViewController，裡面放第三張圖片
    ViewController * vc3 = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
//    UIImage * image3 = [UIImage imageNamed:@"3.jpg"];
//    vc3.picture = image3;
    vc3.imageURL = image3;
    
//    // 建立第四個 ViewController，裡面放第四張圖片
    ViewController * vc4 = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
//    UIImage * image4 = [UIImage imageNamed:@"4.jpg"];
//    vc4.picture = image4;
    vc4.imageURL = image4;
    
//    // 將上面建立的四個 ViewController 物件都放到一個 Array 裡
    self.viewcontrollers = @[vc1,vc2,vc3,vc4];
    
    // PageViewController(容器) 初始化
    self.pageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageViewController"];
    
    //  指定 PageViewController 的 delegate
    self.pageViewController.dataSource = self;
    
    // 指派第一個 viewcontroller 物件給 PageViewController
    [self.pageViewController setViewControllers:@[self.viewcontrollers[0]] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    // 將 PageViewController 的畫面加上來
    // 加入畫面
    [self.view addSubview:self.pageViewController.view];
}

#pragma mark - UIPageViewController Datasource
-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    // 檢查使用者目前看到的畫面，是在我們陣列裡面的第幾個物件
    NSInteger index = [self.viewcontrollers indexOfObject:viewController];
    
    // 如果使用者看到的畫面是陣列裡的第 0 個，或是找不到的話，就回傳 nil
    if (index == 0 || (index == NSNotFound)) {
        return nil;
    }
    
    // 如果非以上狀況，代表前面有東西可以顯示，故將 index-1
    index--;
    return [self.viewcontrollers objectAtIndex:index];
}

-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    // 檢查使用者目前看到的畫面，是在我們陣列裡面的第幾個物件
    NSInteger index = [self.viewcontrollers indexOfObject:viewController];
    
    // 如果找不到的話，就回傳 nil
    if (index == NSNotFound) {
        return nil;
    }
    
    // 將 index+1，準備拿下一個 viewcontroller 物件
    index++;
    
    // 在拿之前，先確認一下沒有超過陣列的範圍，否則會 crash。如果超過的話，回傳 nil
    if (index == [self.viewcontrollers count]) {
        return nil;
    }
    
    return [self.viewcontrollers objectAtIndex:index];

}

-(NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return [self.viewcontrollers count];
}

-(NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return 0;
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
