import pandas as pd
import numpy as np
import functools

def convert_to_seconds(time : str) -> int :
    if 's' in time :
        return int(time.replace('s', ''))

a2 = functools.partial(np.around, decimals=2)
a4 = functools.partial(np.around, decimals=4)

ex3_sheet1 = pd.read_excel(r"C:\Users\AshGrey\Downloads\data.xlsx", sheet_name="Sheet1")
ex3_sheet2 = pd.read_excel(r"C:\Users\AshGrey\Downloads\data.xlsx", sheet_name="Sheet2")

exp = ex3_sheet1[ex3_sheet1["药物"].isin(["20%硫酸镁（含5%炭末/5%阿拉伯胶）",
                                         "20%硫酸镁（含5%炭末加5%阿拉伯胶）"])]
exp_dist_mean = exp["墨汁前沿距离幽门的距离（cm）"].mean()
exp_dist_std  = exp["墨汁前沿距离幽门的距离（cm）"].std()
exp_rate_mean = exp["小肠推进/幽门-盲肠长度（%）"].mean()
exp_rate_std  = exp["小肠推进/幽门-盲肠长度（%）"].std()
print(f'''
exp_dist_mean : {a2(exp_dist_mean)}
exp_dist_std  : {a2(exp_dist_std)}
exp_rate_mean : {a4(exp_rate_mean)}
exp_rate_std  : {a4(exp_rate_std)}
''')

con = ex3_sheet1[ex3_sheet1["药物"].isin(["5%炭末/5%阿拉伯胶"])]
con_dist_mean = con["墨汁前沿距离幽门的距离（cm）"].mean()
con_dist_std  = con["墨汁前沿距离幽门的距离（cm）"].std()
con_rate_mean = con["小肠推进/幽门-盲肠长度（%）"].mean()
con_rate_std  = con["小肠推进/幽门-盲肠长度（%）"].std()
print(f'''
con_dist_mean : {a2(con_dist_mean)}
con_dist_std  : {a2(con_dist_std)}
con_rate_mean : {a4(con_rate_mean)}
con_rate_std  : {a4(con_rate_std)}
''')

ip = ex3_sheet2[ex3_sheet2["给药途径"].isin(["腹腔注射"])]
ip_all_count = ip.shape[0]
ip_die = ip[ip["是否死亡"].isin(["是"])]
ip_die_count = ip_die.shape[0]
dirty_ip_time = ip_die["死亡时间（min）"]
dirty_ip_time = dirty_ip_time.replace({"立刻" : "1s", "1s立刻" : "1s"})

ip_time = dirty_ip_time.apply(convert_to_seconds)
ip_time_mean = ip_time.mean()

iv = ex3_sheet2[ex3_sheet2["给药途径"].isin(["尾静脉注射"])]
iv_all_count = iv.shape[0]
iv_die = iv[iv["是否死亡"].isin(["是"])]
iv_die_count = iv_die.shape[0]
dirty_iv_time = iv_die["死亡时间（min）"]
dirty_iv_time = dirty_iv_time.replace({"立刻" : "1s", "1s立刻" : "1s"})

iv_time = dirty_iv_time.apply(convert_to_seconds)
iv_time_mean = iv_time.mean()
print(f'''
ip_die_rate  : {a4(ip_die_count / ip_all_count)}
ip_time_mean : {a2(ip_time_mean)}
iv_die_rate  : {a4(iv_die_count / iv_all_count)}
iv_time_mean : {a2(iv_time_mean)}
''')