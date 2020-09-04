if((lbCurSel 1501) isEqualTo -1) exitWith {};
params ["_qty"];
private _name = lbText [1500,(lbCurSel 1500)];
private _cls = lbData [1501,(lbCurSel 1501)];
private _clsname = lbText [1501,(lbCurSel 1501)];
private _queue = server getVariable [format["%1producing",_name],[]];


private _queueitem = [_clsname,_cls,0];
_doadd = true;

if(count _queue > 0) then {
    _i = _queue select (count _queue - 1);
    if((_i select 1) isEqualTo _cls) then {
        _queueitem = _i;
        _doadd = false;
    };
}else{
    if((server getVariable [format["%1producing",_name],""]) isEqualTo "") then {
        server setVariable [format["%1producing",_name],[_clsname,_cls,_qty],true];
    };
};

_queueitem set [2, (_queueitem select 2) + _qty];

if(_doadd) then {
    _queue pushback _queueitem;
};
player globalchat format ["[businessQueueAdd] - _name:%1 _queue:%2", _name, _queue];
server setVariable [format["%1producing",_name],_queue,true];

[] call OT_fnc_refreshBusiness;
