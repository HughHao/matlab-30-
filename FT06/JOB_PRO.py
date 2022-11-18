# _*_ coding:utf-8 _*_
# 开发人员：郝海强
# 开发时间：2020/4/2316:07
# 文件名称：JOB_PRO.py
# 开发工具：PyCharm
def job_pro(ft):
    job_pro=[]
    pro_num=ft.shape[0]
    for i in range(pro_num):
        job = ft[i][0] // 10
        job_pro.append(job)