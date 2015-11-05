.class Lcom/wujianai/rpk/service/RPKService$1;
.super Landroid/content/BroadcastReceiver;
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
    iput-object p1, p0, Lcom/wujianai/rpk/service/RPKService$1;->this$0:Lcom/wujianai/rpk/service/RPKService;

    .line 39
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 5
    .parameter "context"
    .parameter "intent"

    .prologue
    .line 43
    const-string v1, "com.wujianai.rpk.SETTING_CHANGED"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 44
    const-string v1, "notification"

    const/4 v2, 0x1

    invoke-virtual {p2, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    .line 46
    .local v0, isNotification:Z
    if-nez v0, :cond_1

    .line 47
    iget-object v1, p0, Lcom/wujianai/rpk/service/RPKService$1;->this$0:Lcom/wujianai/rpk/service/RPKService;

    #getter for: Lcom/wujianai/rpk/service/RPKService;->mNotificationManager:Landroid/app/NotificationManager;
    invoke-static {v1}, Lcom/wujianai/rpk/service/RPKService;->access$0(Lcom/wujianai/rpk/service/RPKService;)Landroid/app/NotificationManager;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/NotificationManager;->cancelAll()V

    .line 55
    .end local v0           #isNotification:Z
    :cond_0
    :goto_0
    return-void

    .line 49
    .restart local v0       #isNotification:Z
    :cond_1
    iget-object v1, p0, Lcom/wujianai/rpk/service/RPKService$1;->this$0:Lcom/wujianai/rpk/service/RPKService;

    #getter for: Lcom/wujianai/rpk/service/RPKService;->isStarted:Z
    invoke-static {v1}, Lcom/wujianai/rpk/service/RPKService;->access$1(Lcom/wujianai/rpk/service/RPKService;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 50
    iget-object v1, p0, Lcom/wujianai/rpk/service/RPKService$1;->this$0:Lcom/wujianai/rpk/service/RPKService;

    iget-object v2, p0, Lcom/wujianai/rpk/service/RPKService$1;->this$0:Lcom/wujianai/rpk/service/RPKService;

    const/high16 v3, 0x7f05

    invoke-virtual {v2, v3}, Lcom/wujianai/rpk/service/RPKService;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 51
    iget-object v3, p0, Lcom/wujianai/rpk/service/RPKService$1;->this$0:Lcom/wujianai/rpk/service/RPKService;

    const v4, 0x7f050002

    invoke-virtual {v3, v4}, Lcom/wujianai/rpk/service/RPKService;->getString(I)Ljava/lang/String;

    move-result-object v3

    const v4, 0x7f020005

    #calls: Lcom/wujianai/rpk/service/RPKService;->showNotification(Ljava/lang/String;Ljava/lang/String;I)V
    invoke-static {v1, v2, v3, v4}, Lcom/wujianai/rpk/service/RPKService;->access$2(Lcom/wujianai/rpk/service/RPKService;Ljava/lang/String;Ljava/lang/String;I)V

    goto :goto_0
.end method
