package com.wujianai.rpk.activity;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.ComponentName;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.ServiceConnection;
import android.os.Bundle;
import android.os.IBinder;
import android.view.View;

import com.wujianai.rpk.service.IRPKService;
import com.wujianai.rpk.service.RPKService;
import com.wujianai.rpk.util.RPKUtil;
import com.wujianai.rpk.view.CheckBoxView;

import java.io.IOException;
import java.io.InputStreamReader;

import com.wujianai.rpk.R;


public class Main extends Activity implements View.OnClickListener, CheckBoxView.OnCheckedChangeListener 
{
    private IRPKService mService;
    private CheckBoxView scCheckBox;
    private ServiceConnection serviceConnection;
    private Intent serviceIntent;

    public Main() 
    {
        super();
        this.serviceConnection = new ServiceConnection() {
            public void onServiceConnected(ComponentName name, IBinder service) 
            {
                Main.this.mService = ((RPKService.RPKBinder)service).getService();
                Main.this.scCheckBox.setDefaultChecked(Main.this.mService.isStarted());
            }

            public void onServiceDisconnected(ComponentName name) 
            {
                Main.this.mService = null;
            }
        };
    }

    private void doNoRoot() 
    {
        new AlertDialog.Builder(this).setTitle(this.getString(R.string.no_root)).setPositiveButton("È·¶¨", new DialogInterface.OnClickListener() {
            public void onClick(DialogInterface dialog, int which) 
            {
                Main.this.finish();
            }
        }).show();
    }

    private boolean hasRoot() 
    {
        char[] buf = new char[1024];
        try 
        {
            if (new InputStreamReader(Runtime.getRuntime().exec("su -c ls").getErrorStream()).read(buf) != -1) 
            {
                return false;
            }
        }
        catch (IOException e) 
        {
            return false;
        }
        return true;
    }

    public void onCheckedChanged(View view, boolean isChecked) 
    {
        switch (view.getId()) 
        {
            case R.id.service_control: 
            {
                if (isChecked) 
                {
                    this.startService();
                }
                else
                {
                	this.stopService();
                }
                break;
            }
            case R.id.bootauto_control: 
            {
                RPKUtil.setBooleanPref(this, "bootauto_status", isChecked);
                break;
            }
        }
    }

    public void onClick(View v) 
    {
        switch (v.getId()) 
        {
            case R.id.setting: 
            {
                Intent settingIntent = new Intent(this, SettingActivity.class);
                settingIntent.setFlags(android.content.Intent.FLAG_ACTIVITY_NEW_TASK);
                this.startActivity(settingIntent);
                break;
            }
            case R.id.about: 
            {
                Intent aboutIntent = new Intent(this, AboutActivity.class);
                aboutIntent.setFlags(android.content.Intent.FLAG_ACTIVITY_NEW_TASK);
                this.startActivity(aboutIntent);
                break;
            }
        }
    }

    public void onCreate(Bundle savedInstanceState) 
    {
        super.onCreate(savedInstanceState);
        this.setContentView(R.layout.main);
        this.serviceIntent = new Intent(this, RPKService.class);
        this.scCheckBox = (CheckBoxView)this.findViewById(R.id.service_control);
        this.scCheckBox.setOnCheckedChangeListener(this);
        CheckBoxView baCheckBox = (CheckBoxView)this.findViewById(R.id.bootauto_control);
        baCheckBox.setChecked(RPKUtil.getBooleanPref(this, "bootauto_status", false));
        baCheckBox.setOnCheckedChangeListener(this);
        this.findViewById(R.id.about).setOnClickListener(this);
        this.findViewById(R.id.setting).setOnClickListener(this);
        this.bindService(this.serviceIntent, this.serviceConnection, android.content.Context.BIND_AUTO_CREATE);
        if (!this.hasRoot()) 
        {
            this.doNoRoot();
        }
    }

    private void startService() 
    {
        this.startService(this.serviceIntent);
        this.bindService(this.serviceIntent, this.serviceConnection, android.content.Context.BIND_AUTO_CREATE);
    }

    private void stopService() 
    {
        this.stopService(this.serviceIntent);
        this.unbindService(this.serviceConnection);
    }
}
