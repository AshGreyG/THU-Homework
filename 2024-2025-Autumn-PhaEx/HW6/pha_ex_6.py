import matplotlib as mpl
mpl.use("svg")
import matplotlib.pyplot as plt
import pandas as pd
import numpy as np
from scipy import stats
import math

color_C = "#89c9c8"
color_E = "#f9bebb"
alpha_bar = 0.4
alpha_scatter = 0.7

plt.rcParams["font.family"] = "STZhongsong"

ex6 = pd.read_excel(r"~/Downloads/data.xlsx", sheet_name="Sheet1")

def convert_to_efficiency(input : str | int) -> int | float:
    if type(input) == int or type(input) == float :
        return input
    elif '>' in input or '/' in input or '\\' in input or input == '' :
        return math.nan
    else :
        return int(input)
    
def shrink_data_calc_p(a : pd.Series, b : pd.Series) -> float :
    a = a.dropna()
    b = b.dropna()

    # Notice if the data has NaN (Not a number), we must use 'dropna()' function
    # to remove NaN data.

    if len(a) > len(b) :
        t1 = a.to_numpy()[:len(b)]
        t2 = b.to_numpy()
    elif len(a) < len(b) :
        t1 = a.to_numpy()
        t2 = b.to_numpy()[:len(a)]
    else :
        t1 = a.to_numpy()
        t2 = b.to_numpy()
    t, p = stats.ttest_ind(a=t1, b=t2, alternative="two-sided")
    return p

warfarin_con = ex6[ex6.iloc[:,2].isin(["生理盐水"])]
warfarin_con_tubes = warfarin_con.iloc[:,5].apply(convert_to_efficiency)
warfarin_con_slide = warfarin_con.iloc[:,6].apply(convert_to_efficiency)
warfarin_con_tubes_mean = warfarin_con_tubes.mean()
warfarin_con_tubes_std  = warfarin_con_tubes.std()
warfarin_con_tubes_sem  = warfarin_con_tubes_std / np.sqrt(len(warfarin_con_tubes))
warfarin_con_slide_mean = warfarin_con_slide.mean()
warfarin_con_slide_std  = warfarin_con_slide.std()
warfarin_con_slide_sem  = warfarin_con_slide_std / np.sqrt(len(warfarin_con_slide))

warfarin_exp = ex6[ex6.iloc[:,2].isin(["华法林钠"])]
warfarin_exp_tubes = warfarin_exp.iloc[:,5].apply(convert_to_efficiency)
warfarin_exp_slide = warfarin_exp.iloc[:,6].apply(convert_to_efficiency)
warfarin_exp_tubes_mean = warfarin_exp_tubes.mean()
warfarin_exp_tubes_std  = warfarin_exp_tubes.std()
warfarin_exp_tubes_sem  = warfarin_exp_tubes_std / np.sqrt(len(warfarin_exp_tubes))
warfarin_exp_slide_mean = warfarin_exp_slide.mean()
warfarin_exp_slide_std  = warfarin_exp_slide.std()
warfarin_exp_slide_sem  = warfarin_exp_slide_std / np.sqrt(len(warfarin_exp_slide))

heparin_con = ex6[ex6.iloc[:,9].isin(["生理盐水"])]
heparin_con_tubes = heparin_con.iloc[:,12].apply(convert_to_efficiency)
heparin_con_slide = heparin_con.iloc[:,13].apply(convert_to_efficiency)
heparin_con_tubes_mean = heparin_con_tubes.mean()
heparin_con_tubes_std  = heparin_con_tubes.std()
heparin_con_tubes_sem  = heparin_con_tubes_std / np.sqrt(len(heparin_con_tubes))
heparin_con_slide_mean = heparin_con_slide.mean()
heparin_con_slide_std  = heparin_con_slide.std()
heparin_con_slide_sem  = heparin_con_slide_std / np.sqrt(len(heparin_con_slide))

