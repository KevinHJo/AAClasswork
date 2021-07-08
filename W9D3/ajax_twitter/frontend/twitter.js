const FollowToggle = require('./follow_toggle');

$(document).ready(function () {
    $('button.follow-toggle').each((idx, ele) => new FollowToggle(ele));
});