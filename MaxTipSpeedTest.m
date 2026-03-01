classdef MaxTipSpeedTest < matlab.unittest.TestCase
    % Define a test class that uses MATLAB's unit test framework.
    % All tests in here must inherit from matlab.unittest.TestCase.
    methods (TestClassSetup)
        % Shared setup for the whole test class.
        % (Empty here — you could add code that runs once before all tests.)
    end

    methods (Test)
        % This block contains actual test methods.

        function verifyMaxTipSpeed(testCase)
            % A test function that verifies whether "active" components
            % in the model have a PAX greater than 9.

            % Open the System Composer model named "Aircraft".
            model = systemcomposer.openModel("Electram"); 

            % Get the component object at the path "Aircraft/Fuselage/AESARadar"
            comp  = lookup(model, Path="Electram/Propulsion");   % get the component
            
            % Access the architecture definition of the "Seats" component.            
            % arch = comp.Architecture;

            % Get the Simulink parameter object called "PAX" from the child.
            MaxTipSpeed_param = comp.getParameter("MaxTipSpeed");                  % parameter object

            % Convert the Range parameter's stored string into a numeric value.
            % (sscanf reads the number out of the text string.)
            MaxTipSpeed_param_val = sscanf(MaxTipSpeed_param.Value, '%f', 1);  % read

            % Test assertion: check that the PAX is greater than 9.
            % If not, the test fails.
            testCase.verifyLessThan(MaxTipSpeed_param_val, 0.9);  
        end
    end
end
