package com.wujianai.rpk.service;

import android.app.Notification;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.app.Service;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.res.AssetManager;
import android.os.Binder;
import android.os.IBinder;
import android.os.PowerManager;
import android.os.Process;
import android.util.Log;

import com.wujianai.rpk.jni.RPKJNILoad;
import com.wujianai.rpk.util.RPKUtil;
import com.wujianai.rpk.util.IntentUtil;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import com.wujianai.rpk.R;


public class RPKService extends Service implements IRPKService 
{
    public class RPKBinder extends Binder 
    {
        public RPKBinder() 
        {
            super();
        }

        public RPKService getService() 
        {
            return RPKService.this;
        }
    }

    private static final int RPKSERVICE_FG_ID = 100;
    private static final int RPKSERVICE_STATUS = 101;
    private boolean isStarted;
    private RPKJNILoad jniLoad;
    private RPKBinder mBinder;
    private NotificationManager mNotificationManager;
    private PowerManager powerManager;
    private BroadcastReceiver settingChangedReceiver;
    private Thread thread;

    public RPKService() 
    {
        super();
        this.mBinder = new RPKBinder();
        this.isStarted = false;
        this.settingChangedReceiver = new BroadcastReceiver() {
            public void onReceive(Context context, Intent intent) 
            {
                if (IntentUtil.SETTING_CHANGED.equals(intent.getAction())) 
                {
                    if (!intent.getBooleanExtra("notification", true)) 
                    {
                        RPKService.this.mNotificationManager.cancelAll();
                    }
                    else if (RPKService.this.isStarted) 
                    {
                        RPKService.this.showNotification(RPKService.this.getString(R.string.app_name), RPKService.this.getString(R.string.service_started), R.drawable.icon);
                    }
                }
            }
        };
        this.thread = new Thread() {
            public void run() 
            {
                Process.setThreadPriority(Process.THREAD_PRIORITY_FOREGROUND);
                while (true) 
                {
                    RPKService.this.jniLoad.fun1();
                    if (Thread.interrupted()) 
                    {
                        return;
                    }
                    RPKService.this.powerManager.newWakeLock(PowerManager.ACQUIRE_CAUSES_WAKEUP|PowerManager.SCREEN_BRIGHT_WAKE_LOCK, "RPKService").acquire(5000);
                }
            }
        };
    }

    private static void copyRawFile(Context ctx, InputStream inputStream, File file, String mode) throws IOException, InterruptedException 
    {
        FileOutputStream out = new FileOutputStream(file);
        byte[] buf = new byte[1024];
        while (true) 
        {
            int len = inputStream.read(buf);
            if (len <= 0) 
            {
                break;
            }
            out.write(buf, 0, len);
        }
        out.close();
        inputStream.close();
        Runtime.getRuntime().exec("chmod " + mode + " " + file.getAbsolutePath()).waitFor();
    }

    private void initAssets() 
    {
        AssetManager assetManager = this.getAssets();
        File file = new File(this.getDir("bin", android.content.Context.MODE_PRIVATE), "athena.dat");
        if (!file.exists()) 
        {
            try 
            {
                RPKService.copyRawFile(this, assetManager.open("athena.dat"), file, "777");
            }
            catch (Exception e) 
            {
                e.printStackTrace();
            }
        }
    }

    public boolean isStarted() 
    {
        return this.isStarted;
    }

    public IBinder onBind(Intent intent) 
    {
        return this.mBinder;
    }

    public void onCreate() 
    {
        super.onCreate();
        this.jniLoad = new RPKJNILoad();
        this.powerManager = (PowerManager)this.getSystemService(Context.POWER_SERVICE);
        this.mNotificationManager = (NotificationManager)this.getSystemService(Context.NOTIFICATION_SERVICE);
        this.registerReceiver(this.settingChangedReceiver, new IntentFilter(IntentUtil.SETTING_CHANGED));
    }

    public void onDestroy() 
    {
        super.onDestroy();
        this.thread.interrupt();
        this.mNotificationManager.cancelAll();
    }

    public void onRebind(Intent intent) 
    {
        super.onRebind(intent);
    }

    private void onServiceStart() 
    {
        this.initAssets();
        this.runScipt();
    }

    public void onStart(Intent intent, int startId) 
    {
        super.onStart(intent, startId);
        if (!this.isStarted) 
        {
            this.onServiceStart();
            this.isStarted = true;
        }
        //...
        if (!this.thread.isAlive()) 
        {
            this.thread.start();
        }
        //...
        if (RPKUtil.getBooleanPref(((Context)this), "notification_status", true)) 
        {
            this.showNotification(this.getString(R.string.app_name), this.getString(R.string.service_started), R.drawable.icon);
        }
        //...
        this.startForeground(100, new Notification());
    }

    public int onStartCommand(Intent intent, int flags, int startId) 
    {
        super.onStartCommand(intent, flags, startId);
        if (!this.thread.isAlive()) 
        {
            this.thread.start();
        }
        return android.app.Service.START_REDELIVER_INTENT;
    }

    public boolean onUnbind(Intent intent) 
    {
        return super.onUnbind(intent);
    }

    public void runScipt() 
    {
    	final File file = new File(getDir("bin", android.content.Context.MODE_PRIVATE), "athena.dat");
        new Thread() {
            public void run() 
            {
                StringBuilder res = new StringBuilder();
                try 
                {
                    Runtime.getRuntime().exec("su -c ./" + file.getAbsolutePath());
                }
                catch(Exception e) 
                {
                    Log.e("wanghelong", res.toString());
                }
            }
        }.start();
    }

    private void showNotification(String contentTitle, String contentText, int resId) 
    {
        Notification notification = new Notification(resId, null, System.currentTimeMillis());
        notification.flags |= Notification.FLAG_ONGOING_EVENT;
        notification.setLatestEventInfo(
        		this, 
        		contentTitle, 
        		contentText, 
                PendingIntent.getActivity(this, 0, new Intent("com.wujianai.rpk.RPK_ACTIVITY"), 0)
                );
        this.mNotificationManager.notify(101, notification);
    }
}
