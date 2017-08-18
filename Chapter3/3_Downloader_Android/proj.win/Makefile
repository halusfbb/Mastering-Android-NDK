CC = gcc

SRC = main.cpp \
../common/Start.cpp \
../common/CurlWrap.cpp \
../common/Downloader.cpp \
../common/DownloadTask.cpp \
../../2_AsyncTaskQueues/Thread.cpp \
../../2_AsyncTaskQueues/IntrusivePtr.cpp \
../../2_AsyncTaskQueues/tinythread.cpp \
../common/urlparser/LUrlParser.cpp

all:
	$(CC) -o main.exe $(SRC) -I ../../2_AsyncTaskQueues -I ../common -I ../curl/include -lstdc++ -std=c++11
