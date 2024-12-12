#import "@preview/fletcher:0.5.3" as fletcher: diagram, node, edge

= 2024-2025秋季学期离散数学-第 9 次作业
\
何昱晖 2022012050 2024-12-11
\
== 主观题 9.1
\
1. 我们分别计算 $cal(P)cal(P)cal(P)(emptyset)$、$cal(P)cal(P)(emptyset)$ 以及 $cal(P)(emptyset)$，很容易可以得到

  $ cal(P)(emptyset)={emptyset} \
    cal(P)cal(P)(emptyset)={emptyset,{emptyset}} \
    cal(P)cal(P)cal(P)(emptyset)={emptyset,{emptyset},{{emptyset}},{emptyset,{emptyset}}} $
  
  因此我们可以得到

  $ union.big{cal(P)cal(P)cal(P)(emptyset),cal(P)cal(P)(emptyset),cal(P)(emptyset),emptyset}={emptyset,{emptyset},{{emptyset}},{emptyset,{emptyset}}} $

  当然也可以使用 $union{cal(P)(A)}=A$ 的结论得到该广义并是 $cal(P)cal(P)cal(P)(emptyset)$

2. 根据上面的计算结果，我们可以得到

  $ sect.big{cal(P)cal(P)cal(P)(emptyset),cal(P)cal(P)(emptyset),cal(P)(emptyset)}={emptyset} $
\
== 主观题 9.2
\
1. $cal(P)(A)={emptyset,{emptyset},{{emptyset}},{{emptyset},{{emptyset}}}}$，易知 $union cal(P)(A)=A={{emptyset},{{emptyset}}}$
2. $union A={emptyset,{emptyset}}$，则其幂集 $cal(P)(union A)={emptyset,{emptyset},{{emptyset}},{emptyset,{emptyset}}}$
\
== 主观题 9.3
\
1. 证明：我们知道 $A-B={x | x in A and x in.not B}$，则 $(A-B)-C={x | x in A and x in.not B and x in.not C}$，并且我们还有

  $ A-C&={x | x in A and x in.not C} \
    B-C&={x | x in B and x in.not C} \
    (A-C)-(B-C)&={x | x in A and x in.not C and not(x in B and x in.not C)} \
    &={x | x in A and x in.not B and x in.not C} $
  
  因此两个集合是相等的，$(A-B)-C=(A-C)-(B-C)$

2. 证明：$A xor B=(A-B)union(B-A)={x | (x in A and x in.not B) or (x in B and x in.not A)}$，注意到 $A=B$，因此，$x in A and x in.not B=upright(F,)$，于是我们证明了 $A xor B=emptyset$

3. 证明：我们知道 $A sect B=emptyset$ 等价于 $forall x in A, x in.not B$，而 $A subset.eq -B$ 等价于 $forall x in A, x in.not B $，因此我们证明了

  $ A sect B=emptyset arrow.l.r.double A subset.eq -B $

  我们知道 $B subset.eq -A$ 等价于 $forall x in B, x in.not A$，这也等价于 $forall x in A, x in.not B$，综上所述我们证明了

  $ A sect B arrow.l.r.double A subset.eq -B arrow.l.r.double B subset.eq -A $
\
== 主观题 9.4
\
1. $A-B=B$，则说明 $forall x in B$ 都有 $ x in.not B and x in A$，这只能说明 $A=B=emptyset$
2. $A-B=B-A$，则说明 $forall x in A and x in.not B$ 都有 $x in B and x in.not A$，因此 $A=B$
3. $A sect B=A union B$，则说明 $A=B$
4. $A xor B=A$，则说明 $B subset.eq A$
\
== 主观题 9.5
\
1. $(A-B)union(A-C)=A$，这说明 $A-B supset.eq A-(A-C)$，于是可以得到 $A-B supset.eq C$，而这说明 $B sect C=emptyset$。如果利用 De Mogan 律可以更快得到

  $ (A-B)union(A-C)=A-B sect C=A $

  这说明 $B sect C=emptyset$

2. $(A-B)xor(A-C)=emptyset$，注意到
  
  $ (A-B)xor(A-C)&=((A-B)-(A-C))union((A-C)-(A-B)) \
  &=(C-B)union(B-C) \
  &=emptyset $

  这说明 $B=C$
\
== 主观题 9.6
\
1. 若 $A times B=emptyset$，则 $A=emptyset$ 或者 $B=emptyset$
2. 只有当 $A=emptyset$ 时才有可能有 $A times A=A$，否则 $A times A$ 得到的是集合 ${<x,y> | x,y in A}$，当 $A eq.not emptyset$ 时，$A times A eq.not A$
