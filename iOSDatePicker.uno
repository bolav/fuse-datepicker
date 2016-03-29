using Uno;
using Uno.UX;
using Uno.Collections;
using Fuse;
using Fuse.Controls;
public class iOSDatePicker : Panel
{
	public event ValueChangedHandler<int> DateChanged;

	[UXValueChangedEvent("SetDate", "DateChanged")]
	public int Date {
		get;
		set;
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
