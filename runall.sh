#!/bin/bash
cd R2017b
/usr/local/MATLAB/R2017b/bin/matlab -nodisplay -r "runTests;exit(any([results.Failed]));"
