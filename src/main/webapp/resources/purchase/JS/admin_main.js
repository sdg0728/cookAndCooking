$(".btn-delete").click(function(e) {
    $(e.target).parents("tr").remove();
});