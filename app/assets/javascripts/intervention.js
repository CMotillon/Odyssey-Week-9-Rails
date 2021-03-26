$(document).ready(function(){
  $('.hide_select').hide();

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
        $('#battery_show').show();
      }
    });
  });

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
        $('#column_show').show();
      }
    });
  });
  
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
        $('#elevator_show').show();
      }
    });
  });
});