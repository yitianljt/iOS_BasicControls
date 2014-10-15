//
//  ViewController.h
//  Hello Wrold
//
//  Created by jintao on 14-10-15.
//  Copyright (c) 2014年 jintao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    IBOutlet UILabel *label1;
}
@property (weak,nonatomic) UILabel *label1;
-(IBAction)onClick:(id)sender;

@end

