<?php

namespace App\Http\Controllers;

use App\Models\Building;
use App\Repositories\BuildingRepository;
use App\Services\BuildingFilterService;
use Illuminate\Http\Request;

class BuildingController extends Controller
{

    private $buildingRepository;

    public function __construct(BuildingRepository $buildingRepository)
    {
        $this->buildingRepository = $buildingRepository;
    }

    public function index(Request $request)
    {
        $buildings = $this->buildingRepository->getAll();
        if ($request->ajax()) {
            $view = view('buildings.data', compact('buildings'))->render();
            return response()->json(['html' => $view]);
        }

        return view('buildings.index', compact('buildings'));
    }

    public function filter(Request $request, BuildingFilterService $buildingFilter)
    {
        $filters = [
            'metro' => $request->input('metro'),
            'deadline' => $request->input('deadline'),
            'building_class' => $request->input('building_class'),
            'main_options' => $request->input('main_options'),
            'service' => $request->input('service')
        ];

        $query = Building::query();
        // Apply filters using the BuildingFilterService
        $buildings = $buildingFilter->applyFilters($query, $filters);

        // Paginate the results and return the response
        $buildings = $buildings->paginate(6);

        // Render and return JSON response
        $view = view('buildings.data', compact('buildings'))->render();
        return response()->json(['data' => $view]);
    }
}
