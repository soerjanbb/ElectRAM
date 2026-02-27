%% RAM Aircraft System of Systems Cost/Power/Weight Model

clear; clc;

% Define subsystem data
Systems = struct();

Systems.Propulsion.weight = 168+25.3+164.5;      % kg (WIngtip)
Systems.Propulsion.power  = -800;     % kW 
Systems.Propulsion.cost   = 1200000;  % $

Systems.Battery.weight = 687.6;         % kg
Systems.Battery.power  = 800;         % kW (supplies power)
Systems.Battery.cost   = 900000;      % $

Systems.Avionics.weight = 80;
Systems.Avionics.power  = 15;
Systems.Avionics.cost   = 250000;

Systems.ECS.weight = 7.3 + 82.4;
Systems.ECS.power  = 40;
Systems.ECS.cost   = 300000;

Systems.FlightControls.weight = 95;
Systems.FlightControls.power  = 25;
Systems.FlightControls.cost   = 200000;

Systems.Structure.weight = 1800;
Systems.Structure.power  = 0;
Systems.Structure.cost   = 2200000;

%% Compute Totals

fields = fieldnames(Systems);

total_weight = 0;
total_power  = 0;
total_cost   = 0;

for i = 1:length(fields)
    sys = Systems.(fields{i});
    total_weight = total_weight + sys.weight;
    total_power  = total_power + sys.power;
    total_cost   = total_cost + sys.cost;
end

%% Display Results

fprintf('Total Aircraft Weight: %.1f kg\n', total_weight);
fprintf('Net Power Balance: %.1f kW\n', total_power);
fprintf('Total Aircraft Cost: $%.2f M\n', total_cost/1e6);