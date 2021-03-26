$(document).ready(function(){
  $('.hide_select').hide();

  // Requests new buildings every time the customer_id field changes
  $("#customer_list").change(function(){
    $('.hide_select').hide();

    var customer_id = $(this).val();
    $.ajax({
      url: "building_select",
      method: "POST",
      dataType: "json",
      data: {
        customer_id: customer_id,
      },
      success: function (response) {
        var buildings = response["buildings"];
        $("#building_list").empty().append('<option>Select</option>');
        for(var i=0; i < buildings.length; i++){
          $("#building_list").append('<option value="' + buildings[i]["id"] + '">' + buildings[i]["id"] + ' - ' + buildings[i]["address_building"] + '</option>');
        }
        $('#building_show').show();
      }
    });
  });

  // Requests new batteries every time the building_id field changes
  $("#building_list").change(function(){
    $('#battery_show').hide();
    $('#column_show').hide();
    $('#elevator_show').hide();
    
    var building_id = $(this).val();
    $.ajax({
      url: "battery_select",
      method: "POST",
      dataType: "json",
      data: {
        building_id: building_id,
      },
      success: function (response) {
        var batteries = response["batteries"];
        $("#battery_list").empty().append('<option>Select</option>');
        for(var i=0; i < batteries.length; i++){
          $("#battery_list").append('<option value="' + batteries[i]["id"] + '">' + batteries[i]["id"] + '</option>');
        }

        if (building_id == "Select") {
          $('#battery_show').hide();
        } else {
          $('#battery_show').show();
        }
      }
    });
  });

  // Requests new columns every time the battery_id field changes
  $("#battery_list").change(function(){
    $('#column_show').hide();
    $('#elevator_show').hide();

    var battery_id = $(this).val();
    $.ajax({
      url: "column_select",
      method: "POST",
      dataType: "json",
      data: {
        battery_id: battery_id,
      },
      success: function (response) {
        var columns = response["columns"];
        $("#column_list").empty().append('<option>Select</option>');
        for(var i=0; i < columns.length; i++){
          $("#column_list").append('<option value="' + columns[i]["id"] + '">' + columns[i]["id"] + '</option>');
        }

        if (battery_id == "Select") {
          $('#column_show').hide();
        } else {
          $('#column_show').show();
        }
      }
    });
  });
  
  // Requests new elevators every time the column_id field changes
  $("#column_list").change(function(){
    $('#elevator_show').hide();
    
    var column_id = $(this).val();
    $.ajax({
      url: "elevator_select",
      method: "POST",
      dataType: "json",
      data: {
        column_id: column_id,
      },
      success: function (response) {
        var elevators = response["elevators"];
        $("#elevator_list").empty().append('<option>Select</option>');
        for(var i=0; i < elevators.length; i++){
          $("#elevator_list").append('<option value="' + elevators[i]["id"] + '">' + elevators[i]["id"] + '</option>');
        }

        if (column_id == "Select") {
          $('#elevator_show').hide();
        } else {
          $('#elevator_show').show();
        }
      }
    });
  });
});