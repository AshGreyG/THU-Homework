#import "@preview/fletcher:0.5.3" as fletcher: diagram, node, edge

= 2024-2025秋季学期离散数学-第11次作业
\
何昱晖 2022012050 2024-12-13
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

所以我们可以得到 $R compose (S union T)=(R compose S) union (R compose T)$。证毕。$square$
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
\
证明：我们知道 $A$ 上的恒等关系 $I_A$ 定义为 $I_A={<x,x> | x in A}$。由于满足自反性的关系 $R$ 定义为 $forall x in A, <x,x> in R$，也即

$ forall p in I_A, p in R $

因此根据集合包含的定义可知 $I_A subset.eq R$。证毕。$square$
\
== 主观题 11.3
\
1. 可以构造出这么一个关系满足*对称的且反对称的且传递的*：

$ R_1=mat(
  space.en, #text(red)[1], #text(red)[2], #text(red)[3] ;
  #text(red)[1], 1, 0, 0;
  #text(red)[2], 0, 1, 0;
  #text(red)[3], 0, 0, 1;
  augment: #(hline: 1, vline: 1, stroke: 0.5pt + red),
) $

2. 可以构造出这么一个关系满足*不是对称的且不是反对称的且不是传递的*：

$ R_2=mat(
  space.en, #text(red)[1], #text(red)[2], #text(red)[3] ;
  #text(red)[1], 1, 0, 0;
  #text(red)[2], 0, 0, 1;
  #text(red)[3], 0, 0, 0;
  augment: #(hline: 1, vline: 1, stroke: 0.5pt + red),
) $
\
== 主观题 11.4
\
注意到 $3 R 1$ 并且 $1 R 2$，但是 $3 cancel(R) 2$，因此 $R$ 不是传递的。关系 $R$ 的传递闭包是

$ R'={&<1,1>,<1,2>, \ 
&<2,1>,<2,2>, \
&<3,1>,<3,2>, \
&<4,3>,<4,1>,<4,2>} $
\
== 主观题 11.5
\
- $R_1 compose R_2={<x,y> | exists z(<x,z> in R_2 and <z,y> in R_1)}$，因此

$ R_1 compose R_2={<c,d>} $

- $R_2 compose R_1={<x,y> | exists z(<x,z> in R_1 and <z,y> in R_2)} $，因此

$ R_2 compose R_1={<a,d>,<a,c>} $

- $R_1^2=R_1 compose R_1$，因此

$ R_1^2={<a,a>,<a,b>,<a,d>} $

- $R_2^2=R_2 compose R_2$，因此

$ R_2^2={<b,b>,<c,c>} $
\
== 主观题 11.6
\
- 自反闭包 $r(R)$

#align(center)[
  #diagram(
     
    // begin original diagram

    node-shape: circle,
    node-stroke: 1pt,
    node((1,0), $a$, name: <a>),
    node((2,0), $b$, name: <b>),
    node((3,0), $c$, name: <c>),
    node((4,0), $d$, name: <d>),
    node((5,0), $e$, name: <e>),
    edge(<a>, <b>, "->", bend: +60deg),
    edge(<b>, <c>, "->", bend: +60deg),
    edge(<c>, <d>, "->", bend: +60deg),
    edge(<d>, <c>, "->", bend: +60deg),
    edge(<b>, <e>, "->", bend: -40deg),
    edge(<e>, <e>, "->", bend: +130deg, loop-angle: +90deg),

    // end original diagram

    edge(<a>, <a>, "->", bend: +130deg, loop-angle: -90deg),
    edge(<b>, <b>, "->", bend: +130deg, loop-angle: -90deg),
    edge(<c>, <c>, "->", bend: +130deg, loop-angle: -120deg),
    edge(<d>, <d>, "->", bend: +130deg, loop-angle: -60deg),

 )
]

- 对称闭包 $s(R)$

#align(center)[
  #diagram(
     
    // begin original diagram

    node-shape: circle,
    node-stroke: 1pt,
    node((1,0), $a$, name: <a>),
    node((2,0), $b$, name: <b>),
    node((3,0), $c$, name: <c>),
    node((4,0), $d$, name: <d>),
    node((5,0), $e$, name: <e>),
    edge(<a>, <b>, "->", bend: +60deg),
    edge(<b>, <c>, "->", bend: +60deg),
    edge(<c>, <d>, "->", bend: +60deg),
    edge(<d>, <c>, "->", bend: +60deg),
    edge(<b>, <e>, "->", bend: -60deg),
    edge(<e>, <e>, "->", bend: +130deg, loop-angle: +70deg),

    // end original diagram

    edge(<b>, <a>, "->", bend: +60deg),
    edge(<c>, <b>, "->", bend: +60deg),
    edge(<c>, <d>, "->", bend: +60deg),
    edge(<d>, <c>, "->", bend: +60deg),
    edge(<b>, <e>, "->", bend: +60deg),

 )
]

