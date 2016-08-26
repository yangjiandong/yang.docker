FROM yangjiandong/base:v2

# install texlive 2015 and dependencies
RUN apt-get update -q \
    && apt-get install -y --no-install-recommends \
    texlive-latex-extra \
    texlive-latex-recommended \
    texlive-fonts-extra \
    texlive-fonts-recommended \
    #texlive-lang-chinese \
    texlive-formats-extra \
    lmodern \
    wget \
    xzdec \
    && apt-get clean \
    && apt-get autoclean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
 
## intsall latex packages
#RUN tlmgr init-usertree
#RUN tlmgr install ulem

#RUN cd resume/ \
    #&& xelatex Resume.tex -interaction=nonstopmode \
    #&& xelatex Resume_ZH.tex -interaction=nonstopmode \
    #&& rm *.aux *.log *.out

# run xelatex

