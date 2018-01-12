:%s/<+PACKAGE+>/\=tolower(join(filter(split(expand('%:p:.:h'), '\/'), '"\%(src\|main\|test\|scala\)" !~? v:val && v:val !=# "."'), '.'))/g
package <+PACKAGE+>


