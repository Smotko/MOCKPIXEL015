package com.drapps.ms.driverchap;

import android.app.Application;
import android.content.Context;

/**
 * Created by Diogo on 28/09/2017.
 */

public class DriverChapApplication extends Application {

    private DriverChapService service;


    public DriverChapService getRiotService() {
        if(service == null);
        service = DriverChapService.Factory.create();
        return service;
    }

    public static DriverChapApplication get(Context context) {

        return (DriverChapApplication) context.getApplicationContext();
    }

    @Override
    public void onCreate() {
        super.onCreate();

    }
}
