import matlab.unittest.TestSuite
import matlab.unittest.TestRunner
import matlab.unittest.plugins.TestRunProgressPlugin
import matlab.unittest.plugins.DiagnosticsRecordingPlugin;

% Build up test suite
suite = TestSuite.fromClass(?PlutoSDRTests);
% Outline runner
runner = TestRunner.withNoPlugins;
% Add progress verbosity
p = TestRunProgressPlugin.withVerbosity(4);
runner.addPlugin(p);
runner.addPlugin(DiagnosticsRecordingPlugin);
% Run and display info
results = runner.run(suite);
disp(results.table);