heparin_exp = ex6[ex6.iloc[:,9].isin(["肝素钠"])]
heparin_exp_tubes = heparin_exp.iloc[:,12].apply(convert_to_efficiency)
heparin_exp_slide = heparin_exp.iloc[:,13].apply(convert_to_efficiency)
heparin_exp_tubes_mean = heparin_exp_tubes.mean()
heparin_exp_tubes_std  = heparin_exp_tubes.std()
heparin_exp_tubes_sem  = heparin_exp_tubes_std / np.sqrt(len(heparin_exp_tubes))
heparin_exp_slide_mean = heparin_exp_slide.mean()
heparin_exp_slide_std  = heparin_exp_slide.std()
heparin_exp_slide_sem  = heparin_exp_slide_std / np.sqrt(len(heparin_exp_slide))

pval_warfarin_tubes = shrink_data_calc_p(warfarin_con_tubes, warfarin_exp_tubes)
pval_warfarin_slide = shrink_data_calc_p(warfarin_con_slide, warfarin_exp_slide)
pval_heparin_tubes  = shrink_data_calc_p(heparin_con_tubes, heparin_exp_tubes)
pval_heparin_slide  = shrink_data_calc_p(heparin_con_slide, heparin_exp_slide)

print(f'''
warfarin :
  control group :
    glass tubes :
      mean : {warfarin_con_tubes_mean}
      std  : {warfarin_con_tubes_std}
      sem  : {warfarin_con_tubes_sem}
    glass slide :
      mean : {warfarin_con_slide_mean}
      std  : {warfarin_con_slide_std}
      sem  : {warfarin_con_slide_sem}
  experiment group :
    glass tubes :
      mean : {warfarin_exp_tubes_mean}
      std  : {warfarin_exp_tubes_std}
      sem  : {warfarin_exp_tubes_sem}
      p    : {pval_warfarin_tubes}
    glass slide :
      mean : {warfarin_exp_slide_mean}
      std  : {warfarin_exp_slide_std}
      sem  : {warfarin_exp_slide_sem}
      p    : {pval_warfarin_slide}
heparin :
  control group :
    glass tubes :
      mean : {heparin_con_tubes_mean}
      std  : {heparin_con_tubes_std}
      sem  : {heparin_con_tubes_sem}
    glass slide :
      mean : {heparin_con_slide_mean}
      std  : {heparin_con_slide_std}
      sem  : {heparin_con_slide_sem}
  experiment group :
    glass tubes :
      mean : {heparin_exp_tubes_mean}
      std  : {heparin_exp_tubes_std}
      sem  : {heparin_exp_tubes_sem}
      p    : {pval_heparin_tubes}
    glass slide :
      mean : {heparin_exp_tubes_mean}
      std  : {heparin_exp_slide_std}
      sem  : {heparin_exp_slide_sem}
      p    : {pval_heparin_slide}
''')

width = 0.25
jitter = 0.05
fig = plt.figure(figsize=(10, 6), layout="constrained")
fig.suptitle("抗凝血药物的对小鼠凝血时间的影响")

ax_warfarin, ax_heparin = fig.subplots(1, 2)

ax_warfarin.set_xlim(0, 1.5)
warfarin_labels = ["华法林钠-毛细玻璃管", "生理盐水-毛细玻璃管", "华法林钠-载玻片", "生理盐水-载玻片"]
warfarin_x = [width, width * 2.1, width * 4, width * 5.1]
warfarin_data = [[warfarin_con_tubes_mean, warfarin_con_tubes_sem], 
                 [warfarin_exp_tubes_mean, warfarin_exp_tubes_sem, pval_warfarin_tubes],
                 [warfarin_con_slide_mean, warfarin_con_slide_sem],
                 [warfarin_exp_slide_mean, warfarin_exp_slide_sem, pval_warfarin_slide],
]
warfarin_raw_data = [warfarin_con_tubes,
                     warfarin_exp_tubes,
                     warfarin_con_slide,
                     warfarin_exp_slide
]

