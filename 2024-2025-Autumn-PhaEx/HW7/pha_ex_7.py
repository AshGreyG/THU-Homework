import matplotlib as mpl
mpl.use("svg")
import matplotlib.pyplot as plt
import pandas as pd
import numpy as np
from scipy import stats
import math

color_C = "#89c9c8"
color_E = "#f9bebb"
alpha_data  = 1
alpha_jitter = 0.4
alpha_line  = 0.7

plt.rcParams["font.family"] = "STZhongsong"

def convert_to_temprature(input : str | int | float) -> float :
    if type(input) == int or type(input) == float :
        return input
    elif "\\" in input :
        return math.nan
    elif input == "≤32" or input == "超量程" or input == "-" :
        return 32.0
    else :
        return float(input)

ex7 = pd.read_excel(r"~/Downloads/data.xlsx", sheet_name="工作表1")

room_chlor = ex7[ex7.iloc[:,2].isin(["氯丙嗪"])]
room_chlor_data = []
room_chlor_mean = []
room_chlor_std  = []
room_chlor_sem  = []

for i in range(1, 8) :
    data = room_chlor.iloc[:,i + 2].apply(convert_to_temprature)
    room_chlor_data.append(data.dropna())

print("|  index  |       mean       |        std        |         sem         |")

for i in range(1, 8) :
    room_chlor_mean.append(room_chlor_data[i - 1].mean())
    room_chlor_std.append(room_chlor_data[i - 1].std())
    room_chlor_sem.append(room_chlor_data[i - 1].std() / len(room_chlor_data[i - 1]))
    print("|{:^9}|{:^18}|{:^19}|{:^21}|".format(i, room_chlor_mean[i - 1], room_chlor_std[i - 1], room_chlor_sem[i - 1]))

print("------------------------------------------------------------------------")

room_salts = ex7[ex7.iloc[:,2].isin(["生理盐水"])]
room_salts_data = []
room_salts_mean = []
room_salts_std  = []
room_salts_sem  = []

for i in range(1, 8) :
    data = room_salts.iloc[:,i + 2].apply(convert_to_temprature)
    room_salts_data.append(data.dropna())

print("|  index  |       mean       |        std        |         sem         |")

for i in range(1, 8) :
    room_salts_mean.append(room_salts_data[i - 1].mean())
    room_salts_std.append(room_salts_data[i - 1].std())
    room_salts_sem.append(room_salts_data[i - 1].std() / len(room_salts_data[i - 1]))
    print("|{:^9}|{:^18}|{:^19}|{:^21}|".format(i, room_salts_mean[i - 1], room_salts_std[i - 1], room_salts_sem[i - 1]))

print("------------------------------------------------------------------------")

cold_chlor = ex7[ex7.iloc[:,11].isin(["氯丙嗪"])]
cold_chlor_data = []
cold_chlor_mean = []
cold_chlor_std  = []
cold_chlor_sem  = []

for i in range(1, 9) :
    data = cold_chlor.iloc[:,i + 11].apply(convert_to_temprature)
    cold_chlor_data.append(data.dropna())

print("|  index  |       mean       |        std        |         sem         |")

for i in range(1, 9) :
    cold_chlor_mean.append(cold_chlor_data[i - 1].mean())
    cold_chlor_std.append(cold_chlor_data[i - 1].mean())
    cold_chlor_sem.append(cold_chlor_data[i - 1].std() / len(cold_chlor_data[i - 1]))
    print("|{:^9}|{:^18}|{:^19}|{:^21}|".format(i, cold_chlor_mean[i - 1], cold_chlor_std[i - 1], cold_chlor_sem[i - 1]))

print("------------------------------------------------------------------------")

cold_salts = ex7[ex7.iloc[:,11].isin(["生理盐水"])]
cold_salts_data = []
cold_salts_mean = []
cold_salts_std  = []
cold_salts_sem  = []

for i in range(1, 9) :
    data = cold_salts.iloc[:,i + 11].apply(convert_to_temprature)
    cold_salts_data.append(data.dropna())

