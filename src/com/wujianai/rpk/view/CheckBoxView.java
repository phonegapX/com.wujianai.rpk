package com.wujianai.rpk.view;

import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import android.widget.ImageView;
import android.widget.RelativeLayout;

import com.wujianai.rpk.R;


public class CheckBoxView extends RelativeLayout 
{
    public interface OnCheckedChangeListener 
    {
        void onCheckedChanged(View view, boolean isChecked);
    }

    private View.OnClickListener clickListener;
    private int mAnimationOffset;
    private boolean mChecked;
    private boolean mNoBroadcast;
    private OnCheckedChangeListener mOnCheckedChangeListener;

    public CheckBoxView(Context context) 
    {
        super(context);
        this.mNoBroadcast = false;
        this.clickListener = new View.OnClickListener() {
            public void onClick(View v) 
            {
                boolean isChecked = CheckBoxView.this.mChecked ? false : true;	//取反
                CheckBoxView.this.mChecked = isChecked;
                CheckBoxView.this.updateView();
            }
        };
        this.initView(context);
    }

    public CheckBoxView(Context context, AttributeSet attrs) 
    {
        super(context, attrs);
        this.mNoBroadcast = false;
        this.clickListener = new View.OnClickListener() {
            public void onClick(View v) 
            {
                boolean isChecked = CheckBoxView.this.mChecked ? false : true;	//取反
                CheckBoxView.this.mChecked = isChecked;
                CheckBoxView.this.updateView();
            }
        };
        this.initView(context);
    }

    public CheckBoxView(Context context, AttributeSet attrs, int defStyle) 
    {
        super(context, attrs, defStyle);
        this.mNoBroadcast = false;
        this.clickListener = new View.OnClickListener() {
            public void onClick(View v) 
            {
                boolean isChecked = CheckBoxView.this.mChecked ? false : true;	//取反
                CheckBoxView.this.mChecked = isChecked;
                CheckBoxView.this.updateView();
            }
        };
        this.initView(context);
    }

    private void initView(Context context) 
    {
        ImageView imageView = new ImageView(context);
        imageView.setImageResource(R.drawable.checkbox_swich);
        this.addView(imageView);
        this.mChecked = false;
        this.mAnimationOffset = 5;
        this.setGravity(this.mAnimationOffset);
        this.setBackgroundResource(R.drawable.checkbox_bg);
        this.setOnClickListener(this.clickListener);
    }

    public boolean isChecked() 
    {
        return this.mChecked;
    }

    public void setChecked(boolean checked) 
    {
        this.mChecked = checked;
        this.updateView();
    }

    public void setDefaultChecked(boolean checked) 
    {
        this.mChecked = checked;
        this.mNoBroadcast = true;
        this.updateView();
        this.mNoBroadcast = false;
    }

    public void setOnCheckedChangeListener(OnCheckedChangeListener listener) 
    {
        this.mOnCheckedChangeListener = listener;
    }

    private void updateView() 
    {
        if (this.mChecked) 
        {
            this.mAnimationOffset = 3;
            this.setGravity(this.mAnimationOffset);
        }
        else 
        {
            this.mAnimationOffset = 5;
            this.setGravity(this.mAnimationOffset);
        }
        //...
        if (!this.mNoBroadcast && this.mOnCheckedChangeListener != null) 
        {
            this.mOnCheckedChangeListener.onCheckedChanged(this, this.mChecked);
        }
    }
}
