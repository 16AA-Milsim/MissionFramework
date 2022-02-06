player addGoggles "Rev_Shades_Yellow";
waitUntil {!isNull player};  
fst_list = [ 
    "fst1",
    "fst2",
    "fst3",
    "fst4"
];

if (vehicleVarName player in fst_list) then { //add SOFLAM in backpack to every FST slot
    player addItemToBackpack "UK3CB_BAF_Soflam_Laserdesignator";
};