.class public Lcom/wujianai/rpk/activity/Main;
.super Landroid/app/Activity;
.source "Main.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Lcom/wujianai/rpk/view/CheckBoxView$OnCheckedChangeListener;


# instance fields
.field private mService:Lcom/wujianai/rpk/service/IRPKService;

.field private scCheckBox:Lcom/wujianai/rpk/view/CheckBoxView;

.field private serviceConnection:Landroid/content/ServiceConnection;

.field private serviceIntent:Landroid/content/Intent;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 26
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 32
    new-instance v0, Lcom/wujianai/rpk/activity/Main$1;

    invoke-direct {v0, p0}, Lcom/wujianai/rpk/activity/Main$1;-><init>(Lcom/wujianai/rpk/activity/Main;)V

    iput-object v0, p0, Lcom/wujianai/rpk/activity/Main;->serviceConnection:Landroid/content/ServiceConnection;

    .line 26
    return-void
.end method

.method static synthetic access$0(Lcom/wujianai/rpk/activity/Main;Lcom/wujianai/rpk/service/IRPKService;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 27
    iput-object p1, p0, Lcom/wujianai/rpk/activity/Main;->mService:Lcom/wujianai/rpk/service/IRPKService;

    return-void
.end method

.method static synthetic access$1(Lcom/wujianai/rpk/activity/Main;)Lcom/wujianai/rpk/view/CheckBoxView;
    .locals 1
    .parameter

    .prologue
    .line 30
    iget-object v0, p0, Lcom/wujianai/rpk/activity/Main;->scCheckBox:Lcom/wujianai/rpk/view/CheckBoxView;

    return-object v0
.end method

.method static synthetic access$2(Lcom/wujianai/rpk/activity/Main;)Lcom/wujianai/rpk/service/IRPKService;
    .locals 1
    .parameter

    .prologue
    .line 27
    iget-object v0, p0, Lcom/wujianai/rpk/activity/Main;->mService:Lcom/wujianai/rpk/service/IRPKService;

    return-object v0
.end method

.method private doNoRoot()V
    .locals 3

    .prologue
    .line 136
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v1, 0x7f050004

    invoke-virtual {p0, v1}, Lcom/wujianai/rpk/activity/Main;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\u786e\u5b9a"

    .line 137
    new-instance v2, Lcom/wujianai/rpk/activity/Main$2;

    invoke-direct {v2, p0}, Lcom/wujianai/rpk/activity/Main$2;-><init>(Lcom/wujianai/rpk/activity/Main;)V

    .line 136
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 144
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 145
    return-void
.end method

.method private hasRoot()Z
    .locals 7

    .prologue
    const/4 v6, 0x0

    .line 124
    const/16 v4, 0x400

    new-array v0, v4, [C

    .line 126
    .local v0, buf:[C
    :try_start_0
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v4

    const-string v5, "su -c ls"

    invoke-virtual {v4, v5}, Ljava/lang/Runtime;->exec(Ljava/lang/String;)Ljava/lang/Process;

    move-result-object v2

    .line 128
    .local v2, exec:Ljava/lang/Process;
    new-instance v3, Ljava/io/InputStreamReader;

    invoke-virtual {v2}, Ljava/lang/Process;->getErrorStream()Ljava/io/InputStream;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    .line 129
    .local v3, r:Ljava/io/InputStreamReader;
    invoke-virtual {v3, v0}, Ljava/io/InputStreamReader;->read([C)I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v4

    const/4 v5, -0x1

    if-ne v4, v5, :cond_0

    const/4 v4, 0x1

    .line 131
    .end local v2           #exec:Ljava/lang/Process;
    .end local v3           #r:Ljava/io/InputStreamReader;
    :goto_0
    return v4

    .restart local v2       #exec:Ljava/lang/Process;
    .restart local v3       #r:Ljava/io/InputStreamReader;
    :cond_0
    move v4, v6

    .line 129
    goto :goto_0

    .line 130
    .end local v2           #exec:Ljava/lang/Process;
    .end local v3           #r:Ljava/io/InputStreamReader;
    :catch_0
    move-exception v4

    move-object v1, v4

    .local v1, e:Ljava/io/IOException;
    move v4, v6

    .line 131
    goto :goto_0
.end method

.method private startService()V
    .locals 3

    .prologue
    .line 74
    iget-object v0, p0, Lcom/wujianai/rpk/activity/Main;->serviceIntent:Landroid/content/Intent;

    invoke-virtual {p0, v0}, Lcom/wujianai/rpk/activity/Main;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 75
    iget-object v0, p0, Lcom/wujianai/rpk/activity/Main;->serviceIntent:Landroid/content/Intent;

    iget-object v1, p0, Lcom/wujianai/rpk/activity/Main;->serviceConnection:Landroid/content/ServiceConnection;

    .line 76
    const/4 v2, 0x1

    .line 75
    invoke-virtual {p0, v0, v1, v2}, Lcom/wujianai/rpk/activity/Main;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    .line 77
    return-void
.end method

.method private stopService()V
    .locals 1

    .prologue
    .line 80
    iget-object v0, p0, Lcom/wujianai/rpk/activity/Main;->serviceIntent:Landroid/content/Intent;

    invoke-virtual {p0, v0}, Lcom/wujianai/rpk/activity/Main;->stopService(Landroid/content/Intent;)Z

    .line 81
    iget-object v0, p0, Lcom/wujianai/rpk/activity/Main;->serviceConnection:Landroid/content/ServiceConnection;

    invoke-virtual {p0, v0}, Lcom/wujianai/rpk/activity/Main;->unbindService(Landroid/content/ServiceConnection;)V

    .line 82
    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/view/View;Z)V
    .locals 1
    .parameter "view"
    .parameter "isChecked"

    .prologue
    .line 86
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 99
    :goto_0
    return-void

    .line 88
    :pswitch_0
    if-eqz p2, :cond_0

    .line 89
    invoke-direct {p0}, Lcom/wujianai/rpk/activity/Main;->startService()V

    goto :goto_0

    .line 91
    :cond_0
    invoke-direct {p0}, Lcom/wujianai/rpk/activity/Main;->stopService()V

    goto :goto_0

    .line 96
    :pswitch_1
    const-string v0, "bootauto_status"

    invoke-static {p0, v0, p2}, Lcom/wujianai/rpk/util/RPKUtil;->setBooleanPref(Landroid/content/Context;Ljava/lang/String;Z)V

    goto :goto_0

    .line 86
    :pswitch_data_0
    .packed-switch 0x7f070001
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public onClick(Landroid/view/View;)V
    .locals 4
    .parameter "v"

    .prologue
    const/high16 v3, 0x1000

    .line 103
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v2

    packed-switch v2, :pswitch_data_0

    .line 119
    :goto_0
    return-void

    .line 105
    :pswitch_0
    new-instance v0, Landroid/content/Intent;

    const-class v2, Lcom/wujianai/rpk/activity/AboutActivity;

    invoke-direct {v0, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 106
    .local v0, aboutIntent:Landroid/content/Intent;
    invoke-virtual {v0, v3}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 107
    invoke-virtual {p0, v0}, Lcom/wujianai/rpk/activity/Main;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 111
    .end local v0           #aboutIntent:Landroid/content/Intent;
    :pswitch_1
    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/wujianai/rpk/activity/SettingActivity;

    invoke-direct {v1, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 112
    .local v1, settingIntent:Landroid/content/Intent;
    invoke-virtual {v1, v3}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 113
    invoke-virtual {p0, v1}, Lcom/wujianai/rpk/activity/Main;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 103
    :pswitch_data_0
    .packed-switch 0x7f070004
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 6
    .parameter "savedInstanceState"

    .prologue
    .line 47
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 48
    const v3, 0x7f030002

    invoke-virtual {p0, v3}, Lcom/wujianai/rpk/activity/Main;->setContentView(I)V

    .line 50
    new-instance v3, Landroid/content/Intent;

    const-class v4, Lcom/wujianai/rpk/service/RPKService;

    invoke-direct {v3, p0, v4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    iput-object v3, p0, Lcom/wujianai/rpk/activity/Main;->serviceIntent:Landroid/content/Intent;

    .line 52
    const v3, 0x7f070001

    invoke-virtual {p0, v3}, Lcom/wujianai/rpk/activity/Main;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Lcom/wujianai/rpk/view/CheckBoxView;

    iput-object v3, p0, Lcom/wujianai/rpk/activity/Main;->scCheckBox:Lcom/wujianai/rpk/view/CheckBoxView;

    .line 53
    iget-object v3, p0, Lcom/wujianai/rpk/activity/Main;->scCheckBox:Lcom/wujianai/rpk/view/CheckBoxView;

    invoke-virtual {v3, p0}, Lcom/wujianai/rpk/view/CheckBoxView;->setOnCheckedChangeListener(Lcom/wujianai/rpk/view/CheckBoxView$OnCheckedChangeListener;)V

    .line 55
    const v3, 0x7f070002

    invoke-virtual {p0, v3}, Lcom/wujianai/rpk/activity/Main;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/wujianai/rpk/view/CheckBoxView;

    .line 56
    .local v1, baCheckBox:Lcom/wujianai/rpk/view/CheckBoxView;
    const-string v3, "bootauto_status"

    const/4 v4, 0x0

    invoke-static {p0, v3, v4}, Lcom/wujianai/rpk/util/RPKUtil;->getBooleanPref(Landroid/content/Context;Ljava/lang/String;Z)Z

    move-result v3

    invoke-virtual {v1, v3}, Lcom/wujianai/rpk/view/CheckBoxView;->setChecked(Z)V

    .line 57
    invoke-virtual {v1, p0}, Lcom/wujianai/rpk/view/CheckBoxView;->setOnCheckedChangeListener(Lcom/wujianai/rpk/view/CheckBoxView$OnCheckedChangeListener;)V

    .line 59
    const v3, 0x7f070005

    invoke-virtual {p0, v3}, Lcom/wujianai/rpk/activity/Main;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    .line 60
    .local v0, aboutView:Landroid/widget/ImageView;
    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 62
    const v3, 0x7f070004

    invoke-virtual {p0, v3}, Lcom/wujianai/rpk/activity/Main;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    .line 63
    .local v2, settingView:Landroid/widget/ImageView;
    invoke-virtual {v2, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 65
    iget-object v3, p0, Lcom/wujianai/rpk/activity/Main;->serviceIntent:Landroid/content/Intent;

    iget-object v4, p0, Lcom/wujianai/rpk/activity/Main;->serviceConnection:Landroid/content/ServiceConnection;

    .line 66
    const/4 v5, 0x1

    .line 65
    invoke-virtual {p0, v3, v4, v5}, Lcom/wujianai/rpk/activity/Main;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    .line 68
    invoke-direct {p0}, Lcom/wujianai/rpk/activity/Main;->hasRoot()Z

    move-result v3

    if-nez v3, :cond_0

    .line 69
    invoke-direct {p0}, Lcom/wujianai/rpk/activity/Main;->doNoRoot()V

    .line 71
    :cond_0
    return-void
.end method
