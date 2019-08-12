Python-for-Epidemiologists
---

- [python 流行病学](https://github.com/pzivich/Python-for-Epidemiologists)

### numpy

- https://www.numpy.org.cn/
- https://github.com/teadocs/numpy-cn

### pandas

Pandas是一个强大的分析结构化数据的工具集；它的使用基础是Numpy（提供高性能的矩阵运算）；用于数据挖掘和数据分析，同时也提供数据清洗功能。

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

## octave

开源 Maltab

```
t=-10:0.01:10;
x=16*(power(sin(t),3));
y=(13*cos(t))-(5*cos(2*t))-(2*cos(3*t))-(cos(4*t));
plot(x,y)
title("Heart with Octave", 'Color','k','fontsize',18)
```
