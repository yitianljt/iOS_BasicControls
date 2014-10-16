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
    self.scrollView.contentSize = CGSizeMake(320, 600);
    self.textField.delegate = self;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreasted.
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
    NSDictionary* info = [noti userInfo];
    NSValue* aValue = [info objectForKey:UIKeyboardFrameBeginUserInfoKey];
    CGSize keyboardSize = [aValue CGRectValue].size;
    
    CGRect viewFrame = self.scrollView.frame;
    viewFrame.size.height -=(keyboardSize.height);
    self.scrollView.frame = viewFrame;
    
    CGRect textFieldRect = [self.textField frame];
    [self.scrollView scrollRectToVisible:textFieldRect animated:YES];
    
    
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
    NSLog(@"seg=%ld",(long)[seg selectedSegmentIndex]);
    
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

-(IBAction)onWebViewTest:(id)sender
{
    NSURL * url = [NSURL URLWithString:@"http://www.baidu.com"];
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
    self.webView.delegate = self;
    
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    NSLog(@"webViewDidFinishLoad");
}


-(IBAction)onUpload:(id)sender
{
    if ([self.myActivityIndicatorView isAnimating]) {
        [self.myActivityIndicatorView stopAnimating];
    }
    else
    {
        [self.myActivityIndicatorView startAnimating];
    }
}

-(IBAction)onDownProgress:(id)sender
{
    myTimer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                               target:self
                                             selector:@selector(download:)
                                             userInfo:nil
                                              repeats:YES];
    self.myProgressView.progress =0.0;
}

-(void)download:(id)sender
{
    self.myProgressView.progress = self.myProgressView.progress+0.1;
    if (self.myProgressView.progress == 1.0) {
        [myTimer invalidate];
        UIAlertView* alertView = [[UIAlertView alloc]initWithTitle:@"DownLoad Com" message:@"" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [alertView show];
    }
}


@end
