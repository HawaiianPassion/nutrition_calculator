//
//  ViewController.h
//  Nutrition Calculator
//
//  Created by Ryson Asuncion & Sean Pierson on 4/3/15.
//  Copyright (c) 2015 Derp. All rights reserved.
//

//  This View Controller will be initial scene!!!
/**
 
 This application is a calculator for a carb-cycling style of dieting used by many individuals involved
 in fitness and athletics.  The calculator uses the formulas described in the online article found at:
 
 https://www.t-nation.com/diet-fat-loss/carb-cycling-codex
 
 The results outputed by the calculator will suggest recommended amounts (in grams) of carbohydrates,
 protiens, and fats that should be consumed by an individual on certain days depending on a variety of
 measurements
 
 **/
 

#import <UIKit/UIKit.h>

@interface BodyMeasurementsViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>

//--- UIPickerViews -----------------------------------------------//
@property (strong, nonatomic) IBOutlet UIPickerView *heightPicker;


@property (strong, nonatomic) IBOutlet UIPickerView *weightPicker;


@property (strong, nonatomic) IBOutlet UIPickerView *agePicker;

//----------------------------------------------------------------//

// New Properties
@property CGFloat heightChoice;
@property CGFloat weightChoice;
@property NSInteger ageChoice;


@end

