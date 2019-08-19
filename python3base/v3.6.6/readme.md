[用 python 建立房价预测模型](https://zhuanlan.zhihu.com/p/34462156)
---

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



Python-for-Epidemiologists
---

- [python 流行病学](https://github.com/pzivich/Python-for-Epidemiologists)
- python:3.6.6
    - python
    - python3
    - java11

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
  font= FontProperties(fname=r"/work/fonts/simsun.ttc", size=12)
  plt.ylabel('密度', fontproperties=font)
  ```

### 系统解决中文问题

- [参考](https://www.jianshu.com/p/b02ec7dc39dd)
- use fonts/simsun.ttc

  ```
  cp simsun.ttc /usr/local/lib/python3.6/dist-packages/matplotlib/mpl-data/fonts/ttf
  ```

- edit `/usr/local/lib/python3.6/dist-packages/matplotlib/mpl-data/matplotlibrc`

  ```
  axes.unicode_minus  : False    ## use unicode for the minus symbol
  font.sans-serif     : simsun, DejaVu Sans, Bitstream Vera Sans, Computer Modern Sans Serif, Lucida Grande, Verdana, Geneva, Lucid, Arial, Helvetica, Avant Garde, sans-serif
  ```

- rm `/root/.cache/matplotlib/`
- simsun 显示效果不行， Songti 没成功，暂时按第一种方案

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
