#!/bin/bash
testArguments="$*"
testAllFile="test/test_all_test.dart"
testAllWidgetsFile="test/test_all_widgets_test.dart"
fileToWrite=""

rm -f $testAllFile
rm -f $testAllWidgetsFile

createFilledTestFile() {
    local imports=()
    local groups=()

    for file in $files; do
        fileFormatted=${file//.\/test\//}
        fileName=$(basename "$fileFormatted" ".dart")
        imports+=("import '$fileFormatted' as $fileName;\n")
        groups+=("group('$fileName', $fileName.main);\n")
    done

    local importsSorted=$(echo -e "${imports[@]}" | sort | sed -e 's/^[ \t]*//')
    importsSorted=("import 'package:flutter/material.dart';\nimport 'package:flutter_test/flutter_test.dart';\n""${importsSorted[@]}")

    local groupsRemovedSpaces=$(echo -e "${groups[@]}" | sed -e 's/^[ \t]*//')
    local groupsWithTwoSpaces=$(echo -e "${groupsRemovedSpaces[@]}" | sed -e 's/^/  /')

    local fileContent="$(echo -e "${importsSorted[@]}")\n\nvoid main() {\n  TestWidgetsFlutterBinding.ensureInitialized();\n$(echo -e "${groupsWithTwoSpaces[@]}")\n}"
    echo -e "$fileContent" >$fileToWrite
}

fileToWrite=$testAllFile
files=$(find . -type f -name '*_test.dart' -not -name '*_page_test.dart' -not -name '*_widget_test.dart')
createFilledTestFile

fileToWrite=$testAllWidgetsFile
files=$(find . -type f -name '*_page_test.dart' -o -name '*_widget_test.dart')
createFilledTestFile
