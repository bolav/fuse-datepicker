using Uno;
using Uno.Collections;
using Fuse;
using iOS.UIKit;
using Uno.Compiler.ExportTargetInterop;

[TargetSpecificImplementation]
extern (iOS)
public class DatePickerImpl : Fuse.iOS.Controls.Control<iOSDatePicker>
{
	internal override UIView CreateInternal()
	{
		var v = CreateImpl();
		return v;
	}

	iOS.UIKit.UIView CreateImpl() {
		iOS.UIKit.UIDatePicker dp = new iOS.UIKit.UIDatePicker();
		

	}
	@{
		FBSDKLoginButton *loginButton = [[FBSDKLoginButton alloc] init];
		return (@{iOS.UIKit.UIView})uObjC::Lifetime::GetUnoObject(loginButton, @{iOS.UIKit.UIView:TypeOf});
	@}

	protected override void Attach()
	{
		// CreateInternal();
	}

	protected override void Detach()
	{
	}

	public override float2 GetMarginSize( LayoutParams lp ) {
		return float2(55);
	}

}

extern (!iOS) public class DatePickerImpl : Fuse.iOS.Controls.Control<iOSDatePicker> {}
