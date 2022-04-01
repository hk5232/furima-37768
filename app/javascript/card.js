function buy() {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  const buy_button = document.getElementById("button");
  
  buy_button.addEventListener('click',function(e){
    e.preventDefault();
    
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: document.getElementById("card-number").value,
      cvc: document.getElementById("card-cvc").value,
      exp_month: document.getElementById("card-exp-month").value,
      exp_year: `20${document.getElementById("card-exp-year").value}`,
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden">`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }

      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");

      formResult.submit();

    });
  });
};

window.addEventListener('load', buy);