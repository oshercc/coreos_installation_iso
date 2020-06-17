FROM quay.io/yshnaidm/livecd-iso:fedora-coreos-livecd

FROM python:2.7

ARG WORK_DIR=/data

RUN mkdir $WORK_DIR
RUN chmod 777 $WORK_DIR

COPY --from=0 /root/image/livecd.iso $WORK_DIR
RUN chmod 666 $WORK_DIR/livecd.iso
ENV COREOS_IMAGE=$WORK_DIR/livecd.iso

COPY ./coreos-installer $WORK_DIR
COPY ./install_process.py $WORK_DIR

ENV WORK_DIR=$WORK_DIR

RUN pip install boto3
RUN pip install botocore

CMD python /data/install_process.py
