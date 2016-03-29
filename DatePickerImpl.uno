using Uno;
using Uno.UX;
using Fuse;
using iOS.UIKit;
using Uno.Compiler.ExportTargetInterop;

[ForeignInclude(Language.ObjC, "DatePickerDelegate.h")]
[TargetSpecificImplementation]
extern (iOS)
public class DatePickerImpl : Fuse.iOS.Controls.Control<iOSDatePicker>
{
	iOS.UIKit.UIView _view;
	ObjC.ID _viewid;
	ObjC.ID _delegate;

	internal override UIView CreateInternal()
	{
		if (_view == null)
		{
			_viewid = CreateView();
			_delegate = CreateDelegate();
			SetDelegate(_viewid, _delegate);
			_view = new iOS.UIKit.UIView(_viewid);
		}
		return _view;
	}

	public void Picked (int picked) {
		debug_log "We picked " + picked;
		SemanticControl.Date = picked;
	}

	[Foreign(Language.ObjC)]
	public ObjC.ID CreateView ()
	@{
		UIDatePicker *myPicker = [[UIDatePicker alloc] init];
		return myPicker;
	@}

	[Require("Entity","DatePickerImpl.Picked(int)")]
	[Foreign(Language.ObjC)]
	public ObjC.ID CreateDelegate ()
	@{
		DatePickerDelegate *del = [[DatePickerDelegate alloc] init];
		return del;
	@}

	[Foreign(Language.ObjC)]
	public void SetDelegate (ObjC.ID dp, ObjC.ID deleg)
	@{
		[dp addTarget:deleg action:@selector(dateChanged:) forControlEvents:UIControlEventValueChanged];
		[deleg setDatePicker:_this];
	@}

	[Foreign(Language.ObjC)]
	public void SetDate (ObjC.ID dp, int dv)
	@{
		[dp setDate:[NSDate dateWithTimeIntervalSince1970:dv] animated:YES];
	@}

	protected override void Attach()
	{
		CreateInternal();
		SetDate(_viewid, SemanticControl.Date);
		SemanticControl.DateChanged += OnDateChanged;

	}

	protected override void Detach()
	{
		SemanticControl.DateChanged -= OnDateChanged;
	}

	public override float2 GetMarginSize( LayoutParams lp ) {
		return float2(250);
	}

	void OnDateChanged(object sender, ValueChangedArgs<int> args)
	{
		SetDate(_viewid, args.Value);
	}

}

extern (!iOS) public class DatePickerImpl : Fuse.iOS.Controls.Control<iOSDatePicker> {}
