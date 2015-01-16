$(document).ready(function() {

$('#examination_time').raty({
    score: 0,
    path: '/assets',
    scoreName: 'complaint_review[examination_time]'
});

$('#client_approach').raty({
    score: 0,
    path: '/assets',
    scoreName: 'complaint_review[client_approach]'
});

$('#satisfaction').raty({
    score: 0,
    path: '/assets',
    scoreName: 'complaint_review[satisfaction]'
});

$('.examination_time_read_only').raty({
        path: '/assets/',
        readOnly: true,
        score: function() {
        return $(this).attr('data-score');
        }
});

$('.client_approach_read_only').raty({
        path: '/assets/',
        readOnly: true,
        score: function() {
            return $(this).attr('data-score');
        }
});

$('.satisfaction_read_only').raty({
        path: '/assets/',
        readOnly: true,
        score: function() {
        return $(this).attr('data-score');
        }
    });


});