package com.wujianai.rpk.util;

import android.content.Context;
import android.content.SharedPreferences;


public class RPKUtil 
{
    public static final String BOOTAUTO_STATUS = "bootauto_status";
    public static final String NOTIFICATION_STATUS = "notification_status";

    public RPKUtil() 
    {
        super();
    }

    public static boolean getBooleanPref(Context context, String name, boolean def) 
    {
        return context.getSharedPreferences(context.getPackageName(), android.content.Context.MODE_PRIVATE).getBoolean(name, def);
    }

    public static void setBooleanPref(Context context, String name, boolean value) 
    {
        SharedPreferences.Editor ed = context.getSharedPreferences(context.getPackageName(), android.content.Context.MODE_PRIVATE).edit();
        ed.putBoolean(name, value);
        ed.commit();
    }
}
