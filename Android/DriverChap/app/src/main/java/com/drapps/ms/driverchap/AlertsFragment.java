package com.drapps.ms.driverchap;

import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import java.util.ArrayList;
import java.util.List;
import java.util.zip.Inflater;

/**
 * Created by Diogo on 29/09/2017.
 */
public class AlertsFragment extends Fragment {

    RecyclerView rvAlerts;
    AlertsAdapter alertsAdapter;
    List<Alerts> alertsList = new ArrayList<>();

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.fragment_alerts,container,false);
        rvAlerts = (RecyclerView) view.findViewById(R.id.alerts_rv);
        RecyclerView.LayoutManager layoutManager = new LinearLayoutManager(getActivity());
        rvAlerts.setLayoutManager(layoutManager);
        alertsList.add(new Alerts("Exceded the speed limit"));
        alertsList.add(new Alerts("Doors Open"));
        alertsList.add(new Alerts("Outside safe zone"));

        alertsAdapter = new AlertsAdapter(alertsList,getContext(),getActivity());
        alertsAdapter.notifyDataSetChanged();
        rvAlerts.setAdapter(alertsAdapter);



        return view;
    }
}