print("|  index  |       mean       |        std        |         sem         |")

for i in range(1, 9) :
    cold_salts_mean.append(cold_salts_data[i - 1].mean())
    cold_salts_std.append(cold_salts_data[i - 1].mean())
    cold_salts_sem.append(cold_salts_data[i - 1].std() / len(cold_salts_data[i - 1]))
    print("|{:^9}|{:^18}|{:^19}|{:^21}|".format(i, cold_salts_mean[i - 1], cold_salts_std[i - 1], cold_salts_sem[i - 1]))

print("------------------------------------------------------------------------")

fig = plt.figure(figsize=(10, 12))
ax_room, ax_cold = fig.subplots(2, 1)

fig.suptitle("氯丙嗪对小鼠体温的影响")

x = np.arange(len(room_chlor_mean))
ax_room.scatter(x, room_chlor_mean, s=30, alpha=alpha_data, color=color_C, marker="o")
ax_room.scatter(x, room_salts_mean, s=30, alpha=alpha_data, color=color_E, marker="x")
ax_room.errorbar(x, room_chlor_mean, yerr=room_chlor_sem, color=color_C, ecolor=color_C, alpha=alpha_line)
ax_room.errorbar(x, room_salts_mean, yerr=room_salts_sem, color=color_E, ecolor=color_E, alpha=alpha_line)
ax_room.set_xticks(x, ["室温下", "5min", "10min", "15min", "20min", "25min", "30min"])
ax_room.set_title("在室温（20℃）环境下氯丙嗪对小鼠体温的影响")
ax_room.set_ylabel("温度（单位℃）")

for i in range(1, 8) :
    jitter_c = x[i - 1] + np.random.uniform(-0.05, 0.05, len(room_chlor_data[i - 1]))
    jitter_s = x[i - 1] + np.random.uniform(-0.05, 0.05, len(room_salts_data[i - 1]))
    ax_room.scatter(jitter_c, room_chlor_data[i - 1], s=30, alpha=alpha_jitter, color=color_C, marker="o")
    ax_room.scatter(jitter_s, room_salts_data[i - 1], s=30, alpha=alpha_jitter, color=color_E, marker="x")

x = np.arange(len(cold_chlor_mean))
ax_cold.scatter(x, cold_chlor_mean, s=30, alpha=alpha_data, color=color_C, marker="o")
ax_cold.scatter(x, cold_salts_mean, s=30, alpha=alpha_data, color=color_E, marker="x")
ax_cold.errorbar(x, cold_chlor_mean, yerr=cold_chlor_sem, color=color_C, ecolor=color_C, alpha=alpha_line)
ax_cold.errorbar(x, cold_salts_mean, yerr=cold_salts_sem, color=color_E, ecolor=color_E, alpha=alpha_line)
ax_cold.set_xticks(x, ["室温下", "给药前", "3min", "5min", "8min", "10min", "15min", "20min"])
ax_cold.set_title("在低温（4℃）环境下氯丙嗪对小鼠体温的影响")
ax_cold.set_ylabel("温度（单位℃）")

for i in range(1, 9) :
    jitter_c = x[i - 1] + np.random.uniform(-0.05, 0.05, len(cold_chlor_data[i - 1]))
    jitter_s = x[i - 1] + np.random.uniform(-0.05, 0.05, len(cold_salts_data[i - 1]))
    ax_cold.scatter(jitter_c, cold_chlor_data[i - 1], s=30, alpha=alpha_jitter, color=color_C, marker="o")
    ax_cold.scatter(jitter_s, cold_salts_data[i - 1], s=30, alpha=alpha_jitter, color=color_E, marker="x")

plt.savefig("figure-7.svg", format="svg")

