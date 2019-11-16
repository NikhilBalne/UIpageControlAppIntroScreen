//
//  FirstViewController.m
//  Task1
//
//  Created by KONGA RAJESH on 31/08/17.
//  Copyright © 2017 Og. All rights reserved.
//

#import "FirstViewController.h"

int currentPageIndex = 0;
@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    imagesArray = [[NSMutableArray alloc]initWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",nil];
    
    [self setUpSlideImages];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)setUpSlideImages{

    [self.pageControl setNumberOfPages: [imagesArray count]];

    int x=0;
    self.scrollView.pagingEnabled=YES;
    for (int i=0; i<imagesArray.count; i++)
    {
        UIImageView *img=[[UIImageView alloc]initWithFrame:CGRectMake(x, 0,[[UIScreen mainScreen] bounds].size.width, self.scrollView.frame.size.height)];
        img.image=[UIImage imageNamed:[imagesArray objectAtIndex:i]];
        x=x+[[UIScreen mainScreen] bounds].size.width;
        [self.scrollView addSubview:img];
    }
    self.scrollView.contentSize=CGSizeMake(x, self.scrollView.frame.size.height);
    self.scrollView.contentOffset=CGPointMake(0, 0);
}


- (void)scrollViewDidScroll:(UIScrollView *)sender {
    
    CGFloat pageWidth = self.scrollView.frame.size.width;
    int page = floor((self.scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    self.pageControl.currentPage = page;
    currentPageIndex = page;
    
    if (currentPageIndex == 9) {
        [self.nxtBtn setTitle:@"Get Started" forState:UIControlStateNormal];
    }

    
}

- (IBAction)nextButtonAction:(id)sender {
    
    NSInteger pageNumber = currentPageIndex + 1;
    
    CGRect frame = self.scrollView.frame;
    //If your scroll is horizonal
    frame.origin.x = frame.size.width * pageNumber;
    frame.origin.y = 0;
    [self.scrollView scrollRectToVisible:frame animated:YES];
    
    if (pageNumber == 9) {
        [self.nxtBtn setTitle:@"Get Started" forState:UIControlStateNormal];
    }
}

@end
