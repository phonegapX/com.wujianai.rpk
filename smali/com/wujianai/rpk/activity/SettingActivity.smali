.class public Lcom/wujianai/rpk/activity/SettingActivity;
.super Landroid/app/Activity;
.source "SettingActivity.java"

# interfaces
.implements Lcom/wujianai/rpk/view/CheckBoxView$OnCheckedChangeListener;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 14
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/view/View;Z)V
    .locals 2
    .parameter "view"
    .parameter "isChecked"

    .prologue
    .line 27
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.wujianai.rpk.SETTING_CHANGED"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 28
    .local v0, settingChanged:Landroid/content/Intent;
    const-string v1, "notification"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 29
    invoke-virtual {p0, v0}, Lcom/wujianai/rpk/activity/SettingActivity;->sendBroadcast(Landroid/content/Intent;)V

    .line 31
    const-string v1, "notification_status"

    invoke-static {p0, v1, p2}, Lcom/wujianai/rpk/util/RPKUtil;->setBooleanPref(Landroid/content/Context;Ljava/lang/String;Z)V

    .line 32
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 3
    .parameter "savedInstanceState"

    .prologue
    .line 17
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 18
    const v1, 0x7f030001

    invoke-virtual {p0, v1}, Lcom/wujianai/rpk/activity/SettingActivity;->setContentView(I)V

    .line 20
    const/high16 v1, 0x7f07

    invoke-virtual {p0, v1}, Lcom/wujianai/rpk/activity/SettingActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/wujianai/rpk/view/CheckBoxView;

    .line 21
    .local v0, notification:Lcom/wujianai/rpk/view/CheckBoxView;
    const-string v1, "notification_status"

    const/4 v2, 0x1

    invoke-static {p0, v1, v2}, Lcom/wujianai/rpk/util/RPKUtil;->getBooleanPref(Landroid/content/Context;Ljava/lang/String;Z)Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/wujianai/rpk/view/CheckBoxView;->setDefaultChecked(Z)V

    .line 22
    invoke-virtual {v0, p0}, Lcom/wujianai/rpk/view/CheckBoxView;->setOnCheckedChangeListener(Lcom/wujianai/rpk/view/CheckBoxView$OnCheckedChangeListener;)V

    .line 23
    return-void
.end method
