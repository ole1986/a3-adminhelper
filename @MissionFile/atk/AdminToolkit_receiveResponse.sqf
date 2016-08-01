private["_request", "_params", '_tmp'];
try 
{
	_request = _this select 0; // what to do
    _params = _this select 1; // mixed value
    
	switch(_request) do {
		case 'message': {
			_params call AdminToolkit_showMessage;
		};
	};
}
catch
{
    systemChat format["[ATK-RESPONSE]: EXCEPTION: %1", _exception];
};