for i in range(len(warfarin_x)) :
    x_jittered = warfarin_x[i] + np.random.uniform(-jitter, jitter, len(warfarin_raw_data[i]))
    if i % 2 == 0 :
        ax_warfarin.bar(warfarin_x[i], warfarin_data[i][0], yerr=warfarin_data[i][1], width=width, capsize=5, 
                        color=color_C, alpha=alpha_bar,
                        error_kw={"ecolor" : color_C, "elinewidth" : 2})
        ax_warfarin.scatter(x_jittered, warfarin_raw_data[i], s=30, alpha=alpha_scatter, color=color_C, marker="o")
    else :
        ax_warfarin.bar(warfarin_x[i], warfarin_data[i][0], yerr=warfarin_data[i][1], width=width, capsize=5,
                        color=color_E, alpha=alpha_bar,
                        error_kw={"ecolor" : color_E, "elinewidth" : 2})
        ax_warfarin.text(warfarin_x[i], warfarin_data[i][0] + warfarin_data[i][1] * 1.05, 
                         f"p={np.around(warfarin_data[i][2], 6)}",
                         ha="center", va="bottom", fontsize=8, color=color_E)
        ax_warfarin.scatter(x_jittered, warfarin_raw_data[i], s=30, alpha=alpha_scatter, color=color_E, marker="o")

heparin_labels = ["肝素钠-毛细玻璃管", "生理盐水-毛细玻璃管", "肝素钠-载玻片", "生理盐水-载玻片"]

ax_heparin.set_xlim(0, 1.5)
heparin_labels = ["华法林钠-毛细玻璃管", "生理盐水-毛细玻璃管", "华法林钠-载玻片", "生理盐水-载玻片"]
heparin_x = [width, width * 2.1, width * 4, width * 5.1]
heparin_data = [[heparin_con_tubes_mean, heparin_con_tubes_sem], 
                 [heparin_exp_tubes_mean, heparin_exp_tubes_sem, pval_heparin_tubes],
                 [heparin_con_slide_mean, heparin_con_slide_sem],
                 [heparin_exp_slide_mean, heparin_exp_slide_sem, pval_heparin_slide],
]
heparin_raw_data = [heparin_con_tubes,
                     heparin_exp_tubes,
                     heparin_con_slide,
                     heparin_exp_slide
]

for i in range(len(heparin_x)) :
    x_jittered = heparin_x[i] + np.random.uniform(-jitter, jitter, len(heparin_raw_data[i]))
    if i % 2 == 0 :
        ax_heparin.bar(heparin_x[i], heparin_data[i][0], yerr=heparin_data[i][1], width=width, capsize=5, 
                        color=color_C, alpha=alpha_bar,
                        error_kw={"ecolor" : color_C, "elinewidth" : 2})
        ax_heparin.scatter(x_jittered, heparin_raw_data[i], s=30, alpha=alpha_scatter, color=color_C, marker="o")
    else :
        ax_heparin.bar(heparin_x[i], heparin_data[i][0], yerr=heparin_data[i][1], width=width, capsize=5,
                        color=color_E, alpha=alpha_bar,
                        error_kw={"ecolor" : color_E, "elinewidth" : 2})
        ax_heparin.text(heparin_x[i], heparin_data[i][0] + heparin_data[i][1] * 1.05, 
                         f"p={np.around(heparin_data[i][2], 6)}",
                         ha="center", va="bottom", fontsize=8, color=color_E)
        ax_heparin.scatter(x_jittered, heparin_raw_data[i], s=30, alpha=alpha_scatter, color=color_E, marker="o")

ax_warfarin.set_title("华法林钠对小鼠凝血时间的影响")
ax_warfarin.set_xticks(warfarin_x, labels=warfarin_labels)
ax_warfarin.set_ylabel("小鼠凝血时间（s）")
ax_warfarin.tick_params(axis='x', rotation=30)
ax_heparin.set_title("肝素钠对小鼠凝血时间的影响")
ax_heparin.set_xticks(heparin_x, labels=heparin_labels)
ax_heparin.set_ylabel("小鼠凝血时间（s）")
ax_heparin.tick_params(axis='x', rotation=30)

plt.savefig("figure-6.svg", format="svg")