@extends('layouts.main')

@section('content')
    
<div class="page-content">

    <h1 class="visuallyhidden">Новостройки</h1>

    <div class="page-loop__wrapper loop tab-content tab-content__active">

        <ul class="page-loop with-filter" id="post-data">

        @include('buildings.data')

        </ul>

            <div class="show-more">

                <button id="more" class="show-more__button">

                    <span class="show-more__button-icon"></span>

                    Показать еще

                </button>

            </div>

    </div>

    <div class="page-map tab-content map">

        <h1>Тут будет карта</h1>

    </div>

</div>

<div class="page-filter fixed">

    <div class="page-filter__wrapper">
        @include('buildings.filter')
    </div>

</div>

@endsection

@push('script')
<script type="text/javascript">
	var page = 1;
	$('#more').click(function() {
	        page++;
	        loadMoreData(page);
	    });

	function loadMoreData(page){
	  $.ajax(
	        {
	            url: '?page=' + page,
	            type: "get",
	            // beforeSend: function()
	            // {
	            //     $('.ajax-load').show();
	            // }
	        })
	        .done(function(data)
	        {
	            if(!data.html){
	                $('.show-more').hide();
	                return;
	            }
	            $('.ajax-load').hide();
	            $("#post-data").append(data.html);
	        })
	        .fail(function(jqXHR, ajaxOptions, thrownError)
	        {
	              alert('сервер не отвечает...');
	        });
	}

const form = document.getElementById('page-filter'); // get the form element
const url = '/filter'; // replace with your API endpoint URL

function submitForm(data) {
  // add the CSRF token to the form data
  const csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
  data['_token'] = csrfToken;
  // send data to the server
  fetch(url, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify(data)
  })
  .then(response => response.json()) // parse response as JSON
  .then(result => {
    // handle response
    console.log(result);
    $("#post-data").html(result.data);
  })
  .catch(error => {
    // handle error
    console.error(error);
  });
}

form.addEventListener('submit', (e) => {
  e.preventDefault(); // prevent form submission

  // get form data as an object
  const formData = new FormData(form);
  const data = {};
  for (const [key, value] of formData.entries()) {
    if (key === 'deadline' || key === 'service') {
      data[key] = value; // send deadline as string instead of an array
    } else if (data.hasOwnProperty(key)) {
      data[key].push(value);
    } else {
      data[key] = [value];
    }
  }

  submitForm(data);
});

const resetBtn = document.querySelector('#reset_filter');

// Add a click event listener to the reset button
resetBtn.addEventListener('click', function(event) {


// Reset the form
  form.reset();
  const formData = new FormData(form);
  const data = {};
  for (const [key, value] of formData.entries()) {
    if (key === 'deadline' || key === 'service') {
      data[key] = value; // send deadline as string instead of an array
    } else if (data.hasOwnProperty(key)) {
      data[key].push(value);
    } else {
      data[key] = [value];
    }
  }
  // Submit the form
  submitForm(data);
});
</script>
@endpush