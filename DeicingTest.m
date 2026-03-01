classdef DeicingTest < matlab.unittest.TestCase
    % Define a test class that uses MATLAB's unit test framework.
    % All tests in here must inherit from matlab.unittest.TestCase.
    methods (TestClassSetup)
        % Shared setup for the whole test class.
        % (Empty here — you could add code that runs once before all tests.)
    end

    methods (Test)
        % This block contains actual test methods.

        function verifyDeicing(testCase)
            % A test function that verifies whether "active" components
            % in the model have a PAX greater than 9.

            % Open the System Composer model named "Aircraft".
            model = systemcomposer.openModel("Electram"); 

            % Get the component object at the path "Aircraft/Fuselage/AESARadar"
            comp  = lookup(model, Path="Electram/Wing/Deicing");   % get the component
            
            % Access the architecture definition of the "Seats" component.            
            % arch = comp.Architecture;

            % Get the Simulink parameter object called "PAX" from the child.
            Deicing_param = comp.getParameter("Deicing");                  % parameter object

            % Convert the Range parameter's stored string into a numeric value.
            % (sscanf reads the number out of the text string.)
            Deicing_param_val = sscanf(Deicing_param.Value, '%f', 1);  % read

            % Test assertion: check that the PAX is greater than 9.
            % If not, the test fails.
            testCase.verifyEqual(Deicing_param_val, 1);  
        end
    end
end
