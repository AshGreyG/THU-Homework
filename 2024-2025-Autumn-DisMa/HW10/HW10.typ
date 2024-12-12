#import "@preview/fletcher:0.5.3" as fletcher: diagram, node, edge

= 2024-2025秋季学期离散数学-第 10 次作业
\
何昱晖 2022012050 2024-12-11
\
== 主观题 9.7
\
在 $1~250$ 之间，设能被 2 整除的元素构成的集合为 $N_2$，能被 3 整除的元素构成的集合为 $N_3$，能被 5 整除的元素构成的集合为 $N_5$，则根据容斥原理：

$ "#"(N_2 union N_3 union N_5)&="#"(N_2)+"#"(N_3)+"#"(N_5) \
&-"#"(N_2 sect N_3)-"#"(N_2 sect N_5)-"#"(N_3 sect N_5) \
&+"#"(N_2 sect N_3 sect N_5) \
&=125+83+50-41-25-16+8 \
&=184 $

\
== 主观题 10.1
\
1. 集合 $A={0,1,2}$，$B={0,2,4}$，关系 $R={<x,y> | x,y in A sect B}$

  注意到 $A sect B={0,2}$，因此关系

  $ R={&<0,0>,<0,2>,<2,0>,<2,2>} $

2. 集合 $A={1,2,3,4,5}$，$B={1,2,3}$，关系 $R={<x,y> | x in A and y in  B and x=y^2}$

  注意到只有 $1=1^2$ 和 $4=2^2$，因此关系

  $ R={<1,1>,<4,2>} $

3. 列出所有从集合 $A={a,b,c}$ 到集合 $B={d}$ 的关系。我们知道 Cartesian 积：

  $ A times B={<a,d>,<b,d>,<c,d>} $

  因此 $R_1=<a,d>, R_2=<b,d>, R_3=<c,d>$
\
== 主观题 10.2
\
我们知道 $A union B={<1,2>,<2,4>,<3,3>,<1,3>,<2,4>,<4,2>}$，则 $A union B$ 的定义域为：

  $ "dom"(A union B)={1,2,3,4} $

  我们知道 $A sect B=emptyset$，则空关系的值域也是空集 $emptyset$，即

  $ "ran"(A sect B)=emptyset $
\
== 主观题 10.3
\
1. 求证 $"dom"(R union S)="dom"(R) union "dom"(S)$

  证明：根据关系定义域的定义，可以得到 $"dom"(R)={x | exists y(<x,y> in R)}$ 以及 $"dom"(S)={x | exists y(<x,y> in S)}$，则 
  
  $ "dom"(R) union "dom"(S)&={x_1,x_2 | exists y_1 exists y_2(<x_1,y_1> in R or <x_2,y_2> in S)} \
  &={x | exists y_1 exists y_2(<x,y_1> in R or <x,y_2> in S)} $

  我们知道 $R union S={<x,y> | <x,y> in R or <x,y> in S}$，因此 

  $ "dom"(R union S)={x | exists y_1 exists y_2(<x,y_1> in R or <x,y_2> in S)} $

  于是 $"dom"(R union S)="dom"(R) union "dom"(S)$。证毕。$square$

2. 求证 $"dom"(R sect S)="dom"(R) sect "dom"(S)$

  证明：根据关系定义域的定义，可以得到 $"dom"(R)={x | exists y(<x,y> in R)}$ 以及 $"dom"(S)={x | exists y(<x,y> in S)}$，则 
  
  $ "dom"(R) sect "dom"(S)={x | exists y_1 exists y_2(<x,y_1> in R and <x,y_2> in S)} $

  我们知道 $R sect S={<x,y> | <x,y> in R and <x,y> in S}$，因此 

  $ "dom"(R sect S)={x | exists y_1 exists y_2(<x,y_1> in R and <x,y_2> in S)} $

  于是 $"dom"(R sect S)="dom"(R) sect "dom"(S)$。证毕。$square$
