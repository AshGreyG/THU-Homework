import matplotlib.pyplot as plt
import numpy as np
from scipy.optimize import curve_fit
from scipy.special import erf
import functools

around2 = functools.partial(np.around, decimals=2)

def normal_cdf(x, mu, sigma) :
    return 0.5 * (1 + erf((x - mu) / (sigma * np.sqrt(2))))

plt.rcParams["font.family"]="STZhongsong"

group = np.linspace(0.5, 3, 6)
list_lgd = [102.4, 128, 160, 200, 250, 312]
lgd = np.array(list(map(np.log10, list_lgd)))
count = np.array([0, 0, 3, 6, 11, 12])
death_rate = np.array(list(map(lambda x : x / 12, count)))

fig = plt.figure(figsize=(6, 4), layout="constrained")
fig.suptitle("盐酸普鲁卡因 LD50 的测定")
ax_bars, ax_curves = fig.subplots(1, 2)
ax_bars.set_title("死亡频数图", loc="center", fontsize="medium")
ax_bars.bar(group, count, width=0.5, color="#89b4fa", edgecolor="white")
ax_bars.set_xticks(np.linspace(0.5, 3, 6), labels=list(map(around2, lgd)))
ax_bars.set(xlabel="剂量对数", ylabel="死亡数（只）")

ax_curves.scatter(lgd, death_rate * 100, color="#fab387", marker="+")

for i in range(len(lgd)) :
    if i <= 3 :
        offset_x = 10
        offset_y = 10
    else :
        offset_x = -30
        offset_y = -20
    plt.annotate(f'({np.around(lgd[i], 2)}, {np.around(death_rate[i], 2)})',
                 xy=(lgd[i], death_rate[i] * 100),
                 xytext=(offset_x, offset_y),
                 textcoords="offset points",
                 fontsize=7,
                 color="#fab387",
                 arrowprops=dict(arrowstyle="->", lw=0.5, color="#fab387"))

popt, pcov = curve_fit(normal_cdf, lgd, death_rate, p0=[0, 1])
mu, sigma = popt
print(f"mu={mu}\nsigma={sigma}")
lgd_fit = np.linspace(min(lgd), max(lgd), 200)
death_rate_fit = normal_cdf(lgd_fit, mu, sigma)
ax_curves.plot(lgd_fit, death_rate_fit * 100, color="#eab0ac")
ax_curves.set_title("死亡率", loc="center", fontsize="medium")
ax_curves.set(xlabel="剂量对数", ylabel="死亡率（%）")


plt.savefig("figure-2.svg", format="svg")