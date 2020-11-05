if (location.pathname.match("tweets/new")){
  document.addEventListener("DOMContentLoaded", () => {
    const inputElement = document.getElementById("tags_form_name");
    inputElement.addEventListener("keyup", () => {
      const keyword = document.getElementById("tags_form_name").value;
      XHR.open("GET", `search/?keyword=${keyword}`, true);
      XHR.responseType = "json";
      XHR.send();
      XHR.onload = () => {
        const tagName = XHR.response.keyword;
      };
    });
  });
};