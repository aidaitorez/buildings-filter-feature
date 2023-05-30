@foreach ($buildings as $building)
<li class="page-loop__item wow animate__animated animate__fadeInUp" data-wow-duration="0.8s">

    <a href="#" class="favorites-link favorites-link__add" title="Добавить в Избранное" role="button">
        <span class="icon-heart"><span class="path1"></span><span class="path2"></span></span>
    </a>

    <a href="#" class="page-loop__item-link">

        <div class="page-loop__item-image">

            <img src="img/building.jpg" alt="">

            <div class="page-loop__item-badges">
                <span class="badge">Услуги {{$building->percentage}}%</span>
                <span class="badge">{{$building->building_class}}</span>
            </div>

        </div>

        <div class="page-loop__item-info">

            <h3 class="page-title-h3">{{$building->name}}</h3>

            <p class="page-text">Срок сдачи {{$building->deadline}}</p>
            @if($building->nearestMetro()->first())
            <div class="page-text to-metro">
                <span class="icon-metro icon-metro--red"></span>
                <span class="page-text">{{$building->nearestMetro()->first()->name}} <span> {{$building->nearestMetro()->first()->pivot->minutes_to_station}} мин.</span></span>
                <span class="icon-walk-icon"></span>
            </div>
            @endif

            <span class="page-text text-desc">{{$building->address}}</span>

        </div>

    </a>

</li>
@endforeach