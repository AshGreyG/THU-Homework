import matplotlib.pyplot as plt
import numpy as np
from scipy.optimize import curve_fit
from scipy.special import erf

def normal_cdf(x, mu, sigma) :
     return 0.5 * (1 + erf((x - mu) / (sigma * np.sqrt(2))))

plt.rcParams["font.family"]="STZhongsong"

group = np.linspace(0.5, 2.5, 5)
count = np.array([6, 5, 12, 12, 11])

fig = plt.figure(figsize=(6, 4), layout="constrained")
fig.suptitle("水合氯醛 ED50 测定数据")
ax_bars, ax_curves = fig.subplots(1, 2)
ax_bars.set_title("阳性频数图", loc="center", fontsize="medium")
ax_bars.bar(group, count, width=0.5, color="#89b4fa", edgecolor="white")
ax_bars.set(xlim=(0, 3), xlabel="组号",
            ylim=(1, 12), ylabel="阳性小鼠数量")
ax_bars.set_xticks(np.linspace(0.5, 2.5, 5), labels=["1", "2", "3", "4", "5"])

ax_curves.set_title("累加剂量曲线", loc="center", fontsize="medium")
d = np.array([212, 251, 296, 349, 412])
lgd = list(map(np.log10, d))
react_rate= np.array([0.5, 0.4167, 1.0, 1.0, 0.9167])
ax_curves.scatter(lgd, react_rate, color="#fab387", marker="+")

for i in range(len(lgd)) :
    if i <= 1 :
        offset_x = 10
        offset_y = 10
    else :
        offset_x = -40
        offset_y = -20
    plt.annotate(f'({np.around(lgd[i], 2)}, {react_rate[i]})',   
                 xy=(lgd[i], react_rate[i]),   
                 xytext=(offset_x, offset_y),
                 textcoords='offset points',
                 fontsize=7,
                 color="#fab387",
                 arrowprops=dict(arrowstyle='->', lw=0.5, color="#fab387"))

popt, pcov = curve_fit(normal_cdf, lgd, react_rate, p0=[0, 1])
mu, sigma = popt
print(f"mu = {mu}\nsigma = {sigma}")
lgd_fit = np.linspace(min(lgd), max(lgd), 200)
react_rate_fit = normal_cdf(lgd_fit, mu, sigma)
ax_curves.plot(lgd_fit, react_rate_fit, color="#eba0ac")
ax_curves.set(xlim=(min(lgd) - 0.05, max(lgd) + 0.03), xlabel="剂量对数",
              ylabel="效应百分率")

plt.savefig("figure-1.svg", format="svg")