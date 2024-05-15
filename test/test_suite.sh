#!/bin/sh

swipl -t "test_coverage(form_filling, 'test/dialog_coverage_form_filling.pl')" test/test_coverage.pl
swipl -t "test_coverage(enthymemes, 'test/dialog_coverage_enthymemes.pl')" test/test_coverage.pl
