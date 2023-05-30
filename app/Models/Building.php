<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Building extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'desciption',
        'address',
        'deadline',
        'building_class',
        'percentage'
    ];

    public function metros()
    {
        return $this->belongsToMany(Metro::class, 'building_metro', 'building_id', 'metro_id')
            ->withPivot('minutes_to_station');
    }

    public function nearestMetro()
    {
        return $this->belongsToMany(MetroStation::class, 'building_metro', 'building_id', 'metro_id')
            ->withPivot('minutes_to_station')
            ->orderBy('minutes_to_station', 'asc')
            ->limit(1);
    }

    public function mainOptions()
    {
        return $this->belongsToMany(MainOption::class, 'building_main_options', 'building_id', 'option_id');
    }
}
