class AdminToolkitMenu {
    idd = 40000;
    objects[] = {};

	controls[]=
	{
		RscAdminToolkitTitle,
		RscAdminToolkitMainMenu,
		RscAdminToolkitInfo,
		RscAdminToolkitSearch,
		RscAdminToolkitSearchAction,
		RscAdminToolkitList,
		RscAdminToolkitActionMenu,
		RscAdminToolkitActionLabel,
		RscAdminToolkitParam,
		RscAdminToolkitParamLabel,
		RscAdminToolkitQuick1,
		RscAdminToolkitQuick2,
		RscAdminToolkitQuick3,
		RscAdminToolkitQuick4,
		RscAdminToolkitExecute,
		RscAdminToolkitRepeat
		
	};
	////////////////////////////////////////////////////////
	// GUI EDITOR OUTPUT START (by ole, v1.063, #Tupyxi)
	////////////////////////////////////////////////////////
	
	class RscAdminToolkitTitle: RscStructuredText
	{
		idc = 1900;

		text = "# RscAdminToolkitTitle #"; //--- ToDo: Localize;
		x = 0.775 * safezoneW + safezoneX;
		y = 0.02 * safezoneH + safezoneY;
		w = 0.2125 * safezoneW;
		h = 0.02 * safezoneH;
		colorText[] = {0.8,0.15,0.3,1};
		colorBackground[] = {-1,-1,-1,0};
	};
	class RscAdminToolkitMainMenu: RscListbox
	{
		idc = 1910;
		x = 0.775 * safezoneW + safezoneX;
		y = 0.06 * safezoneH + safezoneY;
		w = 0.2125 * safezoneW;
		h = 0.1 * safezoneH;
		colorText[] = {0.8,0.15,0.3,1};
		colorBackground[] = {0,0,0,0.7};
	};
	class RscAdminToolkitInfo: RscStructuredText
	{
		idc = 1920;

		text = "# RscAdminToolkitInfo #"; //--- ToDo: Localize;
		x = 0.775 * safezoneW + safezoneX;
		y = 0.18 * safezoneH + safezoneY;
		w = 0.2125 * safezoneW;
		h = 0.02 * safezoneH;
		colorBackground[] = {-1,-1,-1,0};
	};
	class RscAdminToolkitSearch: RscEdit
	{
		idc = 1930;
		onKeyDown = "if ((_this select 1) == 0x1C or (_this select 1) == 0x9C) then { call AdminToolkit_menuEvents };";

		x = 0.775 * safezoneW + safezoneX;
		y = 0.22 * safezoneH + safezoneY;
		w = 0.1625 * safezoneW;
		h = 0.04 * safezoneH;
		colorBackground[] = {0,0,0,0.7};
	};
	class RscAdminToolkitSearchAction: RscButton
	{
		idc = 1940;
		action = "call AdminToolkit_menuEvents";

		text = "Search"; //--- ToDo: Localize;
		x = 0.9375 * safezoneW + safezoneX;
		y = 0.22 * safezoneH + safezoneY;
		w = 0.05 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class RscAdminToolkitList: RscListBox
	{
		idc = 1950;

		x = 0.775 * safezoneW + safezoneX;
		y = 0.26 * safezoneH + safezoneY;
		w = 0.2125 * safezoneW;
		h = 0.36 * safezoneH;
		colorBackground[] = {0,0,0,0.7};
		rowHeight = 0.1;
		/*sizeEx = 4;*/
	};
	class RscAdminToolkitActionMenu: RscCombo
	{
		idc = 1960;

		x = 0.775 * safezoneW + safezoneX;
		y = 0.7 * safezoneH + safezoneY;
		w = 0.2125 * safezoneW;
		h = 0.04 * safezoneH;
		colorBackground[] = {0,0,0,0.7};
	};
	class RscAdminToolkitActionLabel: RscStructuredText
	{
		idc = 1970;

