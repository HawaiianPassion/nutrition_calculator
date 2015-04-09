//
//  FactorMeasurementsViewController.m
//  Nutrition Calculator
//
//  Created by Ryson Asuncion on 4/7/15.
//  Copyright (c) 2015 Derp. All rights reserved.
//

#import "FactorMeasurementsViewController.h"

@interface FactorMeasurementsViewController (){
    NSArray *genderPickerData;
    NSArray *goalPickerData;
    NSArray *activityLevelPickerData;
    NSArray *ratioPickerData;
}

@end


@implementation FactorMeasurementsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    genderPickerData = @[@"male", @"female"];
    activityLevelPickerData = @[@"Sedentary", @"Very Light Activity", @"Light Activity", @"Moderate Activity", @"Heavy Activity", @"Extreme Activity"];
    goalPickerData = @[@"Extreme Cut", @"Cut", @"Maintain", @"Bulk", @"Extreme Bulk"];
    ratioPickerData = @[@"0.8g Protein / lb. Body Weight", @"1.0g Protein / lb. Body Weight", @"1.25g Protein / lb. Body Weight", @"1.5g Protein / lb. Body Weight"];
    
}


//------------------------ UIPickerViewDataSourceDelegate REQUIRED Methods -------------------------------//

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

// returns the # of rows in each component.
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (pickerView == _genderPicker){
        return 2;
    }
    else if (pickerView == _goalPicker){
        return 5;
    }
    else if (pickerView == _activityLevelPicker){
        return 6;
    }
    else if (pickerView == _ratioPicker){
        return 4;
    }
    return 0;
}


//-------------------------------------------------------------------------------------------------------//




//------------------------ UIPickerViewDelegate Methods -------------------------------------------------//

// The data to return for the row and component (column) that's being passed in
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (pickerView == _genderPicker){
     //   NSLog(@"initiating genderPicker");
        return genderPickerData[row];
    }
    else if (pickerView == _goalPicker){
        NSLog(@"initiating goalPicker");
        return goalPickerData[row];
    }
    else if (pickerView == _activityLevelPicker){
     //   NSLog(@"initiating acitivyLevelPicker");
        return activityLevelPickerData[row];
    }
    else if (pickerView == _ratioPicker){
     //   NSLog(@"initiating ratioPicker");
        return ratioPickerData[row];
    }
    return @"blank";
}


//- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component{
//    if (pickerView == _ratioPicker){
//     return 700;
//    }
//    return 400;
//}

//- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
//    if (pickerView == _ratioPicker){
//        return 200;
//    }
//    return 100;
//}


//- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
//
//}
//-------------------------------------------------------------------------------------------------------//




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//#pragma mark - Navigation

//// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    // Get the new view controller using [segue destinationViewController].
//    // Pass the selected object to the new view controller.
//}


@end
