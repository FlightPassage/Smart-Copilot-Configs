--EMB110
size = { 2048, 2048 }

function dref_f(drefNamef, drefLocalf)
    defineProperty(drefNamef, globalPropertyf(drefLocalf))
end

function dref_i(drefNamef, drefLocalf)
    defineProperty(drefNamef, globalPropertyi(drefLocalf))
end

function dref_s(drefNames, drefLocalf)
    defineProperty(drefNames, globalPropertys(drefLocalf))
end

function Cdref(drefNamec, drefLocalc)
    defineProperty(drefNamec, createGlobalPropertyf(drefLocalc))
end

function Cdref_i(drefNameI, drefLocalI)
    defineProperty(drefNameI, createGlobalPropertyi(drefLocalI))
end

dref_f("frameRate",  				"sim/operation/misc/frame_rate_period")
dref_i("window_height",             "sim/graphics/view/window_height")
dref_i("instr_bright_5",			"sim/cockpit2/switches/instrument_brightness_ratio[5]")
dref_i("instr_bright_10",			"sim/cockpit2/switches/instrument_brightness_ratio[10]")
dref_i("auto_feather_mode",			"sim/cockpit/switches/auto_feather_mode")
dref_i("prop_manet_0",				"sim/cockpit2/engine/actuators/prop_rotation_speed_rad_sec[0]")
dref_i("prop_manet_1",				"sim/cockpit2/engine/actuators/prop_rotation_speed_rad_sec[1]")
dref_i("mixture_0",					"sim/cockpit2/engine/actuators/mixture_ratio[0]")
dref_i("mixture_1",					"sim/cockpit2/engine/actuators/mixture_ratio[1]")
dref_i("throttle_0",				"sim/cockpit2/engine/actuators/throttle_ratio[0]")
dref_i("throttle_1",				"sim/cockpit2/engine/actuators/throttle_ratio[1]")
dref_f("bus_volts_0", 				"sim/cockpit2/electrical/bus_volts[0]")
dref_i("prop_override_0", 			"sim/flightmodel2/engines/prop_disc/override[0]")
dref_i("prop_override_1", 			"sim/flightmodel2/engines/prop_disc/override[1]")

Cdref("yok_copilot",				"EMB110/yoke/copilot")
Cdref("yok_pilot",					"EMB110/yoke/pilot")

dref_i("bright_5","sim/cockpit2/switches/instrument_brightness_ratio[5]")

-- set zero
set(prop_override_0, 1)
set(prop_override_1, 1)
set(bright_5, 0)

function onAvionicsDone()
set(prop_override_0,0)
set(prop_override_1,0)
end

--Smart Copilot Nosewheel bug fix
dref_i("SmartConnection","scp/api/ismaster")
dref_i("HasControl","scp/api/hascontrol_1")
dref_i("SmartNose","sim/operation/override/override_wheel_steer")

--Sniffing for SMART COPILOT STATE
--function SmartCopilot()
        if get(SmartConnection) == 2 and get(HasControl) == 1 then
            set(SmartNose, 1)
        else 
            set(SmartNose, 0)
        end
--end

--END OF SMART COPILOT NOSE WHEEL BUG

-- function update()
--     SmartCopilot()
-- end

AutopilotPed = subpanel {

    -- default panel position
    position = { 20, 650, 485, 300 };

    -- disable default background
    noBackground = true;

    -- command ID for shortcut binding
    command = "xap/panels/4";

    -- panel descriptions for shortcuts setup dialog
    description = "Toggle Autopilot Parameters operator panel";

    -- components of panel
    components = {
        
        AutopilotPed {  position = { 0, 0, 485, 300 } };
    };


};

components = {
	rain {},
	prop{},
	arcond{},
	gps{},
	deicing{},
	wxradar{},
	audio{},
	RMI {},
	logic{},
	Fuel{},
	misc{},
    --scp{},
}




