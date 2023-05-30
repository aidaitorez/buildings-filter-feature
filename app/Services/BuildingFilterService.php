<?php

namespace App\Services;

use App\Models\Building;
use Carbon\Carbon;

class BuildingFilterService
{
    public function filterByMetroStations($query, $minutesToStation)
    {
        if (count($minutesToStation) > 0) {
            return $query->where(function ($query) use ($minutesToStation) {
                foreach ($minutesToStation as $minute) {
                    $query->orWhereHas('metros', function ($q) use ($minute) {
                        $q->where('minutes_to_station', '>=', $minute[0]);
                        if ($minute[1]) {
                            $q->where('minutes_to_station', '<=', $minute[1]);
                        }
                    });
                }
            });
        }
        return $query;
    }
    public function filterByDeadline($query, $deadline)
    {
        if ($deadline !== 'all') {
            return $query->where(function ($q) use ($deadline) {
                if ($deadline === 'passed') {
                    $q->whereDate('deadline', '<', Carbon::today());
                } elseif ($deadline === 'this-year') {
                    $q->whereBetween('deadline', [Carbon::today(), Carbon::today()->endOfYear()]);
                } elseif ($deadline === 'next-year') {
                    $q->whereBetween('deadline', [Carbon::today()->addYear(), Carbon::today()->addYear()->endOfYear()]);
                }
            });
        }

        return $query;
    }

    public function filterByBuildingClass($query, $buildingClasses)
    {
        if ($buildingClasses) {
            return $query->whereIn('building_class', $buildingClasses);
        }

        return $query;
    }

    public function filterBySelectedOptions($query, $selectedOptions)
    {
        if ($selectedOptions) {
            return $query->whereHas('mainOptions', function ($query) use ($selectedOptions) {
                $query->whereIn('option_id', $selectedOptions);
            });
        }

        return $query;
    }

    public function filterByService($query, $service)
    {
        if ($service) {
            if ($service == 'on') {
                return $query->where('percentage', 0)->orWhereNull('percentage');
            } else {
                return $query->where('percentage', '>', 0);
            }
        }

        return $query;
    }

    public function applyFilters($query, $filters)
    {
        $query = $this->filterByMetroStations($query, $filters['metro']);
        $query = $this->filterByDeadline($query, $filters['deadline']);
        $query = $this->filterByBuildingClass($query, $filters['building_class']);
        $query = $this->filterBySelectedOptions($query, $filters['main_options']);
        $query = $this->filterByService($query, $filters['service']);
        return $query;
    }
}
