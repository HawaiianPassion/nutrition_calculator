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



- (CGFloat)calculateBMR{
    return _heightChoice + _weightChoice + _ageChoice;
}



//------------------------ UIPickerViewDataSourceDelegate REQUIRED Methods -------------------------------//


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




//------------------------ UIPickerViewDelegate OPTIONAL Methods -----------------------------------------//


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



- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component{
    return 25;
}




- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    NSLog(@"selected row %ld", (long)row);
    
    if (pickerView == _heightPicker){
        NSInteger firstCompRow = [_heightPicker selectedRowInComponent:0];
        NSInteger secondCompRow = [_heightPicker selectedRowInComponent:1];
        NSInteger thirdCompRow = [_heightPicker selectedRowInComponent:2];
        NSInteger fifthCompRow = [_heightPicker selectedRowInComponent:4];
        NSInteger sixthCompRow = [_heightPicker selectedRowInComponent:5];
        
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

- (IBAction)continueButton:(id)sender {
}


#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"toSecondPage"]) {
        //NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        FactorMeasurementsViewController *destViewController = segue.destinationViewController;
        destViewController.heightChoice = _heightChoice;
    }
}
@end
