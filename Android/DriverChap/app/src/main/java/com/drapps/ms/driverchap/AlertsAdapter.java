package com.drapps.ms.driverchap;

import android.app.Activity;
import android.content.Context;
import android.support.v4.content.ContextCompat;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Diogo on 29/09/2017.
 */
public class AlertsAdapter extends  RecyclerView.Adapter<AlertsAdapter.ViewHolder> {

    List<Alerts> alertsList = new ArrayList<>();

    public AlertsAdapter(List<Alerts> alertsList, Context context, Activity act){
        this.alertsList = alertsList;
    }

    @Override
    public AlertsAdapter.ViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        View itemView = LayoutInflater.from(parent.getContext()).inflate(R.layout.alerts_list_row, parent, false);

        return new ViewHolder(itemView);
    }

    @Override
    public void onBindViewHolder(AlertsAdapter.ViewHolder holder, int position) {
        holder.title.setText(alertsList.get(position).getTitle());
    }

    @Override
    public int getItemCount() {
        return alertsList.size();
    }

    public class ViewHolder extends RecyclerView.ViewHolder{
        TextView title;

        public ViewHolder(View itemView) {
            super(itemView);
            title = (TextView) itemView.findViewById(R.id.alert_title);
        }
    }
}
