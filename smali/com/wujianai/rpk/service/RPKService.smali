.class public Lcom/wujianai/rpk/service/RPKService;
.super Landroid/app/Service;
.source "RPKService.java"

# interfaces
.implements Lcom/wujianai/rpk/service/IRPKService;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/wujianai/rpk/service/RPKService$RPKBinder;
    }
.end annotation


# static fields
.field private static final RPKSERVICE_FG_ID:I = 0x64

.field private static final RPKSERVICE_STATUS:I = 0x65


# instance fields
.field private isStarted:Z

.field private jniLoad:Lcom/wujianai/rpk/jni/RPKJNILoad;

.field private mBinder:Lcom/wujianai/rpk/service/RPKService$RPKBinder;

.field private mNotificationManager:Landroid/app/NotificationManager;

.field private powerManager:Landroid/os/PowerManager;

.field private settingChangedReceiver:Landroid/content/BroadcastReceiver;

.field private thread:Ljava/lang/Thread;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 28
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    .line 29
    new-instance v0, Lcom/wujianai/rpk/service/RPKService$RPKBinder;

    invoke-direct {v0, p0}, Lcom/wujianai/rpk/service/RPKService$RPKBinder;-><init>(Lcom/wujianai/rpk/service/RPKService;)V

    iput-object v0, p0, Lcom/wujianai/rpk/service/RPKService;->mBinder:Lcom/wujianai/rpk/service/RPKService$RPKBinder;

    .line 32
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/wujianai/rpk/service/RPKService;->isStarted:Z

    .line 39
    new-instance v0, Lcom/wujianai/rpk/service/RPKService$1;

    invoke-direct {v0, p0}, Lcom/wujianai/rpk/service/RPKService$1;-><init>(Lcom/wujianai/rpk/service/RPKService;)V

    iput-object v0, p0, Lcom/wujianai/rpk/service/RPKService;->settingChangedReceiver:Landroid/content/BroadcastReceiver;

    .line 88
    new-instance v0, Lcom/wujianai/rpk/service/RPKService$2;

    invoke-direct {v0, p0}, Lcom/wujianai/rpk/service/RPKService$2;-><init>(Lcom/wujianai/rpk/service/RPKService;)V

    iput-object v0, p0, Lcom/wujianai/rpk/service/RPKService;->thread:Ljava/lang/Thread;

    .line 28
    return-void
.end method

.method static synthetic access$0(Lcom/wujianai/rpk/service/RPKService;)Landroid/app/NotificationManager;
    .locals 1
    .parameter

    .prologue
    .line 34
    iget-object v0, p0, Lcom/wujianai/rpk/service/RPKService;->mNotificationManager:Landroid/app/NotificationManager;

    return-object v0
.end method

.method static synthetic access$1(Lcom/wujianai/rpk/service/RPKService;)Z
    .locals 1
    .parameter

    .prologue
    .line 32
    iget-boolean v0, p0, Lcom/wujianai/rpk/service/RPKService;->isStarted:Z

    return v0
.end method

.method static synthetic access$2(Lcom/wujianai/rpk/service/RPKService;Ljava/lang/String;Ljava/lang/String;I)V
    .locals 0
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 193
    invoke-direct {p0, p1, p2, p3}, Lcom/wujianai/rpk/service/RPKService;->showNotification(Ljava/lang/String;Ljava/lang/String;I)V

    return-void
.end method

.method static synthetic access$3(Lcom/wujianai/rpk/service/RPKService;)Lcom/wujianai/rpk/jni/RPKJNILoad;
    .locals 1
    .parameter

    .prologue
    .line 30
    iget-object v0, p0, Lcom/wujianai/rpk/service/RPKService;->jniLoad:Lcom/wujianai/rpk/jni/RPKJNILoad;

    return-object v0
.end method

.method static synthetic access$4(Lcom/wujianai/rpk/service/RPKService;)Landroid/os/PowerManager;
    .locals 1
    .parameter

    .prologue
    .line 31
    iget-object v0, p0, Lcom/wujianai/rpk/service/RPKService;->powerManager:Landroid/os/PowerManager;

    return-object v0
.end method

