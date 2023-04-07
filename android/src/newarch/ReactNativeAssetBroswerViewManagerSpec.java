package com.ac.reactnativeassetbroswer;

import android.view.View;

import androidx.annotation.Nullable;

import com.facebook.react.uimanager.SimpleViewManager;
import com.facebook.react.uimanager.ViewManagerDelegate;
import com.facebook.react.viewmanagers.ReactNativeAssetBroswerViewManagerDelegate;
import com.facebook.react.viewmanagers.ReactNativeAssetBroswerViewManagerInterface;
import com.facebook.soloader.SoLoader;

public abstract class ReactNativeAssetBroswerViewManagerSpec<T extends View> extends SimpleViewManager<T> implements ReactNativeAssetBroswerViewManagerInterface<T> {
  static {
    if (BuildConfig.CODEGEN_MODULE_REGISTRATION != null) {
      SoLoader.loadLibrary(BuildConfig.CODEGEN_MODULE_REGISTRATION);
    }
  }

  private final ViewManagerDelegate<T> mDelegate;

  public ReactNativeAssetBroswerViewManagerSpec() {
    mDelegate = new ReactNativeAssetBroswerViewManagerDelegate(this);
  }

  @Nullable
  @Override
  protected ViewManagerDelegate<T> getDelegate() {
    return mDelegate;
  }
}
