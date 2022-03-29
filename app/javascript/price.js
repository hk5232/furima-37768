function price() {

  const item_price = document.getElementById("item-price")

  item_price.addEventListener('keyup', function(){
    const price = item_price.value;
    const tax_price  = document.getElementById("add-tax-price");
    const tax = `${price/10}`
    tax_price.innerHTML = `${Math.floor(tax)}`;
    const price_tax = document.getElementById("profit");
    price_tax.innerHTML = `${Math.floor(price-tax)}`
  });
}

window.addEventListener('load', price)