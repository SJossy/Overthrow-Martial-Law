closedialog 0;
if (count (server getVariable ["GEURowned",[]]) isEqualTo 0) exitWith { "The resistance has no businesses." call OT_fnc_notifyMinor; };
createDialog "OT_dialog_business";
{
	_idx = lbAdd [1500,_x];
}foreach (server getVariable ["GEURowned",[]]);
lbSort [1500,"ASC"];
lbSetCurSel [1500, 0];
[] call OT_fnc_refreshBusiness;