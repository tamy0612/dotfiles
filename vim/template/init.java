:%s/<+PACKAGE+>/\=tolower(join(filter(split(expand('%:p:.:h'), '\/'), '"\%(src\|main\|test\|java\)" !~? v:val && v:val !=# "."'), '.'))/g
:%s/<+CLASS+>/\=expand('%:t:r')/g
package <+PACKAGE+>;


public class <+CLASS+> {

    public <+CLASS+>() {
    }

}
