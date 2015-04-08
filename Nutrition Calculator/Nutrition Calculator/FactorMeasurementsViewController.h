//
//  FactorMeasurementsViewController.h
//  Nutrition Calculator
//
//  Created by Ryson Asuncion on 4/7/15.
//  Copyright (c) 2015 Derp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FactorMeasurementsViewController : UIViewController 

@property CGFloat heightChoice;
@property CGFloat weightChoice;
@property NSInteger ageChoice;

-(CGFloat)calculateBMR;

@end
