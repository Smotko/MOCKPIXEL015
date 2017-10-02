package com.drapps.ms.driverchap;

import android.graphics.Color;
import android.support.v4.view.ViewPager;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.support.v7.widget.Toolbar;
import android.view.View;
import android.widget.Adapter;

import com.aurelhubert.ahbottomnavigation.AHBottomNavigation;
import com.aurelhubert.ahbottomnavigation.AHBottomNavigationItem;

public class MainActivity extends AppCompatActivity {

    AHBottomNavigation bottomNavigation;
    Toolbar toolbar;
    ViewPager viewpager;
    TabsAdapter adapter;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        bottomNavigation = (AHBottomNavigation) findViewById(R.id.bottom_navigation);
        toolbar = (Toolbar) findViewById(R.id.toolbar);
        viewpager = (ViewPager) findViewById(R.id.viewpager);

        setSupportActionBar(toolbar);
        if(getSupportActionBar() != null) {
            getSupportActionBar().setTitle("DriverChap");

        }

        setViewPager();
        setUpBottomNavigation();
    }

    private void setViewPager() {
        adapter = new TabsAdapter(getSupportFragmentManager());
        adapter.addFragment(new CarFragment(), "");
        adapter.addFragment(new AlertsFragment(), "");
        viewpager.setAdapter(adapter);
        viewpager.addOnPageChangeListener(new ViewPager.OnPageChangeListener() {
            @Override
            public void onPageScrolled(int position, float positionOffset, int positionOffsetPixels) {

            }

            @Override
            public void onPageSelected(int position) {
                bottomNavigation.setCurrentItem(position);
            }

            @Override
            public void onPageScrollStateChanged(int state) {

            }
        });
    }


    private void setUpBottomNavigation() {

        AHBottomNavigationItem item1 = new AHBottomNavigationItem("Car",R.drawable.ic_directions_car_white_24dp,R.color.whitee);
        AHBottomNavigationItem item2 = new AHBottomNavigationItem("Alerts",R.drawable.ic_list_white_24dp ,R.color.whitee);

// Add items
        bottomNavigation.addItem(item1);
        bottomNavigation.addItem(item2);

        bottomNavigation.setAccentColor(Color.parseColor("#FFFFFF"));
        bottomNavigation.setInactiveColor(Color.parseColor("#FFFFFF"));
        bottomNavigation.setDefaultBackgroundColor(Color.parseColor("#273E47"));

        bottomNavigation.setOnTabSelectedListener(new AHBottomNavigation.OnTabSelectedListener() {
            @Override
            public boolean onTabSelected(int position, boolean wasSelected) {
                viewpager.setCurrentItem(position);
                return true;
            }
        });
    }
}
