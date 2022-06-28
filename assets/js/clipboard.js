function copyToClipboard(text) {
  const hiddenTextBlock = document.getElementById(text + '-text');
  window.navigator.clipboard.writeText(hiddenTextBlock.innerHTML);
}