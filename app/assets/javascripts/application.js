// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery

//= require rails-ujs
//= require activestorage
//= require turbolinks

//= require bootstrap-sprockets
//= require cocoon
//= require datatables
//= require_tree .
document.addEventListener("turbolinks:load", function() {
    var cust_id
    
    $(document).ready(function() {
        var table = $('#customers-datatable').DataTable();
        
        $('#customers-datatable tbody').on( 'click', 'tr', function () {
          var rowData = table.row( this ).data();
          cust_id = rowData.id
        })
    })

    $('#teklif').click(function() {
           if(cust_id) {
            $.ajax({
                url : "/proposal/new",
                type : "get",
                data : { data_value: cust_id},
            }).done(function (data) {
                window.location.replace(this.url)     
            })
        }
    })   
    $('#siparis').click(function() {
           if(cust_id) {
            $.ajax({
                url : "/order/new",
                type : "get",
                data : { data_value: cust_id},
            }).done(function (data) {
                window.location.replace(this.url)     
            })
        }
    }) 
    $('item-id').hover(function() {
            
        console.log("adsas")
    }) 

     
})

 
