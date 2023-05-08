package root.example.com;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;

import  android.app.Activity;
import android.view.Menu;
import android.view.View;
import android.widget.*;

public class MainActivity extends AppCompatActivity {
    TextView tvInfo;
    EditText etInput;
    Button bControl;

    int guess;
    boolean gameFinished;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        tvInfo = (TextView) findViewById(R.id.textView3);
        etInput = (EditText) findViewById(R.id.editTextNumber);
        bControl = (Button) findViewById(R.id.button);

        guess = (int) (Math.random() * 100);
        gameFinished = false;
    }

    public void onExitButtonClick(View view) {
        finish();
    }
    public void onClick(View v) {
        if (!gameFinished) {
            try {
                int inp = Integer.parseInt(etInput.getText().toString());
                if (inp > 100 || inp < 0) {
                    tvInfo.setText(getResources().getString(R.string.error_3));
                } else if (inp > guess) {
                    tvInfo.setText(getResources().getString(R.string.ahead));
                } else if (inp < guess) {
                    tvInfo.setText(getResources().getString(R.string.behind));
                } else {
                    tvInfo.setText(getResources().getString(R.string.hit));
                    bControl.setText(getResources().getString(R.string.play_more));
                    gameFinished = true;
                }
            } catch (NumberFormatException e) {
                tvInfo.setText(getResources().getString(R.string.error_2));
            }
        } else {
            guess = (int) (Math.random() * 100);
            bControl.setText(getResources().getString(R.string.input_value));
            tvInfo.setText(getResources().getString(R.string.try_to_guess));
            gameFinished = false;
        }
        etInput.setText("");
    }
}