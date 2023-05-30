<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class MainOptionSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('main_options')->insert([
            ['name' => 'Благоустроенный двор'],
            ['name' => 'Отделка под ключ'],
            ['name' => 'Подземный паркинг'],
            ['name' => 'Кирпичный дом'],
            ['name' => 'Вид на реку'],
            ['name' => 'Лес рядом'],
            ['name' => 'Есть акции']
        ]);
    }
}
