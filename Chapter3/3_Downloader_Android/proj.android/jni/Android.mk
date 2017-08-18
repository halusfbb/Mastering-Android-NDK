#

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE    := Crypto
LOCAL_SRC_FILES := ../../../../Libs.Android/libCrypto.$(TARGET_ARCH_ABI).a
LOCAL_EXPORT_C_INCLUDES := ../openssl/include
include $(PREBUILT_STATIC_LIBRARY)

LOCAL_MODULE    := SSL
LOCAL_SRC_FILES := ../../../../Libs.Android/libSSL.$(TARGET_ARCH_ABI).a
LOCAL_EXPORT_C_INCLUDES := ../openssl/include
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE    := curl
LOCAL_SRC_FILES := ../../../../Libs.Android/libcurl.$(TARGET_ARCH_ABI).a
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/../../curl/include
LOCAL_STATIC_LIBRARIES = SSL
LOCAL_STATIC_LIBRARIES += Crypto
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)

TARGET_PLATFORM := android-19

LOCAL_MODULE   := NativeLib

LOCAL_SRC_FILES := \
../../common/Start.cpp \
main.cpp \
../../common/CurlWrap.cpp \
../../common/Downloader.cpp \
../../common/DownloadTask.cpp \
../../../2_AsyncTaskQueues/Thread.cpp \
../../../2_AsyncTaskQueues/IntrusivePtr.cpp \
../../../2_AsyncTaskQueues/tinythread.cpp \
../../common/urlparser/LUrlParser.cpp


LOCAL_C_INCLUDES += $(LOCAL_PATH)/../../../2_AsyncTaskQueues $(LOCAL_PATH)/../../common

LOCAL_ARM_MODE := arm
COMMON_CFLAGS := -Werror -DANDROID -DDISABLE_IMPORTGL

ifeq ($(TARGET_ARCH),x86)
	LOCAL_CFLAGS   := $(COMMON_CFLAGS)
else
	LOCAL_CFLAGS   := -mfpu=vfp -mfloat-abi=hard -mhard-float -fno-short-enums -D_NDK_MATH_NO_SOFTFP=1 $(COMMON_CFLAGS)
endif

LOCAL_LDLIBS     := -lz -llog -lGLESv2 -Wl,-s

LOCAL_CPPFLAGS += -std=gnu++11

LOCAL_STATIC_LIBRARIES += curl

include $(BUILD_SHARED_LIBRARY)
