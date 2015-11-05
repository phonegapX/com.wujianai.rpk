package com.wujianai.rpk.activity;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;

import com.wujianai.rpk.util.RPKUtil;
import com.wujianai.rpk.view.CheckBoxView;
import com.wujianai.rpk.util.IntentUtil;
import com.wujianai.rpk.R;


public class SettingActivity extends Activity implements CheckBoxView.OnCheckedChangeListener 
{
    public SettingActivity() 
    {
        super();
    }

    public void onCheckedChanged(View view, boolean isChecked) 
    {
        Intent settingChanged = new Intent(IntentUtil.SETTING_CHANGED);
        settingChanged.putExtra("notification", isChecked);
        this.sendBroadcast(settingChanged);
        RPKUtil.setBooleanPref(this, "notification_status", isChecked);
    }

    public void onCreate(Bundle savedInstanceState) 
    {
        super.onCreate(savedInstanceState);
        this.setContentView(R.layout.layout_setting);
        CheckBoxView notification = (CheckBoxView)this.findViewById(R.id.notification_control);
        notification.setDefaultChecked(RPKUtil.getBooleanPref(this, "notification_status", true));
        notification.setOnCheckedChangeListener(this);
    }
}
