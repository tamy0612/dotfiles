:%s/<+PACKAGE+>/\=expand('%:h:s?^src\/??:gs?\/?\.?')/
:%s/<+CLASS+>/\=expand('%:t:r')/g
package <+PACKAGE+>


public class <+CLASS+> {

    public <+CLASS+>() {
    }

}
