//%attributes = {}

C_TEXT:C284($text)
$text:="Feature: Highlander\n"+\
"\n"+\
"Rule: There can be only One\n"+\
"\n"+\
"Example: Only One--More than one alive\n"+\
"Given there are 3 ninjas\n"+\
"And there are more than one ninja alive\n"+\
"When 2 ninjas meet, they will fight\n"+\
"Then one ninja dies(but not me)\n"+\
"And there is one ninja less alive\n"+\
"\n"+\
"Example: Only One--One alive\n"+\
"Given there is only 1 ninja alive\n"+\
"Then he (or she) will live forever ;-)\n"
C_OBJECT:C1216($parser)
$parser:=cs:C1710.Gherkin.new($text)