## todo

- [nbdev](https://nbdev.fast.ai/)
- [PolyNote](https://zhuanlan.zhihu.com/p/92495340)

## Docker

- v3.9 from `python:3.9-buster`
  - `run.sh`
  - in container, run `run_jupyter.sh`
  - 配合 vscode 访问 jupyter，启动命令增加 token，`--NotebookApp.token=x`
- v3.6.6
  - python
  - python3
  - java11
- v3.6 from python:3.6.6
- py2neo from v3.6.6
- flask from python:3.9.4-alpine3.13
  - py2neo
  - graphql

## flask

- 参考 [flask-graphql-neo4j)](https://github.com/elementsinteractive/flask-graphql-neo4j)
- 采用 python:3.9-slim-buster，没这个问题
  解决 `cryptography 3.4.7 disabling pep 517 processing is invalid`
  use `RUN apk add --no-cache gcc musl-dev python3-dev libffi-dev openssl-dev cargo`
- 构建时不需要 Pipfile.lock
- 参考 [flask-api-starter-kit](https://github.com/bajcmartinez/flask-api-starter-kit)，Sample API layout structure to be used as a baseline for other apps
  ```
  [packages]
  flask = "*"
  flasgger = "*"
  flask-marshmallow = "*"
  apispec = "*"
  ```
  - test, `pipenv run python -m unittest`
- run docker, and access
  - `http://xx:8885/apidocs/`
  - api

## py2neo

访问 Neo4j

## pandas

### [北京二手房房价分析和预测](https://github.com/xiaoyusmd/Bj_HousePricePredict)

### [用 python 建立房价预测模型](https://zhuanlan.zhihu.com/p/34462156)

- 直接处理字段为日期型

  ```
  train = pd.read_csv("kc_house_data.csv", parse_dates=["date"])
  ```

- 查看价格分布

  ```
  train.price.describe()
  ...
  print("skew, 偏离:", train.price.skew())
  ```

  - 偏态分布 (skew): 偏态分布是与“正态分布” 相对，分布曲线左右不对称的数据次数分布，是连续随机变量概率分布的一种。可以通过峰度和偏度的计算，衡量偏态的程度。可分为正偏态和负偏态，前者曲线右侧偏长，左侧偏短；后者曲线左侧偏长，右侧偏短
  - 改善线性度，分布接近正态分布
    ```
    target = np.log(train.price)
    sns.distplot(target)
    ```

- Pearson Correlation, 皮尔逊相关系数: 是用于度量两个变量X和Y之间的相关（线性相关），其值介于-1与1之间. 当接近1时，表示两者具有强烈的正相关性

  检测数值特征和目标变量之间的相关性

  ```
  corrMat = train[['price', 'bedrooms', 'bathrooms', 'sqft_living', 'sqft_lot', 'floors', 'waterfront', 'condition', 'grade', 'sqft_above', 'sqft_basement', 'yr_built']].corr()
  ```


Python data analysis
---

### [10 Simple hacks to speed up your Data Analysis in Python](https://towardsdatascience.com/10-simple-hacks-to-speed-up-your-data-analysis-in-python-ec18c6396e6b)

介绍几个扩展类
- `pip install pandas_profiling`

  ```
  import pandas as pd
  import pandas_profiling
  df = pd.read_csv('lianjia.csv')
  pandas_profiling.ProfileReport(df)
  # df.profile_report()
  profile = df.profile_report(title='Pandas Profiling Report')
  profile.to_file('lianjia-profiling.html')
  ```
- Cufflinks

  ```
  pip install -i https://pypi.tuna.tsinghua.edu.cn/simple cufflinks
  ```

  Cufflinks就是专门用来方便pandas DataFrame对象调用Plotly绘图的工具

  example:
  - [Python金融分析（一）：Cufflinks与数据可视化](https://beiyuan.me/python4finance-1/)
  - [code](https://codeload.github.com/yhilpisch/py4fi2nd/zip/master)
  - 下载部分代码 `svn co https://github.com/yhilpisch/py4fi2nd/trunk/source`

### [python 流行病学](https://github.com/pzivich/Python-for-Epidemiologists)

### docker

- python3, java11
- run /work/run_jupyter.sh, 指定 `--NotebookApp.base_url=/jub`
- nginx conf

  ```
  location /jub {
    index  index.html index.jsp;
    proxy_pass  http://192.168.1.209:8889/jub;
    #proxy_redirect  default;
    proxy_set_header X-Real-Scheme $scheme;
    proxy_set_header Host $host;
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_http_version 1.1;
    proxy_set_header Upgrade $http_upgrade;
    proxy_set_header Connection "upgrade";
    proxy_set_header Referer http://192.168.1.209;
    proxy_set_header Origin "";
    }
  ```

### numpy

- https://www.numpy.org.cn/
- https://github.com/teadocs/numpy-cn

NumPy提供了大量的数值编程工具，可以方便地处理向量、矩阵等运算，极大地便利了人们在科学计算方面的工作

### SciPy

SciPy基于NumPy提供了更为丰富和高级的功能扩展，在统计、优化、插值、数值积分、时频转换等方面提供了大量的可用函数，基本覆盖了基础科学计算相关的问题。

### pandas

Pandas 是一个强大的分析结构化数据的工具集；它的使用基础是 Numpy（提供高性能的矩阵运算）；用于数据挖掘和数据分析，同时也提供数据清洗功能。

- https://www.pypandas.cn/

### matplotlib

python 数据表现

- show in JuPyter Notebooks, run

  ```
  %matplotlib inline
  ```

- 中文字体

  ```
  from matplotlib.font_manager import FontProperties
  font= FontProperties(fname=r"/work/fonts/Songti.ttc", size=12)
  plt.ylabel('密度', fontproperties=font)
  ```

### 系统解决中文问题

docker 下已按以下步骤更改

- [参考](https://www.jianshu.com/p/b02ec7dc39dd)
- use fonts/Songti.ttc

  ```
  cp Songti.ttc /usr/local/lib/python3.6/dist-packages/matplotlib/mpl-data/fonts/ttf
  ```

- edit `/usr/local/lib/python3.6/dist-packages/matplotlib/mpl-data/matplotlibrc`

  ```
  axes.unicode_minus  : False    ## use unicode for the minus symbol
  font.sans-serif     : Songti SC, DejaVu Sans, Bitstream Vera Sans, Computer Modern Sans Serif, Lucida Grande, Verdana, Geneva, Lucid, Arial, Helvetica, Avant Garde, sans-serif
  ```

- rm `/root/.cache/matplotlib/`

### missingno

Missing data visualization module for Python.

### seaborn

Seaborn 是一种基于 matplotlib 的图形可视化 python libraty。它提供了一种高度交互式界面，便于用户能够做出各种有吸引力的统计图表。

## octave

开源 Maltab

```
t=-10:0.01:10;
x=16*(power(sin(t),3));
y=(13*cos(t))-(5*cos(2*t))-(2*cos(3*t))-(cos(4*t));
plot(x,y)
title("Heart with Octave", 'Color','k','fontsize',18)
```

