

$(function() {

  var $select = $('select');


  function addCities(element, index, array) {

    var groupFound = false,
        allGroups = $select.find('optgroup'),
        $group = {};

    if (allGroups.length > 0) {
      allGroups.each( function(index) {
        if ($(this).attr('label') === element.country) {
          groupFound = true;
          $group = $(this);
        }
      });
    }

    if (!groupFound) {
      $group = $('<optgroup label="' + element.country + '">');
      $select.append($group);
    }
    
    $group.append('<option value="' + element.city + '">' + element.city + '</option>');
  }


  $.getJSON( "cities.json", function( data ) {
    data.forEach(addCities);
  });
});
