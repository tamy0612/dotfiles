:%s/<+PATH+>/\=expand('%')/g
:%s/<+DATE+>/\=strftime("%d %b. %Y")/g
:%s/<+CMAKE_VERSION+>/\=get(g:,'template_cmake_version','3.8')/g
:5
# <+PATH+>
# Generated: <+DATE+>.
# Last Change: <+DATE+>.
cmake_minimum_required(VERSION <+CMAKE_VERSION+>)
