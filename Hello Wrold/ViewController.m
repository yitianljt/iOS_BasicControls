//
//  ViewController.m
//  Hello Wrold
//
//  Created by jintao on 14-10-15.
//  Copyright (c) 2014年 jintao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Button
-(IBAction)onClick:(id)sender{
    [self.label1 setText:@"Hello World!"];
}


//TextField、TextView
-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

-(BOOL) textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    
    return YES;
}

-(void) viewWillAppear:(BOOL)animated{
    //注册键盘显示通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardShow:) name:UIKeyboardDidShowNotification object:nil];
    
    //注册键盘消失通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardHide:) name:UIKeyboardDidHideNotification object:nil];
}

-(void)keyboardShow :(NSNotification*) noti{
    NSLog(@"show keyboard");
}

-(void)keyboardHide :(NSNotification*) noti{
    NSLog(@"Hide keyboard");

}


@end
