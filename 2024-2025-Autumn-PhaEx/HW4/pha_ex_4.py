import pandas as pd
import matplotlib.pyplot as plt
import numpy as np
from scipy import stats

color_C = "#89c9c8"
color_E = "#f9bebb"
alpha_bar = 0.4
alpha_scatter = 0.7

plt.rcParams["font.family"]="STZhongsong"

def convert_to_seconds(input : str) -> int :
    min_index = input.find("min")
    sec_index = input.find("s")
    sep_index = input.find(":")
    if min_index != -1 and sec_index != -1 :
        return int(input[:min_index]) * 60 + int(input[min_index + 3:sec_index])
    elif min_index == -1 and sec_index != -1 :
        return int(input[:sec_index])
    elif min_index != -1 and sec_index == -1 :
        return int(input[:min_index]) * 60
    elif min_index == -1 and sec_index == -1 and sep_index != -1 :
        return int(input[:sep_index]) * 60 + int(input[sep_index + 1:])
    else :
        return -1

ex4 = pd.read_excel(r"C:\Users\AshGrey\Downloads\data.xlsx", sheet_name="Sheet1")

con = ex4[ex4["实验分组（低、中、高剂量组/对照组）"].isin(["对照组"])]
con_first = con["首次出现扭体反应时间"].apply(convert_to_seconds)
con_times = con["扭体次数（次数/15min)"]
con_first_mean = con_first.mean()
con_first_std  = con_first.std()
con_times_mean = con_times.mean()
con_times_std  = con_times.std()
con_times_sem  = con_times_std / np.sqrt(len(con_times))

low = ex4[ex4["实验分组（低、中、高剂量组/对照组）"].isin(["低剂量组"])]
low_first = low["首次出现扭体反应时间"].apply(convert_to_seconds)
low_times = low["扭体次数（次数/15min)"]
low_first_mean = low_first.mean()
low_first_std  = low_first.std()
low_times_mean = low_times.mean()
low_times_std  = low_times.std()
low_times_sem  = low_times_std / np.sqrt(len(low_times))

mid = ex4[ex4["实验分组（低、中、高剂量组/对照组）"].isin(["中剂量组"])]
mid_first = mid["首次出现扭体反应时间"].apply(convert_to_seconds)
mid_times = mid["扭体次数（次数/15min)"]
mid_first_mean = mid_first.mean()
mid_first_std  = mid_first.std()
mid_times_mean = mid_times.mean()
mid_times_std  = mid_times.std()
mid_times_sem  = mid_times_std / np.sqrt(len(mid_times))

high = ex4[ex4["实验分组（低、中、高剂量组/对照组）"].isin(["高剂量组"])]
high_first = high["首次出现扭体反应时间"].apply(convert_to_seconds)
high_times = high["扭体次数（次数/15min)"]
high_first_mean = high_first.mean()
high_first_std  = high_first.std()
high_times_mean = high_times.mean()
high_times_std  = high_times.std()
high_times_sem  = high_times_std / np.sqrt(len(high_times))

print(f'''
对照组-首次出现扭体反应平均时间：    {con_first_mean} ± {con_first_std}
对照组-平均扭体次数：              {con_times_mean} ± {con_times_std}
低剂量组-首次出现扭体反应平均时间：  {low_first_mean} ± {low_first_std}
低剂量组-平均扭体次数：            {low_times_mean} ± {low_times_std}
中剂量组-首次出现扭体反应平均时间：  {mid_first_mean} ± {mid_first_std}
中剂量组-平均扭体次数：            {mid_times_mean} ± {mid_times_std}
高剂量组-首次出现扭体反应平均时间：  {high_first_mean} ± {high_first_std}
高剂量组-平均扭体次数：            {high_times_mean} ± {high_times_std}
''')

print(f'''
低剂量组镇痛百分率：{(con_times_mean - low_times_mean) / con_times_mean * 100}%
中剂量组镇痛百分率：{(con_times_mean - mid_times_mean) / con_times_mean * 100}%
高剂量组镇痛百分率：{(con_times_mean - high_times_mean) / con_times_mean * 100}%
''')

tstat_low, pval_low = stats.ttest_ind(a=con_times.to_numpy(), b=low_times.to_numpy(), alternative="two-sided")
tstat_mid, pval_mid = stats.ttest_ind(a=con_times.to_numpy(), b=mid_times.to_numpy(), alternative="two-sided")
tstat_high, pval_high = stats.ttest_ind(a=con_times.to_numpy(), b=high_times.to_numpy(), alternative="two-sided")

print(f'''
t-stat of low : {tstat_low}    p-val of low : {pval_low}
t-stat of mid : {tstat_mid}    p-val of mid : {pval_mid}
t-stat of high : {tstat_high}  p-val of high : {pval_high}
''')

group_labels = ["对照组", "低剂量组", "中剂量组", "高剂量组"]
group = np.arange(len(group_labels))
mean_count = np.array([con_times_mean, low_times_mean, mid_times_mean, high_times_mean])
sem_count = np.array([con_times_sem, low_times_sem, mid_times_sem, high_times_sem])
p_values = np.array([pval_low, pval_mid, pval_high])

fig, ax = plt.subplots(figsize=(5, 6))

ax.bar(group, mean_count, yerr=sem_count, width=0.4, capsize=5, 
       color=color_C, alpha=alpha_bar, label="平均扭体次数", 
       error_kw={"ecolor": color_C, "elinewidth" : 2})

jitter = 0.05
x_jittered_con = group[0] + np.random.uniform(-jitter, jitter, len(con_times))
x_jittered_low = group[1] + np.random.uniform(-jitter, jitter, len(low_times))
x_jittered_mid = group[2] + np.random.uniform(-jitter, jitter, len(mid_times))
x_jittered_high = group[3] + np.random.uniform(-jitter, jitter, len(high_times))
ax.scatter(x_jittered_con, con_times, s=30, alpha=alpha_scatter, color=color_C, marker="o")
ax.scatter(x_jittered_low, low_times, s=30, alpha=alpha_scatter, color=color_C, marker="o")
ax.scatter(x_jittered_mid, mid_times, s=30, alpha=alpha_scatter, color=color_C, marker="o")
ax.scatter(x_jittered_high, high_times, s=30, alpha=alpha_scatter, color=color_C, marker="o")

for i, p in enumerate(p_values) :
    sig = "***" if p < 0.001 else "**" if p < 0.01 else "*" if p < 0.05 else ""
    ax.text(i + 1, mean_count[i + 1] + sem_count[i + 1] * 1.2, f"p={np.around(p, 3)}", 
            ha="center", va="bottom", fontsize=8, color=color_C)

ax.set_xticks(group)
ax.set_xticklabels(group_labels)
ax.set_ylabel("扭体次数（次/15min）")
ax.set_title("对乙酰氨基酚的镇痛作用")

plt.savefig("figure-4.svg", format="svg")