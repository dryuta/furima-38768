const pay = () => {
  const payjp = Payjp('pk_test_77dcf84d838aeb9db7bce827')// PAY.JPテスト公開鍵
  const elements = payjp.elements();
  const numberElement = elements.create('cardNumber');
  const expiryElement = elements.create('cardExpiry');
  const cvcElement = elements.create('cardCvc');

  numberElement.mount('#card-number');
  expiryElement.mount('#card-exp-month');
  expiryElement.mount('#card-exp-year');
  cvcElement.mount('#card-cvc');

  const submit = document.getElementById("button");

  submit.addEventListener("click", (e) => {
    e.preventDefault();
    payjp.createToken(numberElement).then(function (response) {
      if (response.error) {
      } else {
        const token = response.id;
        console.log(token)
      }
    });
  });
};

window.addEventListener("load", pay);