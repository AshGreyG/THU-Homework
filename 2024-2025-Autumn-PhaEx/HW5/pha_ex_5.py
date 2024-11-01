import matplotlib.pyplot as plt
import numpy as np
from scipy.optimize import curve_fit

plt.rcParams["font.family"]="STZhongsong"
color_scatter_con = "#fab387"
color_curve_con   = "#eab0ac"
color_scatter_exp = "#89c9c8"
color_curve_exp   = "#89b4fa"

def average_of_force(force : list[float | int]) -> float :
    result = 0
    for f in force :
        result += f
    return result / len(force)

def find_most_closed(force : list[float | int], target : float | int) -> int :
    index = count = 0
    err = abs(force[0] - target)
    for f in force :
        count += 1
        if abs(f - target) < err :
            err = abs(f - target)
            index = count
    return index

def linear(x, a, b) :
    return a * x + b

force_con = [4.5377, 4.535, 4.563, 4.6307, 4.9187, 5.3415, 5.849,
             6.1906, 6.4545, 6.4946, 6.5708, 6.7552, 6.7491]
force_exp = [5.2161, 5.1461, 5.1459, 5.1417, 5.1334, 5.1393, 5.2531,
             5.5183, 6.0077, 6.4767, 6.6281, 6.5234, 6.5532, 6.8002]
concentration = [0.001, 0.003, 0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30, 100, 300]
average_con = average_of_force(force_con)
average_exp = average_of_force(force_exp)
index_con = find_most_closed(force_con, average_con)
index_exp = find_most_closed(force_exp, average_exp)

print(f"{index_con} : {force_con[index_con]}")
print(f"{index_exp - 1} : {force_exp[index_exp]}")

per_con = list(map(lambda x : (x - force_con[0]) / (max(force_con) - force_con[0]), force_con))[1:]
per_exp = list(map(lambda x : (x - force_exp[0]) / (max(force_exp) - force_exp[0]), force_exp))[2:]
lg_concentration = list(map(lambda x : np.log10(x * 10 ** -6), concentration))

popt_con, pcov_con = curve_fit(linear, lg_concentration[2:8], per_con[2:8], p0=[0, 1])
a_con, b_con = popt_con
print(f"a : {a_con}\nb : {b_con}")
concentration_fit_con = np.linspace(min(lg_concentration[2:8]) - 0.2, max(lg_concentration[2:8]) + 0.2, 200)
efficiency_fit_con = linear(concentration_fit_con, a_con, b_con)
half_con = (0.5 - b_con) / a_con
print(f"x : {half_con}")

popt_exp, pcov_exp = curve_fit(linear, lg_concentration[4:8], per_exp[4:8], p0=[0, 1])
a_exp, b_exp = popt_exp
print(f"a : {a_exp}\nb : {b_exp}")
concentration_fit_exp = np.linspace(min(lg_concentration[4:8]) - 0.2, max(lg_concentration[4:8]) + 0.2, 200)
efficiency_fit_exp = linear(concentration_fit_exp, a_exp, b_exp)
half_exp = (0.5 - b_exp) / a_exp
print(f"x : {half_exp}")

fig = plt.figure(figsize=(10, 6), layout="constrained")
fig.suptitle("阿托品对乙酰胆碱的竞争性拮抗作用")
ax_con, ax_exp = fig.subplots(1, 2)
ax_con.set_ylim(-0.15, 1.15)
ax_con.set_xlim(-9.5, -3.2)
ax_exp.set_ylim(-0.15, 1.15)
ax_exp.set_xlim(-9.5, -3.2)

ax_con.scatter(lg_concentration, per_con, s=30, color=color_scatter_con, marker="+")
ax_con.scatter(half_con, 0.5, s=50, color=color_scatter_con, marker="o")
ax_con.plot(concentration_fit_con, efficiency_fit_con, color=color_curve_con)

ax_con.vlines(half_con, -0.15, 0.5, color=color_curve_con, ls="--")
ax_con.hlines(0.5, -9.5, half_con, color=color_curve_con, ls="--")
ax_con.annotate(f"{np.around(half_con, 2)}", xy=(half_con, -0.15), 
                xytext=(half_con - 0.2, -0.195), color=color_curve_con)
ax_con.annotate("0.5", xy=(-9.5, 0.5),
                xytext=(-9.9, 0.5), color=color_curve_con)

ax_exp.scatter(lg_concentration, per_exp, s=30, color=color_scatter_exp, marker="+")
ax_exp.scatter(half_exp, 0.5, s=50, color=color_scatter_exp, marker="o")
ax_exp.plot(concentration_fit_exp, efficiency_fit_exp, color=color_curve_exp)

ax_exp.vlines(half_exp, -0.15, 0.5, color=color_curve_exp, ls="--")
ax_exp.hlines(0.5, -9.5, half_exp, color=color_curve_exp, ls="--")
ax_exp.annotate(f"{np.around(half_exp, 2)}", xy=(half_exp, -0.15),
                xytext=(half_exp - 0.6, -0.195), color=color_curve_exp)
ax_exp.annotate("0.5", xy=(-9.5, 0.5),
                xytext=(-9.9, 0.5), color=color_curve_exp)

ax_con.set_title("对照组实验数据")
ax_con.set_xlabel("溶液中乙酰胆碱的浓度对数")
ax_con.set_ylabel("肠张力平均值/g")
ax_exp.set_title("实验组实验数据")
ax_exp.set_xlabel("溶液中乙酰胆碱的浓度对数")
ax_exp.set_ylabel("肠张力平均值/g")

plt.savefig("figure-5.svg", format="svg")