
classdef PlutoSDRTests < matlab.unittest.TestCase
    
    properties
        
    end
    
    
    methods(TestClassSetup)
        % Update Pluto Firmware
        function updateFirmware(testCase)
            rel = a(1).Release;rel = rel(2:end-1);
            r = updateFirmwarePluto(rel);
            testCase.assertTrue(r);
        end
        % Load example settings from mat file
        function loadPlutoEnvironment(~)
            plutoradiosetup;
        end
        
    end
    
    methods(TestClassTeardown)
        
    end
    
    methods (Test)
        % Test Connectivity
        function testConnectivity(testCase)
            r = findPlutoRadio;
            testCase.assertNotEmpty(r,'No Devices Found');
        end
        % Test RX Data
        function testRXOnly(testCase)
            rx = sdrrx('Pluto','OutputDataType','double');
            rx();rx();d = rx();
            clear rx;
            testCase.assertGreaterThan(sum(abs(d)),0,'All zeros returned');
        end
        % Test Max RX buffer size
        function testMAXRXBuff(testCase)
            rx = sdrrx('Pluto','SamplesPerFrame',2^20,'OutputDataType','double');
            rx();rx();d = rx();
            clear rx;
            testCase.assertGreaterThan(sum(abs(d)),0,'All zeros returned');
        end
        
    end
end