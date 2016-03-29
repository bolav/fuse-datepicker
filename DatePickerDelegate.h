//
//  TakePictureTask.h
//  GalleryLibrary
//
//  Created by Bjørn-Olav Solum Strand on 22/03/16.
//
//

#import <Foundation/Foundation.h>
#include <uObjC.Foreign.h>

@interface DatePickerDelegate : NSObject

@property (nonatomic, retain) id<UnoObject> datePicker;

-(void) dateChanged:(id)sender;

@end
