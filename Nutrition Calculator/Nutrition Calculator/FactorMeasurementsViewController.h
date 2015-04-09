//
//  FactorMeasurementsViewController.h
//  Nutrition Calculator
//
//  Created by Ryson Asuncion on 4/7/15.
//  Copyright (c) 2015 Derp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FactorMeasurementsViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>

// specified from BodyMeasurementsViewController
@property CGFloat heightChoice;
@property CGFloat weightChoice;
@property NSInteger ageChoice;

// new properties
@property NSString* gender;
@property NSString* activityLevel;
@property NSString* goal;
@property NSString* proteinRatio;

// UIPickerViews
@property (strong, nonatomic) IBOutlet UIPickerView *genderPicker;
@property (strong, nonatomic) IBOutlet UIPickerView *goalPicker;
@property (strong, nonatomic) IBOutlet UIPickerView *activityLevelPicker;
@property (strong, nonatomic) IBOutlet UIPickerView *ratioPicker;



@end
