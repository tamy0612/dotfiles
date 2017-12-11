:%s/<+FILE+>/\=expand("%:s?^src\/??:p:.")/g
:%s/<+GUARD+>/\=toupper(expand("%:gs?\\.?_?:s?^src\/??:gs?\/?_?:p:."))/g
:%s/<+NAMESPACE+>/\=tolower(join(filter(extend([get(g:, 'neoformat_project_name', '')], split(expand('%:s?^src\/??:p:.:h'), '\/')), 'v:val !=? ""'), '::'))/g
:11
/**
 * @file <+FILE+>
 */
#ifndef <+GUARD+>
#define <+GUARD+>

#ifdef __cplusplus
namespace <+NAMESPACE+> {
#endif



#ifdef __cplusplus
}
#endif

#endif /* <+GUARD+> */
