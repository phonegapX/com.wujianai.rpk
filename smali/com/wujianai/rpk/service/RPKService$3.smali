.class Lcom/wujianai/rpk/service/RPKService$3;
.super Ljava/lang/Thread;
.source "RPKService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/wujianai/rpk/service/RPKService;->runScipt()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/wujianai/rpk/service/RPKService;

.field private final synthetic val$file:Ljava/io/File;


# direct methods
.method constructor <init>(Lcom/wujianai/rpk/service/RPKService;Ljava/io/File;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/wujianai/rpk/service/RPKService$3;->this$0:Lcom/wujianai/rpk/service/RPKService;

    iput-object p2, p0, Lcom/wujianai/rpk/service/RPKService$3;->val$file:Ljava/io/File;

    .line 174
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    .line 177
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 179
    .local v1, res:Ljava/lang/StringBuilder;
    :try_start_0
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "su -c ./"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v4, p0, Lcom/wujianai/rpk/service/RPKService$3;->val$file:Ljava/io/File;

    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Runtime;->exec(Ljava/lang/String;)Ljava/lang/Process;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 183
    :goto_0
    return-void

    .line 180
    :catch_0
    move-exception v2

    move-object v0, v2

    .line 181
    .local v0, ex:Ljava/lang/Exception;
    const-string v2, "wanghelong"

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method
