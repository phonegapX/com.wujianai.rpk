.class Lcom/wujianai/rpk/activity/Main$2;
.super Ljava/lang/Object;
.source "Main.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/wujianai/rpk/activity/Main;->doNoRoot()V
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
    iput-object p1, p0, Lcom/wujianai/rpk/activity/Main$2;->this$0:Lcom/wujianai/rpk/activity/Main;

    .line 137
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1
    .parameter "dialog"
    .parameter "which"

    .prologue
    .line 141
    iget-object v0, p0, Lcom/wujianai/rpk/activity/Main$2;->this$0:Lcom/wujianai/rpk/activity/Main;

    invoke-virtual {v0}, Lcom/wujianai/rpk/activity/Main;->finish()V

    .line 142
    return-void
.end method
