FROM jguiraudet/dit4c-container-ipython:8.0-cudnn5-devel
MAINTAINER Jean-Marc Guiraudet <jguiraudet@gmail.com>

RUN su - researcher -c \
  "/opt/python/bin/pip install jupyterlab && \
  /opt/python/bin/jupyter serverextension enable --py jupyterlab"
RUN rm -f /etc/supervisord.d/ipynb.conf
RUN sed -i -e 's/\/ipynb\//\/jupyter\//' /home/researcher/.jupyter/jupyter_notebook_config.py

ADD /etc /etc
ADD /var /var