# |  index  |       mean       |        std        |         sem         |
# |    1    |36.94166666666666 |0.3232177237864553 |0.026934810315537943 |
# |    2    |34.75833333333333 |1.2449595344525215 | 0.10374662787104345 |
# |    3    |34.20833333333333 |0.6473137967903602 | 0.05394281639919668 |
# |    4    |33.70833333333333 |0.8867287515288312 | 0.0738940626274026  |
# |    5    |      33.25       |0.6640098575390965 |0.055334154794924706 |
# |    6    |32.958333333333336|0.7476731582149723 |0.062306096517914356 |
# |    7    |32.61666666666667 |0.4914419106213395 | 0.04095349255177829 |
# ------------------------------------------------------------------------
# |  index  |       mean       |        std        |         sem         |
# |    1    |36.96666666666667 |0.6020168124099551 | 0.05016806770082959 |
# |    2    |      37.36       |0.8643558937793566 | 0.08643558937793566 |
# |    3    |      37.25       |0.8959786703810411 | 0.0895978670381041  |
# |    4    |36.86666666666667 |0.9413079230839432 | 0.07844232692366193 |
# |    5    |      36.99       |0.8698020208964542 | 0.08698020208964542 |
# |    6    |      37.22       |0.7857056276579243 | 0.07857056276579243 |
# |    7    |36.96666666666667 |1.0254341283159782 | 0.08545284402633152 |
# ------------------------------------------------------------------------
# |  index  |       mean       |        std        |         sem         |
# |    1    |36.50000000000001 | 36.50000000000001 | 0.06816498108607273 |
# |    2    |      34.26       |       34.26       | 0.07676804890925217 |
# |    3    |33.666666666666664|33.666666666666664 | 0.0974636252617264  |
# |    4    |      33.025      |      33.025       | 0.07009418267191972 |
# |    5    |32.541666666666664|32.541666666666664 | 0.06498429621230616 |
# |    6    |32.38333333333333 | 32.38333333333333 | 0.04830894543202327 |
# |    7    |32.05833333333333 | 32.05833333333333 |0.011491286407520345 |
# |    8    |       32.0       |       32.0        |         0.0         |
# ------------------------------------------------------------------------
# |  index  |       mean       |        std        |         sem         |
# |    1    |      36.675      |      36.675       | 0.05730974232760571 |
# |    2    |      34.57       |       34.57       | 0.11076000080253603 |
# |    3    |33.79999999999999 | 33.79999999999999 | 0.1186519398420558  |
# |    4    |      33.42       |       33.42       | 0.12007405122580732 |
# |    5    |33.54166666666666 | 33.54166666666666 | 0.09557497013248241 |
# |    6    |33.49999999999999 | 33.49999999999999 | 0.11960583412006098 |
# |    7    |33.066666666666656|33.066666666666656 | 0.10133785210552015 |
# |    8    |32.858333333333334|32.858333333333334 | 0.0867087844434651  |
# ------------------------------------------------------------------------

latex_table_room = "\\midrule\n"
table_time_room  = ["室温下", "5min", "10min", "15min", "20min", "25min", "30min"]

for i in range(1, 8) :
    latex_table_room += f"{table_time_room[i - 1]} & ${np.around(room_chlor_mean[i - 1], 2)}\\pm{np.around(room_chlor_sem[i - 1], 4)}$ "
    latex_table_room += f"& ${np.around(room_salts_mean[i - 1], 2)}\\pm{np.around(room_salts_sem[i - 1], 4)}$ \\\\\n"

latex_table_cold = "\\midrule\n"
table_time_cold  = ["室温下", "给药前", "5min", "10min", "15min", "20min", "25min", "30min"]

for i in range(1, 9) :
    latex_table_cold += f"{table_time_cold[i - 1]} & ${np.around(cold_chlor_mean[i - 1], 2)}\\pm{np.around(cold_chlor_sem[i - 1], 4)}$ "
    latex_table_cold += f"& ${np.around(cold_salts_mean[i - 1], 2)}\\pm{np.around(cold_salts_sem[i - 1], 4)}$ \\\\\n"

print("------------------------------------------------------------------------")
print(latex_table_room)
print("------------------------------------------------------------------------")
print(latex_table_cold)