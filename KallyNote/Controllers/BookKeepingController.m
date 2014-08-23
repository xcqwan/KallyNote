//
//  BookKeepingController.m
//  KallyNote
//
//  Created by Zombie on 8/22/14.
//  Copyright (c) 2014 Xcqwan. All rights reserved.
//

#import "BookKeepingController.h"

@interface BookKeepingController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *typeSegmentedControl;
@property (weak, nonatomic) IBOutlet UIButton *dateTimeButton;
@property (weak, nonatomic) IBOutlet UILabel *costTypeLabel;
@property (weak, nonatomic) IBOutlet UIButton *costTypeButton;
@property (weak, nonatomic) IBOutlet UILabel *payTypeLabel;
@property (weak, nonatomic) IBOutlet UIButton *payTypeButton;
@property (weak, nonatomic) IBOutlet UILabel *costLabel;
@property (weak, nonatomic) IBOutlet UITextField *costTextField;
@property (weak, nonatomic) IBOutlet UILabel *helpPayLabel;
@property (weak, nonatomic) IBOutlet UITextField *helpPayTextField;
@property (weak, nonatomic) IBOutlet UITextView *markerTextView;

@end

@implementation BookKeepingController

- (IBAction)markDown:(id)sender {
    
}

- (IBAction)selectChange:(id)sender {
    [_costTextField resignFirstResponder];
    [_markerTextView resignFirstResponder];
    [_helpPayTextField resignFirstResponder];
    NSInteger index = _typeSegmentedControl.selectedSegmentIndex;
    
    if (index == 0) {
        [UIView animateWithDuration:0.3 animations:^{
            _costTypeLabel.text = @"消费类别";
            [_costTypeButton setTitle:@"点击选择" forState:UIControlStateNormal];
            _payTypeLabel.text = @"付费方式";
            [_payTypeButton setTitle:@"点击选择" forState:UIControlStateNormal];
            _costLabel.text = @"消费金额";
            _helpPayLabel.hidden = true;
            _helpPayTextField.hidden = true;
        }];
    } else if (index == 1) {
        [UIView animateWithDuration:0.3 animations:^{
            _costTypeLabel.text = @"收入类别";
            [_costTypeButton setTitle:@"点击选择" forState:UIControlStateNormal];
            _payTypeLabel.text = @"收入方式";
            [_payTypeButton setTitle:@"点击选择" forState:UIControlStateNormal];
            _costLabel.text = @"金额";
            _helpPayLabel.hidden = true;
            _helpPayTextField.hidden = true;
        }];
    } else {
        [UIView animateWithDuration:0.3 animations:^{
            _costTypeLabel.text = @"类别";
            [_costTypeButton setTitle:@"点击选择" forState:UIControlStateNormal];
            _payTypeLabel.text = @"付费方式";
            [_payTypeButton setTitle:@"点击选择" forState:UIControlStateNormal];
            _costLabel.text = @"金额";
            _helpPayLabel.hidden = false;
            _helpPayTextField.hidden = false;
        }];
    }
}

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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
