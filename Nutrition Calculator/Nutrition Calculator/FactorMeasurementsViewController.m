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
    
    
    // create the arrays to populate the UIPickerViews
    genderPickerData = @[@"Male", @"Female"];
    
    activityLevelPickerData = @[@"Sedentary", @"Very Light Activity", @"Light Activity", @"Moderate Activity", @"Heavy Activity", @"Extreme Activity"];
    
    goalPickerData = @[@"Extreme Cut", @"Cut", @"Maintain", @"Bulk", @"Extreme Bulk"];
    
    ratioPickerData = @[@"0.8g Protein / lb. Body Weight", @"1.0g Protein / lb. Body Weight", @"1.25g Protein / lb. Body Weight", @"1.5g Protein / lb. Body Weight"];
    
}


//------------------------ UIPickerViewDataSourceDelegate REQUIRED Methods -------------------------------//

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1; // There is only 1 column of choices for each of these Picker Views
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
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if (pickerView == _genderPicker){
        return genderPickerData[row];
    }
    else if (pickerView == _goalPicker){
        return goalPickerData[row];
    }
    else if (pickerView == _activityLevelPicker){
        return activityLevelPickerData[row];
    }
    else if (pickerView == _ratioPicker){
        return ratioPickerData[row];
    }
    return @"blank";
}


- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{

    if (pickerView == _genderPicker){
        _genderChoice = genderPickerData[row];
        //genderPickerData[[_genderPicker selectedRowInComponent:0]];
        NSLog(@"%@",_genderChoice);
    }
    else if (pickerView == _goalPicker){
        switch (row) {
            case 0:
                _goalChoice = -.20;
                break;
            case 1:
                _goalChoice = -.10;
                break;
            case 2:
                _goalChoice = 0.0;
                break;
            case 3:
                _goalChoice = .10;
                break;
            case 4:
                _goalChoice = .20;
                break;
                
            default:
                break;
        }
         NSLog(@"goal factor = %f", _goalChoice);
    }
    else if (pickerView == _activityLevelPicker){
        switch (row) {
            case 0:
                _activityLevelChoice = 1.0;
                break;
            case 1:
                _activityLevelChoice = 1.2;
                break;
            case 2:
                _activityLevelChoice = 1.4;
                break;
            case 3:
                _activityLevelChoice = 1.6;
                break;
            case 4:
                _activityLevelChoice = 1.8;
                break;
            case 5:
                _activityLevelChoice = 2.0;
                break;
                
            default:
                break;
        }
         NSLog(@"activity factor = %f", _activityLevelChoice);
    }
    else if (pickerView == _ratioPicker){
        switch (row) {
            case 0:
                _ratioChoice = 0.8;
                break;
            case 1:
                _ratioChoice = 1.0;
                break;
            case 2:
                _ratioChoice = 1.25;
                break;
            case 3:
                _ratioChoice = 1.5;
                break;

                
            default:
                break;
        }
         NSLog(@"ratio factor = %f", _ratioChoice);
    }

}

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
