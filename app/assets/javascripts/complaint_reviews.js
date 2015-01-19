$(document).ready(function() {

$('#examination_time').raty({
    score: 0,
    path: '/assets',
    hints: ['fatalny', 'kiepski', 'średni', 'dobry', 'b.dobry'],
    scoreName: 'complaint_review[examination_time]'
});

$('#client_approach').raty({
    score: 0,
    path: '/assets',
    hints: ['fatalny', 'kiepski', 'średni', 'dobry', 'b.dobry'],
    scoreName: 'complaint_review[client_approach]'
});

$('#satisfaction').raty({
    score: 0,
    path: '/assets',
    hints: ['b.niezadowolony', 'niezadowolony', 'umiarkowanie zadowolony', 'zadowolony', 'b.zadowolony'],
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

$('.overall_rating_read_only').raty({
        path: '/assets/',
        hints: ['fatalna', 'kiepska', 'średnia', 'dobra', 'b.dobra'],
        readOnly: true,
        half: true,
        score: function() {
            return $(this).attr('data-score');
        }
});


});