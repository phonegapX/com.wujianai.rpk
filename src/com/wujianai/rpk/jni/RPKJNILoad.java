package com.wujianai.rpk.jni;

import android.util.Log;


public class RPKJNILoad 
{
    static 
    {
        try 
        {
            System.loadLibrary("rpkjni");
        }
        catch (UnsatisfiedLinkError e) 
        {
            Log.e("wanghelong", "Could not load native library jni_latinime");
        }
    }

    public RPKJNILoad() 
    {
        super();
    }

    public native void fun1();

    public native void fun2();
}
