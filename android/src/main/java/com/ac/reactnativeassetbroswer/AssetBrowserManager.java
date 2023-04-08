package com.ac.reactnativeassetbroswer;

import android.app.Activity;

import androidx.annotation.NonNull;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.ReadableArray;
import com.facebook.react.bridge.ReadableMap;

import java.util.ArrayList;

public class AssetBrowserManager extends ReactContextBaseJavaModule {
   AssetBrowserManager(ReactApplicationContext context) {
       super(context);
   }

  @NonNull
  @Override
  public String getName() {
    return "AssetBrowserManager";
  }


}
