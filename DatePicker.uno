using Uno;
using Uno.Collections;
using Fuse;
using Fuse.Scripting;
using Uno.Compiler.ExportTargetInterop;

public class DatePicker : NativeModule
{
	public DatePicker () {
		AddMember(new NativeFunction("show", (NativeCallback)Show));
	}

	object Show (Context c, object[] args) {
		if defined(iOS) {
			ShowiOS(iOS.UIKit.UIApplication._sharedApplication().KeyWindow);
		}
		return null;
	}

	extern (iOS) ObjC.ID dp;
	[Foreign(Language.ObjC)]
	extern (iOS) void ShowiOS (iOS.UIKit.UIWindow uiw) 
	@{
		@{iOS.UIKit.UIWindow} unowin = (@{iOS.UIKit.UIWindow}) [uiw unoObject];
		id uiw_id = unowin->Handle();
		UIWindow *uiww = (UIWindow *)uiw_id;
		UIDatePicker *datePicker =[[UIDatePicker alloc]initWithFrame:CGRectMake(0, uiww.frame.size.height, uiww.frame.size.width, uiww.frame.size.height)];
		// dp = (id)datePicker;
		datePicker.datePickerMode=UIDatePickerModeDate;
		datePicker.hidden=NO;
		datePicker.date=[NSDate date];
		// 	[datePicker addTarget:uivc_id action:@selector(LabelTitle:) forControlEvents:UIControlEventValueChanged];
		// [uivc_id setView:datePicker];
		// [uiw_id addSubview:datePicker];
	@}
}
