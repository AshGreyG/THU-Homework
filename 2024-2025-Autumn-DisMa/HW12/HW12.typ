#import "@preview/fletcher:0.5.3" as fletcher: diagram, node, edge

= 2024-2025秋季学期离散数学-第12次作业
\
何昱晖 2022012050 
\
== 主观题 12.1
\
对于有限集合 $A={a_1,a_2,dots.c.h,a_n}$，可以知道其最多的划分为 ${{a_1},{a_2},dots.c.h}$，最少的划分是 ${a_1,a_2,dots.c.h,a_n}$，因此能给出最多等价类的等价关系是

$ {<a_1,a_1>,<a_2,a_2>,dots.c.h,<a_n,a_n>} $

能给出最少等价类的等价关系是

$ {<a_1,a_1>,&dots.c.h,<a_1,a_n> \ 
   <a_2,a_1>,&dots.c.h,<a_2,a_n> \ 
   &dots.v \
   <a_n,a_1>,&dots.c.h,<a_n,a_n> } $
\
== 主观题 12.2
\
$R$ 是 $A$ 上自反和传递的关系，$T$ 是 $A$ 上的关系，$a T b arrow.l.r.double a R b and b R a$，证明 $T$ 是等价关系

证明：我们要逐一说明关系 $T$ 的自反性、对称性和传递性：
- 自反性：因为 $R$ 是自反的，因此 $a R a and a R a arrow.l.r.double a R a arrow.l.r.double a T a$，这是对所有 $a in A$ 都满足的，因此 $T$ 也是自反的；
- 对称性：对于所有 $a,b in A$，我们知道 $a T b arrow.l.r.double a R b and b R a arrow.l.r.double b R a and a R b arrow.l.r.double b T a$，因此关系 $T$ 是对称的；
- 传递性：$a T b arrow.l.r.double a R b and b R a$，因此对于 $a,b,c in A$，若 $a T b and b T c$，由 $R$ 是传递的我们可以得到

  $ (a R b and b R a) and (b R c and c R b)=a R c and c R a arrow.l.r.double a T c $ 

  因此 $T$ 也满足传递性。

综上所述，我们证明了 $T$ 是集合 $A$ 上的等价关系。证毕。$square$
\
== 主观题 12.3
\
$R$ 的关系图如下：

#align(center)[
  #diagram(
    node-shape: circle,
    node-stroke: 0.5pt,
    node((1, 0), $a$, name: <a>),
    node((2, 0), $b$, name: <b>),
    node((3, 0), $c$, name: <c>),
    node((4, 0), $d$, name: <d>),
    edge(<a>, <b>, "->", bend: +60deg),
    edge(<b>, <a>, "->", bend: +60deg),
    edge(<c>, <d>, "->", bend: +60deg),
    edge(<d>, <c>, "->", bend: +60deg),
    edge(<a>, <a>, "->", bend: +130deg, loop-angle: +110deg),
    edge(<b>, <b>, "->", bend: +130deg, loop-angle: +70deg),
    edge(<c>, <c>, "->", bend: +130deg, loop-angle: +110deg),
    edge(<d>, <d>, "->", bend: +130deg, loop-angle: +70deg),
  )
]

$A$ 中各元素的等价类如下：
- $[a]_R={a,b}$；
- $[b]_R={a,b}$；
- $[c]_R={c,d}$；
- $[d]_R={c,d}$
\
== 主观题 12.4
\
1. 设 $R$ 和 $S$ 是 $A$ 的关系，且 $S={<a,b> | exists c(a R c and c R b)}$，证明若 $R$ 是等价关系，则 $S$ 也是等价关系。

  证明：需要证明关系 $S$ 满足自反性、对称性和传递性：

  - 自反性：对于 $<a,a> in S$，应当满足 $exists c(a R c and  c R a)$，由于 $R$ 是等价关系，因此 $forall a in A exists c (a R c and c R a) arrow.l.r.double a R a arrow.l.r.double a S a$，因此 $S$ 是自反的；
  - 对称性：对于 $<a,b> in S$，由 $exists c(a R c and c R b)$ 以及 $R$ 是等价关系可知 $exists c(b R c and c R a)$，因此 $<b,a> in S$，因此 $S$ 满足对称性；
  - 传递性：对于 $<a,b>,<b,c> in S$，可知 $exists t(a R t and t R b)$ 并且 $exists s(b R s and s R c)$，因此我们就是要证明 $exists p (a R p and p R c)$，注意到 $R$ 是等价关系，因此我们可以取 $t=s$，此时 $exists t(a R t and t R b and b R t and t R c)$，因此我们知道 $exists t(a R t and t R c)$，于是我们知道 $S$ 也是具有传递性的。

