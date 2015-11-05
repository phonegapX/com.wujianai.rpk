#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <sys/types.h>
#include <fcntl.h>
#include <errno.h>
#include <time.h>
#include <linux/input.h>
#include <linux/poll.h>
#include <sys/stat.h>


#define BOOL int
#define TRUE  1
#define FALSE 0

static int g_single_proc_inst_lock_fd = -1;

static void single_proc_inst_lockfile_cleanup(void)
{
	if (g_single_proc_inst_lock_fd != -1)
	{
		close(g_single_proc_inst_lock_fd);
		g_single_proc_inst_lock_fd = -1;
	}
}

BOOL is_single_proc_inst_running(const char *process_name)
{
	char lock_file[128];
	snprintf(lock_file, sizeof(lock_file), "/cache/%s.lock", process_name);
	g_single_proc_inst_lock_fd = open(lock_file, O_CREAT|O_RDWR, 0644);
	if (-1 == g_single_proc_inst_lock_fd)
	{
		fprintf(stderr, "Fail to open lock file(%s). Error: %sn", lock_file, strerror(errno));
		return FALSE;
	}
	if (0 == flock(g_single_proc_inst_lock_fd, LOCK_EX|LOCK_NB))
	{
		atexit(single_proc_inst_lockfile_cleanup);
		return TRUE;
	}
	close(g_single_proc_inst_lock_fd);
	g_single_proc_inst_lock_fd = -1;
	return FALSE;
}

struct pollfd g_pf_list[5] = {0};

void init_input_event_list()
{
	int i;
	char name[256] = {0};
	for (i = 0; i < 5; i++)
	{
		sprintf(name, "/dev/input/event%d", i);
		g_pf_list[i].fd = open(name, O_RDONLY, 0);
		g_pf_list[i].events = POLLIN;
		g_pf_list[i].revents = 0;
		printf("[init_input_event_list] open name: %s\n", name);
	}
}

void wait_input_event(int pipe_fd)
{
	for (;;)
	{
		struct pollfd pf_list[5];
		memcpy(pf_list, g_pf_list, sizeof(g_pf_list));
		struct pollfd *fds = pf_list;
		int result = poll(fds, 5, -1);
		if (result >= 0)
		{
			int i;
			for(i = 0; i < 5; i++)
			{
				if (fds[i].revents & POLLIN)
				{
					struct input_event event = {0};
					read(fds[i].fd, &event, sizeof(event));
					if (
							(event.type&EV_KEY) &&
							event.value &&
							((event.code&0xff) == 115 || (event.code&0xff) == 114)
							)
					{
						// result = sub_9FE0();
						int message = 0x12345678;
						int res = write(pipe_fd, &message, sizeof(message));
						if (res == -1)
						{
							printf("Write error on pipe\n");
						}
						break;
					}
				}
			}
		}
		else if (result < 0)
		{
			printf("poll error!\n");
			break;
		}
		else if (result == 0)
		{
			printf("Time out!\n");
			break;
		}
	}
}

void free_input_event_list()
{
}

int main(int argc, char **argv)
{
	if (!is_single_proc_inst_running("athena"))
	{
		return 0;
	}
	const char *fifo_name = "/data/data/com.wujianai.rpk/__rpk__fifo__";
	int pipe_fd = -1;
	if (access(fifo_name, F_OK) == -1)
	{
		//管道文件不存在
		//创建命名管道
		int res = mkfifo(fifo_name, 0777);
		if (res != 0)
		{
			printf("Could not create fifo %s\n", fifo_name);
			return 0;
		}
	}
	chmod(fifo_name, S_IRUSR|S_IWUSR|S_IXUSR|S_IRGRP|S_IWGRP|S_IXGRP|S_IROTH|S_IWOTH|S_IXOTH);
	printf("Process %d opening FIFO O_WRONLY\n", getpid());
	//以只写阻塞方式打开FIFO文件
	pipe_fd = open(fifo_name, O_WRONLY);
	if (pipe_fd != -1)
	{
		//...
		init_input_event_list();
		wait_input_event(pipe_fd);
		free_input_event_list();
		//...
		close(pipe_fd);
	}
	return 0;
}
