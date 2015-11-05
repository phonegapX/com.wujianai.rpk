.class public Lcom/wujianai/rpk/service/RPKService$RPKBinder;
.super Landroid/os/Binder;
.source "RPKService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/wujianai/rpk/service/RPKService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "RPKBinder"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/wujianai/rpk/service/RPKService;


# direct methods
.method public constructor <init>(Lcom/wujianai/rpk/service/RPKService;)V
    .locals 0
    .parameter

    .prologue
    .line 134
    iput-object p1, p0, Lcom/wujianai/rpk/service/RPKService$RPKBinder;->this$0:Lcom/wujianai/rpk/service/RPKService;

    invoke-direct {p0}, Landroid/os/Binder;-><init>()V

    return-void
.end method


# virtual methods
.method public getService()Lcom/wujianai/rpk/service/RPKService;
    .locals 1

    .prologue
    .line 136
    iget-object v0, p0, Lcom/wujianai/rpk/service/RPKService$RPKBinder;->this$0:Lcom/wujianai/rpk/service/RPKService;

    return-object v0
.end method
