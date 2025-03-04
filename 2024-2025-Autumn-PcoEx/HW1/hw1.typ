= #highlight(fill: rgb("#a6d189"))[药物化学综合实验一：扑炎痛的合成]
\
\
\
== 1 #highlight(fill: rgb("#a6d189"))[实验目的和原理]
\
=== 1.1 #highlight(fill: rgb("#a6d189"))[实验目的]
\
- 通过乙酰水杨酰氯的制备，了解*氯化试剂*的选择及操作中的注意事项；
- 通过本实验了解*拼合原理*在化学结构修饰方面的应用；
- 通过本实验了解 Schotten-Baumann *酯化反应*原理；
- 通过本实验了解相转移催化合成方法；
- 熟悉合成药物的*结构确证*方法。
\
=== 1.2 #highlight(fill: rgb("#a6d189"))[实验原理]
\
扑炎痛为一种新型解热镇痛抗炎药，是由*阿司匹林*（乙酰水杨酸）和*扑热息痛*（对乙酰氨基酚）经拼合原理制成，它既保留了原药的解热镇痛功能，又减少了原药的毒副作用，并有协同作用。适用于急/慢性风湿性关节炎、风湿痛、感冒发烧、头痛和神经痛等。扑炎痛化学名为2-乙酰氧基苯甲酸-乙酰胺基苯酯，化学结构式如图一：
\
#figure(
  image("figure-1.png", width: 40%),
  caption: [
    扑炎痛的结构式
  ]
)
\
扑炎痛为白色结晶性粉末，无臭无味。mp.174\~178 $degree.c$，不溶于水，微溶于乙醇，溶于氯仿、丙酮。合成路线如下：
\
#figure(
  image("figure-2.png", width: 80%),
  caption: [
    扑炎痛的合成路线
  ]
)
\
本合成法以阿司匹林和扑热息痛为原料，阿司匹林经氯化生成乙酰水杨酰氯，扑热息痛成钠盐，两者经缩合酯化生成扑炎痛。
\
== 2 #highlight(fill: rgb("#a6d189"))[实验试剂]
\
#show table.cell.where(y: 0): strong
#set table(
  stroke: (x, y) => if y == 0 {
    (bottom: 0.7pt + black)
  },
  align: (x, y) => (
    if x > 0 {center}
    else {left}
  )
)
#table(
  columns: 6,
  inset: 10pt,
  align: center,
  
  table.header(
    [名称], [规格], [理论用量], [沸点/$degree.c$], [熔点/$degree.c$], [分子量],
  ),
  [阿司匹林], [药用], [9g], [321.4 \ at 760 mmHg], [136\~140], [180.16],
  [扑热息痛], [药用], [7.5g], [129.3], [169\~171], [151.16],
  [氯化亚砜], [CP \ D=1.638], [5mL], [78.8], [-105], [118.96],
  [N,N-二甲基甲酰胺], [CP \ D=0.948], [3滴（约80$mu$L）], [152.8], [-60.5], [73.10],
  [醋酸正丁酯], [CP \ D=0.88], [12mL], [126.6], [-77.9], [116.16],
  [溴化四丁基铵], [CP], [0.5g], [102], [100\~104], [322.37],
  [氢氧化钠], [CP], [3.6g（20mL水）], [1388], [318], [40],
  [乙醇], [AR \ D=0.789], [50mL（95%）], [78.4], [-114.3], [46.07]
)
\
== 3 #highlight(fill: rgb("#a6d189"))[原始实验数据记录及现象记录]
\
=== 3.1 #highlight(fill: rgb("#a6d189"))[实验准备]
\
本实验采用方案B。进入实验室可以先开启加热装置，这样等到开始实验的时候就不需要等待加热时间了。实际称取阿司匹林*9.096g*，扑热息痛*7.5g*。取适量氯化钙放入干燥管中，连接上导气管，导气管另一端连接尾气吸收装置。
\
=== 3.2 #highlight(fill: rgb("#a6d189"))[实验过程]
\
按照实验手册搭好乙酰水杨酰氯的实验装置。在干燥的 100ml 圆底烧瓶中，依次加入磁力搅拌子，DMF 三滴，阿司匹林*9.096g*，氯化亚砜*5ml*。将上述圆底烧瓶装置放在油浴中，连接上冷凝器。油浴温度缓慢加热到 $45 degree.c$，打开磁力搅拌器。维持油浴温度 $45 plus.minus 2 degree.c$ 反应 70min。减压除去过量的的氯化亚砜，得到淡黄色透明液体。加入醋酸正丁酯 12ml 至上述圆底烧瓶中，然后将反应液倾入干燥的 25ml 滴液漏斗中。

