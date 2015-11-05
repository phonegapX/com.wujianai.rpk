.class public Lcom/wujianai/rpk/view/CheckBoxView;
.super Landroid/widget/RelativeLayout;
.source "CheckBoxView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/wujianai/rpk/view/CheckBoxView$OnCheckedChangeListener;
    }
.end annotation


# instance fields
.field private clickListener:Landroid/view/View$OnClickListener;

.field private mAnimationOffset:I

.field private mChecked:Z

.field private mNoBroadcast:Z

.field private mOnCheckedChangeListener:Lcom/wujianai/rpk/view/CheckBoxView$OnCheckedChangeListener;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .parameter "context"

    .prologue
    .line 19
    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 16
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/wujianai/rpk/view/CheckBoxView;->mNoBroadcast:Z

    .line 46
    new-instance v0, Lcom/wujianai/rpk/view/CheckBoxView$1;

    invoke-direct {v0, p0}, Lcom/wujianai/rpk/view/CheckBoxView$1;-><init>(Lcom/wujianai/rpk/view/CheckBoxView;)V

    iput-object v0, p0, Lcom/wujianai/rpk/view/CheckBoxView;->clickListener:Landroid/view/View$OnClickListener;

    .line 20
    invoke-direct {p0, p1}, Lcom/wujianai/rpk/view/CheckBoxView;->initView(Landroid/content/Context;)V

    .line 21
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 24
    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 16
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/wujianai/rpk/view/CheckBoxView;->mNoBroadcast:Z

    .line 46
    new-instance v0, Lcom/wujianai/rpk/view/CheckBoxView$1;

    invoke-direct {v0, p0}, Lcom/wujianai/rpk/view/CheckBoxView$1;-><init>(Lcom/wujianai/rpk/view/CheckBoxView;)V

    iput-object v0, p0, Lcom/wujianai/rpk/view/CheckBoxView;->clickListener:Landroid/view/View$OnClickListener;

    .line 25
    invoke-direct {p0, p1}, Lcom/wujianai/rpk/view/CheckBoxView;->initView(Landroid/content/Context;)V

    .line 26
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .parameter "context"
    .parameter "attrs"
    .parameter "defStyle"

    .prologue
    .line 29
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 16
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/wujianai/rpk/view/CheckBoxView;->mNoBroadcast:Z

    .line 46
    new-instance v0, Lcom/wujianai/rpk/view/CheckBoxView$1;

    invoke-direct {v0, p0}, Lcom/wujianai/rpk/view/CheckBoxView$1;-><init>(Lcom/wujianai/rpk/view/CheckBoxView;)V

    iput-object v0, p0, Lcom/wujianai/rpk/view/CheckBoxView;->clickListener:Landroid/view/View$OnClickListener;

    .line 30
    invoke-direct {p0, p1}, Lcom/wujianai/rpk/view/CheckBoxView;->initView(Landroid/content/Context;)V

    .line 31
    return-void
.end method

.method static synthetic access$0(Lcom/wujianai/rpk/view/CheckBoxView;)Z
    .locals 1
    .parameter

    .prologue
    .line 15
    iget-boolean v0, p0, Lcom/wujianai/rpk/view/CheckBoxView;->mChecked:Z

    return v0
.end method

.method static synthetic access$1(Lcom/wujianai/rpk/view/CheckBoxView;Z)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 15
    iput-boolean p1, p0, Lcom/wujianai/rpk/view/CheckBoxView;->mChecked:Z

    return-void
.end method

.method static synthetic access$2(Lcom/wujianai/rpk/view/CheckBoxView;)V
    .locals 0
    .parameter

    .prologue
    .line 71
    invoke-direct {p0}, Lcom/wujianai/rpk/view/CheckBoxView;->updateView()V

    return-void
.end method

