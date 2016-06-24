using Uno;
using Uno.UX;
using Uno.Collections;
using Fuse;
using Fuse.Controls;
using Fuse.Controls.Native.iOS;
using Uno.Compiler.ExportTargetInterop;

extern(!iOS) public class iOSDatePicker : Panel {
	public int Date { get; set; }
}

[Require("Source.Include", "UIKit/UIKit.h")]
[ForeignInclude(Language.ObjC, "DatePickerDelegate.h")]
extern(iOS) public class iOSDatePicker : LeafView
{
	public iOSDatePicker() : base(Create()) { }

	[Require("Entity","DatePickerImpl.Picked(int)")]
	[Foreign(Language.ObjC)]
	static ObjC.Object Create()
	@{
		::UIDatePicker* dp = [[UIDatePicker alloc] init];
		// DatePickerDelegate *del = [[DatePickerDelegate alloc] init];
		// [dp addTarget:deleg action:@selector(dateChanged:) forControlEvents:UIControlEventValueChanged];
		// [deleg setDatePicker:_this];
		return dp;

	@}

	public event ValueChangedHandler<int> DateChanged;

	// [UXValueChangedEvent("SetDate", "DateChanged")]
	public int Date {
		get;
		set;
	}

	public void Picked (int picked) {
		debug_log "We picked " + picked;
		SetDate(picked, this);
	}

	public void SetDate(int value, object origin)
	{
		debug_log "SetDate " + value;
		Date = value;
		OnDateChanged(value, origin);
	}

	void OnDateChanged(int value, object orig)
	{
		debug_log "OnDateChanged";
		if (DateChanged != null) {
			debug_log "Calling DateChanged " + DateChanged;
			DateChanged(this, new ValueChangedArgs<int>(value, orig));
		}
	}

}
