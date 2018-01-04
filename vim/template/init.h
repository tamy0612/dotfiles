:%s/<+FILE+>/\=expand("%:s?^src\/??:p:.")/g
:%s/<+GUARD+>/\=toupper(expand("%:gs?\\.?_?:s?^src\/??:gs?\/?_?:p:."))/g
:7
/**
 * @file <+FILE+>
 */
#ifndef <+GUARD+>
#define <+GUARD+>



#endif /* <+GUARD+> */
