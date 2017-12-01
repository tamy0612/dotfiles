:%s/<+PATH+>/\=expand('%')/g
:%s/<+DATE+>/\=strftime("%d %b. %Y")/g
:%s/<+CMAKE_VERSION+>/\=get(g:,'neoformat_cmake_version','3.9')/g
:5
# <+PATH+>
# Generated: <+DATE+>.
# Last Change: 27 Nov. 2017.
cmake_minimum_required(VERSION <+CMAKE_VERSION+>)

