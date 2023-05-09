package root.example.multiscreenmainactivity;

import android.app.ListActivity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.ListView;
import android.widget.Toast;

public class MainActivity extends ListActivity {

    private ArrayAdapter<String> adapter;
    String[] islands = {"Канары", "Курилы", "Мальдивы", "Филиппины"};

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        // Создание ArrayAdapter и привязка его к списку ListView
        adapter = new ArrayAdapter<>(this, android.R.layout.simple_list_item_1, islands);
        setListAdapter(adapter);

        // Получение ListView и добавление обработчика событий клика на элемент списка
        ListView listView = getListView();
        listView.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                // Создание намерения для перехода на соответствующий экран в зависимости от выбранного элемента списка
                Intent intent;
                switch (position) {
                    case 0:
                        intent = new Intent(MainActivity.this, Canari.class);
                        startActivity(intent);
                        break;
                    case 1:
                        intent = new Intent(MainActivity.this, Curili.class);
                        startActivity(intent);
                        break;
                    case 2:
                        intent = new Intent(MainActivity.this, Maldivi.class);
                        startActivity(intent);
                        break;
                    case 3:
                        intent = new Intent(MainActivity.this, Philippini.class);
                        startActivity(intent);
                        break;
                }
                Toast.makeText(getApplicationContext(), "Вы выбрали " + parent.getItemAtPosition(position).toString(),
                        Toast.LENGTH_SHORT).show();
            }
        });
    }
}
