//
//  MainTabController.m
//  KallyNote
//
//  Created by Zombie on 8/22/14.
//  Copyright (c) 2014 Xcqwan. All rights reserved.
//

#import "MainTabController.h"

@interface MainTabController ()

@property NSArray   *tabs;
@property UIView    *bar;
@property UIView    *slider;
@property UIColor   *btnColor;
@property UIColor   *barBgColor;
@property UIColor   *titleColor;

@end

@implementation MainTabController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _tabs       = [[NSArray alloc] initWithObjects:@"记账", @"账户", @"流水账", @"图表", nil];
    _btnColor   = [[UIColor alloc] initWithRed:125 green:236 blue:198 alpha:1];
    _barBgColor = [[UIColor alloc] initWithRed:251 green:0 blue:0 alpha:1];
    _titleColor = [[UIColor alloc] initWithRed:52 green:156 blue:150 alpha:1];
    
    [self setupViews];
    [self initViewControllers];
}

- (void)setupViews
{
    self.automaticallyAdjustsScrollViewInsets = false;
    self.view.backgroundColor = [UIColor whiteColor];
    self.tabBar.hidden = true;
    
    CGFloat width = self.view.frame.size.width;
    CGFloat height = self.view.frame.size.height;
    _bar    = [[UIView alloc] initWithFrame:CGRectMake(0, height - 49, width, 49)];
    _slider = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 80, 49)];
    _bar.backgroundColor    = _barBgColor;
    _slider.backgroundColor = [UIColor blackColor];
    [_bar addSubview:_slider];
    [self.view addSubview:_bar];
    
    NSInteger count = _tabs.count;
    for (int index = 0; index < count; index++) {
        CGFloat btnWidth = index * 80;
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(btnWidth, 0, 80, 49);
        button.tag = index + 100;
        
        NSString *title = _tabs[index];
        [button setTitle:title forState:UIControlStateNormal];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button setTitleColor:_barBgColor forState:UIControlStateSelected];
        [button addTarget:self action:@selector(tabBarButtonClicked:) forControlEvents:UIControlEventAllTouchEvents];
        
        [_bar addSubview:button];
        if (index == 0) {
            button.selected = true;
        }
    }
}

- (void)initViewControllers
{
    BookKeepingController *view1 = [[BookKeepingController alloc] init];
    
    UIViewController *view2 = [[UIViewController alloc] init];
    view2.view.backgroundColor = [UIColor yellowColor];
    
    UIViewController *view3 = [[UIViewController alloc] init];
    view3.view.backgroundColor = [UIColor greenColor];
    
    UIViewController *view4 = [[UIViewController alloc] init];
    view4.view.backgroundColor = [UIColor purpleColor];
    self.viewControllers = [[NSArray alloc] initWithObjects:view1, view2, view3, view4, nil];
}

- (void)tabBarButtonClicked:(UIButton *)sender
{
    NSInteger index = sender.tag;
    for (int i = 0; i < _tabs.count; i++) {
        UIButton *button = [self.view viewWithTag:(i + 100)];
        if (button.tag == index) {
            button.selected = true;
        } else {
            button.selected = false;
        }
    }
    [UIView animateWithDuration:0.3 animations:^{
        _slider.frame = CGRectMake((index - 100) * 80, 0, 80, 49);
    }];
    self.title = _tabs[index - 100];
    self.selectedIndex = index - 100;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
