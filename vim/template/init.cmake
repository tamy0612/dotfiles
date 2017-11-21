:%s/<+PROJECT+>/\=expand('%:p:h:t')/g
:%s/<+DATE+>/\=strftime("%d %b. %Y")/g
:7
# CMakeList.txt
# Generated: <+DATE+>.
# Last Change: 21 Nov. 2017.
cmake_minimum_required(VERSION 3.9)
project(<+PROJECT+>)


