FROM continuumio/anaconda
MAINTAINER gary.feng@gmail.com

# install Knowledge-repo
#
RUN  pip install --upgrade "knowledge-repo[all]"

# install R
RUN conda install -y r-essentials 

# create a sample repo
RUN knowledge_repo --repo ./example_repo init

# set up git
# RUN cd ./example_repo/
# RUN git remote add origin https://github.com/garyfeng/knowledge_repo.git
# RUN git push -u origin master

# create the autorun script
COPY autorun.sh /
# make it an exec
RUN chmod +x /autorun.sh

# set the startup script to scan the data file for video files and process them.
# the following line will run the /autorun.sh and quit the docker instance; good for production
# ENTRYPOINT ["/autorun.sh"]
ENTRYPOINT ["bash"]

# CMD []
