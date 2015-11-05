.class Lcom/wujianai/rpk/activity/Main$1;
.super Ljava/lang/Object;
.source "Main.java"

# interfaces
.implements Landroid/content/ServiceConnection;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/wujianai/rpk/activity/Main;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/wujianai/rpk/activity/Main;


# direct methods
.method constructor <init>(Lcom/wujianai/rpk/activity/Main;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/wujianai/rpk/activity/Main$1;->this$0:Lcom/wujianai/rpk/activity/Main;

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 2
    .parameter "name"
    .parameter "service"

    .prologue
    .line 40
    iget-object v0, p0, Lcom/wujianai/rpk/activity/Main$1;->this$0:Lcom/wujianai/rpk/activity/Main;

    check-cast p2, Lcom/wujianai/rpk/service/RPKService$RPKBinder;

    .end local p2
    invoke-virtual {p2}, Lcom/wujianai/rpk/service/RPKService$RPKBinder;->getService()Lcom/wujianai/rpk/service/RPKService;

    move-result-object v1

    #setter for: Lcom/wujianai/rpk/activity/Main;->mService:Lcom/wujianai/rpk/service/IRPKService;
    invoke-static {v0, v1}, Lcom/wujianai/rpk/activity/Main;->access$0(Lcom/wujianai/rpk/activity/Main;Lcom/wujianai/rpk/service/IRPKService;)V

    .line 41
    iget-object v0, p0, Lcom/wujianai/rpk/activity/Main$1;->this$0:Lcom/wujianai/rpk/activity/Main;

    #getter for: Lcom/wujianai/rpk/activity/Main;->scCheckBox:Lcom/wujianai/rpk/view/CheckBoxView;
    invoke-static {v0}, Lcom/wujianai/rpk/activity/Main;->access$1(Lcom/wujianai/rpk/activity/Main;)Lcom/wujianai/rpk/view/CheckBoxView;

    move-result-object v0

    iget-object v1, p0, Lcom/wujianai/rpk/activity/Main$1;->this$0:Lcom/wujianai/rpk/activity/Main;

    #getter for: Lcom/wujianai/rpk/activity/Main;->mService:Lcom/wujianai/rpk/service/IRPKService;
    invoke-static {v1}, Lcom/wujianai/rpk/activity/Main;->access$2(Lcom/wujianai/rpk/activity/Main;)Lcom/wujianai/rpk/service/IRPKService;

    move-result-object v1

    invoke-interface {v1}, Lcom/wujianai/rpk/service/IRPKService;->isStarted()Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/wujianai/rpk/view/CheckBoxView;->setDefaultChecked(Z)V

    .line 42
    return-void
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 2
    .parameter "name"

    .prologue
    .line 35
    iget-object v0, p0, Lcom/wujianai/rpk/activity/Main$1;->this$0:Lcom/wujianai/rpk/activity/Main;

    const/4 v1, 0x0

    #setter for: Lcom/wujianai/rpk/activity/Main;->mService:Lcom/wujianai/rpk/service/IRPKService;
    invoke-static {v0, v1}, Lcom/wujianai/rpk/activity/Main;->access$0(Lcom/wujianai/rpk/activity/Main;Lcom/wujianai/rpk/service/IRPKService;)V

    .line 36
    return-void
.end method
