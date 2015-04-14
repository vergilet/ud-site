// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.turbolinks
//= require turbolinks
//= require_directory ./bootstrap
//= require_directory ./material

$(document).ready(function(){
    $.material.init();
    $("[data-toggle='tooltip']").tooltip();
    initHelperForTagInput();
})


function removeFields(link) {
    $(link).closest(".field").find("input[type=hidden]").val("1");
    $(link).closest(".field").hide();
}

function addFields(link, association, content) {
    var new_id = new Date().getTime();
    var regexp = new RegExp("new_" + association, "g")
    $('.fields').append(content.replace(regexp, new_id));
}

function initHelperForTagInput() {
    $('.bootstrap-tagsinput input').on('focus', function () {
        $(this).parent('div').addClass('focused')
    }).on('blur', function () {
        $(this).parent('div').removeClass('focused')
    });
}