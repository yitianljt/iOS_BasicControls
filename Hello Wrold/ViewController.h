//
//  ViewController.h
//  Hello Wrold
//
//  Created by jintao on 14-10-15.
//  Copyright (c) 2014年 jintao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITextViewDelegate,
                                            UITextFieldDelegate,
                                            UIWebViewDelegate,
                                            UIAlertViewDelegate,
                                            UIActionSheetDelegate>
{
    IBOutlet UILabel *label1;
    IBOutlet UISwitch *leftSwitch;
    IBOutlet UISwitch *rightSwitch;
    IBOutlet UISlider *slider;
    IBOutlet UIWebView* webView;
    IBOutlet UIScrollView *scrollView;
    IBOutlet UITextField *textField;
    NSTimer *myTimer;
    IBOutlet UIButton *testAlertView;
    IBOutlet UIButton *testActionSheet;
    IBOutlet UILabel *label2;
    
}

@property (weak,nonatomic) UILabel *label1;
@property (weak,nonatomic) UISwitch *leftSwitch;
@property (weak,nonatomic) UISwitch *rightSwitch;
@property (weak,nonatomic) UISlider *slider;
@property (weak,nonatomic) UIWebView* webView;
@property (weak,nonatomic) UIScrollView *scrollView;
@property (weak,nonatomic) UITextField *textField;
@property (weak,nonatomic) IBOutlet UIActivityIndicatorView *myActivityIndicatorView;
@property (weak,nonatomic) IBOutlet UIProgressView *myProgressView;
@property (weak,nonatomic) UILabel *label2;
@property (weak,nonatomic) IBOutlet UILabel *labelDate;
@property (weak,nonatomic) IBOutlet UIDatePicker *datePicker;


-(IBAction)onClick:(id)sender;
-(IBAction)onWebViewTest:(id)sender;
-(IBAction)valueChange:(id)sender;
-(IBAction)onUpload:(id)sender;
-(IBAction)onDownProgress:(id)sender;
-(void)download:(id)sender;
-(IBAction) onTestAlertView:(id)sender;
-(IBAction) onTestActionSheet:(id)sender;
-(IBAction)save:(id)sender;
-(IBAction)open:(id)sender;
-(IBAction)onClickDate:(id)sender;


//键盘
-(void)keyboardShow :(NSNotification*) noti;
-(void)keyboardHide :(NSNotification*) noti;

//slider
-(void) setValue:(float)value animated:(BOOL) animated;
-(IBAction)sliderValueChange:(id)sender;

//seg
-(IBAction)touchDown:(id)sender;



@end


