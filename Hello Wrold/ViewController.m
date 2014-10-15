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

-(IBAction)valueChange:(id)sender{
    UISwitch *s = (UISwitch *)sender;
    BOOL setting = s.isOn;
    NSLog(@"%d",s.isOn);
    [self.leftSwitch setOn:setting animated:YES];
    [self.rightSwitch setOn:setting animated:YES];
    
}

-(void) setValue:(float)value animated:(BOOL) animated{

}

-(IBAction)sliderValueChange:(id)sender{
    UISlider *sld = (UISlider *)sender;
    NSLog(@"slider=%f",[sld value]);
}

-(IBAction)touchDown:(id)sender
{
    UISegmentedControl * seg = (UISegmentedControl*)sender;
    //[seg _selectedSegment];
    NSLog(@"seg=%ld",[seg selectedSegmentIndex]);
    
    if ([seg selectedSegmentIndex] ==1) {
        self.leftSwitch.hidden = NO;
        self.rightSwitch.hidden = NO;
    }
    else
    {
        self.leftSwitch.hidden = YES;
        self.rightSwitch.hidden = YES;
    }
    
}



@end
