//	@file Version: 1.0
//	@file Name: objectsSpawning.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Created: 20/11/2012 05:19
//	@file Args:

if(!X_Server) exitWith {};

private ["_counter","_townname","_tradius","_pos","_objammount","_minrad","_maxrad","_lcounter"];
_tradius = 0;
_townname = "debug";
_counter = 1;
_objammount = 0;
_minrad = 0;
_maxrad = 0;
_lcounter = 0;

{
	_pos = getMarkerPos (_x select 0);
	_tradius = (_x select 1);
	_townname = (_x select 2);
	_objammount = ((_tradius / 25) *2);  // spawns 2 objects for every 25 mtr radius the townmarker has, this might need tweaking! 
	_minrad = 1;
	_maxrad = 25;
	while {(_counter < (_objammount + 2))} do {
		_pos = [_pos,_minrad,_maxrad,2,0,60 * (pi / 180),0,[],[_pos]] call BIS_fnc_findSafePos;
		[_pos] call objectCreation;
		_counter = (_counter + 1);
		_lcounter = (_lcounter + 1);
		_pos = [_pos,_minrad,_maxrad,2,0,60 * (pi / 180),0,[],[_pos]] call BIS_fnc_findSafePos;
		[_pos] call objectCreation;
		_counter = (_counter + 1);
		_lcounter = (_lcounter + 1);
		_minrad = (_minrad + 25);
		_maxrad = (_maxrad + 25);
	};	
	diag_log format["WASTELAND DEBUG - spawned %1 Objects in: %2",_lcounter,_townname];
	_lcounter = 0;
}forEach (call citylist);

diag_log format["WASTELAND - Object spawning completed - %1 Objects Spawned on Altis",_counter];
