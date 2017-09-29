package com.drapps.ms.driverchap;

import okhttp3.OkHttpClient;
import okhttp3.logging.HttpLoggingInterceptor;
import retrofit2.Retrofit;
import retrofit2.adapter.rxjava.RxJavaCallAdapterFactory;
import retrofit2.converter.gson.GsonConverterFactory;

/**
 * Created by Diogo on 28/09/2017.
 */
public interface DriverChapService{

    //Add localhost url??
    String mUrl = "";




    class Factory {

        private static Retrofit retrofit;

        public static DriverChapService create() {

            //TODO: in prod, remove this
            // Beautiful login interceptor to debug what is being RESTly sent
            HttpLoggingInterceptor logging = new HttpLoggingInterceptor();
            logging.setLevel(HttpLoggingInterceptor.Level.BODY);
            OkHttpClient.Builder httpClient = new OkHttpClient.Builder();
            httpClient.addInterceptor(logging);

            retrofit = new Retrofit.Builder()
                    .baseUrl(mUrl)
                    .client(httpClient.build())
                    .addConverterFactory(GsonConverterFactory.create())
                    .addCallAdapterFactory(RxJavaCallAdapterFactory.create())
                    .build();

            return retrofit.create(DriverChapService.class);
        }

        public static Retrofit getRetrofit() {
            return Factory.retrofit;
        }
    }
}
