.class Lcom/wujianai/rpk/service/RPKService$2;
.super Ljava/lang/Thread;
.source "RPKService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/wujianai/rpk/service/RPKService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/wujianai/rpk/service/RPKService;


# direct methods
.method constructor <init>(Lcom/wujianai/rpk/service/RPKService;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/wujianai/rpk/service/RPKService$2;->this$0:Lcom/wujianai/rpk/service/RPKService;

    .line 88
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 92
    const/4 v1, -0x2

    .line 91
    invoke-static {v1}, Landroid/os/Process;->setThreadPriority(I)V

    .line 94
    const/4 v0, 0x0

    .line 96
    .local v0, wakeLock:Landroid/os/PowerManager$WakeLock;
    :goto_0
    iget-object v1, p0, Lcom/wujianai/rpk/service/RPKService$2;->this$0:Lcom/wujianai/rpk/service/RPKService;

    #getter for: Lcom/wujianai/rpk/service/RPKService;->jniLoad:Lcom/wujianai/rpk/jni/RPKJNILoad;
    invoke-static {v1}, Lcom/wujianai/rpk/service/RPKService;->access$3(Lcom/wujianai/rpk/service/RPKService;)Lcom/wujianai/rpk/jni/RPKJNILoad;

    move-result-object v1

    invoke-virtual {v1}, Lcom/wujianai/rpk/jni/RPKJNILoad;->fun1()V

    .line 98
    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 99
    return-void

    .line 102
    :cond_0
    iget-object v1, p0, Lcom/wujianai/rpk/service/RPKService$2;->this$0:Lcom/wujianai/rpk/service/RPKService;

    #getter for: Lcom/wujianai/rpk/service/RPKService;->powerManager:Landroid/os/PowerManager;
    invoke-static {v1}, Lcom/wujianai/rpk/service/RPKService;->access$4(Lcom/wujianai/rpk/service/RPKService;)Landroid/os/PowerManager;

    move-result-object v1

    const v2, 0x1000000a

    const-string v3, "RPKService"

    invoke-virtual {v1, v2, v3}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;

    move-result-object v0

    .line 103
    const-wide/16 v1, 0x1388

    invoke-virtual {v0, v1, v2}, Landroid/os/PowerManager$WakeLock;->acquire(J)V

    goto :goto_0
.end method
