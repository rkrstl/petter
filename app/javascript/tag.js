if (location.pathname.match("tweets/new")){
  document.addEventListener("DOMContentLoaded", () => {
    const inputElement = document.getElementById("tags_form_name");
    inputElement.addEventListener("keyup", () => {
      const keyword = document.getElementById("tags_form_name").value;
      const XHR = new XMLHttpRequest();
      XHR.open("GET", `search/?keyword=${keyword}`, true);
      XHR.responseType = "json";
      XHR.send();
      XHR.onload = () => {
        const searchResult = document.getElementById("search-result");
        searchResult.innerHTML = "";
        if (XHR.response) {
          const tagName = XHR.response.keyword;
          tagName.forEach((tweet_tag) => {
            const childElement = document.createElement("div");
            childElement.setAttribute("class", "child");
            childElement.setAttribute("id", tweet_tag.id);
            childElement.innerHTML = tweet_tag.name;
            searchResult.appendChild(childElement);
            const clickElement = document.getElementById(tweet_tag.id);
            clickElement.addEventListener("click", () => {
              document.getElementById("tags_form_name").value = clickElement.textContent;
              clickElement.remove();
            });
          });
        };
      };
    });
  });
};