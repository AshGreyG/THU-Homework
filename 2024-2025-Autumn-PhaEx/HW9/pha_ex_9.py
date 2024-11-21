import matplotlib as mpl
mpl.use("svg")
import matplotlib.pyplot as plt
import pandas as pd
import numpy as np
import re

color_C = "#89c9c8"
color_E = "#f9bebb"
alpha_data = 0.4
alpha_jitter = 1
alpha_line = 0.7

plt.rcParams["font.family"] = "STZhongsong"

def convert_to_float(input : str | float | int) -> float :
    if type(input) == float or type(input) == int :
        return input
    float_pattern = r"^[-+]?[0-9]*\.?[0-9]+$"
    if (re.fullmatch(float_pattern, input)) :
        return float(input)

ex9 = pd.read_excel("~/Downloads/data.xlsx", sheet_name="Sheet1")

urine_data = []
urine_mean = []
urine_std  = []
urine_sem  = []
latex_table_str = ""

urine_before = ex9.iloc[:,1].apply(convert_to_float).dropna()

for i in range(1, 7) :
    urine_data.append(ex9.iloc[:,i + 1].apply(convert_to_float).dropna() - urine_before)
    urine_mean.append(urine_data[i - 1].mean())
    urine_std.append(urine_data[i - 1].std())
    urine_sem.append(urine_std[i - 1] / len(urine_data))

print("-" * 73)
print("|   index   |       mean        |        std        |        sem        |")

for i in range(1, 7) :
    print("|{:^11}|{:^19}|{:^19}|{:^19}|".format(i, urine_mean[i - 1], urine_std[i - 1], urine_sem[i - 1]))
    latex_table_str += rf"{i} & ${np.round(urine_mean[i - 1], 2)}\pm {np.round(urine_sem[i - 1], 2)}$ \\" + "\n"

print("-" * 73)
print(latex_table_str)

fig, ax = plt.subplots(figsize=(6, 6))

fig.suptitle("呋塞米对家兔利尿作用的研究")

x = np.arange(1, 7)
width = 0.6
jitter = 0.05

ax.bar(x, urine_mean, yerr=urine_sem, width=width, capsize=5, color=color_C,
            alpha=alpha_data, error_kw={"ecolor" : color_C, "elinewidth" : 2})

for i in range(1, 7) :
    jitter_x = x[i - 1] + np.random.uniform(-jitter, jitter, len(urine_data[i - 1]))
    ax.scatter(jitter_x, urine_data[i - 1], s=30, alpha=alpha_jitter,
               color=color_C, marker="o")

ax.set_xlabel("组号")
ax.set_ylabel("单位时间内家兔尿量增加量（mL）")

plt.savefig("figure-9.svg", format="svg")