$(function () {
  $(".js-copy-icon").on("click", function () {
    if (copyText(String($(this).prev(".postbox-url__url").text()))) {
      $('head').append('<style>.postbox-url__description:after { content: "copied!!"; } </style>');
    }
  });

  $(".js-copy-icon").mouseover(function (e) {
    $('head').append('<style>.postbox-url__description:after { content: "click to copy"; } </style>');
  });

  $(".js-copy-icon").mouseout(function (e) {
    $('head').append('<style>.postbox-url__description:after { content: "click to copy"; } </style>');
  });

  function copyText(copyText) {
    const copyFrom = document.createElement("textarea");
    copyFrom.textContent = copyText;
    const bodyElm = document.getElementsByTagName("body")[0];
    bodyElm.appendChild(copyFrom);
    copyFrom.select();
    const retVal = document.execCommand('copy');
    bodyElm.removeChild(copyFrom);
    return retVal;
  }
});