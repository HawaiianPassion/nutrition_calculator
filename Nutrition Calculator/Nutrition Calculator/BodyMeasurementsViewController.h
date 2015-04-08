//
//  ViewController.h
//  Nutrition Calculator
//
//  Created by Ryson Asuncion on 4/3/15.
//  Copyright (c) 2015 Derp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BodyMeasurementsViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>

@property (strong, nonatomic) IBOutlet UIPickerView *heightPicker;


@property (strong, nonatomic) IBOutlet UIPickerView *weightPicker;


@property (strong, nonatomic) IBOutlet UIPickerView *agePicker;


- (IBAction)continueButton:(id)sender;

@property CGFloat heightChoice;
@property CGFloat weightChoice;
@property NSInteger ageChoice;

-(CGFloat)calculateBMR;

@end

