using Uno;
using Uno.UX;
using Uno.Collections;
using Fuse;
using Fuse.Controls;
public class iOSDatePicker : Panel
{
	public event ValueChangedHandler<String> DateChanged;



	[UXValueChangedEvent("SetDate", "DateChanged")]
	string _date;
	public string Date {
		get { return _date; } 
		set {
			var s = _date;
			_date = value;
			OnDateChanged(value, s);
		}
	}
	public void SetDate(string value, object origin)
	{
		Date = value;
	}

	void OnDateChanged(string value, string orig)
	{
		if (DateChanged != null)
			DateChanged(this, new ValueChangedArgs<string>(value, orig));
	}

}
