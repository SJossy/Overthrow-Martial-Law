private _name = lbText [1500,(lbCurSel 1500)];
private _idx = lbCurSel 1503;
private _queue = server getVariable [format["%1producing",_name],[]];
if(_idx isEqualTo -1) exitWith {};
    
_queue deleteAt _idx;
server setVariable [format["%1producing",_name],_queue,true];

[] call OT_fnc_refreshBusiness;