- 传递闭包 $t(R)$：已知 $R={<a,b>,<b,c>,<c,d>,<d,c>,<e,e>,<b,e>}$，可以求得其传递闭包

$ t(R)={&<a,b>,<a,c>,<a,e>, \
&<b,c>,<b,d>,<b,e> \
&<c,d>,<c,c>, \
&<d,c>,<d,d>, \
&<e,e>} $

因此其传递闭包的关系图为：

#align(center)[
  #diagram(
     
    // begin original diagram

    node-shape: circle,
    node-stroke: 1pt,
    node((1,0), $a$, name: <a>),
    node((2,0), $b$, name: <b>),
    node((3,0), $c$, name: <c>),
    node((4,0), $d$, name: <d>),
    node((5,0), $e$, name: <e>),
    edge(<a>, <b>, "->", bend: +60deg),
    edge(<b>, <c>, "->", bend: +60deg),
    edge(<c>, <d>, "->", bend: +60deg),
    edge(<d>, <c>, "->", bend: +60deg),
    edge(<e>, <e>, "->", bend: +130deg, loop-angle: +70deg),

    // end original diagram

    edge(<a>, <c>, "->", bend: +60deg),
    edge(<a>, <e>, "->", bend: +60deg),
    edge(<b>, <d>, "->", bend: +60deg),
    edge(<b>, <e>, "->", bend: +60deg),
    edge(<c>, <c>, "->", bend: +130deg, loop-angle: -110deg),
    edge(<d>, <d>, "->", bend: +130deg, loop-angle: -60deg),

 )
]
\
== 客观题 1
\
*Q* : 对集合 $A={1,2,3}$，下列 8 种关系图，选择每个关系具有的性质

A: 自反 $space.en$ B: 反自反 $space.en$ C: 对称 $space.en$ D: 反对称 $space.en$ E: 传递 $space.en$ F: 无任何关系

- $R_1$：F
- $R_2$：E
- $R_3$：A, C, E
- $R_4$：A, E
- $R_5$：F
- $R_6$：B, C
- $R_7$：B
- $R_8$：A, C
\
== 客观题 2
\
*Q* : 对集合 $A={1,2,dots.c.h,10}$，$A$ 上的关系 $R$ 和 $S$ 各有什么性质：

- $R={<x,y> | x+y=10}$
- $S={<x,y> | x+y" is even"}$

- $R$：对称
- $S$：自反，对称，传递
\
== 客观题 3
\
*Q* : 对 $A$ 上的关系 $R_1$ 和 $R_2$，判定下列命题的真假，若为真，填入 $sans(upright(T))$，若为假，填入 $sans(upright(F))$：

- 若 $R_1$ 和 $R_2$ 是自反的，则 $R_1 compose R_2$ 也是自反的：$sans(upright(T))$

  由于 $R_1$ 和 $R_2$ 都是自反的，因此 $forall x in A, <x,x> in R_1, R_2$，对于任意 $x in A$ 都可以找到 $z=x$ 使得

  $ <x,z> in R_2, <z,x> in  R_1 $

  因此 $forall x in A, <x,x> in R_1 compose R_2$，于是 $R_1 compose R_2$ 也是自反的；

- 若 $R_1$ 和 $R_2$ 是反自反的，则 $R_1 compose R_2$ 也是反自反的：$sans(upright(F))$

  只需要给出以下反例（思考的方式是 $<2,1> compose <1,2> = <2,2>$ 这样的结果）：给定 $A={1,2}$，关系 $R_1={<1,2>}$ 和 $R_2={<2,1>}$ 是自反的，但 $R_1 compose R_2={<2,2>}$ 并不是反自反的；

- 若 $R_1$ 和 $R_2$ 是对称的，则 $R_1 compose R_2$ 也是对称的：$sans(upright(F))$

  只需要给出以下反例（思考的方式是 $<a,b> compose <b,c> = <a,c>$ 但是找不到复合出 $<c,a>$ 的情况）：给定 $A={a,b,c}$，关系
  
  $ R_2&={<a,a>,<b,b>,<c,c>,<a,b>,<b,a>} \ 
    R_1&={<b,c>,<c,b>} $

  很明显 $R_1$ 和 $R_2$ 是对称的，此时 $R_1 compose R_2={<b,c>,<c,b>,<a,c>}$，而 $R_1 compose R_2$ 不是对称的；

- 若 $R_1$ 和 $R_2$ 是传递的，则 $R_1 compose R_2$ 也是传递的：$sans(upright(F))$

  只需要给出以下反例：给定集合 $A={a,b,c}$，关系 $R_1={<a,b>,<b,c>,<a,c>}$ 和 $R_2={<c,a>,<a,b>,<c,b>}$ 都是传递的，但是 $R_1 compose R_2={<c,b>,<c,c>,<a,c>}$ 不是传递的。