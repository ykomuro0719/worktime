$(document).on('change', '#work_child1task_id', function get_child2() {
    $.ajax({
        type: 'GET',
        url: '/works/getchild2',
        data: {
            child1task_id: $(this).has('option:selected').val()
        }
    });
});

$(document).on('change', '#work_task_id', function get_request() {
    $.ajax({
        type: 'GET',
        url: '/works/getrequest',
        data: {
            task_id: $(this).has('option:selected').val()
        }
    });
});

$(document).on('change', '#work_task_id', function get_child1() {
        $.ajax({
            type: 'GET',
            url: '/works/getchild1',
            data: {
                task_id: $(this).has('option:selected').val()
            }
        }).done(function () {
        $.ajax({
            type: 'GET',
            url: '/works/getchild2',
            data: {
                child1task_id: $('#work_child1task_id').has('option:selected').val()
            }
        }); 
    });
});

//workstart,workend,breaktime1
$(document).on('change', '#workstart', function get_workstart() {
    $.ajax({
        type: 'GET',
        url: '/works/getworkstart',
        data: {
            workstart: $(this).has('option:selected').val()
        }
    });
});

$(document).on('change', '#workend', function get_workend() {
    $.ajax({
        type: 'GET',
        url: '/works/getworkend',
        data: {
            workend: $(this).has('option:selected').val()
        }
    });
});

$(document).on('change', '#breaktime1', function get_breaktime1() {
    $.ajax({
        type: 'GET',
        url: '/works/getbreaktime1',
        data: {
            breaktime1: $(this).has('option:selected').val()
        }
    });
});