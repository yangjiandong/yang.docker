keras
---

### jupyterLab

- [《自学是门手艺》](https://github.com/selfteaching/the-craft-of-selfteaching)
- [基于Jupyter Notebook从头学习机器学习](https://zhuanlan.zhihu.com/p/47230091)

### 05.27

- [使用TensorFlow 来实现一个简单的验证码识别过程](https://juejin.im/post/5ceb621f6fb9a07ec955ebd8)
- [使用深度学习来破解captcha验证码](http://www.qingpingshan.com/bc/jsp/243150.html)
- [Kaggle Python docker image](https://github.com/Kaggle/docker-python), image `kaggle/python-build`

### 04.12

- add jupyterlab

  - run
    - in container, `sh /run_jupyter.sh`
    - open brower, `http://localhost:8888/lab`, pwd=123

- matplotlib 图表 中文字体

  ```python
  from matplotlib.font_manager import FontProperties
  font= FontProperties(fname=r"Songti.ttc", size=12)
  ...
  plt.title('中国\n' + note, fontproperties=font)
  ```
- [python pep](https://www.python.org/dev/peps/pep-0008/)

### 2019.02.28

- [A neural network that transforms a design mock-up into a static website](https://github.com/emilwallner/Screenshot-to-code), 深度学习，设计稿转换代码
- [使用TensorFlow进行股票价格预测的简单深度学习模型](https://vimsky.com/article/3847.html)
  - [github code](https://github.com/sebastianheinz/stockprediction)
  - [中文参考](https://juejin.im/post/5c753a75518825013a575ec3)
  - stock-price-2.py

### base python 3.6, use

- keras
- tensorflow
- pillow h5py matplotlib pandas numpy scikit-learn scipy
- run

  ```shell
  sh run.sh
  #进入容器，运行 jupyter,
  sh /run_jupyter.sh
  # brower, localhost:8888, 根据提示拷贝url 访问
  ```
