= 2024-2025秋季学期离散数学-第 10 次作业
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
$n$ 元关系是指对于任意 $n>1$，Cartesian 积 $A_1 times dots.h.c A_n$ 的任意子集都是从 $A_1$ 到 $A_n$ 的 $n$ 元关系。我们知道 Cartesian 积满足

