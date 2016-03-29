using Uno;
using Uno.UX;
using Uno.Collections;
using Fuse;
using Fuse.Controls;
public class iOSDatePicker : Panel
{
	public event ValueChangedHandler<int> DateChanged;

	[UXValueChangedEvent("SetDate", "DateChanged")]
	int _date;
	public int Date {
		get { return _date; } 
		set {
			debug_log "Date set to " + value;
			var s = _date;
			_date = value;
			OnDateChanged(value, s);
		}
	}
	public void SetDate(int value, object origin)
	{
		debug_log "SetDate " + value;
		Date = value;
	}

	void OnDateChanged(int value, int orig)
	{
		debug_log "OnDateChanged";
		if (DateChanged != null)
			DateChanged(this, new ValueChangedArgs<int>(value, orig));
	}

}