按照实验手册搭好制取扑炎粗品的实验装置。在 250ml 圆底烧瓶中，加入扑热息痛*7.5g*，水 30ml。冷水冰浴至 $10 degree.c$ 左右，在搅拌下用胶头滴管滴加 10% 氢氧化钠溶液 20ml 至完全溶解。加入醋酸正丁酯 50ml，溴化四丁基铵 0.5g，搅拌 5\~10min。在 $8\~12 degree.c$ 之间强烈搅拌下，缓慢滴加前面制取得到的乙酰水杨酰氯的溶液。滴加完毕后确认 $"pH" >= 10$，控制温度在 $8\~12 degree.c$ 之间继续搅拌反应 30min。反应结束后进行抽滤，将产物用水洗至中性。
\
#figure(
  image("figure-3.jpg", width: 80%),
  caption: [
    制取粗品过程中的圆底烧瓶
  ]
)
\
#figure(
  image("figure-4.jpg", height: 40%),
  caption: [
    从上方看制取粗品过程中的圆底烧瓶
  ]
)
\
#figure(
  image("figure-5.jpg", height: 40%),
  caption: [
    粗品
  ]
)
\
按照实验手册搭好精制扑炎痛的装置。取粗品 5g 置于装有蛇形冷凝器的 100ml 圆底烧瓶中，加入 50ml 95% 的乙醇，在油浴上加热溶解。停止加热，往圆底烧瓶中加入适量活性炭进行脱色，$80 degree.c$ 左右加热回流 30min。回流结束关闭冷凝水。趁热过滤，自然冷却，待结晶完全析出，进行抽滤，压干。用少量乙醇洗涤两次，压干，得精品。
\
#figure(
  image("figure-6.jpg", height: 40%),
  caption: [
    制取精品时的圆底烧瓶
  ]
)
\
#figure(
  image("figure-9.jpg", height: 40%),
  caption: [
    精品
  ]
)
\
经过称量，最终的精品质量为*1.739g*。熔点为：
\
#figure(
  image("figure-11.jpg", width: 80%),
  caption: [
    扑炎痛的熔点
  ]
)
\
== 4 #highlight(fill: rgb("#a6d189"))[思考题]
\
+ 选择一种检索数据库对扑炎痛进行检索，查阅其相关信息。

  #highlight(fill: rgb("#eeeeee"))[
    基本信息

    化学名称：2 - 乙酰氧基苯甲酸 - 4 - 乙酰氨基苯酯

    英文名：Benorilate
    
    分子式：C₁₇H₁₅NO₅

    分子量：313.31

    CAS 号：5003-48-5

    药理作用

    贝诺酯是对乙酰氨基酚与乙酰水杨酸的酯化产物，属于非甾体类抗炎、抗风湿、解热镇痛药。口服后在胃肠道不被水解，在肠内吸收并迅速在血中达有效浓度，在肝中代谢，半衰期约 1 小时。通过对中枢神经系统环加氧酶的抑制，减少前列腺素合成，并直接作用于受体部位，能阻止疼痛介质前列腺素的形成，还可降低肾血流量和尿量，降低肾盂输尿管内压，使肾绞痛得以缓解或消失。此外，尚有抑制抗原 - 抗体形成，抑制组织胺、缓激肽等形成，降低炎症组织中血管通透性，消除水肿等一系列抗炎作用。

    临床应用

    类风湿性关节炎、急慢性风湿性关节炎、风湿痛：可缓解关节疼痛、肿胀等症状，改善关节功能。
    感冒发烧、头痛、神经痛及术后疼痛：能减轻感冒引起的发热、头痛，以及各类神经痛和术后创口疼痛等，起到解热、镇痛的效果。

  ]
