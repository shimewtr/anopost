$(function () {
  $(".js-count-form").on("keyup", function () {
    let countNum = String($(this).val().length);
    const maxNum = String($(this).attr("maxLength"));
    $(this).next("p").text(countNum + "/" + maxNum);
  });
});