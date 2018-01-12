:%s/<+FILE+>/\=expand("%:s?^src\/??:p:.")/g
:%s/<+GUARD+>/\=toupper(expand("%:gs?\\.?_?:s?^src\/??:gs?\/?_?:p:."))/g
:%s/<+NAMESPACE+>/\=tolower(join(filter(extend([get(g:, 'template_project_name', '')], split(expand('%:s?^src\/??:p:.:h'), '\/')), 'v:val !=# "" && v:val !=# "."'), '::'))/g
:9
/**
 * @file <+FILE+>
 */
#ifndef <+GUARD+>
#define <+GUARD+>

namespace <+NAMESPACE+> {



}  // namespace <+NAMESPACE+>

#endif /* <+GUARD+> */
