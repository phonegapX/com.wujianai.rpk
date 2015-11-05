package com.wujianai.rpk.activity;

import android.app.Activity;
import android.os.Bundle;

import com.wujianai.rpk.R;


public class AboutActivity extends Activity 
{
    public AboutActivity() 
    {
        super();
    }

    public void onCreate(Bundle savedInstanceState) 
    {
        super.onCreate(savedInstanceState);
        this.setContentView(R.layout.layout_about);
    }
}