.method private static copyRawFile(Landroid/content/Context;Ljava/io/InputStream;Ljava/io/File;Ljava/lang/String;)V
    .locals 6
    .parameter "ctx"
    .parameter "inputStream"
    .parameter "file"
    .parameter "mode"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 160
    new-instance v2, Ljava/io/FileOutputStream;

    invoke-direct {v2, p2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 161
    .local v2, out:Ljava/io/FileOutputStream;
    const/16 v3, 0x400

    new-array v0, v3, [B

    .line 163
    .local v0, buf:[B
    :goto_0
    invoke-virtual {p1, v0}, Ljava/io/InputStream;->read([B)I

    move-result v1

    .local v1, len:I
    if-gtz v1, :cond_0

    .line 166
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V

    .line 167
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V

    .line 169
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "chmod "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/Runtime;->exec(Ljava/lang/String;)Ljava/lang/Process;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Process;->waitFor()I

    .line 170
    return-void

    .line 164
    :cond_0
    const/4 v3, 0x0

    invoke-virtual {v2, v0, v3, v1}, Ljava/io/FileOutputStream;->write([BII)V

    goto :goto_0
.end method

.method private initAssets()V
    .locals 6

    .prologue
    const-string v5, "athena.dat"

    .line 146
    invoke-virtual {p0}, Lcom/wujianai/rpk/service/RPKService;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    .line 148
    .local v0, assetManager:Landroid/content/res/AssetManager;
    new-instance v2, Ljava/io/File;

    const-string v3, "bin"

    const/4 v4, 0x0

    invoke-virtual {p0, v3, v4}, Lcom/wujianai/rpk/service/RPKService;->getDir(Ljava/lang/String;I)Ljava/io/File;

    move-result-object v3

    const-string v4, "athena.dat"

    invoke-direct {v2, v3, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 149
    .local v2, file:Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v3

    if-nez v3, :cond_0

    .line 151
    :try_start_0
    const-string v3, "athena.dat"

    invoke-virtual {v0, v3}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v3

    const-string v4, "777"

    invoke-static {p0, v3, v2, v4}, Lcom/wujianai/rpk/service/RPKService;->copyRawFile(Landroid/content/Context;Ljava/io/InputStream;Ljava/io/File;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 156
    :cond_0
    :goto_0
    return-void

    .line 152
    :catch_0
    move-exception v3

    move-object v1, v3

    .line 153
    .local v1, e:Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method private onServiceStart()V
    .locals 0

    .prologue
    .line 141
    invoke-direct {p0}, Lcom/wujianai/rpk/service/RPKService;->initAssets()V

    .line 142
    invoke-virtual {p0}, Lcom/wujianai/rpk/service/RPKService;->runScipt()V

    .line 143
    return-void
.end method

.method private showNotification(Ljava/lang/String;Ljava/lang/String;I)V
    .locals 6
    .parameter "contentTitle"
    .parameter "contentText"
    .parameter "resId"

    .prologue
    const/4 v5, 0x0

    .line 195
    new-instance v1, Landroid/app/Notification;

    .line 196
    const/4 v2, 0x0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    .line 195
    invoke-direct {v1, p3, v2, v3, v4}, Landroid/app/Notification;-><init>(ILjava/lang/CharSequence;J)V

    .line 198
    .local v1, notification:Landroid/app/Notification;
    iget v2, v1, Landroid/app/Notification;->flags:I

    or-int/lit8 v2, v2, 0x2

    iput v2, v1, Landroid/app/Notification;->flags:I

    .line 200
    new-instance v2, Landroid/content/Intent;

    const-string v3, "com.wujianai.rpk.RPK_ACTIVITY"

    invoke-direct {v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 199
    invoke-static {p0, v5, v2, v5}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v0

    .line 202
    .local v0, contentIntent:Landroid/app/PendingIntent;
    invoke-virtual {v1, p0, p1, p2, v0}, Landroid/app/Notification;->setLatestEventInfo(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Landroid/app/PendingIntent;)V

    .line 205
    iget-object v2, p0, Lcom/wujianai/rpk/service/RPKService;->mNotificationManager:Landroid/app/NotificationManager;

    const/16 v3, 0x65

    invoke-virtual {v2, v3, v1}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    .line 206
    return-void
.end method


# virtual methods
.method public isStarted()Z
    .locals 1

    .prologue
    .line 190
    iget-boolean v0, p0, Lcom/wujianai/rpk/service/RPKService;->isStarted:Z

    return v0
.end method

.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 1
    .parameter "intent"

    .prologue
    .line 61
    iget-object v0, p0, Lcom/wujianai/rpk/service/RPKService;->mBinder:Lcom/wujianai/rpk/service/RPKService$RPKBinder;

    return-object v0
.end method

.method public onCreate()V
    .locals 3

    .prologue
    .line 66
    invoke-super {p0}, Landroid/app/Service;->onCreate()V

    .line 68
    new-instance v0, Lcom/wujianai/rpk/jni/RPKJNILoad;

    invoke-direct {v0}, Lcom/wujianai/rpk/jni/RPKJNILoad;-><init>()V

    iput-object v0, p0, Lcom/wujianai/rpk/service/RPKService;->jniLoad:Lcom/wujianai/rpk/jni/RPKJNILoad;

    .line 69
    const-string v0, "power"

    invoke-virtual {p0, v0}, Lcom/wujianai/rpk/service/RPKService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/PowerManager;

    iput-object v0, p0, Lcom/wujianai/rpk/service/RPKService;->powerManager:Landroid/os/PowerManager;

    .line 70
    const-string v0, "notification"

    invoke-virtual {p0, v0}, Lcom/wujianai/rpk/service/RPKService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    iput-object v0, p0, Lcom/wujianai/rpk/service/RPKService;->mNotificationManager:Landroid/app/NotificationManager;

    .line 72
    iget-object v0, p0, Lcom/wujianai/rpk/service/RPKService;->settingChangedReceiver:Landroid/content/BroadcastReceiver;

    new-instance v1, Landroid/content/IntentFilter;

    const-string v2, "com.wujianai.rpk.SETTING_CHANGED"

    invoke-direct {v1, v2}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0, v1}, Lcom/wujianai/rpk/service/RPKService;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 73
    return-void
.end method

.method public onDestroy()V
    .locals 1

    .prologue
    .line 77
    invoke-super {p0}, Landroid/app/Service;->onDestroy()V

    .line 78
    iget-object v0, p0, Lcom/wujianai/rpk/service/RPKService;->thread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V

    .line 80
    iget-object v0, p0, Lcom/wujianai/rpk/service/RPKService;->mNotificationManager:Landroid/app/NotificationManager;

    invoke-virtual {v0}, Landroid/app/NotificationManager;->cancelAll()V

    .line 81
    return-void
.end method

.method public onRebind(Landroid/content/Intent;)V
    .locals 0
    .parameter "intent"

    .prologue
    .line 85
    invoke-super {p0, p1}, Landroid/app/Service;->onRebind(Landroid/content/Intent;)V

    .line 86
    return-void
.end method

.method public onStart(Landroid/content/Intent;I)V
    .locals 3
    .parameter "intent"
    .parameter "startId"

    .prologue
    const/4 v1, 0x1

    .line 110
    invoke-super {p0, p1, p2}, Landroid/app/Service;->onStart(Landroid/content/Intent;I)V

    .line 112
    iget-boolean v0, p0, Lcom/wujianai/rpk/service/RPKService;->isStarted:Z

    if-nez v0, :cond_0

    .line 113
    invoke-direct {p0}, Lcom/wujianai/rpk/service/RPKService;->onServiceStart()V

    .line 114
    iput-boolean v1, p0, Lcom/wujianai/rpk/service/RPKService;->isStarted:Z

    .line 117
    :cond_0
    iget-object v0, p0, Lcom/wujianai/rpk/service/RPKService;->thread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->isAlive()Z

    move-result v0

    if-nez v0, :cond_1

    .line 118
    iget-object v0, p0, Lcom/wujianai/rpk/service/RPKService;->thread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 121
    :cond_1
    const-string v0, "notification_status"

    invoke-static {p0, v0, v1}, Lcom/wujianai/rpk/util/RPKUtil;->getBooleanPref(Landroid/content/Context;Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 122
    const/high16 v0, 0x7f05

    invoke-virtual {p0, v0}, Lcom/wujianai/rpk/service/RPKService;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 123
    const v1, 0x7f050002

    invoke-virtual {p0, v1}, Lcom/wujianai/rpk/service/RPKService;->getString(I)Ljava/lang/String;

    move-result-object v1

    const v2, 0x7f020005

    .line 122
    invoke-direct {p0, v0, v1, v2}, Lcom/wujianai/rpk/service/RPKService;->showNotification(Ljava/lang/String;Ljava/lang/String;I)V

    .line 126
    :cond_2
    const/16 v0, 0x64

    new-instance v1, Landroid/app/Notification;

    invoke-direct {v1}, Landroid/app/Notification;-><init>()V

    invoke-virtual {p0, v0, v1}, Lcom/wujianai/rpk/service/RPKService;->startForeground(ILandroid/app/Notification;)V

    .line 127
    return-void
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .locals 1
    .parameter "intent"
    .parameter "flags"
    .parameter "startId"

    .prologue
    .line 210
    invoke-super {p0, p1, p2, p3}, Landroid/app/Service;->onStartCommand(Landroid/content/Intent;II)I

    .line 212
    iget-object v0, p0, Lcom/wujianai/rpk/service/RPKService;->thread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->isAlive()Z

    move-result v0

    if-nez v0, :cond_0

    .line 213
    iget-object v0, p0, Lcom/wujianai/rpk/service/RPKService;->thread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 215
    :cond_0
    const/4 v0, 0x3

    return v0
.end method

.method public onUnbind(Landroid/content/Intent;)Z
    .locals 1
    .parameter "intent"

    .prologue
    .line 131
    invoke-super {p0, p1}, Landroid/app/Service;->onUnbind(Landroid/content/Intent;)Z

    move-result v0

    return v0
.end method

.method public runScipt()V
    .locals 4

    .prologue
    .line 173
    new-instance v0, Ljava/io/File;

    const-string v2, "bin"

    const/4 v3, 0x0

    invoke-virtual {p0, v2, v3}, Lcom/wujianai/rpk/service/RPKService;->getDir(Ljava/lang/String;I)Ljava/io/File;

    move-result-object v2

    const-string v3, "athena.dat"

    invoke-direct {v0, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 174
    .local v0, file:Ljava/io/File;
    new-instance v1, Lcom/wujianai/rpk/service/RPKService$3;

    invoke-direct {v1, p0, v0}, Lcom/wujianai/rpk/service/RPKService$3;-><init>(Lcom/wujianai/rpk/service/RPKService;Ljava/io/File;)V

    .line 185
    .local v1, thread:Ljava/lang/Thread;
    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 186
    return-void
.end method
