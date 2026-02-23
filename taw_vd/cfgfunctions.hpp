class TAW_VD {
	tag = "TAWVD";

	class Initialize {
		file = "taw_vd";
		class onSliderChanged {};
		class onTerrainChanged {};
		class updateViewDistance {};
		class openMenu {};
		class onChar {};
		class openSaveManager {};
		class onSavePressed {};
		class onSaveSelectionChanged {};
		class persistSettings {};
		class persistSettingsSafe {};
		class applySlot {};
		class onSetDefaultPressed {};
		class isAceViewDistanceActive {};
		class startupInit {};
		class stateTracker {
			ext = ".fsm";
			postInit = 1;
			headerType = -1;
		};
	};
};
