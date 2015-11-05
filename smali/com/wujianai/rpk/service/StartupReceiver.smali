.class public Lcom/wujianai/rpk/service/StartupReceiver;
.super Landroid/content/BroadcastReceiver;
.source "StartupReceiver.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 9
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 3
    .parameter "context"
    .parameter "intent"

    .prologue
    .line 13
    const-string v1, "bootauto_status"

    const/4 v2, 0x0

    invoke-static {p1, v1, v2}, Lcom/wujianai/rpk/util/RPKUtil;->getBooleanPref(Landroid/content/Context;Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 14
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/wujianai/rpk/service/RPKService;

    invoke-direct {v0, p1, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 15
    .local v0, serviceIntent:Landroid/content/Intent;
    invoke-virtual {p1, v0}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 17
    .end local v0           #serviceIntent:Landroid/content/Intent;
    :cond_0
    return-void
.end method
