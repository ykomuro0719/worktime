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