:%s/<+PACKAGE+>/\=expand('%:p:h:t')/
:%s/<+SCALA_VERSION+>/\=system("scala -e 'print(util.Properties.versionNumberString)'")/
name := "<+PACKAGE+>"

version := "0.0.0"

scalaVersion := "<+SCALA_VERSION+>"
