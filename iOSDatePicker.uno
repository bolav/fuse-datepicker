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

	IDisposable _valueChangedEvent;
	public iOSDatePicker() : base(Create()) { 
		_valueChangedEvent = UIControlEvent.AddValueChangedCallback(Handle, OnValueChanged);
	}

	[Foreign(Language.ObjC)]
	static ObjC.Object Create()
	@{
		::UIDatePicker* dp = [[UIDatePicker alloc] init];
		return dp;
	@}

	public override void Dispose()
	{
		_valueChangedEvent.Dispose();
		_valueChangedEvent = null;
		base.Dispose();
	}

	void OnValueChanged(ObjC.Object sender, ObjC.Object uiEvent)
	{
		// _host.OnProgressChanged( (double)(Value / 100.0f) );
	}

	// public event ValueChangedHandler<int> DateChanged;

	// [UXValueChangedEvent("SetDate", "DateChanged")]
	public int Date {
		get { return GetDate(Handle); }
		set { SetDate(Handle, value); }
	}

	public void Picked (int picked) {
		debug_log "We picked " + picked;
		SetDate(Handle, picked);
	}

	[Foreign(Language.ObjC)]
	static int GetDate(ObjC.Object handle)
	@{
	    ::UIDatePicker* dp = (::UIDatePicker*)handle;
	    NSDate *chosen = [dp date];
	    int epoch = (int)[chosen timeIntervalSince1970];
	    return epoch;
	@}

	[Foreign(Language.ObjC)]
	static void SetDate(ObjC.Object dp, int dv)
	@{
	    [dp setDate:[NSDate dateWithTimeIntervalSince1970:dv] animated:YES];
	@}

}
