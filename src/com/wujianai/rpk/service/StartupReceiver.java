package com.wujianai.rpk.service;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;

import com.wujianai.rpk.util.RPKUtil;


public class StartupReceiver extends BroadcastReceiver 
{
    public StartupReceiver() 
    {
        super();
    }

    public void onReceive(Context context, Intent intent) 
    {
        if (RPKUtil.getBooleanPref(context, "bootauto_status", false)) 
        {
            context.startService(new Intent(context, RPKService.class));
        }
    }
}
