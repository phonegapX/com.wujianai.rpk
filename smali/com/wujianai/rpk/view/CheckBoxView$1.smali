.class Lcom/wujianai/rpk/view/CheckBoxView$1;
.super Ljava/lang/Object;
.source "CheckBoxView.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/wujianai/rpk/view/CheckBoxView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/wujianai/rpk/view/CheckBoxView;


# direct methods
.method constructor <init>(Lcom/wujianai/rpk/view/CheckBoxView;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/wujianai/rpk/view/CheckBoxView$1;->this$0:Lcom/wujianai/rpk/view/CheckBoxView;

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .parameter "v"

    .prologue
    .line 49
    iget-object v0, p0, Lcom/wujianai/rpk/view/CheckBoxView$1;->this$0:Lcom/wujianai/rpk/view/CheckBoxView;

    iget-object v1, p0, Lcom/wujianai/rpk/view/CheckBoxView$1;->this$0:Lcom/wujianai/rpk/view/CheckBoxView;

    #getter for: Lcom/wujianai/rpk/view/CheckBoxView;->mChecked:Z
    invoke-static {v1}, Lcom/wujianai/rpk/view/CheckBoxView;->access$0(Lcom/wujianai/rpk/view/CheckBoxView;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x0

    :goto_0
    #setter for: Lcom/wujianai/rpk/view/CheckBoxView;->mChecked:Z
    invoke-static {v0, v1}, Lcom/wujianai/rpk/view/CheckBoxView;->access$1(Lcom/wujianai/rpk/view/CheckBoxView;Z)V

    .line 50
    iget-object v0, p0, Lcom/wujianai/rpk/view/CheckBoxView$1;->this$0:Lcom/wujianai/rpk/view/CheckBoxView;

    #calls: Lcom/wujianai/rpk/view/CheckBoxView;->updateView()V
    invoke-static {v0}, Lcom/wujianai/rpk/view/CheckBoxView;->access$2(Lcom/wujianai/rpk/view/CheckBoxView;)V

    .line 51
    return-void

    .line 49
    :cond_0
    const/4 v1, 0x1

    goto :goto_0
.end method
