//
//  FirstViewController.h
//  Task1
//
//  Created by KONGA RAJESH on 31/08/17.
//  Copyright © 2017 Og. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController
{

    NSMutableArray *imagesArray;
}

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIPageControl *pageControl;
@property (weak, nonatomic) IBOutlet UIButton *nxtBtn;

@end

