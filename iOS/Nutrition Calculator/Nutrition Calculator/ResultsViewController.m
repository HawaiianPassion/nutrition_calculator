//
//  ResultsViewController.m
//  Nutrition Calculator
//
//  Created by Ryson Asuncion on 4/11/15.
//  Copyright (c) 2015 Derp. All rights reserved.
//

#import "ResultsViewController.h"

@interface ResultsViewController ()

@end

@implementation ResultsViewController{
    NSInteger gramsProtein;
    NSInteger gramsCarbsHigh;
    NSInteger gramsCarbsMed;
    NSInteger gramsCarbsLow;
    CGFloat poundWeight;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self calculateBMR];
    [self calculatedAdjustedBMR];
    [self calculateHighDays];
    [self calculateMediumDays];
    [self calculateLowDays];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// --------------------------------------- New Methods ------------------------------------------//


-(void)calculateBMR{
    // For Men
    // BMR = 66 + (13.7 x weight in kg) + (5 x height in cm) - (6.8 x age)
    if ([_genderChoice  isEqual: @"Male"]){
        _BMR = 66 + (13.7 * _weightChoice) + (5 * _heightChoice) - (6.8 * _ageChoice);
        _BMRresult.text = [NSString stringWithFormat:@"%ld", (long)_BMR];
    }
    // For Women
    // 655 + (9.6 x weight in kg) + (1.7 x height in cm) - (4.7 x age)
    else{
        _BMR = 655 + (9.6 * _weightChoice) + (1.7 * _heightChoice) - (4.7 * _ageChoice);
        _BMRresult.text = [NSString stringWithFormat:@"%ld", (long)_BMR];
    }
}


-(void)calculatedAdjustedBMR{
    _adjBMR = _BMR * _activityLevelChoice;
    int extra = _adjBMR * _goalChoice;
    _adjBMR += extra;
    _adjustedBMRresult.text = [NSString stringWithFormat:@"%ld" ,(long)_adjBMR];
}


-(void)calculateHighDays{
    _proteinHigh.text = [NSString stringWithFormat:@"≈ %ld grams", (long)[self calculateProtein]];
    _carbHigh.text = [ NSString stringWithFormat:@"≈ %ld grams", (long)[self calculateCarbs:_carbHigh]];
    _fatHigh.text = [ NSString stringWithFormat:@"≈ %ld grams", (long)[self calculateFat:_fatHigh]];
}


-(void)calculateMediumDays{
    _proteinMed.text = [NSString stringWithFormat:@"≈ %ld grams", (long)[self calculateProtein]];
    _carbMedium.text = [ NSString stringWithFormat:@"≈ %ld grams", (long)[self calculateCarbs:_carbMedium]];
    _fatMed.text = [ NSString stringWithFormat:@"≈ %ld grams", (long)[self calculateFat:_fatMed]];
}


-(void)calculateLowDays{
    _proteinLow.text = [NSString stringWithFormat:@"≈ %ld grams", (long)[self calculateProtein]];
    _carbLow.text = [ NSString stringWithFormat:@"≈ %ld grams", (long)[self calculateCarbs:_carbLow]];
    _fatLow.text = [ NSString stringWithFormat:@"≈ %ld grams", (long)[self calculateFat:_fatLow]];
}

-(NSInteger)calculateProtein{
    poundWeight = 2.20462262 * _weightChoice;
    gramsProtein = _ratioChoice * poundWeight;
    return gramsProtein;
}

-(NSInteger)calculateCarbs: (UILabel*) day{
    if (_goalChoice <= 0){
        gramsCarbsMed = 1.25 * poundWeight;
    }
    else{
        gramsCarbsMed = gramsProtein;
    }
    
    
    if (day == _carbMedium){
        return gramsCarbsMed;
    }
    else if (day == _carbHigh){
        gramsCarbsHigh = gramsCarbsMed * 1.25;
        return gramsCarbsHigh;
    }
    else if (day == _carbLow){
        gramsCarbsLow = gramsCarbsMed * .75;
        return gramsCarbsLow;
    }
    
    return 0; // shouldn't get here either
}

-(NSInteger)calculateFat: (UILabel*) day{
    NSInteger leftoverCals = _adjBMR ;
    leftoverCals = leftoverCals - (4*gramsProtein + 4*gramsCarbsMed);
    return leftoverCals/9;
}

// ----------------------------------------------------------------------------------------------//

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
