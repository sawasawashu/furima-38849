window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    console.log(inputValue);
    const tax = Math.floor(inputValue * 0.1) ;
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = tax;
    const profit = Math.floor(inputValue - tax);
    const margin = document.getElementById("profit");
    margin.innerHTML = profit;  

  })
})
