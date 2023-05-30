<?php

namespace App\Repositories;

use App\Models\Building;

class BuildingRepository
{

    protected $model;

    public function __construct(Building $model)
    {
        $this->model = $model;
    }

    public function getById($id)
    {
        return $this->model->findOrFail($id);
    }

    public function getAll()
    {
        return $this->model->paginate(6);
    }
}
