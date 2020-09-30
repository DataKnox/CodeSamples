import time
from datetime import datetime


def epochHandler(epoch):
    epoch = epochFormatter(epoch)
    eventTime = datetime.fromtimestamp(epoch)
    now = datetime.now()
    #print(eventTime.strftime('%c')+' '+now.strftime('%c'))
    # print(now-eventTime)
    return(abs(now-eventTime).days)


def epochFormatter(epoch):
    epoch = str(epoch)
    epoch = epoch[:10]
    epoch = int(epoch)
    return epoch


def epochTableFormatter(epoch):
    epoch = str(epoch)
    epoch = epoch[:10]
    epoch = int(epoch)
    eventTime = datetime.fromtimestamp(epoch)
    return eventTime