.method private initView(Landroid/content/Context;)V
    .locals 2
    .parameter "context"

    .prologue
    .line 34
    new-instance v0, Landroid/widget/ImageView;

    invoke-direct {v0, p1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 35
    .local v0, imageView:Landroid/widget/ImageView;
    const v1, 0x7f020002

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 36
    invoke-virtual {p0, v0}, Lcom/wujianai/rpk/view/CheckBoxView;->addView(Landroid/view/View;)V

    .line 38
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/wujianai/rpk/view/CheckBoxView;->mChecked:Z

    .line 39
    const/4 v1, 0x5

    iput v1, p0, Lcom/wujianai/rpk/view/CheckBoxView;->mAnimationOffset:I

    .line 40
    iget v1, p0, Lcom/wujianai/rpk/view/CheckBoxView;->mAnimationOffset:I

    invoke-virtual {p0, v1}, Lcom/wujianai/rpk/view/CheckBoxView;->setGravity(I)V

    .line 42
    const v1, 0x7f020001

    invoke-virtual {p0, v1}, Lcom/wujianai/rpk/view/CheckBoxView;->setBackgroundResource(I)V

    .line 43
    iget-object v1, p0, Lcom/wujianai/rpk/view/CheckBoxView;->clickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {p0, v1}, Lcom/wujianai/rpk/view/CheckBoxView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 44
    return-void
.end method

.method private updateView()V
    .locals 2

    .prologue
    .line 72
    iget-boolean v0, p0, Lcom/wujianai/rpk/view/CheckBoxView;->mChecked:Z

    if-eqz v0, :cond_1

    .line 73
    const/4 v0, 0x3

    iput v0, p0, Lcom/wujianai/rpk/view/CheckBoxView;->mAnimationOffset:I

    .line 74
    iget v0, p0, Lcom/wujianai/rpk/view/CheckBoxView;->mAnimationOffset:I

    invoke-virtual {p0, v0}, Lcom/wujianai/rpk/view/CheckBoxView;->setGravity(I)V

    .line 80
    :goto_0
    iget-boolean v0, p0, Lcom/wujianai/rpk/view/CheckBoxView;->mNoBroadcast:Z

    if-eqz v0, :cond_2

    .line 87
    :cond_0
    :goto_1
    return-void

    .line 76
    :cond_1
    const/4 v0, 0x5

    iput v0, p0, Lcom/wujianai/rpk/view/CheckBoxView;->mAnimationOffset:I

    .line 77
    iget v0, p0, Lcom/wujianai/rpk/view/CheckBoxView;->mAnimationOffset:I

    invoke-virtual {p0, v0}, Lcom/wujianai/rpk/view/CheckBoxView;->setGravity(I)V

    goto :goto_0

    .line 84
    :cond_2
    iget-object v0, p0, Lcom/wujianai/rpk/view/CheckBoxView;->mOnCheckedChangeListener:Lcom/wujianai/rpk/view/CheckBoxView$OnCheckedChangeListener;

    if-eqz v0, :cond_0

    .line 85
    iget-object v0, p0, Lcom/wujianai/rpk/view/CheckBoxView;->mOnCheckedChangeListener:Lcom/wujianai/rpk/view/CheckBoxView$OnCheckedChangeListener;

    iget-boolean v1, p0, Lcom/wujianai/rpk/view/CheckBoxView;->mChecked:Z

    invoke-interface {v0, p0, v1}, Lcom/wujianai/rpk/view/CheckBoxView$OnCheckedChangeListener;->onCheckedChanged(Landroid/view/View;Z)V

    goto :goto_1
.end method


# virtual methods
.method public isChecked()Z
    .locals 1

    .prologue
    .line 68
    iget-boolean v0, p0, Lcom/wujianai/rpk/view/CheckBoxView;->mChecked:Z

    return v0
.end method

.method public setChecked(Z)V
    .locals 0
    .parameter "checked"

    .prologue
    .line 55
    iput-boolean p1, p0, Lcom/wujianai/rpk/view/CheckBoxView;->mChecked:Z

    .line 56
    invoke-direct {p0}, Lcom/wujianai/rpk/view/CheckBoxView;->updateView()V

    .line 57
    return-void
.end method

.method public setDefaultChecked(Z)V
    .locals 1
    .parameter "checked"

    .prologue
    .line 60
    iput-boolean p1, p0, Lcom/wujianai/rpk/view/CheckBoxView;->mChecked:Z

    .line 62
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/wujianai/rpk/view/CheckBoxView;->mNoBroadcast:Z

    .line 63
    invoke-direct {p0}, Lcom/wujianai/rpk/view/CheckBoxView;->updateView()V

    .line 64
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/wujianai/rpk/view/CheckBoxView;->mNoBroadcast:Z

    .line 65
    return-void
.end method

.method public setOnCheckedChangeListener(Lcom/wujianai/rpk/view/CheckBoxView$OnCheckedChangeListener;)V
    .locals 0
    .parameter "listener"

    .prologue
    .line 94
    iput-object p1, p0, Lcom/wujianai/rpk/view/CheckBoxView;->mOnCheckedChangeListener:Lcom/wujianai/rpk/view/CheckBoxView$OnCheckedChangeListener;

    .line 95
    return-void
.end method
