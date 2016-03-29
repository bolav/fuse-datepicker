using Uno;
using Uno.Collections;
using Fuse;
using iOS.UIKit;
using Uno.Compiler.ExportTargetInterop;

[TargetSpecificImplementation]
extern (iOS)
public class DatePickerImpl : Fuse.iOS.Controls.Control<iOSDatePicker>
{
	iOS.UIKit.UIView _view;
	ObjC.ID _viewid;

	internal override UIView CreateInternal()
	{
		if (_view == null)
		{
			_viewid = CreateView();
			_view = new iOS.UIKit.UIView(_viewid);
		}
		return _view;
	}

	[Foreign(Language.ObjC)]
	public ObjC.ID CreateView ()
	@{
		UIDatePicker *myPicker = [[UIDatePicker alloc] init];
		return myPicker;
	@}

	protected override void Attach()
	{
		CreateInternal();
	}

	protected override void Detach()
	{
	}

	public override float2 GetMarginSize( LayoutParams lp ) {
		return float2(250);
	}

}

extern (!iOS) public class DatePickerImpl : Fuse.iOS.Controls.Control<iOSDatePicker> {}
