//
//  TakePictureTask.m
//  GalleryLibrary
//
//  Created by Bjørn-Olav Solum Strand on 22/03/16.
//
//

#import "DatePickerDelegate.h"
@{DatePickerImpl:IncludeDirective}

@implementation DatePickerDelegate

-(void) dateChanged:(id)sender {
    @{DatePickerImpl:Of(self.datePicker).Picked(int):Call([[sender date] timeIntervalSince1970])};
}

@end