\
== 主观题 10.4
\
1. 已知 $"#"(A)=3$，则总共存在 $2^(3^2)=2^9=512$ 种关系；
2. 已知 $"#"(A)=n$，则总共存在 $2^(n^2)$ 种关系。
\
== 主观题 10.5
\
$n$ 元关系是指对于任意 $n>1$，Cartesian 积 $A_1 times dots.h.c times A_n$ 的任意子集都是从 $A_1$ 到 $A_n$ 的 $n$ 元关系。我们知道上述 Cartesian 积可以被写作：

$ ( dots.c.h ((A_1 times A_2) times A_3) times dots.c.h) times A_n $

因此使用二元关系可以这么定义：

$ A_1 times dots.c.h times A_n={< dots.c.h <<p_1,p_2>,p_3> dots.c.h, p_n> | p_i in A_i, 1 <= i <= n} $
\
== 主观题 10.6
\
1. 对于集合 ${0,1,2,3,4}$ 上的关系 $R_1={<x,y> | x >= 2 and y <= 2}$

  #table(
    stroke: none,
    columns: (auto, auto),
    align: center,
    table.header(
      [关系图], [关系矩阵]
    ),
    diagram(
      node((1,0), [0], name: <1>),
      node((1,0.4), [1], name: <2>),
      node((1,0.8), [2], name: <3>),
      node((1,1.2), [3], name: <4>),
      node((1,1.6), [4], name: <5>),
      node((2,0), [0], name: <6>),
      node((2,0.4), [1], name: <7>),
      node((2,0.8), [2], name: <8>),
      node((2,1.2), [3], name: <9>),
      node((2,1.6), [4], name: <10>),
      edge(<3>, <6>, "->"),
      edge(<3>,<7>, "->"),
      edge(<3>, <8>, "->"),
      edge(<4>, <6>, "->"),
      edge(<4>, <7>, "->"),
      edge(<4>, <8>, "->"),
      edge(<5>, <6>, "->"),
      edge(<5>, <7>, "->"),
      edge(<5>, <8>, "->")
    ),
    $ mat(
      space.en , #text(red)[0], #text(red)[1], #text(red)[2], #text(red)[3], #text(red)[4] ;
      #text(red)[0], 0, 0, 0, 0, 0;
      #text(red)[1], 0, 0, 0, 0, 0;
      #text(red)[2], 1, 1, 1, 0, 0;
      #text(red)[3], 1, 1, 1, 0, 0;
      #text(red)[4], 1, 1, 1, 0, 0;
      augment: #(hline: 1, vline: 1, stroke: 0.5pt + red)
    ) $
  )

2. 对于集合 ${0,1,2,3,4}$ 上的关系 $R_2={<x,y> | forall 1 <= k <= min(x,y), x mod k != 0 and y mod k != 0}$，即 $x,y$ 互质

  #table(
    stroke: none,
    columns: (auto, auto),
    align: center,
    table.header(
      [关系图], [关系矩阵]
    ),
    diagram(
      node((1,0), [0], name: <1>),
      node((1,0.4), [1], name: <2>),
      node((1,0.8), [2], name: <3>),
      node((1,1.2), [3], name: <4>),
      node((1,1.6), [4], name: <5>),
      node((2,0), [0], name: <6>),
      node((2,0.4), [1], name: <7>),
      node((2,0.8), [2], name: <8>),
      node((2,1.2), [3], name: <9>),
      node((2,1.6), [4], name: <10>),
      edge(<2>,<8>, "->"),
      edge(<2>,<9>, "->"),
      edge(<2>,<10>, "->"),
      edge(<3>, <7>, "->"),
      edge(<3>, <9>, "->"),
      edge(<4>, <7>, "->"),
      edge(<4>, <8>, "->"),
      edge(<4>, <10>, "->"),
      edge(<5>, <7>, "->"),
      edge(<5>, <9>, "->")
    ),
    $ mat(
      space.en, #text(red)[0], #text(red)[1], #text(red)[2], #text(red)[3], #text(red)[4] ;
      #text(red)[0], 0, 0, 0, 0, 0;
      #text(red)[1], 0, 0, 1, 1, 1;
      #text(red)[2], 0, 1, 0, 1, 0;
      #text(red)[3], 0, 1, 1, 0, 1;
      #text(red)[4], 0, 1, 0, 1, 0;
      augment: #(hline: 1, vline: 1, stroke: 0.5pt + red)
    ) $
  )