+ 吡啶、DMF催化酰氯反应的机理是什么？

  #highlight(fill: rgb("#eeeeee"))[
    吡啶催化酰氯反应的机理

    亲核进攻酰氯：吡啶具有一个富电子的氮原子，氮原子上的孤对电子使其具有亲核性。在酰氯反应中，吡啶的氮原子首先对酰氯的羰基碳进行亲核进攻，形成一个带正电荷的中间体。这一步是反应的起始步骤，通过吡啶的亲核作用，使酰氯的羰基碳的电子云密度发生改变，为后续反应创造条件。
    增强酰氯活性：形成的中间体中，吡啶氮原子与酰氯的羰基碳相连，由于吡啶正离子的吸电子效应，使得与羰基碳相连的氯原子更易离去，从而增强了酰氯的反应活性。此时，氯原子带着一对电子以氯离子的形式离去，中间体转化为一个具有更高活性的酰基吡啶正离子中间体。
    与亲核试剂反应：体系中的亲核试剂（如醇、胺等）进攻酰基吡啶正离子中间体的羰基碳，这是反应的关键步骤，亲核试剂与酰基结合，同时吡啶离去，吡啶在这里起到了催化作用，因为它在反应前后并未发生本质变化，只是促进了反应的进行，最终生成相应的酰化产物。

    DMF 催化酰氯反应的机理

    形成活性中间体：DMF 的结构中，氮原子上连有两个甲基，由于甲基的给电子效应以及氮原子与羰基的共轭作用，使得 DMF 的羰基碳具有一定的亲电性。酰氯与 DMF 首先发生反应，酰氯的氯原子进攻 DMF 的羰基碳，形成一个具有正电荷的中间体，同时 DMF 的氮原子上的孤对电子与酰氯的羰基碳形成一个新的键，生成一个活性更高的中间体。
    促进亲核反应：生成的活性中间体中的碳氯键具有较高的活性，容易受到亲核试剂的进攻。亲核试剂进攻中间体中的羰基碳，使得中间体发生解离，形成酰化产物和一个含有 DMF 和氯化氢的复合物。
    催化剂再生：最后，复合物中的氯化氢与体系中的其他碱性物质（如吡啶或其他碱）反应，使 DMF 得以再生，继续参与下一轮的催化反应。
  ]

+ Schotten-Baumann反应的机理是什么？

  #highlight(fill: rgb("#eeeeee"))[
    底物与碱的作用

    以胺与酰氯反应生成酰胺为例，首先胺作为亲核试剂，由于胺中氮原子上存在孤对电子，具有亲核性。在碱性条件下，体系中的碱（如氢氧化钠、碳酸钠等）会与胺作用，使胺的氮原子上的电子云密度进一步增加，增强其亲核性。这是因为碱可以夺取胺上的一个质子，形成胺的共轭碱，从而使氮原子上的孤对电子更易给出。

    亲核进攻

    经过碱活化后的胺，其氮原子的孤对电子对酰氯的羰基碳进行亲核进攻，形成一个带有负电荷的四面体中间体。在这个过程中，酰氯的碳氧双键中的 π 键打开，电子对转移到氧原子上，使氧原子带上一个负电荷。同时，由于酰氯中氯原子具有较强的电负性，使得羰基碳具有较高的正电性，容易受到亲核试剂的进攻，这是反应能够发生的关键因素。

    消除反应

    形成的四面体中间体不稳定，氧原子上的负电荷会重新形成碳氧双键，同时氯原子带着一对电子以氯离子的形式离去。这一步是一个消除反应，通过消除氯离子，中间体转化为酰胺产物。

    酸碱平衡

    反应生成的酰胺可能会与体系中的碱继续作用，形成酰胺的共轭碱和水。但在大多数情况下，由于酰胺的酸性较弱，这一步反应通常是可逆的，并且在反应结束后，通过调节反应体系的 pH 值，可以使酰胺以其稳定的形式存在。同时，生成的氯离子与体系中的阳离子（如碱金属离子）结合形成盐。

  ]

