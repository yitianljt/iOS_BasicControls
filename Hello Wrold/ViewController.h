//
//  ViewController.h
//  Hello Wrold
//
//  Created by jintao on 14-10-15.
//  Copyright (c) 2014年 jintao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITextViewDelegate,UITextFieldDelegate,UIWebViewDelegate>
{
    IBOutlet UILabel *label1;
    IBOutlet UISwitch *leftSwitch;
    IBOutlet UISwitch *rightSwitch;
    IBOutlet UISlider *slider;
    IBOutlet UIWebView* webView;
    IBOutlet UIScrollView *scrollView;
    IBOutlet UITextField *textField;
}

@property (weak,nonatomic) UILabel *label1;
@property (weak,nonatomic) UISwitch *leftSwitch;
@property (weak,nonatomic) UISwitch *rightSwitch;
@property (weak,nonatomic) UISlider *slider;
@property (weak,nonatomic) UIWebView* webView;
@property (weak,nonatomic) UIScrollView *scrollView;
@property (weak,nonatomic) UITextField *textField;

-(IBAction)onClick:(id)sender;
-(IBAction)onWebViewTest:(id)sender;
-(IBAction)valueChange:(id)sender;


//键盘
-(void)keyboardShow :(NSNotification*) noti;
-(void)keyboardHide :(NSNotification*) noti;

//slider
-(void) setValue:(float)value animated:(BOOL) animated;
-(IBAction)sliderValueChange:(id)sender;


//seg
-(IBAction)touchDown:(id)sender;



@end


