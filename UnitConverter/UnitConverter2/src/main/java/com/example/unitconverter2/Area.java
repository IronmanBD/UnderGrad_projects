package com.example.unitconverter2;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.Spinner;
import android.widget.TextView;

public class Area extends AppCompatActivity {
    TextView text1;
    String   textbox="";
    Spinner spinner;
    ArrayAdapter<CharSequence> adapter;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_area);
        text1=(TextView) findViewById(R.id.valuefrom);
        spinner=(Spinner) findViewById(R.id.Spinner1);
        adapter=ArrayAdapter.createFromResource(this,R.array.spinner_fromofarea,android.R.layout.simple_spinner_item);
        adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        spinner.setAdapter(adapter);
        spinner=(Spinner) findViewById(R.id.Spinner2);
        adapter=ArrayAdapter.createFromResource(this,R.array.spinner_fromofarea,android.R.layout.simple_spinner_item);
        adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        spinner.setAdapter(adapter);
    }
    public void updateTextbox()
    {
        text1.setText(textbox);
    }
    public void onClickNum(View v)
    {
        Button btn=(Button) v;
        textbox += btn.getText();
        updateTextbox();
    }
    public void onClickClear(View V)
    {
        Clear();
        updateTextbox();
    }
    public void Clear()
    {
        textbox="";
        updateTextbox();
    }
}