综上所述，$S$ 也是 $A$ 上的等价关系。证毕。$square$

2. 设 $A=ZZ^+ times ZZ^+$，$A$ 上的关系 $R={angle.l <x,y>,<u,v> angle.r | x v=y u}$，证明 $R$ 是等价关系

  证明：依次说明 $R$ 具有自反性、对称性和传递性

  - 自反性：设 $s=<a,b> in ZZ^+ times ZZ^+$，则 $s R s$，因为 $a b=b a$，因此 $R$ 满足自反性；
  - 对称性：设 $s=<a,b>,t=<c,d> in ZZ^+ times ZZ^+$，满足 $s R t$，因此满足 $a d=b c$，现在考察 $t R s$ 是否满足，我们知道 $c b=d a$，因此 $t R s$，故 $R$ 满足对称性；
  - 传递性：设 $s=<x,y>,t=<u,v>,k=<a,b>$ 设 $s R t and t R k$，因此我们知道 $x v=y u$ 且 $u b=v a$，于是有 $x v dot u b=y u dot v a$。注意到 $u,v in ZZ^+$，因此 $u v!=0$ 时有 $x b=y a$，于是 $s R k$，$R$ 具有传递性。

综上所述，$R$ 是一个等价关系。证毕。$square$

\
== 主观题 12.5
\
1. ${1,2,3,4,6,8,12,24}$ 与其上的整除关系构成偏序集 $angle.l{1,2,3,4,6,8,12,24}, R_d angle.r$，则其 Hasse 图为

  #align(center)[
    #diagram(
      node-shape: circle,
      node-stroke: 0.5pt,
      node((0,0), $1$, name: <1>),
      node((0.7,-0.5), $2$, name: <2>),
      node((-0.7,-0.5), $3$, name: <3>),
      node((1.4,-1), $4$, name: <4>),
      node((0,-1), $6$, name: <6>),
      node((2.1, -1.5), $8$, name: <8>),
      node((0.7,-1.5), $12$, name: <12>),
      node((0,-2), $24$, name: <24>),

      edge(<1>, <2>),
      edge(<1>, <3>),
      edge(<2>, <4>),
      edge(<3>, <6>),
      edge(<2>, <6>),
      edge(<4>, <8>),
      edge(<6>, <12>),
      edge(<4>, <12>),
      edge(<6>, <24>),
      edge(<12>, <24>),
      edge(<8>, <24>)

  )
  ]

2. ${1,2,3,4,5,6,7,8,9}$ 与其上的整除关系构成偏序集 $angle.l {1,2,3,4,5,6,7,8,9}, R_d angle.r$，则其 Hasse 图为

  #align(center)[
    #diagram(
      node-shape: circle,
      node-stroke: 0.5pt,
      node((0,0), $1$, name: <1>),
      node((1,-0.7), $2$, name: <2>),
      node((0,-0.7), $3$, name: <3>),
      node((-1,-0.7), $5$, name: <5>),
      node((-2,-0.7), $7$, name: <7>),
      node((2,-1.4), $4$, name: <4>),
      node((1,-1.4), $6$, name: <6>),
      node((0,-1.4), $9$, name: <9>),
      node((2,-2.1), $8$, name: <8>),

      edge(<1>, <2>),
      edge(<1>, <3>),
      edge(<1>, <5>),
      edge(<1>, <7>),
      edge(<2>, <4>),
      edge(<2>, <6>),
      edge(<3>, <6>),
      edge(<3>, <9>),
      edge(<4>, <8>),
    )
  ]

3. 对于图 1 的偏序集 $angle.l A_1, R_1 angle.r$，则

  $ A_1={a,b,c,d,e,f,g} $

  $A_1$ 上的偏序关系是

  $ R_1={&<a,a>,<b,b>,<c,c>,<d,d>,<e,e>,<f,f>,<g,g>, \
         &<a,c>,<c,f>,<c,g>,<a,f>,<a,g>, \ 
         &<a,b>,<b,d>,<b,e>,<a,d>,<a,e>} $
  
