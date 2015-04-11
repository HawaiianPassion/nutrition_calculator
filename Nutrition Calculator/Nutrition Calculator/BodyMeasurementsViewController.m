//
//  ViewController.m
//  Nutrition Calculator
//
//  Created by Ryson Asuncion on 4/3/15.
//  Copyright (c) 2015 Derp. All rights reserved.
//

#import "BodyMeasurementsViewController.h"
#import "FactorMeasurementsViewController.h"

@interface BodyMeasurementsViewController (){
    NSArray *heightPickerData;
    NSArray *weightPickerData;
    NSArray *agePickerData;
}
@end

@implementation BodyMeasurementsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    // create the arrays to populate the UIPickerViews
    heightPickerData = @[@[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"],
                         @[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"],
                         @[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"],
                         @[@"."],
                         @[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"],
                         @[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"]];
    
    weightPickerData = @[@[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"],
                         @[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"],
                         @[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"],
                         @[@"."],
                         @[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"],
                         @[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"]];

    agePickerData = @[@[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"],
                      @[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"]];
}



//------------------------ UIPickerViewDataSourceDelegate REQUIRED Methods -------------------------------//


// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    if (pickerView == _heightPicker){
            return heightPickerData.count;
    }
    else if (pickerView == _weightPicker){
        return weightPickerData.count;
    }
    else if (pickerView == _agePicker){
        return agePickerData.count;
    }
    return 1;
}



// returns the # of rows in each component.
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (pickerView == _heightPicker){
        switch (component) {
            case 0:
                return 10;
                break;
            case 1:
                return 10;
                break;
            case 2:
                return 10;
                break;
            case 3:
                return 1;
                break;
            case 4:
                return 10;
                break;
            case 5:
                return 10;
                break;
            default:
                break;
        }
    }
    else if (pickerView == _weightPicker){
        switch (component) {
            case 0:
                return 10;
                break;
            case 1:
                return 10;
                break;
            case 2:
                return 10;
                break;
            case 3:
                return 1;
                break;
            case 4:
                return 10;
                break;
            case 5:
                return 10;
                break;
            default:
                break;
        }
    }
    else if (pickerView == _agePicker){
        switch (component) {
            case 0:
                return 10;
                break;
            case 1:
                return 10;
                break;
        }
    }
    return 0;
}

//--------------------------------------------------------------------------------------------------------//




//------------------------ UIPickerViewDelegate Methods -------------------------------------------------//


// The data to return for the row and component (column) that's being passed in
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (pickerView == _heightPicker){
        return heightPickerData[component][row];
    }
    else if (pickerView == _weightPicker){
        return weightPickerData[component][row];
    }
    else if (pickerView == _agePicker){
        return agePickerData[component][row];
    }
    return @"blank";

}


// The set width for each column in a PickerView
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component{
    return 25;
}



// Defines what will happen when a value is changed in any of the Picker Views
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    NSLog(@"selected row %ld", (long)row);
    
    if (pickerView == _heightPicker){

        // Save all of the selected row values for each column
        NSInteger firstCompRow = [_heightPicker selectedRowInComponent:0];
        NSInteger secondCompRow = [_heightPicker selectedRowInComponent:1];
        NSInteger thirdCompRow = [_heightPicker selectedRowInComponent:2];
        NSInteger fifthCompRow = [_heightPicker selectedRowInComponent:4];
        NSInteger sixthCompRow = [_heightPicker selectedRowInComponent:5];
        
        
        // Construct the appropriate value for the picker using its component values
        _heightChoice = firstCompRow*100 + secondCompRow*10 + thirdCompRow + fifthCompRow*.1 + sixthCompRow*.01;
        NSLog(@"height value = %f", _heightChoice);
    }
    
    else if (pickerView == _weightPicker){
        NSInteger firstCompRow = [_weightPicker selectedRowInComponent:0];
        NSInteger secondCompRow = [_weightPicker selectedRowInComponent:1];
        NSInteger thirdCompRow = [_weightPicker selectedRowInComponent:2];
        NSInteger fifthCompRow = [_weightPicker selectedRowInComponent:4];
        NSInteger sixthCompRow = [_weightPicker selectedRowInComponent:5];
        
        _weightChoice = firstCompRow*100 + secondCompRow*10 + thirdCompRow + fifthCompRow*.1 + sixthCompRow*.01;
        NSLog(@"weight value = %f", _weightChoice);
    }
    else if (pickerView == _agePicker){
        NSInteger firstCompRow = [_agePicker selectedRowInComponent:0];
        NSInteger secondCompRow = [_agePicker selectedRowInComponent:1];
        
        _ageChoice = firstCompRow*10 + secondCompRow;
        NSLog(@"age value = %ld", (long)_ageChoice);
    }
    
}


//--------------------------------------------------------------------------------------------------------//




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation
// called when a segue is triggered.  does initial setup just before moving to another storyboard scene
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"toSecondPage"]) {
        
        // create an instance of the next (destination) view controller
        FactorMeasurementsViewController *destViewController = segue.destinationViewController;
        
        // pass the current values of the pickers to the destination view controller
        destViewController.heightChoice = _heightChoice;
        destViewController.weightChoice = _weightChoice;
        destViewController.ageChoice = _ageChoice;
    }
}
@end
