.class public Lcom/wujianai/rpk/jni/RPKJNILoad;
.super Ljava/lang/Object;
.source "RPKJNILoad.java"


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 8
    :try_start_0
    const-string v1, "rpkjni"

    invoke-static {v1}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_0 .. :try_end_0} :catch_0

    .line 5
    :goto_0
    return-void

    .line 9
    :catch_0
    move-exception v1

    move-object v0, v1

    .line 10
    .local v0, ule:Ljava/lang/UnsatisfiedLinkError;
    const-string v1, "wanghelong"

    const-string v2, "Could not load native library jni_latinime"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public native fun1()V
.end method

.method public native fun2()V
.end method
