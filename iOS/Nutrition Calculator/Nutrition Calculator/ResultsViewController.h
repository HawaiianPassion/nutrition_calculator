//
//  ResultsViewController.h
//  Nutrition Calculator
//
//  Created by Ryson Asuncion on 4/11/15.
//  Copyright (c) 2015 Derp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResultsViewController : UIViewController

// Specified from FactorMeasurementsViewController
@property CGFloat heightChoice;
@property CGFloat weightChoice;
@property NSInteger ageChoice;
@property NSString* genderChoice;
@property CGFloat activityLevelChoice;
@property CGFloat goalChoice;
@property CGFloat ratioChoice;
@property NSInteger BMR;
@property NSInteger adjBMR;



// New properties (labels to display results)
@property (strong, nonatomic) IBOutlet UILabel *BMRresult;
@property (strong, nonatomic) IBOutlet UILabel *adjustedBMRresult;
@property (strong, nonatomic) IBOutlet UILabel *proteinHigh;
@property (strong, nonatomic) IBOutlet UILabel *carbHigh;
@property (strong, nonatomic) IBOutlet UILabel *fatHigh;
@property (strong, nonatomic) IBOutlet UILabel *proteinMed;
@property (strong, nonatomic) IBOutlet UILabel *carbMedium;
@property (strong, nonatomic) IBOutlet UILabel *fatMed;
@property (strong, nonatomic) IBOutlet UILabel *proteinLow;
@property (strong, nonatomic) IBOutlet UILabel *carbLow;
@property (strong, nonatomic) IBOutlet UILabel *fatLow;


// Methods to Calculate Results
-(void)calculateBMR;
-(void)calculatedAdjustedBMR;
-(void)calculateHighDays;
-(void)calculateMediumDays;
-(void)calculateLowDays;

-(NSInteger)calculateProtein;

@end
