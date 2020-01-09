pandoc
---

## update

- add `multimarkdown`
- pandoc remove `latex-formulae-pandoc`
- add gitbook
- gitbook pdf , ok
  - as root run ebook-convert, `Running as root without --no-sandbox is not supported`
  - 参考 `https://hub.docker.com/r/beeronbeard/docker-gitbook-pdf/dockerfile`
  - add `ENV QTWEBENGINE_DISABLE_SANDBOX 1`
  - book.json

## base on latex

- 1.9, base latex-2015
- 2, base ubuntu:18.10, have: python2,python3.6
  - [thomasweise/docker-pandoc](https://hub.docker.com/r/thomasweise/docker-pandoc/dockerfile)
  - [thomasWeise-github](https://github.com/thomasWeise/docker-pandoc)
  - ttf-wqy-microhei(文泉驿微黑字体库), 字体定义 `/usr/share/texlive/texmf-dist/tex/latex/ctex/fontset`, 主要中文字体
  - out pdf, `pandoc --toc --toc-depth=3 -f markdown  readme.md --pdf-engine=xelatex -V mainfont="WenQuanYi Micro Hei" -o readme.pdf`
  - list fonts, `fc-list`

## pandoc + latex 中文方案，use `one/pandoc:2.0`，步骤

### run docker

```
docker run \
--rm -it \
-v $(pwd)/works:/source \
one/pandoc:2.0 \
/bin/bash
```

### in container

```
# 如果想重新设置中文字体
# -V CJKmainfont="WenQuanYi Micro Hei" \
# 设置英文字体，中文字体在my.tex 设置
# -V mainfont="Georgia" \
pandoc --toc --toc-depth=3 readme.md --pdf-engine=xelatex \
--template=my.tex \
-V documentclass=book \
-V CJKmainfont="AR PL UMing CN" \
-V mainfont="Georgia" \
-o readme3.pdf
```

### 中文字体

- `Songti TC` - 苹果宋
- `WenQuanYi Zen Hei` - zhhei
- `AR PL UMing CN` - zhsong
- `AR PL UKai CN` - zhkai

### 模版 `templates/my.tex`

### pdf 显示图片

```
![xxxx](1538307638609112927831c.jpeg "Voyage to the moon")
```

## beamer

- 导出模版，`pandoc -D beamer > beamer-template.tex`
- update

  ```
  \usepackage{xeCJK}                 % 设置中英文字体
  \setCJKmainfont{WenQuanYi Micro Hei} % 中文字体
  \setmainfont{Arial}                % 英文字体
  \setromanfont{Courier New}
  \setmonofont{Courier New}
  \linespread{1.2}\selectfont        % 行距
  \XeTeXlinebreaklocale "zh"         % 中文自动换行
  \XeTeXlinebreakskip = 0pt plus 1pt % 字之间加0pt至1pt间距
  \parindent 0em                     % 段缩进
  \setlength{\parskip}{20pt}         % 段间距
  ```

- [themes](http://deic.uab.es/~iblanes/beamer_gallery/index_by_theme.html)
