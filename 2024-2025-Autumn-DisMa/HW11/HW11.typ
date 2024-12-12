#import "@preview/fletcher:0.5.3" as fletcher: diagram, node, edge

= 2024-2025秋季学期离散数学-第11次作业
\
何昱晖 2022012050
\
== 主观题 10.7
\
证明：我们知道对于任意 $<x,y>$，有

$ <x,y> in R compose (S union T) & arrow.l.r.double exists z(<x,z> in S union T and <z,y> in T) \ 
& arrow.l.r.double exists z((<x,z> in S or <x,z> in T)and <z,y> in R) \ 
& arrow.l.r.double exists z((<x,z> in S and <z,y> in R) or (<x,z> in T or <z,y> in R)) \
& arrow.l.r.double exists z(<x,z> in S and <z,y> in R) or exists z(<x,z> in T and <z,y> in R) \
& arrow.l.r.double <x,y> in R compose S and <x,y> in R compose T \
& arrow.l.r.double <x,y> in (R compose S) union (R compose T) $

所以我们可以得到 $R compose (S union T)=(R compose S) union (R compose T)$
\
== 主观题 11.1
\
可以构造出这么一个关系

$ R=mat(
  space.en, #text(red)[1], #text(red)[2], #text(red)[3] ;
  #text(red)[1], 1, 0, 1;
  #text(red)[2], 0, 0, 0;
  #text(red)[3], 1, 0, 1;
  augment: #(hline: 1, vline: 1, stroke: 0.5pt + red)
) $

可以知道在关系 $R={<1,3>, <3,1>, <1,2>, <3,3>}$ 中，关系 $R$ 满足对称性和传递性，但是不满足自反性，因为不包含 $<2,2>$
\
== 主观题 11.2