4. 对于图 2 的偏序集 $angle.l A_2,R_2 angle.r$，则

  $ A_2={a,b,c,d,e,f} $

  $A_2$ 上的偏序关系是

  $ R_2={&<a,a>,<b,b>,<c,c>,<d,d>,<e,e>,<f,f> \
         &<a,b>,<a,c>,<a,d>,<a,e>, \
         &<d,f>,<e,f>,<a,f> } $

\
== 主观题 12.6
\
1. $A={a,b,c,d,e}$ 及其上的关系 $R=I_A union {<a,d>,<a,c>,<a,b>,<a,e>,<b,e>,<c,e>,<d,e>}$ 构成的偏序集的 Hasse 图如下：

  #align(center)[
    #diagram(
      node-shape: circle,
      node-stroke: 0.5pt,
      node((0,0), $a$, name: <a>),
      node((-1,-0.7), $b$, name: <b>),
      node((0,-0.7), $c$, name: <c>),
      node((1,-0.7), $d$, name: <d>),
      node((0,-1.4), $e$, name: <e>),

      edge(<a>,<b>),
      edge(<a>,<c>),
      edge(<a>,<d>),
      edge(<b>,<e>),
      edge(<c>,<e>),
      edge(<d>,<e>),
    )
  ]

  $A$ 的最大元是 $e$，最小元是 $a$（这里主要是 $a$ 和 $e$ 对于其他元素都是可比的），极大元是 $e$，极小元是 $a$；

2. $A={a,b,c,d}$ 及其上的关系 $R=I_A union {<c,d>}$ 构成的偏序集的 Hasse 图如下：

  #align(center)[
    #diagram(
      node-shape: circle,
      node-stroke: 0.5pt,
      node((0,0), $a$, name: <a>),
      node((1,0), $b$, name: <b>),
      node((0.5,1), $c$, name: <c>),
      node((0.5,2), $d$, name: <d>),

      edge(<c>, <d>)
    )
  ]

  $A$ 不具有最大元和最小元，因为 $a$ 和 $b$ 孤立的存在使得其他元素和其可比；$A$ 的极大元是 $a,b,d$，极小元是 $a,b,c$（确实没有其他元素比 $a$ 或者 $b$ 大于或者小于，它们既是极大元也是极小元）。

\
== 主观题 12.7
\
设 $D$ 是 $ZZ^+$ 上的整除关系，$T={1,2,dots.c.h,10} subset.eq ZZ^+$，在偏序集 $angle.l ZZ^+, D angle.r$ 中，求 $T$ 的上界、下界、上确界和下确界。

我们可以得到偏序集 $angle.l ZZ^+, D angle.r$ 的 Hasse 图大致如下：

#align(center)[
  #diagram(
    node-shape: circle,
    node-stroke: 0.5pt,
    node((0,0), $1$, name: <1>),
    node((-2,-0.7), $2$, name: <2>),
    node((-1,-0.7), $3$, name: <3>),
    node((0,-0.7), $5$, name: <5>),
    node((1,-0.7), $7$, name: <7>),
    node((2,-0.7), $dots.c.h$, name: <prime>),
    node((-3,-1.4), $4$, name: <4>),
    node((-2,-1.4), $6$, name: <6>),
    node((-4,-2.1), $8$, name: <8>),
    node((-1,-1.4), $9$, name: <9>),
    node((0,-1.4), $10$, name: <10>),
    
    edge(<1>, <2>),
    edge(<1>, <3>),
    edge(<1>, <5>),
    edge(<1>, <7>),
    edge(<1>, <prime>),
    edge(<2>, <4>),
    edge(<2>, <6>),
    edge(<3>, <6>),
    edge(<4>, <8>),
    edge(<3>, <9>),
    edge(<2>, <10>),
    edge(<5>, <10>),
  )
]

因此 $T$ 在偏序集 $angle.l ZZ^+, D angle.r$ 中的上界是 $x=2520k, k in ZZ^+$，下界是 $1$；上确界是 $2520$，下确界是 $1$。

\
== 主观题 12.8
\
设 $R$ 是 $A$ 上的偏序关系，$B subset.eq A$，证明 $R sect (B times B)$ 是 $B$ 上的偏序关系。

证明：只需要依次说明 $R sect (B times B)$ 具有自反性和传递性，但不具有对称行即可：
- 自反性：设 $x in B$，因此 $x R x and x(B times B)x$，因此 $<x,x> in R sect (B times B)$，故 $R sect (B times B)$ 满足自反性；
- 传递性：设 $x,y,z in B$，并且 $<x,y>, <y,z> in R sect (B times B)$，则我们知道 $<x,y> in R and <x,y> in B times B$，