		text = "# RscAdminToolkitActionLabel #"; //--- ToDo: Localize;
		x = 0.775 * safezoneW + safezoneX;
		y = 0.64 * safezoneH + safezoneY;
		w = 0.2125 * safezoneW;
		h = 0.04 * safezoneH;
		colorBackground[] = {-1,-1,-1,0};
	};
	class RscAdminToolkitParam: RscEdit
	{
		idc = 1980;
		onKeyDown = "";

		x = 0.775 * safezoneW + safezoneX;
		y = 0.8 * safezoneH + safezoneY;
		w = 0.2125 * safezoneW;
		h = 0.04 * safezoneH;
		colorBackground[] = {0,0,0,0.7};
	};
	class RscAdminToolkitParamLabel: RscStructuredText
	{
		idc = 1990;

		text = "# RscAdminToolkitParamLabel #"; //--- ToDo: Localize;
		x = 0.775 * safezoneW + safezoneX;
		y = 0.76 * safezoneH + safezoneY;
		w = 0.2125 * safezoneW;
		h = 0.02 * safezoneH;
		colorBackground[] = {-1,-1,-1,0};
	};
	class RscAdminToolkitQuick1: RscButton
	{
		idc = 1991;
		action = "systemChat 'Not yet implemented'";

		text = "QUICK 1"; //--- ToDo: Localize;
		x = 0.775 * safezoneW + safezoneX;
		y = 0.86 * safezoneH + safezoneY;
		w = 0.05 * safezoneW;
		h = 0.04 * safezoneH;
		colorBackground[] = {0,0,0,0.8};
	};
	class RscAdminToolkitQuick2: RscButton
	{
		idc = 1992;
		action = "systemChat 'Not yet implemented'";

		text = "QUICK 2"; //--- ToDo: Localize;
		x = 0.825 * safezoneW + safezoneX;
		y = 0.86 * safezoneH + safezoneY;
		w = 0.05 * safezoneW;
		h = 0.04 * safezoneH;
		colorBackground[] = {0,0,0,0.8};
	};
	class RscAdminToolkitQuick3: RscButton
	{
		idc = 1993;
		action = "systemChat 'Not yet implemented'";

		text = "QUICK 3"; //--- ToDo: Localize;
		x = 0.8875 * safezoneW + safezoneX;
		y = 0.86 * safezoneH + safezoneY;
		w = 0.05 * safezoneW;
		h = 0.04 * safezoneH;
		colorBackground[] = {0,0,0,0.8};
	};
	class RscAdminToolkitQuick4: RscButton
	{
		idc = 1994;
		action = "systemChat 'Not yet implemented'";

		text = "QUICK 4"; //--- ToDo: Localize;
		x = 0.9375 * safezoneW + safezoneX;
		y = 0.86 * safezoneH + safezoneY;
		w = 0.05 * safezoneW;
		h = 0.04 * safezoneH;
		colorBackground[] = {0,0,0,0.8};
	};
	class RscAdminToolkitExecute: RscButton
	{
		idc = 1995;
		action = "";

		text = "Run action"; //--- ToDo: Localize;
		x = 0.8875 * safezoneW + safezoneX;
		y = 0.94 * safezoneH + safezoneY;
		w = 0.1 * safezoneW;
		h = 0.04 * safezoneH;
		colorBackground[] = {0,0,0,0.8};
	};
	class RscAdminToolkitRepeat: RscButton
	{
		idc = 1996;
		action = "AdminToolkit_LastAction call AdminToolkit_doAction;";

		text = "Repeat action (F5)"; //--- ToDo: Localize;
		x = 0.775 * safezoneW + safezoneX;
		y = 0.94 * safezoneH + safezoneY;
		w = 0.1 * safezoneW;
		h = 0.04 * safezoneH;
		colorBackground[] = {0,0,0,0.8};
	};
	////////////////////////////////////////////////////////
	// GUI EDITOR OUTPUT END
	////////////////////////////////////////////////////////
};