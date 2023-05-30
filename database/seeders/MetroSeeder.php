<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class MetroSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('metro_stations')->insert([
            ['name' => 'Студенческая'],
            ['name' => 'Спортивная'],
            ['name' => 'Сокол']
        ]);
    }
}