+ 通过制取扑炎痛的实验说明酯化反应在结构修饰上的意义。

  #highlight(fill: rgb("#eeeeee"))[
    增加药物的稳定性

    阿司匹林分子中的羧基和对乙酰氨基酚分子中的酚羟基都具有一定的反应活性，在外界环境因素（如湿度、光照等）的影响下，容易发生变质反应。例如，阿司匹林在潮湿的环境中容易水解成水杨酸和乙酸，从而降低药物的疗效。
    通过酯化反应，将阿司匹林的羧基与对乙酰氨基酚的酚羟基结合形成酯键，得到扑炎痛，减少了易反应的活性基团，使药物的化学性质更加稳定，有利于药物的储存和运输。

    改善药物的吸收性能

    阿司匹林和对乙酰氨基酚都是极性较大的分子，在胃肠道中的吸收存在一定的局限性。而扑炎痛分子通过酯化反应，在一定程度上改变了分子的极性和脂溶性。
    扑炎痛的脂溶性相对阿司匹林和对乙酰氨基酚有所提高，根据 “相似相溶” 原理，它更容易通过生物膜，从而在胃肠道中能够更好地被吸收，提高了药物的生物利用度，使药物能够更快地发挥药效。

    降低药物的毒副作用

    阿司匹林对胃肠道有一定的刺激性，长期或大量使用可能会导致胃肠道溃疡、出血等不良反应。这是因为阿司匹林的羧基具有酸性，会对胃肠道黏膜产生刺激作用。
    制成扑炎痛后，阿司匹林的羧基被酯化，其酸性大大降低，对胃肠道的直接刺激作用明显减弱。同时，扑炎痛作为前体药物，在体内经过代谢才释放出阿司匹林和对乙酰氨基酚发挥作用，避免了阿司匹林对胃肠道的直接刺激，降低了药物的毒副作用。

    增强药物的协同作用

    阿司匹林具有解热、镇痛、抗炎作用，对乙酰氨基酚也有良好的解热、镇痛作用，二者作用机制略有不同。
    通过酯化反应将二者结合在一个分子中，扑炎痛进入体内后，在酯酶的作用下逐渐分解为阿司匹林和对乙酰氨基酚，两种药物在体内同时发挥作用，产生协同效应，增强了整体的解热、镇痛效果，比单独使用阿司匹林或对乙酰氨基酚的疗效更为显著。
  ]

+ 什么叫拼合原理？试举例说明拼合原理在药物化学合成中的意义。

  #highlight(fill: rgb("#eeeeee"))[
    拼合原理是指将两种或两种以上具有不同药理活性的化合物或药效基团，通过共价键连接或其他方式组合在一个分子中，使新的化合物同时具有原来几种化合物的药理作用，或产生新的、更强的药理活性，同时可能降低药物的毒副作用，改善药物的药代动力学性质等。
    
    增强药物活性，改善药物的药代动力学性质，降低药物的毒副作用，克服耐药性
  ]

+ 举例说明相转移催化在药物合成中的应用？

  #highlight(fill: rgb("#eeeeee"))[
    氯霉素的合成

    反应过程：在氯霉素合成过程中，对硝基苯乙酮与氯仿在碱性条件下进行缩合反应时，由于反应物分别处于有机相和水相，反应速率较慢。加入季铵盐类相转移催化剂，如苄基三乙基氯化铵（TEBA）后，相转移催化剂能够将水相中的氢氧根离子转移到有机相中，使对硝基苯乙酮在有机相中与氯仿发生缩合反应，生成对硝基 -α- 羟基 -β- 氯丙酰苯，进而通过后续反应制得氯霉素。
    应用优势：相转移催化使原本难以进行的反应在较温和的条件下顺利进行，提高了反应速率和产物收率，避免了使用价格昂贵或反应条件苛刻的试剂和方法，降低了合成成本，并且减少了副反应的发生，提高了产品质量。
  ]