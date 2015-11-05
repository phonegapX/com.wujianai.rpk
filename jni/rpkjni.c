/*
 * Copyright (C) 2009 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 */
#include <string.h>
#include <jni.h>
#include <unistd.h>
#include <stdio.h>

#include <stdlib.h>
#include <fcntl.h>

#include <dirent.h>
#include <android/log.h>

#define ENABLE_DEBUG 1

#define LOG_TAG "debug"
#define LOGI(fmt, args...) __android_log_print(ANDROID_LOG_INFO, LOG_TAG, fmt, ##args)
#define LOGD(fmt, args...) __android_log_print(ANDROID_LOG_DEBUG, LOG_TAG, fmt, ##args)
#define LOGE(fmt, args...) __android_log_print(ANDROID_LOG_ERROR, LOG_TAG, fmt, ##args)

#if ENABLE_DEBUG
	#define DEBUG_PRINT(format,args...) \
		LOGD(format, ##args)
#else
	#define DEBUG_PRINT(format,args...)
#endif


void Java_com_wujianai_rpk_jni_RPKJNILoad_fun1(JNIEnv* env, jobject thiz)
{
	int pipe_fd = -1;
	const char *fifo_name = "/data/data/com.wujianai.rpk/__rpk__fifo__";
	for (;;)
	{
		//以只读阻塞方式打开FIFO文件
		pipe_fd = open(fifo_name, O_RDONLY);
		if (pipe_fd != -1)
		{
			for (;;)
			{
				int message = 0;
				int res = read(pipe_fd, &message, sizeof(message));
				if (res == sizeof(message) && message == 0x12345678)
				{
					close(pipe_fd);
					return;
				}
				else if (res <= 0)
				{
					break;
				}
			}
			close(pipe_fd);
		}
		sleep(2);
	}
}
