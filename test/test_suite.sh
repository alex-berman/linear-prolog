#!/bin/sh

swipl -t 'test_coverage(form_filling, test/dialog_coverage_form_filling)' test/test_coverage.pl
swipl -t 'test_coverage(enthymemes, test/dialog_coverage_enthymemes)' test/test_coverage.pl
