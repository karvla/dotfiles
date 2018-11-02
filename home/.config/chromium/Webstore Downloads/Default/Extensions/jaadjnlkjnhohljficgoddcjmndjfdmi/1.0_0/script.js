window.addEventListener("load", () => {
  if (chrome.extension.inIncognitoContext) {
    document.body.style.background = "#53718e";
  }
});