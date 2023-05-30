<?php

namespace Database\Seeders;

use App\Models\Building;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class BuildingSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        for ($i = 0; $i < 20; $i++) {
            Building::create([
                'name' => 'ЖК-' . $i,
                'address' => fake()->streetAddress(),
                'description' => fake()->paragraph(2),
                'deadline' => fake()->dateTimeBetween('-1 year', '+2 year')->format('Y-m-d'),
                'building_class' => fake()->randomElement(['Эконом', 'Комфорт', 'Бизнес', 'Элит']),
                'percentage' => fake()->numberBetween(0, 15)
            ]);
        }
    }
}
